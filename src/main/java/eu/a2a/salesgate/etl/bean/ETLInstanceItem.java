package eu.a2a.salesgate.etl.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.util.StringUtils;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.template.bean.Campo;

public class ETLInstanceItem extends CodDescBean {

  private static final long serialVersionUID = -1645166882694160913L;
  private String eventCode;
  private CodDescBean stato;
  private String fileName;
  private String dataCreazione;
  private String dataInizioLavorazione;
  private String dataFineLavorazione;
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
    try {
      if (StringUtils.isEmpty(dataCreazione)) {
        return "";
      }
      return formatDateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(dataCreazione));
    } catch (ParseException e) {
      e.printStackTrace();
      return null;
    }
  }

  public void setDataCreazione(String dataCreazione) {
    this.dataCreazione = dataCreazione;
  }

  public String getDataInizioLavorazione() {
    try {
      if (StringUtils.isEmpty(dataInizioLavorazione)) {
        return "";
      }
      return formatDateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(dataInizioLavorazione));
    } catch (ParseException e) {
      e.printStackTrace();
      return null;
    }
  }

  public void setDataInizioLavorazione(String dataInizioLavorazione) {
    this.dataInizioLavorazione = dataInizioLavorazione;
  }

  public String getDataFineLavorazione() {
    try {
      if (StringUtils.isEmpty(dataFineLavorazione)) {
        return "";
      }
      return formatDateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(dataFineLavorazione));
    } catch (ParseException e) {
      e.printStackTrace();
      return null;
    }
  }

  public void setDataFineLavorazione(String dataFineLavorazione) {
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
