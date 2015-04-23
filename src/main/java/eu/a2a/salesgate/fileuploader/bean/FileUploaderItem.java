package eu.a2a.salesgate.fileuploader.bean;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.venditori.bean.Venditore;

public class FileUploaderItem extends CodDescBean {
	private static final long serialVersionUID = 1L;
	private String utility;
	private Distributore distributore;
	private Venditore venditore;
	private AnagRichieste servizio;
	private AnagFlussi flusso;
	private String eventCode;
	
	public String getUtility() {
		return utility;
	}
	
	public void setUtility(String utility) {
		this.utility = utility;
	}
	
	public Distributore getDistributore() {
		return distributore;
	}
	
	public void setDistributore(Distributore distributore) {
		this.distributore = distributore;
	}
	
	public Venditore getVenditore() {
		return venditore;
	}
	
	public void setVenditore(Venditore venditore) {
		this.venditore = venditore;
	}
	
	public AnagRichieste getServizio() {
		return servizio;
	}
	
	public void setServizio(AnagRichieste servizio) {
		this.servizio = servizio;
	}
	
	public AnagFlussi getFlusso() {
		return flusso;
	}
	
	public void setFlusso(AnagFlussi flusso) {
		this.flusso = flusso;
	}
	
	public String getEventCode() {
		return eventCode;
	}
	
	public void setEventCode(String eventCode) {
		this.eventCode = eventCode;
	}

}
