package eu.a2a.salesgate.bean;

public class AnagRichieste extends CodDescBean {

  private static final long serialVersionUID = 8493686799149726965L;
  private String code;
  private String utility;
  private Boolean flagRisottomissione;
  private Boolean flagSg;
  private Boolean flagMatrice;
  private Boolean flagSemaforo;
  private Boolean flagCompatiblita;

  public AnagRichieste() {
  }

  public AnagRichieste(String code, String description) {
    super();
    this.code = code;
    this.description = description;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getUtility() {
    return utility;
  }

  public void setUtility(String utility) {
    this.utility = utility;
  }

  public Boolean getFlagRisottomissione() {
    return flagRisottomissione;
  }

  public void setFlagRisottomissione(Boolean flagRisottomissione) {
    this.flagRisottomissione = flagRisottomissione;
  }

  public Boolean getFlagSg() {
    return flagSg;
  }

  public void setFlagSg(Boolean flagSg) {
    this.flagSg = flagSg;
  }

  public Boolean getFlagMatrice() {
    return flagMatrice;
  }

  public void setFlagMatrice(Boolean flagMatrice) {
    this.flagMatrice = flagMatrice;
  }

  public Boolean getFlagSemaforo() {
    return flagSemaforo;
  }

  public void setFlagSemaforo(Boolean flagSemaforo) {
    this.flagSemaforo = flagSemaforo;
  }

  public Boolean getFlagCompatiblita() {
    return flagCompatiblita;
  }

  public void setFlagCompatiblita(Boolean flagCompatiblita) {
    this.flagCompatiblita = flagCompatiblita;
  }

}
