package eu.a2a.salesgate.cutoff.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tika.detect.CompositeDetector;
import org.apache.tika.detect.Detector;
import org.apache.tika.detect.TextDetector;
import org.apache.tika.detect.TypeDetector;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.mime.MimeTypes;
import org.apache.tika.parser.microsoft.POIFSContainerDetector;
import org.apache.tika.parser.pkg.ZipContainerDetector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.cutoff.bean.CutOffItem;
import eu.a2a.salesgate.cutoff.bean.RootNode;
import eu.a2a.salesgate.cutoff.service.CutOffService;
import eu.a2a.salesgate.utility.MapUtility;

@Controller
public class CutOffController {

  @Autowired
  private CutOffService cutOffServiceSalesgate;

  private Detector getDefaultDetectors() {

    Detector detector;

    List<Detector> detectors = new ArrayList<Detector>();

    // zip compressed container types
    detectors.add(new ZipContainerDetector());
    // Microsoft stuff
    detectors.add(new POIFSContainerDetector());
    detectors.add(new TextDetector());
    detectors.add(new TypeDetector());
    // mime magic detection as fallback
    detectors.add(MimeTypes.getDefaultMimeTypes());

    detector = new CompositeDetector(detectors);

    return detector;

  }

  @RequestMapping(value = { "/app/cutoff/elenco" })
  public String getListCutoff(Model model, WebRequest request, Principal principal, HttpSession session) {

    return "app/cutoff/elenco";
  }

  @RequestMapping(value = { "/app/cutoff/tree/{stato}" }, method = { RequestMethod.GET, RequestMethod.POST })
  public String getTreeCutoff(@PathVariable("stato") String stato, Model model, WebRequest request,
      Principal principal, HttpSession session) {

    List<RootNode> list1 = cutOffServiceSalesgate.estraiElencoCutoff(stato, "distributore.name", "servizio.code");
    List<RootNode> list2 = cutOffServiceSalesgate.estraiElencoCutoff(stato, "servizio.code", "distributore.name");
    model.addAttribute("cutOffNodeDistributore", list1);
    model.addAttribute("cutOffNodeServizio", list2);

    return "app/cutoff/tree";
  }

  @RequestMapping(value = { "/app/cutoff/{id}/visualizza" }, method = RequestMethod.GET)
  public String viewCutoff(@PathVariable("id") String id, Model model, WebRequest request, Principal principal,
      HttpSession session) {

    CutOffItem item = cutOffServiceSalesgate.estraiCutoff(id);
    model.addAttribute("cutoff", item);

    return "app/cutoff/visualizza";
  }

  @RequestMapping(value = { "/app/cutoff/{id}/esegui" }, method = RequestMethod.GET)
  public @ResponseBody
  Object eseguiCutOff(@PathVariable("id") String id, Model model, WebRequest request, Principal principal,
      HttpSession session, HttpServletResponse response) throws IOException {

    CutOffItem item = cutOffServiceSalesgate.estraiCutoff(id);

    String nome = item.getFiles().getNomeFile();
    byte[] fileContent = cutOffServiceSalesgate.eseguiCutOff(id).toByteArray();
    response.setHeader("Content-Disposition", "attachment;filename=\"" + nome + "\"");
    OutputStream out = response.getOutputStream();
    Detector detector = getDefaultDetectors();

    Metadata metadata = new Metadata();
    metadata.add(Metadata.RESOURCE_NAME_KEY, nome);
    response.setContentType(detector.detect(null, metadata).getType());
    response.setContentLength(fileContent.length);
    Cookie fileDownloadCookie = new Cookie("fileDownload", "true");
    fileDownloadCookie.setPath("/");
    response.addCookie(fileDownloadCookie);

    // response.setContentType(doc.getContentType());
    FileCopyUtils.copy(fileContent, out);
    out.flush();
    out.close();

    return "eseguiCutOff";
  }

  @RequestMapping(value = { "/app/cutoff/{id}/chiudi" }, method = RequestMethod.GET)
  public @ResponseBody
  Object chiudiCutOff(@PathVariable("id") String id, Model model, WebRequest request, Principal principal,
      HttpSession session) throws IOException {

    // CutOffNode node = cutOffService.estraiCutoff(id);
    cutOffServiceSalesgate.chiudiCutOff(id, principal.getName());

    Map<String, String> res = MapUtility.mapOf("result", "OK");

    return res;
  }

}
