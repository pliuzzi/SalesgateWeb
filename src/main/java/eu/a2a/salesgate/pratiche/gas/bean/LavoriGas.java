package eu.a2a.salesgate.pratiche.gas.bean;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.bean.Tracking;

@Component
public class LavoriGas extends Tracking {

  private static final long serialVersionUID = -3325069660182541177L;

  private final String utility = "GAS";

  private final ArrayList<String> statiAbilitantiGas;

  private String pdr;
  private String codicePraticaDlPrec;

  private final String pivaUtente = "12883450152";

  private String flussoAcc;

  private LavoriGasExtension lavoriGasExtension;

  private AvanzamentoFlussi avanzamentoFlussi;

  private boolean inviaSap;

  private boolean isLavoriGasEditable;
  private boolean isCodicePraticaDlReadOnly;

  public LavoriGas() {
    statiAbilitantiGas = new ArrayList<String>();
    statiAbilitantiGas.add("INVIATO DL");
    statiAbilitantiGas.add("AMMISSIBILE");
    statiAbilitantiGas.add("EVASA OK DL");
    statiAbilitantiGas.add("EVASA KO DL");
    statiAbilitantiGas.add("CONCLUSA KO");
    inviaSap = false;
  }

  public boolean getIsLavoriGasEditable() {
    return isLavoriGasEditable;
  }

  public String getPdr() {
    return this.pdr;
  }

  public void setPdr(String pdr) {
    this.pdr = pdr;
  }

  public String getCodicePraticaDlPrec() {
    return this.codicePraticaDlPrec;
  }

  public void setCodicePraticaDlPrec(String codicePraticaDlPrec) {
    this.codicePraticaDlPrec = codicePraticaDlPrec;
  }

  public LavoriGasExtension getLavoriGasExtension() {
    return lavoriGasExtension;
  }

  public void setLavoriGasExtension(LavoriGasExtension lavoriGasExtension) {
    this.lavoriGasExtension = lavoriGasExtension;
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
    isLavoriGasEditable = !statiAbilitantiGas.contains(stato);
  }

}
