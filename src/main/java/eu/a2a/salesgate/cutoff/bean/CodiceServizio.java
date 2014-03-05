package eu.a2a.salesgate.cutoff.bean;

import java.util.List;

import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.files.bean.Files;

public class CodiceServizio extends AnagRichieste {

  private static final long serialVersionUID = 1145981033587839344L;

  private List<Files> files;

  public CodiceServizio() {
  }

  public CodiceServizio(String code) {
    super(code, "");
  }

  public List<Files> getFiles() {
    return files;
  }

  public void setFiles(List<Files> files) {
    this.files = files;
  }

}
