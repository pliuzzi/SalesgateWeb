package eu.a2a.salesgate.motivazioni.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class Motivazione extends CodDescBean {
	private static final long serialVersionUID = 1L;
	private String id;
	private String motivazioneDistributore;
	private MotivazioneVenditore motivazioneVenditore;
	private String codiceCausale;
	private String attivo;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMotivazioneDistributore() {
		return motivazioneDistributore;
	}
	
	public void setMotivazioneDistributore(String motivazioneDistributore) {
		this.motivazioneDistributore = motivazioneDistributore;
	}
	
	public MotivazioneVenditore getMotivazioneVenditore() {
		return motivazioneVenditore;
	}
	
	public void setMotivazioneVenditore(MotivazioneVenditore motivazioneVenditore) {
		this.motivazioneVenditore = motivazioneVenditore;
	}
	
	public String getCodiceCausale() {
		return codiceCausale;
	}
	
	public void setCodiceCausale(String codiceCausale) {
		this.codiceCausale = codiceCausale;
	}
	
	public String getAttivo() {
		return attivo;
	}
	
	public void setAttivo(String attivo) {
		this.attivo = attivo;
	}

}
