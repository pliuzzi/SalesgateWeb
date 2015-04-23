package eu.a2a.salesgate.motivazioni.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;
import eu.a2a.salesgate.motivazioni.bean.factory.MotivazioneFactory;
import eu.a2a.salesgate.motivazioni.bean.factory.MotivazioneVenditoreFactory;
import eu.a2a.salesgate.motivazioni.service.MotivazioneService;

@Controller
public class MotivazioneController extends AbstractController {
	@Autowired
	private MotivazioneService motivazioniServiceSalesgate;
	//@Autowired
	private Validator motivazioneValidator;
	public List<MotivazioneVenditore> listCodiciDistributori;
	public List<Motivazione> listMotivazioni;
	
	@ModelAttribute(value = "listCodiciDistributori")
	public List<MotivazioneVenditore> listCodiciDistributori() {
		//if (listCodiciDistributori == null) {
			new MotivazioneVenditoreFactory();
			listCodiciDistributori = motivazioniServiceSalesgate.getMotivazioniVenditore(MotivazioneVenditoreFactory.newEmptyMotivazioneVendita());
		//}
		return listCodiciDistributori;
	}
	
	@ModelAttribute(value = "listMotivazioni")
	public List<Motivazione> listMotivazioni() {
		new MotivazioneFactory();
		listMotivazioni = motivazioniServiceSalesgate.getMotivazioni(MotivazioneFactory.newEmptyMotivazione());
		return listMotivazioni;
	}
	
	@RequestMapping(value = "app/motivazione/getMotivazione/{id}")
	public @ResponseBody String getMotivazioneOut(@PathVariable(value = "id") String id) {
		if (listCodiciDistributori != null) {
			for(MotivazioneVenditore codiceDistributore : listCodiciDistributori) {
				if (id.equals(codiceDistributore.getCodiceInterno())) {
					return codiceDistributore.getMotivazione();
				}
			}
		}
		return null;
	}
	
	@RequestMapping(value = "/app/motivazione/cerca/{init}", method = RequestMethod.GET)
	public String initCercaMotivazione(@PathVariable(value = "init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
		if (!verifyAuth(principal.getName())) {
			return "app/home";
		}
		Motivazione filtro = new Motivazione();
		model.addAttribute("filtro", filtro);
		model.addAttribute("init", init.equals("init"));
		logger.debug(model);
		if (init.equals("init")) {
			session.removeAttribute("ricerca_motivazione_salvata");
		}
		else {
			model.addAttribute("listMotivazioni", session.getAttribute("ricerca_motivazione_salvata"));
		}
		return "app/motivazione/cerca";
	}
	
	@RequestMapping(value = "/app/motivazione/cerca", method = RequestMethod.POST)
	public String cercaMotivazione(@ModelAttribute("filtro") Motivazione filtro, Model model, WebRequest request, Principal principal, HttpSession session) {
		List<Motivazione> motivazioni = motivazioniServiceSalesgate.getMotivazioni(filtro);
		model.addAttribute("filtro", filtro);
		model.addAttribute("listMotivazioni", motivazioni);
		session.setAttribute("ricerca_motivazione_salvata", motivazioni);
		logger.debug(model);
		return "app/motivazione/cerca";
	}
	
	@RequestMapping(value = "/app/motivazione/nuovo/init", method = RequestMethod.GET)
	public String initNuovaMotivazione(Model model, WebRequest request, Principal principal, HttpSession session) {
		if (!verifyAuth(principal.getName())) {
			return "app/home";
		}
		Motivazione motivazione = new Motivazione();
		int maxId = motivazioniServiceSalesgate.getMaxId();
		maxId++;
		motivazione.setId(String.valueOf(maxId));
		model.addAttribute("motivazione", motivazione);
		logger.debug(model);
		return "app/motivazione/nuovo";
	}
	
	@RequestMapping(value = "/app/motivazione/nuovo", method = RequestMethod.POST)
	public String nuovaMotivazione(@ModelAttribute("motivazione") Motivazione motivazione, Model model, BindingResult result, WebRequest request, Principal principal, HttpSession session) {
		logger.debug(model);
		//motivazioneValidator.validate(motivazione, result);
		if (result.hasErrors()) {
			model.addAttribute("motivazione", motivazione);
			model.addAttribute("error", true);
			logger.debug(model);
			return "app/motivazione/nuovo";
		}
		motivazioniServiceSalesgate.insertNewMotivazione(motivazione);
		return "redirect:/app/motivazione/visualizza/" + motivazione.getId() + "?save=OK";
	}
	
	@RequestMapping(value = "/app/motivazione/visualizza/{id}", method = RequestMethod.GET)
	public String visualizzaMotivazione(@PathVariable("id") String id, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {
		if (!verifyAuth(principal.getName())) {
			return "app/home";
		}
		Motivazione motivazione;
		MotivazioneVenditore motivazioneVendita = new MotivazioneVenditore();
		int maxId = motivazioniServiceSalesgate.getMaxIdVenditore();
		maxId++;
		motivazioneVendita.setId(String.valueOf(maxId));
		//List<String> listCodiciDistributori = motivazioniServiceSalesgate.getAllCodiciDistributore();
		if (StringUtils.isEmpty(id)) {
			motivazione = new Motivazione();
		}
		else {
			motivazione = motivazioniServiceSalesgate.getMotivazione(id);
		}
		model.addAttribute("motivazione", motivazione);
		model.addAttribute("motivazioneVendita", motivazioneVendita);
		logger.debug(motivazione.getMotivazioneVenditore());
		//model.addAttribute("listCodiciDistributori", listCodiciDistributori);
		if ((save != null) && ("OK".equals(save))) {
			model.addAttribute("messaggio", "Motivazione salvata correttamente");
		}
		else {
			if ((save != null) && ("DELETE".equals(save))) {
				model.addAttribute("messaggio", "Motivazione eliminata correttamente");
			}
		}
		logger.debug(model);
		return "app/motivazione/visualizza";
	}
	
	@RequestMapping(value = "/app/motivazione/modifica", method = RequestMethod.POST)
	public String modificaMotivazione(@ModelAttribute("motivazione") Motivazione motivazione, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
		logger.debug(model);
		//motivazioneValidator.validate(motivazione, result);
		if (result.hasErrors()) {
			model.addAttribute("motivazione", motivazione);
			model.addAttribute("error", true);
			logger.debug(model);
			return "app/motivazione/visualizza";
		}
		motivazioniServiceSalesgate.updateMotivazione(motivazione);
		motivazione.getMotivazioneVenditore().setCodiceInterno(motivazione.getCodiceCausale());
		motivazioniServiceSalesgate.updateMotivazioneVenditore(motivazione.getMotivazioneVenditore());
		return "redirect:/app/motivazione/visualizza/" + motivazione.getId() + "?save=OK";
	}
	
	@RequestMapping(value = "/app/motivazione/modifica/elimina", method = RequestMethod.POST)
	public String eliminaMotivazione(@ModelAttribute("motivazione") Motivazione motivazione, Model model, WebRequest request, Principal principal, HttpSession session) {
		motivazione.setAttivo("N");
		motivazioniServiceSalesgate.updateMotivazione(motivazione);
		return "redirect:/app/motivazione/visualizza/" + motivazione.getId() + "?save=DELETE";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/cerca/{init}", method = RequestMethod.GET)
	public String cercaMotivazioneVenditaInit(@PathVariable(value = "init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
		if (!verifyAuth(principal.getName())) {
			return "app/home";
		}
		MotivazioneVenditore filtro = new MotivazioneVenditore();
		model.addAttribute("filtro", filtro);
		model.addAttribute("init", init.equals("init"));
		logger.debug(model);
		if (init.equals("init")) {
			session.removeAttribute("ricerca_motivazione_salvata");
		}
		else {
			model.addAttribute("listMotivazioni", session.getAttribute("ricerca_motivazione_salvata"));
		}
		return "app/motivazioneVendita/cerca";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/cerca", method = RequestMethod.POST)
	public String cercaMotivazioneVendita(@ModelAttribute("filtro") MotivazioneVenditore filtro, Model model, WebRequest request, Principal principal, HttpSession session) {
		List<MotivazioneVenditore> motivazioniVendita = motivazioniServiceSalesgate.getMotivazioniVenditore(filtro);
		model.addAttribute("filtro", filtro);
		model.addAttribute("listMotivazioniVendita", motivazioniVendita);
		session.setAttribute("ricerca_salvata_correttamente", motivazioniVendita);
		logger.debug(model);
		return "app/motivazioneVendita/cerca";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/nuovo/init/{idCausale}", method = RequestMethod.GET)
	public String initNuovaMotivazioneVendita(@PathVariable("idCausale") String idCausale, Model model, WebRequest request, Principal principal, HttpSession session) {
		if (!verifyAuth(principal.getName())) {
			return "app/home";
		}
		MotivazioneVenditore motivazioneVendita = new MotivazioneVenditore();
		int maxIdVenditore = motivazioniServiceSalesgate.getMaxIdVenditore();
		maxIdVenditore++;
		motivazioneVendita.setId(String.valueOf(maxIdVenditore));
		motivazioneVendita.setDescription(idCausale);
		model.addAttribute("motivazioneVendita", motivazioneVendita);
		logger.debug(model);
		return "app/motivazioneVendita/nuovo";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/nuovo/{idCausale}", method = RequestMethod.POST)
	public String nuovaMotivazioneVendita(@PathVariable("idCausale") String id, @ModelAttribute("motivazioneVendita") MotivazioneVenditore motivazioneVendita, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
		logger.debug(model);
		//motivazioneValidator.validate(motivazioneVendita, result);
		if(result.hasErrors()) {
			model.addAttribute("motivazioneVendita", motivazioneVendita);
			model.addAttribute("error", true);
			logger.debug(model);
			return "app/motivazioneVendita/nuovo";
		}
		motivazioniServiceSalesgate.insertNewMotivazioneVenditore(motivazioneVendita);
		if ("vendita".equals(id)) {
			return "app/motivazione/nuovo/init";
		}
		return "redirect:/app/motivazione/visualizza/" + id + "?save=OK";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/visualizza/{id}", method = RequestMethod.GET)
	public String visualizzaMotivazioneVendita(@PathVariable(value = "id") String id, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {
		if (!verifyAuth(principal.getName())) {
			return "app/home";
		}
		MotivazioneVenditore motivazioneVendita;
		if (StringUtils.isEmpty(id)) {
			motivazioneVendita = new MotivazioneVenditore();
		}
		else {
			motivazioneVendita = motivazioniServiceSalesgate.getMotivazioneVenditore(id);
		}
		model.addAttribute("motivazioneVendita", motivazioneVendita);
		if((save != null) && ("OK".equals(save))) {
			model.addAttribute("messaggio", "Motivazione venditore salvata correttamente");
		}
		logger.debug(model);
		return "app/motivazioneVendita/visualizza";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/modifica", method = RequestMethod.POST)
	public String modificaMotivazioneVendita(@ModelAttribute("motivazioneVendita") MotivazioneVenditore motivazioneVendita, Model model, BindingResult result, WebRequest request, Principal principal, HttpSession session) {
		logger.debug(model);
		if(result.hasErrors()) {
			model.addAttribute("motivazioneVendita", motivazioneVendita);
			model.addAttribute("error", true);
			logger.debug(model);
			return "app/motivazioneVendita/visualizza";
		}
		motivazioniServiceSalesgate.updateMotivazioneVenditore(motivazioneVendita);
		return "redirect:/app/motivazioneVendita/visualizza/" + motivazioneVendita.getId() + "?save=OK";
	}
	
	@RequestMapping(value = "/app/motivazioneVendita/verifica/cdCausale/{codiceCausale}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> verificaCodiceCausale(@PathVariable(value = "codiceCausale") String codiceCausale, Model model, WebRequest request, Principal principal, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cdCausaleEsistente", motivazioniServiceSalesgate.verifyCdCausale(codiceCausale));
		return map;
	}
	
	@RequestMapping(value = "app/motivazione/getMaxId")
	public @ResponseBody int getMaxIdMotivazioneVenditori() {
		int maxId = motivazioniServiceSalesgate.getMaxIdVenditore() + 1;
		logger.debug(maxId);
		return maxId;
	}
	
	public boolean verifyAuth(String user) {
		return motivazioniServiceSalesgate.verifyUser(user);
	}
}
