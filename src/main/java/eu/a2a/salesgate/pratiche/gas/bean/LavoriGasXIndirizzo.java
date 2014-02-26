package eu.a2a.salesgate.pratiche.gas.bean;

// Generated 27-set-2013 11.36.08 by Hibernate Tools 4.0.0

import java.math.BigDecimal;
import java.util.Date;


public class LavoriGasXIndirizzo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private BigDecimal id;
	private String toponimo;
	private String via;
	private String civico;
	private String scala;
	private String piano;
	private String interno;
	private String cap;
	private String istat;
	private String comune;
	private String provincia;
	private String nazione;
	private String presso;
	private Date created;
	private Date lastUpdated;

	public BigDecimal getId() {
		return this.id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public String getToponimo() {
		return this.toponimo;
	}

	public void setToponimo(String toponimo) {
		this.toponimo = toponimo;
	}

	public String getVia() {
		return this.via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getCivico() {
		return this.civico;
	}

	public void setCivico(String civico) {
		this.civico = civico;
	}

	public String getScala() {
		return this.scala;
	}

	public void setScala(String scala) {
		this.scala = scala;
	}

	public String getPiano() {
		return this.piano;
	}

	public void setPiano(String piano) {
		this.piano = piano;
	}

	public String getInterno() {
		return this.interno;
	}

	public void setInterno(String interno) {
		this.interno = interno;
	}

	public String getCap() {
		return this.cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getIstat() {
		return this.istat;
	}

	public void setIstat(String istat) {
		this.istat = istat;
	}

	public String getComune() {
		return this.comune;
	}

	public void setComune(String comune) {
		this.comune = comune;
	}

	public String getProvincia() {
		return this.provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getNazione() {
		return this.nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}

	public String getPresso() {
		return this.presso;
	}

	public void setPresso(String presso) {
		this.presso = presso;
	}

	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getLastUpdated() {
		return this.lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

}
