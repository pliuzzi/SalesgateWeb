package eu.a2a.salesgate.distributori.bean;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Distributore implements Serializable, Cloneable {

  private static final long serialVersionUID = -7419619162888448961L;

  private String id;
  private String name;
  private String piva;
  private String utility;
  private String referente;
  private String telReferente;
  private String emailReferente;
  private String pec;
  private String sitoWeb;
  private String flagAdempiente147;
  private Date dataAdempiente;
  private boolean flagAttivo;
  private boolean flagNotificaSwo;
  private boolean flagRuc;
  private Date lastUpdatedFlgSwo;
  private Date lastUpdatedFlgRuc;

  private List<ServizioCanale> listServizioCanale;
  private List<ServizioPEC> listServizioPEC;

  public Distributore() {
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPiva() {
    return piva;
  }

  public void setPiva(String piva) {
    this.piva = piva;
  }

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

  public String getReferente() {
    return referente;
  }

  public void setReferente(String referente) {
    this.referente = referente;
  }

  public String getTelReferente() {
    return telReferente;
  }

  public void setTelReferente(String telReferente) {
    this.telReferente = telReferente;
  }

  public String getEmailReferente() {
    return emailReferente;
  }

  public void setEmailReferente(String emailReferente) {
    this.emailReferente = emailReferente;
  }

  public String getPec() {
    return pec;
  }

  public void setPec(String pec) {
    this.pec = pec;
  }

  public String getSitoWeb() {
    return sitoWeb;
  }

  public void setSitoWeb(String sitoWeb) {
    this.sitoWeb = sitoWeb;
  }

  public String getFlagAdempiente147() {
    return flagAdempiente147;
  }

  public void setFlagAdempiente147(String flagAdempiente147) {
    this.flagAdempiente147 = flagAdempiente147;
  }

  public Date getDataAdempiente() {
    return dataAdempiente;
  }

  public void setDataAdempiente(Date dataAdempiente) {
    this.dataAdempiente = dataAdempiente;
  }

  public boolean getFlagAttivo() {
    return flagAttivo;
  }

  public void setFlagAttivo(boolean flagAttivo) {
    this.flagAttivo = flagAttivo;
  }

  public boolean getFlagNotificaSwo() {
    return flagNotificaSwo;
  }

  public String getFlagNotificaSwoHtml() {
    return flagNotificaSwo ? "Abilitati" : "Non Abilitati";
  }

  public void setFlagNotificaSwo(boolean flagNotificaSwo) {
    this.flagNotificaSwo = flagNotificaSwo;
  }

  public boolean getFlagRuc() {
    return flagRuc;
  }

  public String getFlagRucHtml() {
    return flagRuc ? "Abilitati" : "Non Abilitati";
  }

  public void setFlagRuc(boolean flagRuc) {
    this.flagRuc = flagRuc;
  }

  public Date getLastUpdatedFlgSwo() {
    return lastUpdatedFlgSwo;
  }

  public String getLastUpdatedFlgSwoHtml() {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
    return (lastUpdatedFlgSwo == null) ? "ND" : sdf.format(lastUpdatedFlgSwo);
  }

  public void setLastUpdatedFlgSwo(Date lastUpdatedFlgSwo) {
    this.lastUpdatedFlgSwo = lastUpdatedFlgSwo;
  }

  public Date getLastUpdatedFlgRuc() {
    return lastUpdatedFlgRuc;
  }

  public String getLastUpdatedFlgRucHtml() {
    SimpleDateFormat sdf = new SimpleDateFormat("dd/mm/yyyy");
    return (lastUpdatedFlgRuc == null) ? "ND" : sdf.format(lastUpdatedFlgRuc);
  }

  public void setLastUpdatedFlgRuc(Date lastUpdatedFlgRuc) {
    this.lastUpdatedFlgRuc = lastUpdatedFlgRuc;
  }

  public List<ServizioCanale> getListServizioCanale() {
    return listServizioCanale;
  }

  public void setListServizioCanale(List<ServizioCanale> listServizioCanale) {
    this.listServizioCanale = listServizioCanale;
  }

  public List<ServizioPEC> getListServizioPEC() {
    return listServizioPEC;
  }

  public void setListServizioPEC(List<ServizioPEC> listServizioPEC) {
    this.listServizioPEC = listServizioPEC;
  }

  @Override
  public Distributore clone() {

    try {
      return (Distributore) super.clone();
    } catch (CloneNotSupportedException e) {
      e.printStackTrace();
      return null;
    }
  }

}
