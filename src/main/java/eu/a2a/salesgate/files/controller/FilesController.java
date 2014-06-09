package eu.a2a.salesgate.files.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;

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
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.controller.base.AbstractController;
import eu.a2a.salesgate.files.bean.Files;
import eu.a2a.salesgate.files.service.FilesService;

@Controller
public class FilesController extends AbstractController {

  @Autowired
  private FilesService filesServiceSalesgate;

  @RequestMapping(value = "/app/files/{id}/download", method = RequestMethod.GET)
  public void downloadFile(@PathVariable("id") String id, Model model, WebRequest request, Principal principal, HttpSession session, HttpServletResponse response) {

    try {
      Files file = filesServiceSalesgate.estraiFiles(id);

      response.setHeader("Content-Disposition", "attachment;filename=\"" + file.getNomeFile() + "\"");
      OutputStream out = response.getOutputStream();
      /*
       * MimetypesFileTypeMap mft = new MimetypesFileTypeMap();
       * response.setContentType(mft.getContentType(file.getNomeFile()));
       */

      Detector detector = getDefaultDetectors();

      Metadata metadata = new Metadata();
      metadata.add(Metadata.RESOURCE_NAME_KEY, file.getNomeFile());
      response.setContentType(detector.detect(null, metadata).getType());
      response.setContentLength(file.getByteArray().length);

      // response.setContentType(doc.getContentType());
      FileCopyUtils.copy(file.getByteArray(), out);
      out.flush();
      out.close();
    } catch (IOException e) {
      e.printStackTrace();
    }

  }

}
