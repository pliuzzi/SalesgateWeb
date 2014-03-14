package eu.a2a.salesgate.distributori.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class ServizioPEC extends CodDescBean {

  private static final long serialVersionUID = 7275604825349161537L;
  private String codiceServizio;
  private String codiceDistributore;
  private String pecFrom;
  private String pecUsername;
  private String pecPassword;
  private String pecTo;
  private String subject;
  private String oraInizio;
  private String tempoReinvio;

  public String getCodiceServizio() {
    return codiceServizio;
  }

  public void setCodiceServizio(String codiceServizio) {
    this.codiceServizio = codiceServizio;
  }

  public String getPecFrom() {
    return pecFrom;
  }

  public void setPecFrom(String pecFrom) {
    this.pecFrom = pecFrom;
  }

  public String getPecUsername() {
    return pecUsername;
  }

  public void setPecUsername(String pecUsername) {
    this.pecUsername = pecUsername;
  }

  public String getPecPassword() {
    return pecPassword;
  }

  public void setPecPassword(String pecPassword) {
    this.pecPassword = pecPassword;
  }

  public String getPecTo() {
    return pecTo;
  }

  public void setPecTo(String pecTo) {
    this.pecTo = pecTo;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getOraInizio() {
    return oraInizio;
  }

  public void setOraInizio(String oraInizio) {
    this.oraInizio = oraInizio;
  }

  public String getTempoReinvio() {
    return tempoReinvio;
  }

  public void setTempoReinvio(String tempoReinvio) {
    this.tempoReinvio = tempoReinvio;
  }

  public String getCodiceDistributore() {
    return codiceDistributore;
  }

  public void setCodiceDistributore(String codiceDistributore) {
    this.codiceDistributore = codiceDistributore;
  }

}
