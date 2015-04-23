package eu.a2a.salesgate.venditori.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import eu.a2a.salesgate.venditori.bean.Venditore;
import eu.a2a.salesgate.venditori.service.VenditoriService;

@Controller
public class VenditoriController extends AbstractController {
	@Autowired
	private VenditoriService venditoriServiceSalesgate;
	@Autowired
	private Validator venditoreValidator;
	
	@RequestMapping(value = "/app/venditore/cerca/{init}", method = RequestMethod.GET)
	public String initCercaVenditore(@PathVariable(value = "init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
		Venditore filtro = new Venditore();
		model.addAttribute("filtro", filtro);
		model.addAttribute("init", init.equals("init"));
		logger.debug(model);
		if(init.equals("init")) {
			session.removeAttribute("ricerca_venditori_salvata");
		}
		else {
			model.addAttribute("listVenditori", session.getAttribute("ricerca_venditori_salvata"));
		}
		return "app/venditore/cerca";
	}
	
	@RequestMapping(value = "/app/venditore/cerca", method = RequestMethod.POST)
	public String cercaVenditore(@ModelAttribute("filtro") Venditore filtro, Model model, WebRequest request, Principal principal, HttpSession session) {
		List<Venditore> venditori = venditoriServiceSalesgate.getAllVenditori(filtro);
		model.addAttribute("filtro", filtro);
		model.addAttribute("listVenditori", venditori);
		session.setAttribute("ricerca_venditori_salvata", venditori);
		logger.debug(model);
		return "app/venditore/cerca";
	}
	
	@RequestMapping(value = "/app/venditore/nuovo", method = RequestMethod.GET)
	public String nuovoVenditore(Model model, WebRequest request, Principal principal, HttpSession session) {
		Venditore venditore = new Venditore();
		model.addAttribute("venditore", venditore);
		return "app/venditore/nuovo";
	}
	
	@RequestMapping(value = "/app/venditore/nuovo", method = RequestMethod.POST)
	public String nuovoVenditore(@ModelAttribute("venditore") Venditore venditore, Model model, BindingResult result, WebRequest request, Principal principal, HttpSession session) {
		logger.debug(model);
		venditoreValidator.validate(venditore, result);
		if (result.hasErrors()) {
			model.addAttribute("venditore", venditore);
			model.addAttribute("error", true);
			logger.debug(model);
			return "app/venditore/nuovo";
		}
		venditoriServiceSalesgate.insertNewVenditore(venditore, principal.getName());
		return "redirect:/app/venditore/visualizza/" + venditore.getId() + "?save=OK";
	}
	
	@RequestMapping(value = "/app/venditore/visualizza/{id}", method = RequestMethod.GET)
	public String visualizzaVenditore(@PathVariable("id") String id, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {
		Venditore venditore;
		if (StringUtils.isEmpty(id)) {
			venditore = new Venditore();
		}
		else {
			venditore = venditoriServiceSalesgate.getVenditore(id);
		}
		model.addAttribute("venditore", venditore);
		if ((save != null) && ("OK".equals(save))) {
			model.addAttribute("messaggio", "Venditore salvato correttamente");
		}
		logger.debug(model);
		return "app/venditore/visualizza";
	}
	
	@RequestMapping(value = "/app/venditore/modifica", method = RequestMethod.POST)
	public String modificaVenditore(@ModelAttribute("venditore") Venditore venditore, Model model, BindingResult result, WebRequest request, Principal principal, HttpSession session) {
		logger.debug(model);
		venditoreValidator.validate(venditore, result);
		if (result.hasErrors()) {
			model.addAttribute("venditore", venditore);
			model.addAttribute("error", true);
			logger.debug(model);
			return "app/venditore/visualizza";
		}
		venditoriServiceSalesgate.updateVenditore(venditore, principal.getName());
		return "redirect:/app/venditore/visualizza/" + venditore.getId() + "?save=OK";
	}
	
	@RequestMapping(value = "/app/venditore/verifica/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> verificaIdVenditore(@PathVariable(value = "id") String id, Model model, WebRequest request, Principal principal, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idEsistente", venditoriServiceSalesgate.verifyIdVenditore(id) > 0);
		return map;
	}
	
	@RequestMapping(value = "/app/venditore/verifica/ptIva/{ptIva}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> verificaPtIvaVenditore(@PathVariable(value = "ptIva") String ptIva, Model model, WebRequest request, Principal principal, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ptIvaEsistente", venditoriServiceSalesgate.verifyPtIvaVenditore(ptIva));
		return map;
	}
}
