package eu.a2a.salesgate.distributori.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class ServizioCanale extends CodDescBean {

	private static final long serialVersionUID = -4808521498342324704L;
	private String codiceServizio;
	private CodDescBean canale;
	
	public String getCodiceServizio() {
		return codiceServizio;
	}
	public void setCodiceServizio(String codiceServizio) {
		this.codiceServizio = codiceServizio;
	}
	public CodDescBean getCanale() {
		return canale;
	}
	public void setCanale(CodDescBean canale) {
		this.canale = canale;
	}
	
}
