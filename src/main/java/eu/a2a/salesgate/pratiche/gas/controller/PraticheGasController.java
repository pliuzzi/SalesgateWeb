package eu.a2a.salesgate.pratiche.gas.controller;

import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.service.DistributoreService;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.bean.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.pratiche.gas.service.LavoriGasService;
import eu.a2a.salesgate.utility.service.UtilityService;
import eu.a2a.salesgate.validator.CustomValidator;

@Controller
public class PraticheGasController extends AbstractController {

  @Autowired
  private LavoriGasService lavoriGasService;

  @Autowired
  private DistributoreService distributoreService;

  @Autowired
  private UtilityService utilityService;

  @Autowired
  private CustomValidator lavoriGasValidator;

  private List<Distributore> listDistributori;

  private List<CodDescBean> listStati;

  @ModelAttribute(value = "listDistributori")
  public List<Distributore> getAllDistributori() {
    if (listDistributori == null) {
      Distributore distr = new Distributore();
      distr.setUtility("GAS");
      listDistributori = distributoreService.getDistributori(distr);
      // list.add(0, new Distributore());
    }
    return listDistributori;
  }

  @ModelAttribute(value = "listStati")
  public List<CodDescBean> getAllStati() {
    if (listStati == null) {
      listStati = utilityService.estraiStati("GAS");
      // list.add(0, new Distributore());
    }
    return listStati;
  }

  @RequestMapping(value = { "/app/pratiche/gas/cerca/{init}", "/app/pratiche/GAS/cerca/{init}" }, method = RequestMethod.GET)
  public String initCercaPraticaGas(@PathVariable("init") String init, Model model, WebRequest request, Principal principal, HttpSession session) {
    FiltroPraticheGas filtro = new FiltroPraticheGas();
    model.addAttribute("filtro", filtro);
    model.addAttribute("init", init.equals("init"));
    logger.debug(model);

    session.removeAttribute("ricerca_pratica_salvata");

    return "app/pratiche/gas/cerca";
  }

  @SuppressWarnings("unchecked")
  @RequestMapping(value = { "/app/pratiche/gas/cerca", "/app/pratiche/GAS/cerca" }, method = RequestMethod.GET)
  public String backToCercaPraticaGas(Model model, WebRequest request, Principal principal, HttpSession session) {
    FiltroPraticheGas filtro = new FiltroPraticheGas();
    model.addAttribute("filtro", filtro);
    logger.debug(model);

    List<LavoriGas> pratiche = (List<LavoriGas>) session.getAttribute("ricerca_pratica_salvata");
    if (pratiche != null) {
      model.addAttribute("filtro", filtro);
      model.addAttribute("listPraticheGas", pratiche);
      session.setAttribute("ricerca_pratica_salvata", pratiche);
    }

    return "app/pratiche/gas/cerca";
  }

  @RequestMapping(value = { "/app/pratiche/gas/cerca" }, method = RequestMethod.POST)
  public String cercaPraticaGAS(@ModelAttribute("filtro") FiltroPraticheGas filtro, Model model, WebRequest request, Principal principal, HttpSession session) {

    if ("-".equals(filtro.getCodiceDistributore())) {
      filtro.setCodiceDistributore("");
    }
    List<LavoriGas> pratiche = lavoriGasService.cercaPerFiltro(filtro);
    model.addAttribute("filtro", filtro);
    model.addAttribute("listPraticheGas", pratiche);
    session.setAttribute("ricerca_pratica_salvata", pratiche);
    logger.debug(model);
    return "app/pratiche/gas/cerca";
  }

  @RequestMapping(value = { "/app/pratiche/gas/{id}/visualizza", "/app/pratiche/GAS/{id}/visualizza" }, method = RequestMethod.GET)
  public String getPraticaGasById(@PathVariable("id") String id, @RequestParam(value = "code", required = false) String code, @RequestParam(value = "message", required = false) String message, Model model, WebRequest request,
      Principal principal, HttpSession session) {

    // ModelAndView model = new ModelAndView("formVisualizzaPraticaGas");

    LavoriGas pratica = lavoriGasService.cercaPraticaPerCodiceSG(id);
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

    model.addAttribute("lavoriGas", pratica);
    model.addAttribute("flussiSalvabili", flussiSalvabili);
    model.addAttribute("dettaglioVerificaEsito", pratica.getLavoriGasExtension().getDettaglioVerificaEsito());
    model.addAttribute("canali", utilityService.estraiParams("CHANNELS"));
    if (code != null) {
      model.addAttribute("code", code);
      model.addAttribute("message", message);
    }

    logger.debug(model);
    model.addAttribute("codServizio", pratica.getCodServizio());
    return "app/pratiche/gas/visualizza";
  }

  @RequestMapping(value = "/app/pratiche/gas/modifica", method = RequestMethod.POST)
  public String modificaPraticaGas(@ModelAttribute("lavoriGas") LavoriGas pratica, BindingResult result, Model model, WebRequest request, Principal principal, HttpSession session) {
    logger.debug(model);
    List<CampiObbligatori> campiObbligatori = utilityService.estraiCampiObbligatori(pratica.getDistributore().getPiva(), pratica.getCodServizio(), pratica.getUtility(), pratica.getCodFlusso());
    lavoriGasValidator.validate(pratica, result, campiObbligatori);
    if (result.hasErrors()) {
      List<FlussiSalvabili> flussiSalvabili = utilityService.estraiFlussiSalvabili(pratica.getCodServizio(), pratica.getCodFlusso(), pratica.getStato(), pratica.getUtility());
      model.addAttribute("lavoriGas", pratica);
      model.addAttribute("flussiSalvabili", flussiSalvabili);
      model.addAttribute("canali", utilityService.estraiParams("CHANNELS"));
      model.addAttribute("error", true);
      logger.debug(model);
      return "app/pratiche/gas/visualizza";
    }

    GenericResponse response = lavoriGasService.savePratica(pratica, pratica.getInviaSap());

    return "redirect:/app/pratiche/gas/" + pratica.getId() + "/visualizza?code=" + response.getCode() + "&message=" + response.getMessage();

  }

}
