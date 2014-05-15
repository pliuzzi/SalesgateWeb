package eu.a2a.salesgate.pratiche.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class AnagAmmissibilita extends CodDescBean {

  /**
	 * 
	 */
  private static final long serialVersionUID = -795379826155176355L;
  private String utility;
  private String codice;
  private int esito;
  private String gruppo;

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

  public String getCodice() {
    return codice;
  }

  public void setCodice(String codice) {
    this.codice = codice;
  }

  public int getEsito() {
    return esito;
  }

  public void setEsito(int esito) {
    this.esito = esito;
  }

  public String getGruppo() {
    return gruppo;
  }

  public void setGruppo(String gruppo) {
    this.gruppo = gruppo;
  }

}
