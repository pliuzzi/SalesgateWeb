package eu.a2a.salesgate.pratiche.gas.bean;

// Generated 27-set-2013 11.36.08 by Hibernate Tools 4.0.0

import java.math.BigDecimal;

/**
 * LavoriGasXDatiTecnici generated by hbm2java
 */
public class LavoriGasXDatiTecnici implements java.io.Serializable {

  private static final long serialVersionUID = 1L;
  private BigDecimal id;
  private LavoriGas lavoriGas;
  private String portataNuova;
  private String pressioneNuova;
  private BigDecimal numPdr;

  public LavoriGasXDatiTecnici() {
  }

  public LavoriGasXDatiTecnici(BigDecimal id) {
    this.id = id;
  }

  public LavoriGasXDatiTecnici(BigDecimal id, LavoriGas lavoriGas, String portataNuova, String pressioneNuova, BigDecimal numPdr) {
    this.id = id;
    this.lavoriGas = lavoriGas;
    this.portataNuova = portataNuova;
    this.pressioneNuova = pressioneNuova;
    this.numPdr = numPdr;
  }

  public BigDecimal getId() {
    return this.id;
  }

  public void setId(BigDecimal id) {
    this.id = id;
  }

  public LavoriGas getLavoriGas() {
    return this.lavoriGas;
  }

  public void setLavoriGas(LavoriGas lavoriGas) {
    this.lavoriGas = lavoriGas;
  }

  public String getPortataNuova() {
    return this.portataNuova;
  }

  public void setPortataNuova(String portataNuova) {
    this.portataNuova = portataNuova;
  }

  public String getPressioneNuova() {
    return this.pressioneNuova;
  }

  public void setPressioneNuova(String pressioneNuova) {
    this.pressioneNuova = pressioneNuova;
  }

  public BigDecimal getNumPdr() {
    return this.numPdr;
  }

  public void setNumPdr(BigDecimal numPdr) {
    this.numPdr = numPdr;
  }

}
