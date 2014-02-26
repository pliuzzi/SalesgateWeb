package eu.a2a.salesgate.pratiche.gas.bean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Component;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;

@Component
public class LavoriGas extends CodDescBean {
	
	private static final long serialVersionUID = -3325069660182541177L;
	
	private final String utility = "GAS";
	
	private ArrayList<String> statiAbilitantiGas;
	
	private String codServizio;
	private String codFlusso;
	private String sistemaSorgente;
	private String idSistemaSorgente;
	private String pdr;
	private String presa;
	private Date dataRicezione;
	private Date dataInserimento;
	private BigDecimal verificaFormale;
	private BigDecimal verificaEsito;
	private String codicePraticaDl;
	private String codicePraticaDlPrec;
	private Date dataInvioDl;
	private Date dataAmmissibilita;
	private String stato;
	private String caseNumberException;
	private String caseNumber;
	private String canaleSg;
	private String mercato;
	private Date created;
	private String createdBy;
	private Date lastUpdated;
	private String lastUpdatedBy;
	private String fkDistributore;
	private String fkAmmissibilita;
	
	private final String pivaUtente = "12883450152";
	
	private String flussoAcc;
	
	private LavoriGasExtension lavoriGasExtension;
	private Distributore distributore;
	private AnagAmmissibilita anagAmmissibilita;
	private AvanzamentoFlussi avanzamentoFlussi;
	
	private boolean inviaSap;
	
	private boolean isLavoriGasEditable;
	private boolean isCodicePraticaDlReadOnly;
	
	public LavoriGas(){
		statiAbilitantiGas = new ArrayList<String>();
		statiAbilitantiGas.add("INVIATO DL");
		statiAbilitantiGas.add("AMMISSIBILE");
		statiAbilitantiGas.add("EVASA OK DL");
		statiAbilitantiGas.add("EVASA KO DL");
		statiAbilitantiGas.add("CONCLUSA KO");
		inviaSap = false;
	}
	
	public boolean getIsLavoriGasEditable(){
		return isLavoriGasEditable; 
	}
	
	public String getCodServizio() {
		return this.codServizio;
	}

	public void setCodServizio(String codServizio) {
		this.codServizio = codServizio;
	}

	public String getCodFlusso() {
		return this.codFlusso;
	}

	public void setCodFlusso(String codFlusso) {
		this.codFlusso = codFlusso;
	}

	public String getSistemaSorgente() {
		return this.sistemaSorgente;
	}

	public void setSistemaSorgente(String sistemaSorgente) {
		this.sistemaSorgente = sistemaSorgente;
	}

	public String getIdSistemaSorgente() {
		return this.idSistemaSorgente;
	}

	public void setIdSistemaSorgente(String idSistemaSorgente) {
		this.idSistemaSorgente = idSistemaSorgente;
	}
	
	public String getPdr() {
		return this.pdr;
	}

	public void setPdr(String pdr) {
		this.pdr = pdr;
	}

	public String getPresa() {
		return this.presa;
	}

	public void setPresa(String presa) {
		this.presa = presa;
	}

	public Date getDataRicezione() {
		return this.dataRicezione;
	}

	public void setDataRicezione(Date dataRicezione) {
		this.dataRicezione = dataRicezione;
	}

	public Date getDataInserimento() {
		return this.dataInserimento;
	}

	public void setDataInserimento(Date dataInserimento) {
		this.dataInserimento = dataInserimento;
	}

	public BigDecimal getVerificaFormale() {
		return this.verificaFormale;
	}

	public void setVerificaFormale(BigDecimal verificaFormale) {
		this.verificaFormale = verificaFormale;
	}

	public BigDecimal getVerificaEsito() {
		return this.verificaEsito;
	}

	public void setVerificaEsito(BigDecimal verificaEsito) {
		this.verificaEsito = verificaEsito;
	}
	
	public String getCodicePraticaDl() {
		return this.codicePraticaDl;
	}

	public void setCodicePraticaDl(String codicePraticaDl) {
		this.codicePraticaDl = codicePraticaDl;
	}

	public String getCodicePraticaDlPrec() {
		return this.codicePraticaDlPrec;
	}

	public void setCodicePraticaDlPrec(String codicePraticaDlPrec) {
		this.codicePraticaDlPrec = codicePraticaDlPrec;
	}

	public Date getDataInvioDl() {
		return this.dataInvioDl;
	}

	public void setDataInvioDl(Date dataInvioDl) {
		this.dataInvioDl = dataInvioDl;
	}

	public Date getDataAmmissibilita() {
		return this.dataAmmissibilita;
	}

	public void setDataAmmissibilita(Date dataAmmissibilita) {
		this.dataAmmissibilita = dataAmmissibilita;
	}

	public String getStato() {
		return this.stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
		isLavoriGasEditable = !statiAbilitantiGas.contains(stato);
	}

	public String getCaseNumberException() {
		return this.caseNumberException;
	}

	public void setCaseNumberException(String caseNumberException) {
		this.caseNumberException = caseNumberException;
	}

	public String getCaseNumber() {
		return this.caseNumber;
	}

	public void setCaseNumber(String caseNumber) {
		this.caseNumber = caseNumber;
	}

	public String getCanaleSg() {
		return this.canaleSg;
	}

	public void setCanaleSg(String canaleSg) {
		this.canaleSg = canaleSg;
	}

	public String getMercato() {
		return this.mercato;
	}

	public void setMercato(String mercato) {
		this.mercato = mercato;
	}

	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getLastUpdated() {
		return this.lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public String getLastUpdatedBy() {
		return this.lastUpdatedBy;
	}

	public void setLastUpdatedBy(String lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public String getFkDistributore() {
		return fkDistributore;
	}

	public void setFkDistributore(String fkDistributore) {
		this.fkDistributore = fkDistributore;
	}

	public LavoriGasExtension getLavoriGasExtension() {
		return lavoriGasExtension;
	}

	public void setLavoriGasExtension(LavoriGasExtension lavoriGasExtension) {
		this.lavoriGasExtension = lavoriGasExtension;
	}

	public Distributore getDistributore() {
		return distributore;
	}

	public void setDistributore(Distributore distributore) {
		this.distributore = distributore;
	}

	public AnagAmmissibilita getAnagAmmissibilita() {
		return anagAmmissibilita;
	}

	public void setAnagAmmissibilita(AnagAmmissibilita anagAmmissibilita) {
		this.anagAmmissibilita = anagAmmissibilita;
	}

	public String getFkAmmissibilita() {
		return fkAmmissibilita;
	}

	public void setFkAmmissibilita(String fkAmmissibilita) {
		this.fkAmmissibilita = fkAmmissibilita;
	}

	public String getFlussoAcc() {
		return flussoAcc;
	}

	public void setFlussoAcc(String flussoAcc) {
		this.flussoAcc = flussoAcc;
	}

	public String getUtility() {
		return utility;
	}

	public String getPivaUtente() {
		return pivaUtente;
	}

	public AvanzamentoFlussi getAvanzamentoFlussi() {
		return avanzamentoFlussi;
	}

	public void setAvanzamentoFlussi(AvanzamentoFlussi avanzamentoFlussi) {
		this.avanzamentoFlussi = avanzamentoFlussi;
	}

	public boolean getInviaSap() {
		return inviaSap;
	}

	public void setInviaSap(boolean inviaSap) {
		this.inviaSap = inviaSap;
	}

	public boolean getIsCodicePraticaDlReadOnly() {
		isCodicePraticaDlReadOnly = stato != "AMMISSIBILE";
		return isCodicePraticaDlReadOnly;
	}

	public void setIsCodicePraticaDlReadOnly(boolean isCodicePraticaDlReadOnly) {
		this.isCodicePraticaDlReadOnly = isCodicePraticaDlReadOnly;
	}

	
}
