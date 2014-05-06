package eu.a2a.salesgate.cutoff.bean;

import java.util.List;

import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.files.bean.Files;

public class CutOffItem extends CodDescBean {

  private static final long serialVersionUID = 1641751478755025760L;
  private String utility;
  private Distributore distributore;
  private AnagRichieste servizio;
  private CodDescBean canale;
  private Files files;

  private List<PraticaCutOff> pratiche;

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

  public Files getFiles() {
    return files;
  }

  public void setFiles(Files files) {
    this.files = files;
  }

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

  public List<PraticaCutOff> getPratiche() {
    return pratiche;
  }

  public void setPratiche(List<PraticaCutOff> pratiche) {
    this.pratiche = pratiche;
  }

  public CodDescBean getCanale() {
    return canale;
  }

  public void setCanale(CodDescBean canale) {
    this.canale = canale;
  }

}
