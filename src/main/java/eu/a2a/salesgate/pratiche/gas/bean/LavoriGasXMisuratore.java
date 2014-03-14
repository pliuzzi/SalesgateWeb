package eu.a2a.salesgate.pratiche.gas.bean;

// Generated 27-set-2013 11.36.08 by Hibernate Tools 4.0.0

import java.math.BigDecimal;
import java.util.Date;

public class LavoriGasXMisuratore implements java.io.Serializable {

  private static final long serialVersionUID = 1L;
  private BigDecimal id;
  private String matricola;
  private String valoreLettura;
  private Date dataLettura;
  private String tipoLettura;
  private String segn;
  private Date created;
  private Date lastUpdated;
  private String sostituzione;
  private String rimozione;
  private String NCifre;
  private String stato;
  private Date dataAutolettura;
  private String valoreAutolettura;
  private Date dataDisattivazione;

  public BigDecimal getId() {
    return this.id;
  }

  public void setId(BigDecimal id) {
    this.id = id;
  }

  public String getMatricola() {
    return this.matricola;
  }

  public void setMatricola(String matricola) {
    this.matricola = matricola;
  }

  public String getValoreLettura() {
    return this.valoreLettura;
  }

  public void setValoreLettura(String valoreLettura) {
    this.valoreLettura = valoreLettura;
  }

  public Date getDataLettura() {
    return this.dataLettura;
  }

  public void setDataLettura(Date dataLettura) {
    this.dataLettura = dataLettura;
  }

  public String getTipoLettura() {
    return this.tipoLettura;
  }

  public void setTipoLettura(String tipoLettura) {
    this.tipoLettura = tipoLettura;
  }

  public String getSegn() {
    return this.segn;
  }

  public void setSegn(String segn) {
    this.segn = segn;
  }

  public Date getCreated() {
    return this.created;
  }

  public void setCreated(Date created) {
    this.created = created;
  }

  public Date getLastUpdated() {
    return this.lastUpdated;
  }

  public void setLastUpdated(Date lastUpdated) {
    this.lastUpdated = lastUpdated;
  }

  public String getSostituzione() {
    return this.sostituzione;
  }

  public void setSostituzione(String sostituzione) {
    this.sostituzione = sostituzione;
  }

  public String getRimozione() {
    return this.rimozione;
  }

  public void setRimozione(String rimozione) {
    this.rimozione = rimozione;
  }

  public String getNCifre() {
    return this.NCifre;
  }

  public void setNCifre(String NCifre) {
    this.NCifre = NCifre;
  }

  public String getStato() {
    return this.stato;
  }

  public void setStato(String stato) {
    this.stato = stato;
  }

  public Date getDataAutolettura() {
    return this.dataAutolettura;
  }

  public void setDataAutolettura(Date dataAutolettura) {
    this.dataAutolettura = dataAutolettura;
  }

  public String getValoreAutolettura() {
    return this.valoreAutolettura;
  }

  public void setValoreAutolettura(String valoreAutolettura) {
    this.valoreAutolettura = valoreAutolettura;
  }

  public Date getDataDisattivazione() {
    return this.dataDisattivazione;
  }

  public void setDataDisattivazione(Date dataDisattivazione) {
    this.dataDisattivazione = dataDisattivazione;
  }

}
