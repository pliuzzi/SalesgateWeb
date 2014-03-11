package eu.a2a.salesgate.etl.bean;

import java.util.Date;
import java.util.List;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.template.bean.Campo;

public class ETLInstanceItem extends CodDescBean {

  private static final long serialVersionUID = -1645166882694160913L;
  private String eventCode;
  private CodDescBean stato;
  private String fileName;
  private Date dataCreazione;
  private Date dataInizioLavorazione;
  private Date dataFineLavorazione;
  private int recordTotali;
  private int recordProcessati;
  private int recordScartati;
  private String linkFileScarti;
  private byte[] fileScarti;

  private List<Campo> campi;
  private List<List<String>> values;

  public String getEventCode() {
    return eventCode;
  }

  public void setEventCode(String eventCode) {
    this.eventCode = eventCode;
  }

  public CodDescBean getStato() {
    return stato;
  }

  public void setStato(CodDescBean stato) {
    this.stato = stato;
  }

  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }

  public String getDataCreazione() {
    return formatDateTime(dataCreazione);
  }

  public void setDataCreazione(Date dataCreazione) {
    this.dataCreazione = dataCreazione;
  }

  public String getDataInizioLavorazione() {
    return formatDateTime(dataInizioLavorazione);
  }

  public void setDataInizioLavorazione(Date dataInizioLavorazione) {
    this.dataInizioLavorazione = dataInizioLavorazione;
  }

  public String getDataFineLavorazione() {
    return formatDateTime(dataFineLavorazione);
  }

  public void setDataFineLavorazione(Date dataFineLavorazione) {
    this.dataFineLavorazione = dataFineLavorazione;
  }

  public int getRecordTotali() {
    return recordTotali;
  }

  public void setRecordTotali(int recordTotali) {
    this.recordTotali = recordTotali;
  }

  public int getRecordProcessati() {
    return recordProcessati;
  }

  public void setRecordProcessati(int recordProcessati) {
    this.recordProcessati = recordProcessati;
  }

  public int getRecordScartati() {
    return recordScartati;
  }

  public void setRecordScartati(int recordScartati) {
    this.recordScartati = recordScartati;
  }

  public String getLinkFileScarti() {
    return linkFileScarti;
  }

  public void setLinkFileScarti(String linkFileScarti) {
    this.linkFileScarti = linkFileScarti;
  }

  public byte[] getFileScarti() {
    return fileScarti;
  }

  public void setFileScarti(byte[] fileScarti) {
    this.fileScarti = fileScarti;
  }

  public List<Campo> getCampi() {
    return campi;
  }

  public void setCampi(List<Campo> campi) {
    this.campi = campi;
  }

  public List<List<String>> getValues() {
    return values;
  }

  public void setValues(List<List<String>> values) {
    this.values = values;
  }

}
