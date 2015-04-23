package eu.a2a.salesgate.venditori.bean;

import eu.a2a.salesgate.bean.CodDescBean;

public class Venditore extends CodDescBean {
	private static final long serialVersionUID = 1L;
	private String id;
	private String nome;
	private String ptIva;
	private String attivo;
	private String tmsCreated;
	private String usrCreated;
	private String tmsUpdated;
	private String usrUpdated;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getPtIva() {
		return ptIva;
	}
	
	public void setPtIva(String ptIva) {
		this.ptIva = ptIva;
	}
	
	public String getAttivo() {
		return attivo;
	}
	
	public void setAttivo(String attivo) {
		this.attivo = attivo;
	}
	
	public String getTmsCreated() {
		return tmsCreated;
	}
	
	public void setTmsCreated(String tmsCreated) {
		this.tmsCreated = tmsCreated;
	}
	
	public String getUsrCreated() {
		return usrCreated;
	}
	
	public void setUsrCreated(String usrCreated) {
		this.usrCreated = usrCreated;
	}
	
	public String getTmsUpdated() {
		return tmsUpdated;
	}
	
	public void setTmsUpdated(String tmsUpdated) {
		this.tmsUpdated = tmsUpdated;
	}
	
	public String getUsrUpdated() {
		return usrUpdated;
	}
	
	public void setUsrUpdated(String usrUpdated) {
		this.usrUpdated = usrUpdated;
	}

}
