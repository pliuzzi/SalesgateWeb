package eu.a2a.salesgate.template.bean;

import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.bean.FileType;

public class AnagTemplate extends CodDescBean {

  private static final long serialVersionUID = -2217999041857926711L;
  private String nomeFile;
  private byte[] fileContent;
  private Integer firstRow;
  private FileType fileType;
  private String separatore;
  private Integer nMaxRighe;
  private String inOut;
  private Date created;
  private Date lastUpdated;

  public String getNomeFile() {
    return nomeFile;
  }

  public void setNomeFile(String nomeFile) {
    this.nomeFile = nomeFile;
  }

  public byte[] getFileContent() {
    return fileContent;
  }

  public void setFileContent(byte[] fileContent) {
    this.fileContent = fileContent;
  }

  public Integer getFirstRow() {
    return firstRow;
  }

  public void setFirstRow(Integer firstRow) {
    this.firstRow = firstRow;
  }

  public FileType getFileType() {
    return fileType;
  }

  public void setFileType(FileType fileType) {
    this.fileType = fileType;
  }

  public String getSeparatore() {
    return separatore;
  }

  public void setSeparatore(String separatore) {
    this.separatore = separatore;
  }

  public Integer getnMaxRighe() {
    return nMaxRighe;
  }

  public void setnMaxRighe(Integer nMaxRighe) {
    this.nMaxRighe = nMaxRighe;
  }

  public String getInOut() {
    return inOut;
  }

  public void setInOut(String inOut) {
    this.inOut = inOut;
  }

  public Date getCreated() {
    return created;
  }

  public void setCreated(Date created) {
    this.created = created;
  }

  public Date getLastUpdated() {
    return lastUpdated;
  }

  public void setLastUpdated(Date lastUpdated) {
    this.lastUpdated = lastUpdated;
  }

}
