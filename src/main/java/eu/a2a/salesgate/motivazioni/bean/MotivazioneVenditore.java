package eu.a2a.salesgate.motivazioni.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class MotivazioneVenditore extends CodDescBean {
	private static final long serialVersionUID = 1L;
	private String id;
	private String codiceInterno;
	private String motivazione;
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getId() {
		return this.id;
	}
	
	public void setCodiceInterno(String codiceInterno) {
		this.codiceInterno = codiceInterno;
	}
	
	public String getCodiceInterno() {
		return this.codiceInterno;
	}
	
	public void setMotivazione(String motivazione) {
		this.motivazione = motivazione;
	}
	
	public String getMotivazione() {
		return motivazione;
	}
	
}
