package eu.a2a.salesgate.pratiche.ele.bean;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.bean.Tracking;

@Component
public class LavoriEle extends Tracking {

  private static final long serialVersionUID = -3325069660182541177L;

  private final String utility = "ELE";

  private final ArrayList<String> statiAbilitantiEle;

  private String pod;

  private final String pivaUtente = "12883450152";

  private String flussoAcc;

  private LavoriEleExtension lavoriEleExtension;
  private AvanzamentoFlussi avanzamentoFlussi;

  private boolean inviaSap;

  private boolean isLavoriEleEditable;
  private boolean isCodicePraticaDlReadOnly;

  public LavoriEle() {
    statiAbilitantiEle = new ArrayList<String>();
    statiAbilitantiEle.add("INVIATO DL");
    statiAbilitantiEle.add("AMMISSIBILE");
    statiAbilitantiEle.add("EVASA OK DL");
    statiAbilitantiEle.add("EVASA KO DL");
    statiAbilitantiEle.add("CONCLUSA KO");
    inviaSap = false;
  }

  public boolean getIsLavoriEleEditable() {
    return isLavoriEleEditable;
  }

  public String getPod() {
    return this.pod;
  }

  public void setPod(String pod) {
    this.pod = pod;
  }

  public LavoriEleExtension getLavoriEleExtension() {
    return lavoriEleExtension;
  }

  public void setLavoriEleExtension(LavoriEleExtension lavoriEleExtension) {
    this.lavoriEleExtension = lavoriEleExtension;
  }

  public String getFlussoAcc() {
    return flussoAcc;
  }

  public void setFlussoAcc(String flussoAcc) {
    this.flussoAcc = flussoAcc;
  }

  @Override
  public String getUtility() {
    return utility;
  }

  public String getPivaUtente() {
    return pivaUtente;
  }

  public AvanzamentoFlussi getAvanzamentoFlussi() {
    return avanzamentoFlussi;
  }

  public void setAvanzamentoFlussi(AvanzamentoFlussi avanzamentoFlussi) {
    this.avanzamentoFlussi = avanzamentoFlussi;
  }

  public boolean getInviaSap() {
    return inviaSap;
  }

  public void setInviaSap(boolean inviaSap) {
    this.inviaSap = inviaSap;
  }

  public boolean getIsCodicePraticaDlReadOnly() {
    isCodicePraticaDlReadOnly = super.stato != "AMMISSIBILE";
    return isCodicePraticaDlReadOnly;
  }

  public void setIsCodicePraticaDlReadOnly(boolean isCodicePraticaDlReadOnly) {
    this.isCodicePraticaDlReadOnly = isCodicePraticaDlReadOnly;
  }

  @Override
  public void setStato(String stato) {
    super.setStato(stato);
    isLavoriEleEditable = !statiAbilitantiEle.contains(stato);
  }

}
