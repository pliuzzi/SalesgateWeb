package eu.a2a.salesgate.pratiche.gas.bean;

// Generated 27-set-2013 11.36.08 by Hibernate Tools 4.0.0

import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;

public class LavoriGasXCliente extends CodDescBean {

	private static final long serialVersionUID = 216044533301309384L;
	private String nome;
	private String cognome;
	private String ragioneSociale;
	private String piva;
	private String codFis;
	private String telefono;
	private String cellulare;
	private String email;
	private String fax;
	private Date created;
	private Date lastUpdated;

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getRagioneSociale() {
		return this.ragioneSociale;
	}

	public void setRagioneSociale(String ragioneSociale) {
		this.ragioneSociale = ragioneSociale;
	}

	public String getPiva() {
		return this.piva;
	}

	public void setPiva(String piva) {
		this.piva = piva;
	}

	public String getCodFis() {
		return this.codFis;
	}

	public void setCodFis(String codFis) {
		this.codFis = codFis;
	}

	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCellulare() {
		return this.cellulare;
	}

	public void setCellulare(String cellulare) {
		this.cellulare = cellulare;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
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
