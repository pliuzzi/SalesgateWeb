package eu.a2a.salesgate.files.bean;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;

public class Files extends CodDescBean {

  private static final long serialVersionUID = 8813685230049955548L;
  private String nomeFile;
  private String fkTemplateInstance;
  private String codiceServizio;
  private String codiceFlusso;
  private String statoFile;
  private byte[] fileData;
  private byte[] byteArray;
  private int contaRighe;
  private Date closedDate;
  private String closedBy;
  private Date created;
  private String utility;
  private String tipoFile;

  public Files() {
  }

  public Files(String id) {
    super(id);
  }

  public String getNomeFile() {
    return this.nomeFile;
  }

  public void setNomeFile(String nomeFile) {
    this.nomeFile = nomeFile;
  }

  public String getStatoFile() {
    return this.statoFile;
  }

  public void setStatoFile(String statoFile) {
    this.statoFile = statoFile;
  }

  public byte[] getFileData() {
    return this.fileData;
  }

  public void setFileData(byte[] fileData) throws SQLException {
    this.fileData = fileData;
    byteArray = fileData;// fileData.getBytes(1L, (int)fileData.length() );
  }

  public int getContaRighe() {
    return this.contaRighe;
  }

  public void setContaRighe(int i) {
    this.contaRighe = i;
  }

  public Date getClosedDate() {
    return this.closedDate;
  }

  public void setClosedDate(Date closedDate) {
    this.closedDate = closedDate;
  }

  public String getClosedBy() {
    return this.closedBy;
  }

  public void setClosedBy(String closedBy) {
    this.closedBy = closedBy;
  }

  public byte[] getByteArray() {
    return byteArray;
  }

  public void setByteArray(byte[] byteArray) {
    this.byteArray = byteArray;
  }

  public String getCreated() {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    return sdf.format(created);
  }

  public void setCreated(Date created) {
    this.created = created;
  }

  public String getCodiceServizio() {
    return codiceServizio;
  }

  public void setCodiceServizio(String codiceServizio) {
    this.codiceServizio = codiceServizio;
  }

  public String getCodiceFlusso() {
    return codiceFlusso;
  }

  public void setCodiceFlusso(String codiceFlusso) {
    this.codiceFlusso = codiceFlusso;
  }

  public String getFkTemplateInstance() {
    return fkTemplateInstance;
  }

  public void setFkTemplateInstance(String fkTemplateInstance) {
    this.fkTemplateInstance = fkTemplateInstance;
  }

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

  public String getTipoFile() {
    return tipoFile;
  }

  public void setTipoFile(String tipoFile) {
    this.tipoFile = tipoFile;
  }

}
