package eu.a2a.salesgate.legacy.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.controller.base.AbstractController;

@Controller
public class LegacyController extends AbstractController {

  public static final String FD_USER_TOKEN = "{user}";
  public static final String FD_URL_TOKEN = "{url}";
  public static final String FD_DAY_TOKEN = "{day}";
  public static final String FD_LEGACY_PWD_TOKEN = "{legacyPwd}";
  public static final String FD_TEMPLATE = FD_USER_TOKEN + "|" + FD_URL_TOKEN + "|" + FD_LEGACY_PWD_TOKEN;
  public static final String LEGACY_PWD = "CIOCCO0*";

  @Autowired
  private String urlLegacySGBA;

  public static final String[] urlLegacyd = { "/initSalesgateBusinessArea", "/initSalesgateGestionePratiche", "/initCaricamentoEsitiMassivi", "/initSalesgateDatiFiscali", "/initSalesgateUserConsole", "/initSDMBusinessArea",
      "/initSDMFileUploader" };

  @RequestMapping(value = "/app/legacy/{url}", method = RequestMethod.GET)
  public String toLegacy(@PathVariable(value = "url") String url, Model model, WebRequest request, Principal principal, HttpSession session) {

    model.addAttribute("url", getLegacyUrl(principal.getName(), url));

    return "app/legacy";
  }

  private String getLegacyUrl(String user, String url) {

    String ret = urlLegacySGBA + "/legacySgbaWeb?user=" + user + "&url=" + url + "&fd=" + getFdUrl(user, url);

    return ret;

  }

  private String getFdUrl(String user, String url) {
    String fd = null;
    try {
      String fdtoCheck = FD_TEMPLATE.replace(FD_USER_TOKEN, user).replace(FD_URL_TOKEN, url).replace(FD_LEGACY_PWD_TOKEN, LEGACY_PWD);

      MessageDigest md;

      md = MessageDigest.getInstance("MD5");
      byte[] mdbytes = md.digest(fdtoCheck.getBytes());
      StringBuffer sb = new StringBuffer();
      for (int i = 0; i < mdbytes.length; i++) {
        sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
      }
      fd = sb.toString();
    } catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
    }
    return fd;
  }

}
