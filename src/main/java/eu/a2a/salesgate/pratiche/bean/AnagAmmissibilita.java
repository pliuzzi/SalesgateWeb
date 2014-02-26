package eu.a2a.salesgate.pratiche.bean;

import java.math.BigDecimal;

import eu.a2a.salesgate.bean.CodDescBean;

public class AnagAmmissibilita extends CodDescBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -795379826155176355L;
	private String utility;
	private String codice;
	private BigDecimal esito;
	
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
	public BigDecimal getEsito() {
		return esito;
	}
	public void setEsito(BigDecimal esito) {
		this.esito = esito;
	}
	
	
	
}
