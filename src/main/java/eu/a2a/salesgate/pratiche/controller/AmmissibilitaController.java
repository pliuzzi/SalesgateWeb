package eu.a2a.salesgate.pratiche.controller;

import static ch.lambdaj.Lambda.by;
import static ch.lambdaj.Lambda.group;
import static ch.lambdaj.Lambda.on;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import ch.lambdaj.group.Group;
import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.Tracking;
import eu.a2a.salesgate.pratiche.gas.validator.AmmissibilitaValidator;
import eu.a2a.salesgate.pratiche.service.AmmissibilitaService;
import eu.a2a.salesgate.utility.service.UtilityService;

@Controller
public class AmmissibilitaController extends AbstractController {

  @Autowired
  AmmissibilitaService ammissibilitaServiceSalesgate;

  @Autowired
  UtilityService utilityServiceSalesgate;

  @Autowired
  AmmissibilitaValidator ammissibilitaValidator;

  @RequestMapping(value = { "/app/pratiche/ammissibilita/{id}/visualizza" }, method = RequestMethod.GET)
  public String getPraticaById(@PathVariable("id") String id, @RequestParam(value = "code", required = false) String code, @RequestParam(value = "message", required = false) String message, Model model, WebRequest request,
      Principal principal, HttpSession session) {

    Tracking tracking = ammissibilitaServiceSalesgate.getTracking(id);
    Group<AnagAmmissibilita> grpAnagAmmissibilita = getGroupAnagAmmissibilita(null, tracking.getUtility());

    model.addAttribute("tracking", tracking);
    model.addAttribute("listAnagAmmissibilita", grpAnagAmmissibilita.subgroups());
    if (code != null) {
      model.addAttribute("code", code);
      model.addAttribute("message", message);
    }

    return "app/ammissibilita/visualizza";
  }

  @RequestMapping(value = "/app/json/pratiche/ammissibilita/{utility}/list", method = { RequestMethod.POST, RequestMethod.GET })
  public @ResponseBody
  Object getListAmmissbilita(@PathVariable("utility") String utility, Model model, WebRequest request, Principal principal, HttpSession session) {
    List<AnagAmmissibilita> listAnagAmmissibilita = utilityServiceSalesgate.getAllAnagAmmissibilita(null, utility);

    return listAnagAmmissibilita;
  }

  @RequestMapping(value = "/app/pratiche/ammissibilita/modifica", method = RequestMethod.POST)
  public String modificaPraticaGas(@ModelAttribute("tracking") Tracking tracking, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
    logger.debug(model);
    ammissibilitaValidator.validate(tracking, result);

    if (result.hasErrors()) {
      model.addAttribute("tracking", tracking);
      Group<AnagAmmissibilita> grpAnagAmmissibilita = getGroupAnagAmmissibilita(null, tracking.getUtility());

      model.addAttribute("listAnagAmmissibilita", grpAnagAmmissibilita.subgroups());
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/ammissibilita/visualizza";
    }

    GenericResponse response = ammissibilitaServiceSalesgate.aggiornaAmmissibilita(tracking);

    return "redirect:/app/pratiche/ammissibilita/" + tracking.getId() + "/visualizza?code=" + response.getCode() + "&message=" + response.getMessage();

  }

  private Group<AnagAmmissibilita> getGroupAnagAmmissibilita(String id, String utility) {
    List<AnagAmmissibilita> listAnagAmmissibilita = utilityServiceSalesgate.getAllAnagAmmissibilita(id, utility);

    Group<AnagAmmissibilita> grpAnagAmmissibilita = group(listAnagAmmissibilita, by(on(AnagAmmissibilita.class).getGruppo()));
    return grpAnagAmmissibilita;
  }
}
