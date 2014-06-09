package eu.a2a.salesgate.template.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tika.detect.Detector;
import org.apache.tika.metadata.Metadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.service.DistributoreService;
import eu.a2a.salesgate.template.bean.AnagTemplate;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.service.TemplateService;
import eu.a2a.salesgate.utility.service.UtilityService;

@Controller
public class TemplateController extends AbstractController {

  @Autowired
  private TemplateService templateServiceSalesgate;

  @Autowired
  private DistributoreService distributoreService;

  @Autowired
  private UtilityService utilityServiceSalesgate;

  @Autowired
  private Detector defaultDetector;

  @Autowired
  private Validator templateInstanceValidatorSalesgate;
  @Autowired
  private Validator cloneTemplateInstanceValidatorSalesgate;

  private List<Params> listChannel;

  /*
   * @InitBinder public void dateBinder(WebDataBinder dataBinder) {
   * 
   * SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
   * CustomDateEditor cde = new CustomDateEditor(sdf, true);
   * dataBinder.registerCustomEditor(Date.class, cde);
   * 
   * }
   */

  @ModelAttribute(value = "listChannel")
  public List<Params> getAllChannels() {
    if (listChannel == null) {
      listChannel = utilityServiceSalesgate.estraiParams("CHANNELS");
      // list.add(0, new Distributore());
    }
    return listChannel;
  }

  @Override
  @InitBinder
  public void initBinder(WebDataBinder binder) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
    dateFormat.setLenient(false);
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
  }

  @RequestMapping(value = "/app/template/{idDistr}/elenco", method = RequestMethod.GET)
  public String visualizzaElencoTemplate(@PathVariable("idDistr") String idDistr, Model model, WebRequest request, Principal principal, HttpSession session) {

    Distributore distributore = distributoreService.getDistributore(idDistr);
    model.addAttribute("distributore", distributore);
    Distributore filtro = new Distributore();
    filtro.setUtility(distributore.getUtility());
    model.addAttribute("listDistributori", distributoreService.getDistributori(filtro));

    /*
     * List<TemplateInstance> listTemplateInstance =
     * templateServiceSalesgate.getTemplates(id_distr, direzione);
     * model.addAttribute("listTemplateInstance", listTemplateInstance);
     */

    return "app/template/elenco";
  }

  @RequestMapping(value = "/app/json/template/{idDistr}/{direzione}", method = RequestMethod.GET)
  public @ResponseBody
  Object visualizzaElencoTemplateJson(@PathVariable("idDistr") String idDistr, @PathVariable("direzione") String direzione, Model model, WebRequest request, Principal principal, HttpSession session) {

    /*
     * Distributore distributore =
     * distributoreService.getDistributore(id_distr);
     * model.addAttribute("distributore", distributore);
     * model.addAttribute("direzione", direzione);
     */
    HashMap<String, Object> map = new HashMap<>();
    List<TemplateInstance> listTemplateInstance = templateServiceSalesgate.getTemplates(idDistr, direzione);
    model.addAttribute("listTemplateInstance", listTemplateInstance);
    map.put("aaData", listTemplateInstance);
    map.put("sEcho", 1);
    map.put("iTotalRecords", listTemplateInstance.size());

    return map;
  }

  @RequestMapping(value = "/app/json/template/upload", method = RequestMethod.POST)
  public @ResponseBody
  Object uploadTemplateFile(@RequestParam("files[]") MultipartFile file, @RequestParam("id") String id, @RequestParam("separatore") String separatore, Model model, WebRequest request, Principal principal, HttpSession session) {
    HashMap<String, Object> res = new HashMap<>();
    try {

      List<HashMap<String, Object>> files = new ArrayList<>();
      HashMap<String, Object> fileItem = new HashMap<>();
      fileItem.put("name", file.getOriginalFilename());
      files.add(fileItem);
      Metadata metadata = new Metadata();
      metadata.add(Metadata.RESOURCE_NAME_KEY, file.getOriginalFilename());

      String mimeType = defaultDetector.detect(null, metadata).toString();

      // System.out.println(mimeType);

      FileType fileType = utilityServiceSalesgate.estraiFileType(mimeType);
      if (fileType != null) {
        if (StringUtils.isEmpty(separatore) && (fileType.getId().equals("2"))) {
          res.put("codErrore", "SEP_CSV");
          res.put("descErrore", "Il separatore � obbligatorio per il tipo file \"Testo Delimitato CSV \"");
        } else {
          // if(!file.getOriginalFilename().contains("debug")){
          templateServiceSalesgate.updateFileTemplate(id, file.getBytes(), file.getOriginalFilename(), fileType.getId());
          // }

          res.put("files", files);
          res.put("fileTypeId", fileType.getId());
          res.put("fileTypeDesc", fileType.getDescription());
        }
      } else {
        res.put("codErrore", "INV_FIL");
        res.put("descErrore", "Il tipo file non � supportato");
      }

    } catch (IOException e) {
      res.put("codErrore", "GEN_ERR");
      res.put("descErrore", e.getMessage());
    }
    return res;

  }

  @RequestMapping(value = "/app/template/{id}/download", method = RequestMethod.GET)
  public void dowloadTemplateFile(@PathVariable("id") String id, Model model, WebRequest request, Principal principal, HttpSession session, HttpServletResponse response) {

    try {
      TemplateInstance file = templateServiceSalesgate.getFileTemplate(id);
      String nome = file.getAnagTemplate().getNomeFile();
      byte[] fileContent = file.getAnagTemplate().getFileContent();

      response.setHeader("Content-Disposition", "attachment;filename=\"" + nome + "\"");
      OutputStream out = response.getOutputStream();
      /*
       * MimetypesFileTypeMap mft = new MimetypesFileTypeMap();
       * response.setContentType(mft.getContentType(file.getNomeFile()));
       */

      Metadata metadata = new Metadata();
      metadata.add(Metadata.RESOURCE_NAME_KEY, nome);
      response.setContentType(defaultDetector.detect(null, metadata).getType());
      response.setContentLength(fileContent.length);

      // response.setContentType(doc.getContentType());
      FileCopyUtils.copy(fileContent, out);
      out.flush();
      out.close();
    } catch (IOException e) {
      e.printStackTrace();
    }

  }

  @RequestMapping(value = "/app/template/{idTemplate}/visualizza", method = RequestMethod.GET)
  public String visualizzaTemplate(@PathVariable("idTemplate") String idTemplate, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {

    TemplateInstance ti = templateServiceSalesgate.getTemplate(idTemplate);
    List<Campo> campiDisponibili = null;
    List<FileType> fileType = utilityServiceSalesgate.estraiFileTypes(SiNo.SI);
    if ("IN".equals(ti.getAnagTemplate().getInOut())) {
      ti.setMapping(templateServiceSalesgate.getCampiTemplateInbound(idTemplate));
      campiDisponibili = templateServiceSalesgate.getCampiInbound(ti.getUtility());
    } else {
      ti.setMapping(templateServiceSalesgate.getCampiTemplateOutbound(idTemplate));
      campiDisponibili = templateServiceSalesgate.getCampiOutbound(ti.getUtility());
    }

    ti.setDistributore(distributoreService.getDistributore(ti.getDistributore().getId()));
    model.addAttribute("templateInstance", ti);
    model.addAttribute("campiDisponibili", campiDisponibili);
    model.addAttribute("listFileType", fileType);
    // model.addAttribute("distributore",
    // distributoreService.getDistributore(ti.getDistributore().getId()));

    List<String> categorie = new ArrayList<>();
    Iterator<Campo> i = campiDisponibili.iterator();
    String oldCate = "";
    while (i.hasNext()) {
      String categoria = i.next().getCategoria();
      if (!oldCate.equals(categoria)) {
        categorie.add(categoria);
      }
      oldCate = categoria;
    }

    model.addAttribute("categorie", categorie);

    if ((save != null) && ("OK".equals(save))) {
      model.addAttribute("messaggio", "Template salvato correttamente");
    }
    return "app/template/visualizza";

  }

  @RequestMapping(value = { "/app/template/modifica" }, method = RequestMethod.POST)
  public String modificaTemplate(@ModelAttribute("templateInstance") TemplateInstance templateInstance, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {

    Distributore distributore = distributoreService.getDistributore(templateInstance.getDistributore().getId());
    templateInstance.setEventCode(distributore.getId() + templateInstance.getCodiceServizio().getCode() + templateInstance.getCodFlusso().getId() + distributore.getUtility());
    templateInstanceValidatorSalesgate.validate(templateInstance, result);

    if (result.hasErrors()) {
      templateInstance.setDistributore(distributore);
      if ("IN".equals(templateInstance.getAnagTemplate().getInOut())) {
        templateInstance.setMapping(templateServiceSalesgate.getCampiTemplateInbound(templateInstance.getId()));
      } else {
        templateInstance.setMapping(templateServiceSalesgate.getCampiTemplateOutbound(templateInstance.getId()));
      }
      model.addAttribute("templateInstance", templateInstance);
      List<Campo> campiDisponibili = getCampiDisponibili(templateInstance);
      model.addAttribute("campiDisponibili", campiDisponibili);
      List<FileType> fileType = utilityServiceSalesgate.estraiFileTypes(SiNo.SI);
      List<String> categorie = getCategorie(campiDisponibili);
      model.addAttribute("categorie", categorie);
      model.addAttribute("listFileType", fileType);
      model.addAttribute("error", true);
      logger.debug(model);
      if (StringUtils.isEmpty(templateInstance.getId())) {
        List<AnagRichieste> anagRichieste = utilityServiceSalesgate.estraiRichieste(distributore.getUtility());
        List<AnagFlussi> anagFlussi = utilityServiceSalesgate.estraiFlussi(distributore.getUtility(), templateInstance.getAnagTemplate().getInOut());
        model.addAttribute("listAnagRichieste", anagRichieste);
        model.addAttribute("listAnagFlussi", anagFlussi);
        return "app/template/nuovo";
      }
      return "app/template/visualizza";
    }
    if (StringUtils.isEmpty(templateInstance.getId())) {
      templateServiceSalesgate.insertTemplate(templateInstance);
    } else {
      templateServiceSalesgate.updateTemplate(templateInstance);
    }

    return "redirect:/app/template/" + templateInstance.getId() + "/visualizza?save=OK";
  }

  @RequestMapping(value = "/app/template/{idDistr}/{direzione}/nuovo", method = RequestMethod.GET)
  public String nuovoTemplate(@PathVariable("direzione") String direzione, @PathVariable("idDistr") String idDistr, Model model, WebRequest request, Principal principal, HttpSession session) {

    FileType csv = new FileType();
    AnagTemplate anagTemplate = new AnagTemplate();
    anagTemplate.setFileType(csv);
    anagTemplate.setInOut(direzione);
    TemplateInstance ti = new TemplateInstance();
    ti.setAnagTemplate(anagTemplate);
    Distributore distributore = distributoreService.getDistributore(idDistr);
    ti.setUtility(distributore.getUtility());
    ti.setDistributore(distributore);

    List<Campo> campiDisponibili = getCampiDisponibili(ti);
    List<FileType> fileType = utilityServiceSalesgate.estraiFileTypes(SiNo.SI);
    List<AnagRichieste> anagRichieste = utilityServiceSalesgate.estraiRichieste(distributore.getUtility());
    List<AnagFlussi> anagFlussi = utilityServiceSalesgate.estraiFlussi(distributore.getUtility(), direzione);

    model.addAttribute("templateInstance", ti);
    model.addAttribute("campiDisponibili", campiDisponibili);
    model.addAttribute("listFileType", fileType);
    model.addAttribute("listAnagRichieste", anagRichieste);
    model.addAttribute("listAnagFlussi", anagFlussi);

    List<String> categorie = getCategorie(campiDisponibili);

    model.addAttribute("categorie", categorie);

    return "app/template/nuovo";

  }

  @RequestMapping(value = "/app/template/clona", method = RequestMethod.GET)
  public @ResponseBody
  Object uploadTemplateFile(@RequestParam("idTemplate") String idTemplate, @RequestParam("codiceServizio") String codiceServizio, @RequestParam("codiceFlusso") String codiceFlusso, @RequestParam("utility") String utility,
      @RequestParam("idDistributore") String idDistributore, Model model, WebRequest request, Principal principal, HttpSession session) {
    HashMap<String, Object> res = new HashMap<>();

    TemplateInstance templateInstance = templateServiceSalesgate.getTemplate(idTemplate);

    if ("IN".equals(templateInstance.getAnagTemplate().getInOut())) {
      templateInstance.setMapping(templateServiceSalesgate.getCampiTemplateInbound(templateInstance.getId()));
    } else {
      templateInstance.setMapping(templateServiceSalesgate.getCampiTemplateOutbound(templateInstance.getId()));
    }
    templateInstance.setId(null);
    Distributore distributore = distributoreService.getDistributore(idDistributore);
    templateInstance.setDistributore(distributore);
    templateInstance.setEventCode(distributore.getId() + templateInstance.getCodiceServizio().getCode() + templateInstance.getCodFlusso().getId() + distributore.getUtility());
    DataBinder db = new DataBinder(templateInstance);
    BindingResult result = db.getBindingResult();
    cloneTemplateInstanceValidatorSalesgate.validate(templateInstance, result);

    if (result.hasErrors()) {
      res.put("codErrore", "TEMP_DUP");
      res.put("descErrore", "Template gi� esistente");
    } else {
      int idTemplateNew = templateServiceSalesgate.insertTemplate(templateInstance);
      List<String> mappingNew = new ArrayList<>();
      Iterator<Campo> i = templateInstance.getMapping().iterator();
      while (i.hasNext()) {
        Campo campo = i.next();
        mappingNew.add(campo.getId());
      }
      templateInstance.setMappingNew(mappingNew);
      templateServiceSalesgate.updateTemplate(templateInstance);
      res.put("idTemplateNew", idTemplateNew);
    }

    return res;

  }

  private List<Campo> getCampiDisponibili(TemplateInstance ti) {

    List<Campo> campiDisponibili = null;
    if ("IN".equals(ti.getAnagTemplate().getInOut())) {
      campiDisponibili = templateServiceSalesgate.getCampiInbound(ti.getUtility());
    } else {
      campiDisponibili = templateServiceSalesgate.getCampiOutbound(ti.getUtility());
    }
    return campiDisponibili;
  }

  private List<String> getCategorie(List<Campo> listCampo) {
    List<String> categorie = new ArrayList<>();
    Iterator<Campo> i = listCampo.iterator();
    String oldCate = "";
    while (i.hasNext()) {
      String categoria = i.next().getCategoria();
      if (!oldCate.equals(categoria)) {
        categorie.add(categoria);
      }
      oldCate = categoria;
    }
    return categorie;
  }

}
