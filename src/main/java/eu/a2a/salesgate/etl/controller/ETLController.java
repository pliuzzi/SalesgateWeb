package eu.a2a.salesgate.etl.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.etl.bean.ETLInstanceItem;
import eu.a2a.salesgate.etl.service.ETLService;

@Controller
public class ETLController extends AbstractController {

  @Autowired
  ETLService etlServiceSalesgate;

  @RequestMapping(value = { "/app/etl/elenco" })
  public String getListEtl(Model model, WebRequest request, Principal principal, HttpSession session) {

    return "app/etl/elenco";
  }

  @RequestMapping(value = { "/app/etl/tree" }, method = { RequestMethod.GET, RequestMethod.POST })
  public String getTreeETL(Model model, WebRequest request, Principal principal, HttpSession session) {

    List<RootNode> list1 = etlServiceSalesgate.estraiElencoETL("distributore.name", "servizio.code");
    List<RootNode> list2 = etlServiceSalesgate.estraiElencoETL("servizio.code", "distributore.name");
    model.addAttribute("etlNodeDistributore", list1);
    model.addAttribute("etlNodeServizio", list2);

    return "app/etl/tree";
  }

  @RequestMapping(value = { "/app/etl/{eventCode}/instanze" }, method = RequestMethod.GET)
  public String viewETLInstances(@PathVariable("eventCode") String eventCode, Model model, WebRequest request,
      Principal principal, HttpSession session) {

    List<ETLInstanceItem> item = etlServiceSalesgate.estraiElencoETLInstances(eventCode);
    model.addAttribute("istanze", item);

    return "app/etl/istanze";
  }

  @RequestMapping(value = { "/app/etl/{eventCode}/{objId}/staging" }, method = RequestMethod.GET)
  public String viewETLInstances(@PathVariable("eventCode") String eventCode, @PathVariable("objId") String objId,
      Model model, WebRequest request, Principal principal, HttpSession session) {

    ETLInstanceItem item = etlServiceSalesgate.estraiETLInstance(eventCode, objId);
    model.addAttribute("istanza", item);

    return "app/etl/istanza";
  }
}
