package eu.a2a.salesgate.files.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.context.request.WebRequest;

import eu.a2a.salesgate.files.bean.Files;
import eu.a2a.salesgate.files.service.FilesService;

@Controller
public class FilesController {

  @Autowired
  private FilesService filesService;

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

  @RequestMapping(value = "/app/files/{id}/download", method = RequestMethod.GET)
  public void downloadFile(@PathVariable("id") String id, Model model, WebRequest request, Principal principal,
      HttpSession session, HttpServletResponse response) {

    try {
      Files file = filesService.estraiFiles(id);

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
