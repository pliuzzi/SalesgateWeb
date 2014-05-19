package eu.a2a.salesgate.pratiche.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class FlussiSalvabili extends CodDescBean {

  private static final long serialVersionUID = -6327295563562658721L;
  private String codFlussoAcc;
  private String descFlussoAcc;

  public String getCodFlussoAcc() {
    return codFlussoAcc;
  }

  public void setCodFlussoAcc(String codFlussoAcc) {
    this.codFlussoAcc = codFlussoAcc;
  }

  public String getDescFlussoAcc() {
    return descFlussoAcc;
  }

  public void setDescFlussoAcc(String descFlussoAcc) {
    this.descFlussoAcc = descFlussoAcc;
  }

}
