package eu.a2a.salesgate.pratiche.controller;

import static ch.lambdaj.Lambda.by;
import static ch.lambdaj.Lambda.group;
import static ch.lambdaj.Lambda.on;

import java.rmi.RemoteException;
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
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.inbound.core.gas.bind.GecoInboundCoreGASRequestDocument;
import eu.a2a.salesgate.inbound.core.gas.bind.GecoInboundCoreGASRequestDocument.GecoInboundCoreGASRequest;
import eu.a2a.salesgate.inbound.core.gas.bind.GecoInboundCoreGASResponseDocument;
import eu.a2a.salesgate.inbound.core.gas.client.GecoInboundCoreGAS_ServiceStub;
import eu.a2a.salesgate.inbound.core.gas.client.InviaEsitoGASFaultMsg;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.Tracking;
import eu.a2a.salesgate.pratiche.service.AmmissibilitaService;
import eu.a2a.salesgate.utility.dao.UtilityDAO;
import eu.a2a.salesgate.utility.service.UtilityService;

@Controller
public class AmmissibilitaController extends AbstractController {

  @Autowired
  AmmissibilitaService ammissibilitaServiceSalesgate;

  @Autowired
  UtilityService utilityServiceSalesgate;

  @Autowired
  private UtilityDAO utilityDaoSalesgate; // Orrendo da togliere

  @RequestMapping(value = { "/app/pratiche/ammissibilita/{id}/visualizza" }, method = RequestMethod.GET)
  public String getPraticaById(@PathVariable("id") String id, @RequestParam(value = "save", required = false) String save, Model model, WebRequest request, Principal principal, HttpSession session) {

    Tracking tracking = ammissibilitaServiceSalesgate.getTracking(id);
    List<AnagAmmissibilita> listAnagAmmissibilita = utilityServiceSalesgate.getAllAnagAmmissibilita(null, tracking.getUtility());

    Group<AnagAmmissibilita> grpAnagAmmissibilita = group(listAnagAmmissibilita, by(on(AnagAmmissibilita.class).getGruppo()));

    model.addAttribute("tracking", tracking);
    model.addAttribute("listAnagAmmissibilita", grpAnagAmmissibilita.subgroups());

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
    /*
     * if (result.hasErrors()) { List<FlussiSalvabili> flussiSalvabili =
     * utilityService.estraiFlussiSalvabili(pratica.getCodServizio(),
     * pratica.getCodFlusso(), pratica.getStato(), pratica.getUtility());
     * model.addAttribute("lavoriGas", pratica);
     * model.addAttribute("flussiSalvabili", flussiSalvabili);
     * model.addAttribute("error", true); logger.debug(model); return
     * "app/pratiche/gas/visualizza"; }
     */

    try {
      GecoInboundCoreGAS_ServiceStub service = new GecoInboundCoreGAS_ServiceStub("http://10.90.101.177:12060/Business/Services/GecoInboundCore_GAS");

      GecoInboundCoreGASRequestDocument soapRequestDoc = GecoInboundCoreGASRequestDocument.Factory.newInstance();

      AnagAmmissibilita am = utilityServiceSalesgate.getAllAnagAmmissibilita(tracking.getAnagAmmissibilita().getId(), null).get(0);

      GecoInboundCoreGASRequest soapRequest = soapRequestDoc.addNewGecoInboundCoreGASRequest();
      soapRequest.setCODSERVIZIO(tracking.getCodServizio());
      soapRequest.setCODFLUSSO("0100");
      soapRequest.setCODPRATSG(tracking.getId());
      soapRequest.setCODPRATDISTR(tracking.getCodicePraticaDl());
      soapRequest.setVERIFICAAMM(am.getEsito() + "");
      soapRequest.setMOTIVAZIONE(am.getDescription());
      soapRequest.setCODCAUSALE(am.getCodice());

      GecoInboundCoreGASResponseDocument soapResponse = service.inviaEsitoGAS(soapRequestDoc);

      utilityDaoSalesgate.aggiornaAvanzamentoFlussi("0100", "RICEVUTO_DL", "I", tracking.getId());

      logger.debug(soapResponse);

    } catch (RemoteException | InviaEsitoGASFaultMsg e) {

      e.printStackTrace();

    }

    return "redirect:/app/pratiche/ammissibilita/" + tracking.getId() + "/visualizza?save=OK";

  }
}
