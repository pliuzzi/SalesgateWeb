package eu.a2a.salesgate.log.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.log.bean.TibcoAudit;
import eu.a2a.salesgate.log.service.LogService;

@Controller
public class LogController extends AbstractController {

  @Autowired
  LogService logServiceSalesgate;

  @RequestMapping(value = "/app/log/salesgate", method = RequestMethod.GET)
  public String initCercaLog(@RequestParam(value = "serviceName", required = false) String serviceName, @RequestParam(value = "podPdr", required = false) String podPdr, @RequestParam(value = "appKey1", required = false) String appKey1,
      @RequestParam(value = "appKey2", required = false) String appKey2, @RequestParam(value = "appKey3", required = false) String appKey3, Model model, WebRequest request, Principal principal, HttpSession session) {

    model.addAttribute("serviceName", serviceName);
    model.addAttribute("podPdr", podPdr);
    model.addAttribute("appKey1", appKey1);
    model.addAttribute("appKey2", appKey2);
    model.addAttribute("appKey3", appKey3);

    boolean auto = !(StringUtils.isEmpty(serviceName) && StringUtils.isEmpty(podPdr) && StringUtils.isEmpty(appKey1) && StringUtils.isEmpty(appKey2) && StringUtils.isEmpty(appKey3));

    model.addAttribute("auto", auto);
    logger.debug(model);

    return "app/log/salesgate";
  }

  @RequestMapping(value = "/app/log/salesgate/show", method = RequestMethod.POST)
  public String initCercaLog(@RequestParam(value = "serviceName", required = false) String serviceName, @RequestParam(value = "podPdr", required = false) String podPdr, @RequestParam(value = "appKey1", required = false) String appKey1,
      @RequestParam(value = "appKey2", required = false) String appKey2, @RequestParam(value = "appKey3", required = false) String appKey3, @RequestParam(value = "maxRows", required = false) String maxRows, Model model, WebRequest request,
      Principal principal, HttpSession session) {

    List<TibcoAudit> logs = logServiceSalesgate.getTibcoAudit(serviceName, podPdr, appKey1, appKey2, appKey3, Integer.parseInt(maxRows));

    model.addAttribute("logs", logs);

    return "app/log/salesgate/show";
  }

  @RequestMapping(value = "/app/log/salesgate/show/{id}/xml", method = { RequestMethod.POST, RequestMethod.GET })
  public @ResponseBody
  String initCercaLog(@PathVariable("id") String id, Model model, WebRequest request, Principal principal, HttpSession session, HttpServletResponse response) throws IOException {

    String logXml = logServiceSalesgate.getXmlMessage(id);

    /*
     * ServletOutputStream output = response.getOutputStream();
     * output.write(logXml.getBytes()); output.flush();
     */
    return logXml;

  }

}
