package eu.a2a.salesgate.pratiche.ele.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.service.DistributoreService;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.ele.bean.FiltroPraticheEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;
import eu.a2a.salesgate.pratiche.ele.service.LavoriEleService;
import eu.a2a.salesgate.utility.service.UtilityService;
import eu.a2a.salesgate.validator.CustomValidator;

@Controller
public class PraticheEleController extends AbstractController {

  @Autowired
  private LavoriEleService lavoriEleService;

  @Autowired
  private DistributoreService distributoreService;

  @Autowired
  private UtilityService utilityService;

  @Autowired
  private CustomValidator lavoriEleValidator;

  private List<Distributore> list;

  private final Logger logger = Logger.getLogger(this.getClass());

  @ModelAttribute(value = "listDistributori")
  public List<Distributore> getAllDistributori() {
    if (list == null) {
      Distributore distr = new Distributore();
      distr.setUtility("ELE");
      list = distributoreService.getDistributori(distr);
      // list.add(0, new Distributore());
    }
    return list;
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
  @RequestMapping(value = { "/app/pratiche/ele/cerca/{init}", "/app/pratiche/ELE/cerca/{init}" }, method = RequestMethod.GET)
  public String initCercaPraticaEle(@PathVariable("init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
    FiltroPraticheEle filtro = new FiltroPraticheEle();
    model.addAttribute("filtro", filtro);
    model.addAttribute("init", init.equals("init"));
    logger.debug(model);

    session.removeAttribute("ricerca_pratica_ele_salvata");

    return "app/pratiche/ele/cerca";
  }

  @SuppressWarnings("unchecked")
  @RequestMapping(value = "/app/pratiche/ele/cerca", method = RequestMethod.GET)
  public String backToCercaPraticaEle(Model model, WebRequest request, Principal principal, HttpSession session) {
    FiltroPraticheEle filtro = new FiltroPraticheEle();
    model.addAttribute("filtro", filtro);
    logger.debug(model);

    List<LavoriEle> pratiche = (List<LavoriEle>) session.getAttribute("ricerca_pratica_ele_salvata");
    if (pratiche != null) {
      model.addAttribute("filtro", filtro);
      model.addAttribute("listPraticheEle", pratiche);
      session.setAttribute("ricerca_pratica_ele_salvata", pratiche);
    }

    return "app/pratiche/ele/cerca";
  }

  @RequestMapping(value = { "/app/pratiche/ele/cerca", "/app/pratiche/ELE/cerca" }, method = RequestMethod.POST)
  public String cercaPraticaEle(@ModelAttribute("filtro") FiltroPraticheEle filtro, Model model, WebRequest request, Principal principal, HttpSession session) {

    if ("-".equals(filtro.getCodiceDistributore())) {
      filtro.setCodiceDistributore("");
    }
    List<LavoriEle> pratiche = lavoriEleService.cercaPerFiltro(filtro);
    model.addAttribute("filtro", filtro);
    model.addAttribute("listPraticheEle", pratiche);
    session.setAttribute("ricerca_pratica__ele_salvata", pratiche);
    logger.debug(model);
    return "app/pratiche/ele/cerca";
  }

  @RequestMapping(value = { "/app/pratiche/ele/{id}/visualizza", "/app/pratiche/ELE/{id}/visualizza" }, method = RequestMethod.GET)
  public String getPraticaGasById(@PathVariable("id") String id, @RequestParam(value = "code", required = false) String code, @RequestParam(value = "message", required = false) String message, Model model, WebRequest request,
      Principal principal, HttpSession session) {
    // ModelAndView model = new ModelAndView("formVisualizzaPraticaGas");

    LavoriEle pratica = lavoriEleService.cercaPraticaPerCodiceSG(id);
    List<FlussiSalvabili> flussiSalvabili;
    if (request.isUserInRole("ROLE_VPN-ESTERNI-PIC")) {
      FlussiSalvabili fs = new FlussiSalvabili();
      fs.setCodFlussoAcc("0150");
      fs.setDescFlussoAcc("Esito - DEBUG");
      flussiSalvabili = new ArrayList<FlussiSalvabili>();
      flussiSalvabili.add(fs);
    } else {
      flussiSalvabili = utilityService.estraiFlussiSalvabili(pratica.getCodServizio(), pratica.getCodFlusso(), pratica.getStato(), pratica.getUtility());
    }

    model.addAttribute("lavoriEle", pratica);
    model.addAttribute("flussiSalvabili", flussiSalvabili);
    model.addAttribute("dettaglioVerificaEsito", pratica.getLavoriEleExtension().getDettaglioVerificaEsito());
    if (code != null) {
      model.addAttribute("code", code);
      model.addAttribute("message", message);
    }

    logger.debug(model);

    return "app/pratiche/ele/visualizza";
  }

  @RequestMapping(value = "/app/pratiche/ele/modifica", method = RequestMethod.POST)
  public String modificaPraticaEle(@ModelAttribute("lavoriEle") LavoriEle pratica, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
    logger.debug(model);
    List<CampiObbligatori> campiObbligatori = utilityService.estraiCampiObbligatori(pratica.getDistributore().getPiva(), pratica.getCodServizio(), pratica.getUtility(), pratica.getCodFlusso());
    lavoriEleValidator.validate(pratica, result, campiObbligatori);
    if (result.hasErrors()) {
      List<FlussiSalvabili> flussiSalvabili = utilityService.estraiFlussiSalvabili(pratica.getCodServizio(), pratica.getCodFlusso(), pratica.getStato(), pratica.getUtility());
      model.addAttribute("lavoriEle", pratica);
      model.addAttribute("flussiSalvabili", flussiSalvabili);
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/pratiche/ele/visualizza";
    }

    GenericResponse response = lavoriEleService.savePratica(pratica, pratica.getInviaSap());

    return "redirect:/app/pratiche/ele/" + pratica.getId() + "/visualizza?code=" + response.getCode() + "&message=" + response.getMessage();

  }

}
