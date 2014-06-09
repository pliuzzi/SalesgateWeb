package eu.a2a.salesgate.etl.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tika.detect.Detector;
import org.apache.tika.metadata.Metadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.etl.bean.ETLInstanceItem;
import eu.a2a.salesgate.etl.service.ETLService;
import eu.a2a.salesgate.utility.service.UtilityService;

@Controller
public class ETLController extends AbstractController {

  @Autowired
  ETLService etlServiceSalesgate;

  @Autowired
  private Detector defaultDetector;

  @Autowired
  private UtilityService utilityServiceSalesgate;

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

  @RequestMapping(value = "/app/json/etl/upload", method = RequestMethod.POST)
  public @ResponseBody
  Object uploadTemplateFile(@RequestParam("files[]") MultipartFile file, @RequestParam("eventCode") String eventCode, Model model, WebRequest request, Principal principal, HttpSession session) {
    HashMap<String, Object> res = new HashMap<>();
    try {

      List<HashMap<String, Object>> files = new ArrayList<>();
      HashMap<String, Object> fileItem = new HashMap<>();
      fileItem.put("name", file.getOriginalFilename());
      files.add(fileItem);
      Metadata metadata = new Metadata();
      metadata.add(Metadata.RESOURCE_NAME_KEY, file.getOriginalFilename());

      String mimeType = defaultDetector.detect(null, metadata).toString();

      FileType fileType = utilityServiceSalesgate.estraiFileType(mimeType);
      if (fileType != null) {

        GenericResponse etlResponse = etlServiceSalesgate.startETL(file.getBytes(), file.getOriginalFilename(), eventCode, principal.getName());

        if (etlResponse.isOk()) {
          res.put("files", files);
          res.put("fileTypeId", fileType.getId());
          res.put("fileTypeDesc", fileType.getDescription());
        } else {
          res.put("codErrore", "GEN_ERR");
          res.put("descErrore", etlResponse.getDescription());
        }
      } else {
        res.put("codErrore", "INV_FIL");
        res.put("descErrore", "Il tipo file non è supportato");
      }

    } catch (IOException e) {
      res.put("codErrore", "GEN_ERR");
      res.put("descErrore", e.getMessage());
    }
    return res;

  }

  @RequestMapping(value = { "/app/etl/{eventCode}/instanze" }, method = RequestMethod.GET)
  public String viewETLInstances(@PathVariable("eventCode") String eventCode, Model model, WebRequest request, Principal principal, HttpSession session) {

    List<ETLInstanceItem> item = etlServiceSalesgate.estraiElencoETLInstances(eventCode);
    model.addAttribute("istanze", item);
    model.addAttribute("eventCode", eventCode);

    return "app/etl/istanze";
  }

  @RequestMapping(value = { "/app/etl/{eventCode}/{objId}/staging" }, method = RequestMethod.GET)
  public String viewETLInstanceStaging(@PathVariable("eventCode") String eventCode, @PathVariable("objId") String objId, Model model, WebRequest request, Principal principal, HttpSession session) {

    ETLInstanceItem item = etlServiceSalesgate.estraiETLInstance(eventCode, objId);
    model.addAttribute("istanza", item);

    return "app/etl/istanza";
  }

  @RequestMapping(value = { "/app/etl/{eventCode}/{objId}/scarti" }, method = RequestMethod.GET)
  public @ResponseBody
  Object eseguiCutOff(@PathVariable("eventCode") String eventCode, @PathVariable("objId") String objId, Model model, WebRequest request, Principal principal, HttpSession session, HttpServletResponse response) throws IOException {

    ETLInstanceItem item = etlServiceSalesgate.estraiETLInstance(eventCode, objId);

    String nome = "Scarti_" + item.getFileName() + ".csv";
    byte[] fileContent = item.getFileScarti();

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
}
