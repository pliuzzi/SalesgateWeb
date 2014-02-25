package eu.a2a.salesgate.pratiche.beans;

import eu.a2a.salesgate.bean.CodDescBean;


public class FiltroPratiche extends CodDescBean {
	
	private static final long serialVersionUID = -269782278095556828L;
	private String codicePraticaSG;
	private String codicePraticaUtente;
	private String codicePraticaDistributore;
	private String codiceDistributore;
	private boolean erroreVerificaEsito;
	
	public String getCodicePraticaSG() {
		return codicePraticaSG;
	}
	public void setCodicePraticaSG(String codicePraticaSG) {
		this.codicePraticaSG = codicePraticaSG;
	}
	public String getCodicePraticaUtente() {
		return codicePraticaUtente;
	}
	public void setCodicePraticaUtente(String codicePraticaUtente) {
		this.codicePraticaUtente = codicePraticaUtente;
	}
	public String getCodicePraticaDistributore() {
		return codicePraticaDistributore;
	}
	public void setCodicePraticaDistributore(String codicePraticaDistributore) {
		this.codicePraticaDistributore = codicePraticaDistributore;
	}
	public String getCodiceDistributore() {
		return codiceDistributore;
	}
	public void setCodiceDistributore(String codiceDistributore) {
		this.codiceDistributore = codiceDistributore;
	}
	public boolean isErroreVerificaEsito() {
		return erroreVerificaEsito;
	}
	public void setErroreVerificaEsito(boolean erroreVerificaEsito) {
		this.erroreVerificaEsito = erroreVerificaEsito;
	}

}
