package eu.a2a.salesgate.normalizzatore.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.tika.detect.Detector;
import org.apache.tika.metadata.Metadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;
import org.springframework.validation.Validator;
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
import eu.a2a.salesgate.normalizzatore.service.TemplateService;
import eu.a2a.salesgate.normalizzatore.service.UtilityService;
import eu.a2a.salesgate.template.bean.AnagTemplate;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;

@Controller
public class NormalizzatoreController extends AbstractController {

  @Autowired
  private DistributoreService distributoreService;

  @Autowired
  // package normalizzatore
  private TemplateService templateServiceSdm;

  @Autowired
  // package normalizzatore
  private UtilityService utilityServiceSdm;

  @Autowired
  private Detector defaultDetector;

  @Autowired
  private Validator templateInstanceValidatorSdm;

  @Autowired
  private Validator cloneTemplateInstanceValidatorSdm;

  private List<Params> listChannel;

  private final Logger logger = Logger.getLogger(this.getClass());

  @ModelAttribute(value = "listChannel")
  public List<Params> getAllChannels() {
    if (listChannel == null) {
      listChannel = utilityServiceSdm.estraiParams("CHANNELS");
      // list.add(0, new Distributore());
    }
    return listChannel;
  }

  /**
   * Distributore
   */

  @RequestMapping(value = "/app/normalizzatore/cercadistributore/{init}", method = RequestMethod.GET)
  public String initCercaDistributore(@PathVariable(value = "init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
    Distributore filtro = new Distributore();
    model.addAttribute("filtro", filtro);
    model.addAttribute("init", init.equals("init"));
    logger.debug(model);
    if (init.equals("init")) {
      session.removeAttribute("ricerca_normalizzatore_salvata");
    } else {
      model.addAttribute("listDistributori", session.getAttribute("ricerca_normalizzatore_salvata"));
    }
    return "app/normalizzatore/cerca";
  }

  @RequestMapping(value = { "/app/normalizzatore/cercadistributore" }, method = RequestMethod.POST)
  public String cercaDistributore(@ModelAttribute("filtro") Distributore filtro, Model model, WebRequest request, Principal principal, HttpSession session) {

    if ("-".equals(filtro.getUtility())) {
      filtro.setUtility("");
    }

    List<Distributore> distributori = distributoreService.getDistributori(filtro);
    model.addAttribute("filtro", filtro);
    model.addAttribute("listDistributori", distributori);
    session.setAttribute("ricerca_normalizzatore_salvata", distributori);
    logger.debug(model);
    return "app/normalizzatore/cerca";
  }

  /**
   * Distributore
   */

  /**
   * Template
   */
  @RequestMapping(value = "/app/normalizzatore/template/{idDistr}/elenco", method = RequestMethod.GET)
  public String visualizzaElencoTemplate(@PathVariable("idDistr") String idDistr, Model model, WebRequest request, Principal principal, HttpSession session) {

    Distributore distributore = distributoreService.getDistributore(idDistr);
    model.addAttribute("distributore", distributore);
    Distributore filtro = new Distributore();
    filtro.setUtility(distributore.getUtility());
    model.addAttribute("listDistributori", distributoreService.getDistributori(filtro));

    /*
     * List<TemplateInstance> listTemplateInstance =
     * templateService.getTemplates(id_distr, direzione);
     * model.addAttribute("listTemplateInstance", listTemplateInstance);
     */

    return "app/normalizzatore/template/elenco";
  }

  @RequestMapping(value = "/app/json/normalizzatore/template/{idDistr}/{direzione}", method = RequestMethod.GET)
  public @ResponseBody
  Object visualizzaElencoTemplateJson(@PathVariable("idDistr") String idDistr, @PathVariable("direzione") String direzione, Model model, WebRequest request, Principal principal, HttpSession session) {

    /*
     * Distributore distributore =
     * distributoreService.getDistributore(id_distr);
     * model.addAttribute("distributore", distributore);
     * model.addAttribute("direzione", direzione);
     */
    HashMap<String, Object> map = new HashMap<>();
    List<TemplateInstance> listTemplateInstance = templateServiceSdm.getTemplates(idDistr, direzione);
    model.addAttribute("listTemplateInstance", listTemplateInstance);
    map.put("aaData", listTemplateInstance);
    map.put("sEcho", 1);
    map.put("iTotalRecords", listTemplateInstance.size());

    return map;
  }

  @RequestMapping(value = "/app/json/normalizzatore/template/upload", method = RequestMethod.POST)
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

      FileType fileType = utilityServiceSdm.estraiFileType(mimeType);
      if (fileType != null) {
        if (StringUtils.isEmpty(separatore) && (fileType.getId().equals("2"))) {
          res.put("codErrore", "SEP_CSV");
          res.put("descErrore", "Il separatore è obbligatorio per il tipo file \"Testo Delimitato CSV \"");
        } else {
          // if(!file.getOriginalFilename().contains("debug")){
          templateServiceSdm.updateFileTemplate(id, file.getBytes(), file.getOriginalFilename(), fileType.getId());
          // }

          res.put("files", files);
          res.put("fileTypeId", fileType.getId());
          res.put("fileTypeDesc", fileType.getDescription());
        }
      } else {
        res.put("codErrore", "INV_FIL");
        res.put("descErrore", "Il tipo file non è supportato");
      }

    } catch (IOException e) {
      res.put("codErrore", "GEN_ERR");
      res.put("descErrore", e.getMessage());
    }
    return res;

  }

  @RequestMapping(value = "/app/normalizzatore/template/{id}/download", method = RequestMethod.GET)
  public void dowloadTemplateFile(@PathVariable("id") String id, Model model, WebRequest request, Principal principal, HttpSession session, HttpServletResponse response) {

    try {
      TemplateInstance file = templateServiceSdm.getFileTemplate(id);
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

  @RequestMapping(value = "/app/normalizzatore/template/{idTemplate}/visualizza", method = RequestMethod.GET)
  public String visualizzaTemplate(@PathVariable("idTemplate") String idTemplate, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {

    TemplateInstance ti = templateServiceSdm.getTemplate(idTemplate);
    List<Campo> campiDisponibili = null;
    List<FileType> fileType = utilityServiceSdm.estraiFileTypes(SiNo.SI);
    if ("IN".equals(ti.getAnagTemplate().getInOut())) {
      ti.setMapping(templateServiceSdm.getCampiTemplateInbound(idTemplate));
      campiDisponibili = templateServiceSdm.getCampiInbound(ti.getUtility());
    } else {
      ti.setMapping(templateServiceSdm.getCampiTemplateOutbound(idTemplate));
      campiDisponibili = templateServiceSdm.getCampiOutbound(ti.getUtility());
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
    return "app/normalizzatore/template/visualizza";

  }

  @RequestMapping(value = { "/app/normalizzatore/template/modifica" }, method = RequestMethod.POST)
  public String modificaTemplate(@ModelAttribute("templateInstance") TemplateInstance templateInstance, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {

    Distributore distributore = distributoreService.getDistributore(templateInstance.getDistributore().getId());
    templateInstance.setEventCode(distributore.getId() + templateInstance.getCodiceServizio().getCode() + templateInstance.getCodFlusso().getId() + distributore.getUtility());
    templateInstanceValidatorSdm.validate(templateInstance, result);

    if (result.hasErrors()) {
      templateInstance.setDistributore(distributore);
      if ("IN".equals(templateInstance.getAnagTemplate().getInOut())) {
        templateInstance.setMapping(templateServiceSdm.getCampiTemplateInbound(templateInstance.getId()));
      } else {
        templateInstance.setMapping(templateServiceSdm.getCampiTemplateOutbound(templateInstance.getId()));
      }
      model.addAttribute("templateInstance", templateInstance);
      List<Campo> campiDisponibili = getCampiDisponibili(templateInstance);
      model.addAttribute("campiDisponibili", campiDisponibili);
      List<FileType> fileType = utilityServiceSdm.estraiFileTypes(SiNo.SI);
      List<String> categorie = getCategorie(campiDisponibili);
      model.addAttribute("categorie", categorie);
      model.addAttribute("listFileType", fileType);
      model.addAttribute("error", true);
      logger.debug(model);
      if (StringUtils.isEmpty(templateInstance.getId())) {
        List<AnagRichieste> anagRichieste = utilityServiceSdm.estraiRichieste(distributore.getUtility());
        List<AnagFlussi> anagFlussi = utilityServiceSdm.estraiFlussi(distributore.getUtility(), templateInstance.getAnagTemplate().getInOut());
        model.addAttribute("listAnagRichieste", anagRichieste);
        model.addAttribute("listAnagFlussi", anagFlussi);
        return "app/normalizzatore/template/nuovo";
      }
      return "app/normalizzatore/template/visualizza";
    }
    if (StringUtils.isEmpty(templateInstance.getId())) {
      templateServiceSdm.insertTemplate(templateInstance);
    } else {
      templateServiceSdm.updateTemplate(templateInstance);
    }

    return "redirect:/app/normalizzatore/template/" + templateInstance.getId() + "/visualizza?save=OK";
  }

  @RequestMapping(value = "/app/normalizzatore/template/{idDistr}/{direzione}/nuovo", method = RequestMethod.GET)
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
    List<FileType> fileType = utilityServiceSdm.estraiFileTypes(SiNo.SI);
    List<AnagRichieste> anagRichieste = utilityServiceSdm.estraiRichieste(distributore.getUtility());
    List<AnagFlussi> anagFlussi = utilityServiceSdm.estraiFlussi(distributore.getUtility(), direzione);

    model.addAttribute("templateInstance", ti);
    model.addAttribute("campiDisponibili", campiDisponibili);
    model.addAttribute("listFileType", fileType);
    model.addAttribute("listAnagRichieste", anagRichieste);
    model.addAttribute("listAnagFlussi", anagFlussi);

    List<String> categorie = getCategorie(campiDisponibili);

    model.addAttribute("categorie", categorie);

    return "app/normalizzatore/template/nuovo";

  }

  @RequestMapping(value = "/app/normalizzatore/template/clona", method = RequestMethod.GET)
  public @ResponseBody
  Object uploadTemplateFile(@RequestParam("idTemplate") String idTemplate, @RequestParam("codiceServizio") String codiceServizio, @RequestParam("codiceFlusso") String codiceFlusso, @RequestParam("utility") String utility,
      @RequestParam("idDistributore") String idDistributore, Model model, WebRequest request, Principal principal, HttpSession session) {
    HashMap<String, Object> res = new HashMap<>();

    TemplateInstance templateInstance = templateServiceSdm.getTemplate(idTemplate);

    if ("IN".equals(templateInstance.getAnagTemplate().getInOut())) {
      templateInstance.setMapping(templateServiceSdm.getCampiTemplateInbound(templateInstance.getId()));
    } else {
      templateInstance.setMapping(templateServiceSdm.getCampiTemplateOutbound(templateInstance.getId()));
    }
    templateInstance.setId(null);
    Distributore distributore = distributoreService.getDistributore(idDistributore);
    templateInstance.setDistributore(distributore);
    templateInstance.setEventCode(distributore.getId() + templateInstance.getCodiceServizio().getCode() + templateInstance.getCodFlusso().getId() + distributore.getUtility());
    DataBinder db = new DataBinder(templateInstance);
    BindingResult result = db.getBindingResult();
    cloneTemplateInstanceValidatorSdm.validate(templateInstance, result);

    if (result.hasErrors()) {
      res.put("codErrore", "TEMP_DUP");
      res.put("descErrore", "Template già esistente");
    } else {
      int idTemplateNew = templateServiceSdm.insertTemplate(templateInstance);
      List<String> mappingNew = new ArrayList<>();
      Iterator<Campo> i = templateInstance.getMapping().iterator();
      while (i.hasNext()) {
        Campo campo = i.next();
        mappingNew.add(campo.getId());
      }
      templateInstance.setMappingNew(mappingNew);
      templateServiceSdm.updateTemplate(templateInstance);
      res.put("idTemplateNew", idTemplateNew);
    }

    return res;

  }

  private List<Campo> getCampiDisponibili(TemplateInstance ti) {

    List<Campo> campiDisponibili = null;
    if ("IN".equals(ti.getAnagTemplate().getInOut())) {
      campiDisponibili = templateServiceSdm.getCampiInbound(ti.getUtility());
    } else {
      campiDisponibili = templateServiceSdm.getCampiOutbound(ti.getUtility());
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
