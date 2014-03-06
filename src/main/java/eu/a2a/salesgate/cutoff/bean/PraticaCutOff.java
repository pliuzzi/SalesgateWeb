package eu.a2a.salesgate.cutoff.bean;

import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;

public class PraticaCutOff extends CodDescBean {

  private static final long serialVersionUID = 4463569937448952363L;

  private String codicePraticaMittente;
  private String pod;
  private String mercato;
  private String stato;
  private Date created;

  public String getCodicePraticaMittente() {
    return codicePraticaMittente;
  }

  public void setCodicePraticaMittente(String codicePraticaMittente) {
    this.codicePraticaMittente = codicePraticaMittente;
  }

  public String getPod() {
    return pod;
  }

  public void setPod(String pod) {
    this.pod = pod;
  }

  public String getMercato() {
    return mercato;
  }

  public void setMercato(String mercato) {
    this.mercato = mercato;
  }

  public String getStato() {
    return stato;
  }

  public void setStato(String stato) {
    this.stato = stato;
  }

  public String getCreated() {
    return formatDate(created);
  }

  public void setCreated(Date created) {
    this.created = created;
  }

}
