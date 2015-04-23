package eu.a2a.salesgate.norm.venditore.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.tika.detect.Detector;
import org.apache.tika.metadata.Metadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.normalizzatore.service.TemplateService;
import eu.a2a.salesgate.normalizzatore.service.UtilityService;
import eu.a2a.salesgate.template.bean.AnagTemplate;
import eu.a2a.salesgate.template.bean.Campo;
import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.venditori.bean.Venditore;
import eu.a2a.salesgate.venditori.service.VenditoriService;

@Controller
public class NormalizzatoreVenditoriController extends AbstractController {
	@Autowired
	private VenditoriService venditoreService;
	@Autowired
	private TemplateService templateServiceSdm;
	@Autowired
	private UtilityService utilityServiceSdm;
	@Autowired
	private Validator templateInstanceValidatorSdm;
	@Autowired
	private Validator cloneTemplateInstanceValidatorSdm;
	@Autowired
	private Detector defaultDetector;
	private final Logger logger = Logger.getLogger(this.getClass());
	
	/**
	 * Venditore 
	 */
	
	@RequestMapping(value = "/app/normalizzatore/cercavenditore/{init}", method = RequestMethod.GET)
	public String initCercaVenditore(@PathVariable(value = "init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
		Venditore filtro = new Venditore();
		model.addAttribute("filtro", filtro);
		model.addAttribute("init", init.equals("init"));
		logger.debug(model);
		if (init.equals("init")) {
			session.removeAttribute("ricerca_normalizzatore_venditore_salvata");
		}
		else {
			model.addAttribute("listVenditori", session.getAttribute("ricerca_normalizzatore_venditore_salvata"));
		}
		return "app/normalizzatore/cercavenditore";
	}
	
	@RequestMapping(value = {"/app/normalizzatore/cercavenditore" }, method = RequestMethod.POST)
	public String cercaVenditore(@ModelAttribute("filtro") Venditore filtro, Model model, WebRequest request, Principal principal, HttpSession session) {
		List<Venditore> venditori = venditoreService.getAllVenditori(filtro);
		model.addAttribute("filto", filtro);
		model.addAttribute("listVenditori", venditori);
		session.setAttribute("ricerca_normalizzatore_venditore_salvata", venditori);
		logger.debug(model);
		return "app/normalizzatore/cercavenditore";
	}
	
	/**
	 * Venditore
	 */
	
	/**
	 * Template
	 */
	
	@RequestMapping(value = "/app/normalizzatore/templatevenditore/{idVend}/elenco", method = RequestMethod.GET)
	public String visualizzaElencoTemplate(@PathVariable("idVend") String idVend, Model model, WebRequest request, Principal principal, HttpSession session) {
		Venditore venditore = venditoreService.getVenditore(idVend);
		model.addAttribute("venditore", venditore);
		Venditore filtro = new Venditore();
		model.addAttribute("listVenditori", venditoreService.getAllVenditori(filtro));
		return "app/normalizzatore/templatevenditore/elenco";
	}
	
	@RequestMapping(value = "/app/json/normalizzatore/templatevenditore/{idVend}/elenco/{direzione}", method = RequestMethod.GET)
	public @ResponseBody Object visualizzaElencoTemplateJson(@PathVariable("idVend") String idVend, @PathVariable(value = "direzione") String direzione, Model model, WebRequest request, Principal principal, HttpSession session) {
		HashMap<String, Object> map = new HashMap<>();
		List<TemplateInstance> listTemplateInstance = templateServiceSdm.getTemplatesVenditori(idVend, direzione);
		model.addAttribute("listTemplateInstance", listTemplateInstance);
		map.put("aaData", listTemplateInstance);
		map.put("sEcho", 1);
		map.put("iTotalRecords", listTemplateInstance.size());
		return map;
	}
	
	@RequestMapping(value = "/app/json/normalizzatore/templatevenditore/upload", method = RequestMethod.POST)
	public @ResponseBody Object uploadTemplateFile(@RequestParam("files[]") MultipartFile file, @RequestParam("id") String id, @RequestParam("separatore") String separatore, Model model, WebRequest request, Principal principal, HttpSession session) {
		HashMap<String, Object> res = new HashMap<>();
		try {
			List<HashMap<String, Object>> files = new ArrayList<>();
			HashMap<String, Object> fileItem = new HashMap<>();
			fileItem.put("name", file.getOriginalFilename());
			files.add(fileItem);
			Metadata metadata = new Metadata();
			metadata.add(Metadata.RESOURCE_NAME_KEY, file.getOriginalFilename());
			String mimeType = defaultDetector.detect(null, metadata).toString();
			FileType fileType = utilityServiceSdm.estraiFileType(mimeType);
			if (fileType != null) {
				if (StringUtils.isEmpty(separatore) && (fileType.getId().equals("2"))) {
					res.put("codErrore", "SEP_CSV");
					res.put("descErrore", "Il separatore è obbligatorio per il tipo di file \"Testo Delimitato CSV \"");
				}
				else {
					templateServiceSdm.updateFileTemplate(id, file.getBytes(), file.getOriginalFilename(), fileType.getId());
					res.put("files", files);
					res.put("fileTypeId", fileType.getId());
					res.put("fileTypeDesc", fileType.getDescription());
				}
			}
			else {
				res.put("codErrore", "INV_FIL");
				res.put("descErrore", "Il tipo di file non è supportato");
			}
		}
		catch(IOException e) {
			res.put("codErrore", "GEN_ERR");
			res.put("descErrore", e.getMessage());
		}
		return res;
	}
	
	@RequestMapping(value = "/app/normalizzatore/templatevenditore/{id}/download", method = RequestMethod.GET)
	public void downloadTemplateFile(@PathVariable("id") String id, Model model, WebRequest request, Principal principal, HttpServletResponse response, HttpSession session) {
		try {
			TemplateInstance file = templateServiceSdm.getFileTemplate(id);
			String nome = file.getAnagTemplate().getNomeFile();
			byte[] fileContent = file.getAnagTemplate().getFileContent();
			response.setHeader("Content-Disposition", "attachment;filename=\"" + nome + "\"");
			OutputStream out = response.getOutputStream();
			Metadata metadata = new Metadata();
			metadata.add(Metadata.RESOURCE_NAME_KEY, nome);
			response.setContentType(defaultDetector.detect(null, metadata).getType());
			response.setContentLength(fileContent.length);
			FileCopyUtils.copy(fileContent, out);
			out.flush();
			out.close();
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/app/normalizzatore/templatevenditore/{idTemplate}/visualizza", method = RequestMethod.GET)
	public String visualizzaTemplate(@PathVariable("idTemplate") String idTemplate, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {
		TemplateInstance ti = templateServiceSdm.getTemplateVenditore(idTemplate);
		List<Campo> campiDisponibili = null;
		List<FileType> fileType = utilityServiceSdm.estraiFileTypes(SiNo.SI);
		if ("INBOUND".equals(ti.getAnagTemplate().getInOut())) {
			ti.setMapping(templateServiceSdm.getCampiTemplateInbound(idTemplate));
			campiDisponibili = templateServiceSdm.getCampiInbound(ti.getUtility());
		}
		else {
			ti.setMapping(templateServiceSdm.getCampiTemplateOutbound(idTemplate));
			campiDisponibili = templateServiceSdm.getCampiOutbound(ti.getUtility());
		}
		logger.debug(ti.getVenditore());
		logger.debug(ti.getVenditore().getId());
		ti.setVenditore(venditoreService.getVenditore(ti.getVenditore().getId()));
		model.addAttribute("templateInstance", ti);
		model.addAttribute("campiDisponibili", campiDisponibili);
		model.addAttribute("listFileType", fileType);
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
		if ((save != null) && ("OK".equals("save"))) {
			model.addAttribute("messaggio", "Template salvato correttamente");
		}
		return "app/normalizzatore/templatevenditore/visualizza";
	}
	
	@RequestMapping(value = { "/app/normalizzatore/templatevenditore/modifica" }, method = RequestMethod.POST)
	public String modificaTemplate(@ModelAttribute("templateInstance") TemplateInstance templateInstance, Model model, BindingResult result, WebRequest request, Principal principal, HttpSession session) {
		Venditore venditore = venditoreService.getVenditore(templateInstance.getVenditore().getId());
		templateInstance.setEventCode(venditore.getId() + templateInstance.getCodiceServizio().getCode() + templateInstance.getCodFlusso().getId() + "GAS");
		templateInstanceValidatorSdm.validate(templateInstance, result);
		if (result.hasErrors()) {
			templateInstance.setVenditore(venditore);
			if ("INBOUND".equals(templateInstance.getAnagTemplate().getId())) {
				templateInstance.setMapping(templateServiceSdm.getCampiTemplateInbound(templateInstance.getId()));
			}
			else {
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
				List<AnagRichieste> anagRichieste = utilityServiceSdm.estraiRichieste("GAS");
				List<AnagFlussi> anagFlussi = utilityServiceSdm.estraiFlussi("GAS", templateInstance.getAnagTemplate().getInOut());
				model.addAttribute("listAnagRichieste", anagRichieste);
				model.addAttribute("listAnagFlussi", anagFlussi);
				return "app/normalizzatore/templatevenditore/nuovo";
			}
			return "app/normalizzatore/templatevenditore/visualizza";
		}
		if (StringUtils.isEmpty(templateInstance.getId())) {
			templateServiceSdm.insertTemplate(templateInstance);
		}
		else {
			templateServiceSdm.updateTemplate(templateInstance);
		}
		return "redirect:/app/normalizzatore/templatevenditore/" + templateInstance.getId() + "/visualizza?save=OK";
	}
	
	@RequestMapping(value = "/app/normalizzatore/templatevenditore/{idVend}/{direzione}/nuovo", method = RequestMethod.GET)
	public String nuovoTemplate(@PathVariable("idVend") String idVend, @PathVariable("direzione") String direzione, Model model, WebRequest request, Principal principal, HttpSession session) {
		FileType csv = new FileType();
		AnagTemplate anagTemplate = new AnagTemplate();
		anagTemplate.setFileType(csv);
		anagTemplate.setInOut(direzione);
		TemplateInstance ti = new TemplateInstance();
		ti.setAnagTemplate(anagTemplate);
		Venditore venditore = venditoreService.getVenditore(idVend);
		ti.setUtility("GAS");
		ti.setVenditore(venditore);
		List<Campo> campiDisponibili = getCampiDisponibili(ti);
		List<FileType> fileType = utilityServiceSdm.estraiFileTypes(SiNo.SI);
		List<AnagRichieste> anagRichieste = utilityServiceSdm.estraiRichieste("GAS");
		List<AnagFlussi> anagFlussi = utilityServiceSdm.estraiFlussi("GAS", direzione);
		model.addAttribute("templateInstance", ti);
		model.addAttribute("campiDisponibili", campiDisponibili);
		model.addAttribute("listFileType", fileType);
		model.addAttribute("listAnagRichieste", anagRichieste);
		model.addAttribute("listAnagFlussi", anagFlussi);
		List<String> categorie = getCategorie(campiDisponibili);
		model.addAttribute("categorie", categorie);
		return "app/normalizzatore/templatevenditore/nuovo";
	}
	
	@RequestMapping(value = "/app/normalizzatore/templatevenditore/clona", method = RequestMethod.GET)
	public @ResponseBody Object uploadTemplateFile(@RequestParam("idTemplate") String idTemplate, @RequestParam("codiceServizio") String codiceServizio, @RequestParam("codiceFlusso") String codiceFlusso, @RequestParam("utility") String utility,
												   @RequestParam("idVenditore") String idVenditore, Model model, WebRequest request, Principal principal, HttpSession session) {
		HashMap<String, Object> res = new HashMap<>();
		TemplateInstance templateInstance = templateServiceSdm.getTemplate(idTemplate);
		if ("INBOUND".equals(templateInstance.getAnagTemplate().getInOut())) {
			templateInstance.setMapping(templateServiceSdm.getCampiTemplateInbound(templateInstance.getId()));
		}
		else {
			templateInstance.setMapping(templateServiceSdm.getCampiTemplateOutbound(templateInstance.getId()));
		}
		templateInstance.setId(null);
		Venditore venditore = venditoreService.getVenditore(idVenditore);
		templateInstance.setVenditore(venditore);
		templateInstance.setEventCode(venditore.getId() + templateInstance.getCodiceServizio().getCode() + templateInstance.getCodFlusso().getId() + "GAS");
		DataBinder db = new DataBinder(templateInstance);
		BindingResult result = db.getBindingResult();
		cloneTemplateInstanceValidatorSdm.validate(templateInstance, result);
		if (result.hasErrors()) {
			res.put("codError", "TEMP_DUP");
			res.put("descError", "Template già esistente");
		}
		else {
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
		if ("INBOUND".equals(ti.getAnagTemplate().getInOut())) {
			campiDisponibili = templateServiceSdm.getCampiInbound(ti.getUtility());
		}
		else {
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
