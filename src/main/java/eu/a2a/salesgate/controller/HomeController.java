package eu.a2a.salesgate.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.security.service.UserSecurityService;

@Controller
public class HomeController extends AbstractController {

  @Autowired
  private UserSecurityService userSecurityService;
  private boolean userAuth;

  @Value("${version}")
  String version;

  @Value("${build.date}")
  String buildDate;

  @RequestMapping(value = "/app/home", method = RequestMethod.GET)
  public String goToAppHome(Model model, WebRequest request, Principal principal, HttpSession session) {

    /*
     * User loggedUser = userSecurityService.getUserByUsername(principal
     * .getName()); SessionHelper.storeAuthenticatedUserInSession(loggedUser);
     */
    logger.debug(principal.getName());
    userAuth = userSecurityService.verifyUser(principal.getName());
    logger.debug(userAuth);
    model.addAttribute("userAuth", userAuth);
    return "app/home";
  }

  @RequestMapping(value = "/app/menu", method = RequestMethod.GET)
  public String goToAppMenu(Model model, WebRequest request, Principal principal, HttpSession session) {

    /*
     * User loggedUser = userSecurityService.getUserByUsername(principal
     * .getName()); SessionHelper.storeAuthenticatedUserInSession(loggedUser);
     */
    logger.debug(principal.getName());
    userAuth = userSecurityService.verifyUser(principal.getName());
    logger.debug(userAuth);
    model.addAttribute("userAuth", userAuth);
    model.addAttribute("version", version);
    model.addAttribute("build-date", buildDate);
    return "app/menu";
  }

  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String goToIndex(@RequestHeader("User-Agent") String userAgent, Model model, WebRequest request, Principal principal) {
    if (StringUtils.isEmpty(userAgent)) {
      return "browserNotSupported";
    }
    if (userAgent.contains("MSIE 6.0") || userAgent.contains("MSIE 6.1") || userAgent.contains("MSIE 7.0")) {
      return "browserNotSupported";
    }
    return "redirect:/app/home";
  }

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String goToLogin(Model model, WebRequest request, Principal principal) {
    return "login";
  }

}
