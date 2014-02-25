package eu.a2a.salesgate.distributori.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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

import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;
import eu.a2a.salesgate.distributori.service.DistributoreService;
import eu.a2a.salesgate.utility.service.UtilityService;

@Controller
public class DistributoreController extends AbstractController {

  @Autowired
  private DistributoreService distributoreService;

  @Autowired
  private UtilityService utilityService;

  private List<Params> listChannel;

  @Autowired
  private Validator distributoreValidator;

  private final Logger logger = Logger.getLogger(this.getClass());

  @ModelAttribute(value = "listChannel")
  public List<Params> getAllChannels() {
    if (listChannel == null) {
      listChannel = utilityService.estraiParams("CHANNELS");
      // list.add(0, new Distributore());
    }
    return listChannel;
  }

  /*
   * @InitBinder
   * 
   * @Override public void initBinder(WebDataBinder dataBinder) {
   * 
   * super.initBinder(dataBinder); SimpleDateFormat sdf = new
   * SimpleDateFormat("dd/MM/yyyy hh:mm:ss"); CustomDateEditor cde = new
   * CustomDateEditor(sdf, true); dataBinder.registerCustomEditor(Date.class,
   * cde);
   * 
   * }
   */

  @RequestMapping(value = "/app/distributore/cerca/{init}", method = RequestMethod.GET)
  public String initCercaDistributore(@PathVariable(value = "init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
    Distributore filtro = new Distributore();
    model.addAttribute("filtro", filtro);
    model.addAttribute("init", init.equals("init"));
    logger.debug(model);
    if (init.equals("init"))
      session.removeAttribute("ricerca_distributore_salvata");
    else
      model.addAttribute("listDistributori", session.getAttribute("ricerca_distributore_salvata"));
    return "app/distributore/cerca";
  }

  @RequestMapping(value = { "/app/distributore/cerca" }, method = RequestMethod.POST)
  public String cercaDistributore(@ModelAttribute("filtro") Distributore filtro, Model model, WebRequest request, Principal principal, HttpSession session) {

    if ("-".equals(filtro.getUtility()))
      filtro.setUtility("");

    List<Distributore> distributori = distributoreService.getDistributori(filtro);
    model.addAttribute("filtro", filtro);
    model.addAttribute("listDistributori", distributori);
    session.setAttribute("ricerca_distributore_salvata", distributori);
    logger.debug(model);
    return "app/distributore/cerca";
  }

  @RequestMapping(value = "/app/distributore/nuovo/{utility}", method = RequestMethod.GET)
  public String nuovoDistributore(@PathVariable(value = "utility") String utility, Model model, WebRequest request, Principal principal, HttpSession session) {

    // ModelAndView model = new ModelAndView("formNuovoDistributore");
    Distributore distributore = new Distributore();
    distributore.setUtility(utility);
    model.addAttribute("distributore", distributore);
    logger.debug(model);

    return "app/distributore/nuovo";
  }

  @RequestMapping(value = "/app/distributore/nuovo", method = RequestMethod.POST)
  public String nuovoDistributore(@ModelAttribute("distributore") Distributore distributore, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
    logger.debug(model);
    distributoreValidator.validate(distributore, result);
    if (result.hasErrors()) {
      model.addAttribute("distributore", distributore);
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/distributore/nuovo";
    }

    distributoreService.insertNewDistributore(distributore);

    return "redirect:/app/distributore/visualizza/" + distributore.getId() + "?save=OK";

  }

  @RequestMapping(value = "/app/distributore/visualizza/{id}", method = RequestMethod.GET)
  public String visualizzaDistributore(@PathVariable(value = "id") String id, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {

    // ModelAndView model = new ModelAndView("formVisualizzaDistributore");
    Distributore distributore;
    if (StringUtils.isEmpty(id)) {
      distributore = new Distributore();
    } else {
      distributore = distributoreService.getDistributore(id);
    }

    model.addAttribute("distributore", distributore);
    if ((save != null) && ("OK".equals(save))) {
      model.addAttribute("messaggio", "Distributore salvato correttamente");
    }

    logger.debug(model);

    return "app/distributore/visualizza";
  }

  @RequestMapping(value = "/app/distributore/modifica", method = RequestMethod.POST)
  public String modificaDistributore(@ModelAttribute("distributore") Distributore distributore, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
    logger.debug(model);
    distributoreValidator.validate(distributore, result);
    if (result.hasErrors()) {
      model.addAttribute("distributore", distributore);
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/distributore/visualizza";
    }

    distributoreService.updateDistributore(distributore);

    return "redirect:/app/distributore/visualizza/" + distributore.getId() + "?save=OK";

  }

  @RequestMapping(value = "/app/distributore/{idDistr}/canali/visualizza", method = RequestMethod.GET)
  public String visualizzaDistributoreCanali(@PathVariable("idDistr") String id_distr, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {

    // ModelAndView model = new
    // ModelAndView("formVisualizzaDistributoreCanali");

    Distributore distributore = distributoreService.getDistributore(id_distr);

    model.addAttribute("distributore", distributore);
    if ((save != null) && ("OK".equals(save))) {
      model.addAttribute("messaggio", "Configurazione salvata correttamente");
    }

    logger.debug(model);

    return "app/distributore/canali/visualizza";
  }

  @RequestMapping(value = "/app/distributore/{idDistr}/canali/modifica", method = RequestMethod.POST)
  public String modificaDistributoreCanali(@ModelAttribute("distributore") Distributore distributore, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
    logger.debug(model);
    // distributoreValidator.validate(distributore, result);
    if (result.hasErrors()) {
      model.addAttribute("distributore", distributore);
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/distributore/canali/visualizza";
    }

    distributoreService.updateCanali(distributore);

    return "redirect:/app/distributore/" + distributore.getId() + "/canali/visualizza?save=OK";

  }

  @RequestMapping(value = "/app/distributore/{idDistr}/PEC/visualizza", method = RequestMethod.GET)
  public String visualizzaDistributorePEC(@PathVariable("idDistr") String idDistr, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {

    Distributore distributore = distributoreService.getDistributore(idDistr);

    model.addAttribute("distributore", distributore);
    if ((save != null) && ("OK".equals(save))) {
      model.addAttribute("messaggio", "Configurazione salvata correttamente");
    }

    logger.debug(model);

    return "app/distributore/pec/visualizza";
  }

  @RequestMapping(value = "/app/distributore/{idDistr}/PEC/{idPEC}/modifica", method = RequestMethod.GET)
  public String modificaDistributorePEC(@PathVariable("idDistr") String idDistr, @PathVariable("idPEC") String idPEC, Model model, WebRequest request, Principal principal, HttpSession session) {

    ServizioPEC pec = distributoreService.getPEC(idPEC);
    model.addAttribute("pec", pec);
    model.addAttribute("name_distr", distributoreService.getDistributore(idDistr).getName());

    return "app/distributore/pec/modifica";

  }

  @RequestMapping(value = "/app/distributore/{idDistr}/PEC/{idPEC}/modifica", method = RequestMethod.POST)
  public String modificaDistributorePEC(@ModelAttribute("pec") ServizioPEC pec, BindingResult result, @PathVariable("idDistr") String idDistr, @PathVariable("idPEC") String idPEC, Model model, WebRequest request, Principal principal,
      HttpSession session) {
    logger.debug(model);
    // distributoreValidator.validate(pec, result);
    if (result.hasErrors()) {
      model.addAttribute("pec", pec);
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/distributore/pec/modifica";
    }

    distributoreService.updatePEC(pec);

    return "redirect:/app/distributore/" + pec.getCodiceDistributore() + "/PEC/visualizza?save=OK";

  }

  @RequestMapping(value = "/app/distributore/verifica/id/{id}", method = RequestMethod.GET)
  public @ResponseBody
  Map<String, Object> verificaIdDistributore(@PathVariable("id") String id, Model model, WebRequest request, Principal principal, HttpSession session) {
    Map<String, Object> m = new HashMap<String, Object>();
    m.put("idEsistente", distributoreService.verifyIdDistributore(id) > 0);

    return m;
  }

  @RequestMapping(value = "/app/distributore/verifica/piva/{piva}", method = RequestMethod.GET)
  public @ResponseBody
  Map<String, Object> verificaPivaDistributore(@PathVariable("piva") String piva, Model model, WebRequest request, Principal principal, HttpSession session) {
    Map<String, Object> m = new HashMap<String, Object>();
    m.put("pivaEsistente", distributoreService.verifyPivaDistributore(piva) > 0);

    return m;
  }

}
