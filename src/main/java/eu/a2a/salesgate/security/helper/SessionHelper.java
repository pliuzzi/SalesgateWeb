package eu.a2a.salesgate.security.helper;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import eu.a2a.salesgate.base.Loggable;
import eu.a2a.salesgate.security.bean.User;

public class SessionHelper extends Loggable {

  private static final String authenticatedUserAttribute = "authenticatedUser";

  public static User getAuthenticatedUser() {
    return (User) getSession().getAttribute(authenticatedUserAttribute);
  }

  public static HttpSession getSession() {
    ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
    return sra.getRequest().getSession();
  }

  public static void storeAuthenticatedUserInSession(String user) {
    getSession().setAttribute(authenticatedUserAttribute, user);
  }

}
