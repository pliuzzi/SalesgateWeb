package eu.a2a.salesgate.controller.base;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.tika.detect.CompositeDetector;
import org.apache.tika.detect.Detector;
import org.apache.tika.detect.TextDetector;
import org.apache.tika.detect.TypeDetector;
import org.apache.tika.mime.MimeTypes;
import org.apache.tika.parser.microsoft.POIFSContainerDetector;
import org.apache.tika.parser.pkg.ZipContainerDetector;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import eu.a2a.salesgate.base.Loggable;

public abstract class AbstractController extends Loggable {

  @InitBinder
  public void initBinder(WebDataBinder binder) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    dateFormat.setLenient(false);
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
  }

  protected Detector getDefaultDetectors() {

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

}
