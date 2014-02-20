package eu.a2a.salesgate.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.security.bean.User;
import eu.a2a.salesgate.security.helper.SessionHelper;
import eu.a2a.salesgate.security.service.UserSecurityService;

@Controller
public class HomeController extends AbstractController {

	@Autowired
	private UserSecurityService userSecurityService;

	@RequestMapping(value = "/app/home", method = RequestMethod.GET)
	public String goToAppHome(Model model, WebRequest request,
			Principal principal, HttpSession session) {

		/*User loggedUser = userSecurityService.getUserByUsername(principal
				.getName());
		SessionHelper.storeAuthenticatedUserInSession(loggedUser);*/

		return "app/home";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goToIndex(Model model, WebRequest request, Principal principal) {
		return "redirect:/app/home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goToLogin(Model model, WebRequest request, Principal principal) {
		return "login";
	}

}
