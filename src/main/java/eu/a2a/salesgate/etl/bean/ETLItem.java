package eu.a2a.salesgate.etl.bean;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.distributori.bean.Distributore;

public class ETLItem extends CodDescBean {

  private static final long serialVersionUID = 6338596526168429892L;
  private String utility;
  private Distributore distributore;
  private AnagRichieste servizio;
  private AnagFlussi flusso;
  private String eventCode;

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

  public Distributore getDistributore() {
    return distributore;
  }

  public void setDistributore(Distributore distributore) {
    this.distributore = distributore;
  }

  public AnagRichieste getServizio() {
    return servizio;
  }

  public void setServizio(AnagRichieste servizio) {
    this.servizio = servizio;
  }

  public AnagFlussi getFlusso() {
    return flusso;
  }

  public void setFlusso(AnagFlussi flusso) {
    this.flusso = flusso;
  }

  public String getEventCode() {
    return eventCode;
  }

  public void setEventCode(String eventCode) {
    this.eventCode = eventCode;
  }

}
