package eu.a2a.salesgate.pratiche.gas.bean;

// Generated 27-set-2013 11.36.08 by Hibernate Tools 4.0.0

import java.math.BigDecimal;
import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;

public class LavoriGasExtension extends CodDescBean {

	private static final long serialVersionUID = 5489230871519830223L;
	
	/* Campi nascosti */
	private String fkLavoriGas;
	private String codiceFlusso;
	private Date dataRicApp1;
	private String fasciaRicApp1;
	private Date dataRicApp2;
	private String fasciaRicApp2;
	private Date dataRicApp3;
	private String fasciaRicApp3;
	private Date dataAppuntamento;
	private String fasciaAppuntamento;
	
	private Date stimaTempiVerif;
	private Date dataMaxConf;
	private Date dataApp;
	private Date dataRicezione;
	private Date dataForn;
	private Date dataLetturaCl;
	private Date lastUpdated;
	private Date created;
	
	private String noteAmm;
	private String noteAppVend;
	private String noteAppDistr;
	/*-----------------------*/
	
	private String idRichiestaCrm;
	private String codiceContratto;
	private String segmentoCliente;
	private BigDecimal NPdrAttivi;
	private String pdrTipo;
	private String pdrCodProfPrel;
	private String codiceRemi;
	private String pressioneMisura;
	private String maxPrelOra;
	private String maxPotUtilizzazione;
	private String categoriaUso;
	private String descCategoriaUso;
	private String classePrelievo;
	private String descClassePrelievo;
	private String prelAnnuoPrev;
	private String potMaxRichiesta;
	private String potTotInst;
	private String rilevanza;
	private String valoreLettura;
	private String tipoLettura;
	private String valoreLetturaCl;
	private String tipoLetturaCl;
	private String reclamo;
	private String rifReclamo;
	private String datiTecnRic;
	private String rifQuesiti;
	private String confermaCliente;
	private BigDecimal numeroRinvio;
	private String volumiAnnui;
	private String competenzaLettura;
	private String descCompetenzaLettura;
	private String periodLettura;
	private String descPeriodLettura;
	private String qualificaClf;
	private String descQualificaClf;
	private String responsabileImpianto;
	private String telefonoRespImpianto;
	private String nominativoUtf;
	private String motivazione;
	private String instMis;
	private String instConv;
	private String indInvioDocum;
	private String documMancante;
	private String rifComunicDocum;
	private String esitoDocum;
	private String rifComunSosp;
	private String causaleAnnullam;
	private String nomeRespVerif;
	private String cognomeRespVerif;
	private String tel1Verif;
	private String tel2Verif;
	private String verifLabVerif;
	private String causaleLabVerif;
	private String rifResocontoVerif;
	private String valoreLettVerif;
	private String tipoLettverif;
	private String codPrevDl;
	private String costoPrev;
	private String costoLabPrev;
	private String pivaSocietaRichiedente;
	private String numeroRichiestaVenditore;
	private String numeroServizioVenditore;
	private String pdfVenditore;
	private String esito;
	private BigDecimal numeroRinvioDl;
	private Character flgModifica;
	private String tipologiaVoltura;
	private String tipologiaPdr;
	private String aliquotaIva;
	private String imposteAgevolate;
	private String gestoreCalore;
	private String datiFatturazione;
	private String erogServEner;
	private String nuovoTentativo;
	private String appuntamento;
	private String tipoServizio;
	private String richVarDati;
	private String codRinSosMor;
	private String codPrevMor;
	private String nessIntGiud;
	private String tipologiaUtenza;
	private String mortisCausa;
	private String codTipPre;
	private String descLavoro;
	private String potTotUtil;
	private String meseComp;
	private String autoLettFatt;
	private String numChiave;
	private String codiceApp;
	private String potMaxCliente;
	private String tipoAnomaliaCodificata;
	private String esitoConferma;
	private String esitoValAutolettura;
	private String causaleNonValAutolettura;
	private String indDistr;
	private String classeGruppoMis;
	private String esitoAccertamento;
	private String esitoBase;
	private String esitoProcesso;
	private String classeNuovoMis;
	private String codProfiloPrel;
	private String codPratRif;
	private String accMis;
	private String annoFabbMis;
	private String annoFabbGdm;
	private String annoFabNuovoMis;
	private String attiAutorizzativi;
	private String iva;
	private String addebitoOneri;
	private String coeffCorr;
	private String onOff;
	private String rifComL;
	private String rifPreventivo;
	private String rifRispQuesiti;
	private String causeLab;
	private String costoLoco;
	private String alimentBp;
	private String autoletturaFinestra;
	private String listaAllegati;
	private String resoconto;
	private String statoElaborazione;
	private String flagNecessario;
	private String flagVenditore;
	private BigDecimal gestApp;
	private String tipoLavoro;
	private String flagPrimario;
	private String dettaglioVerificaEsito;
	private String strutturaDatiTecnici;
	private String revocaDisattivazione;
	private String sospPotPericolo;
	private String tipologiaAppartenenza;
	private String codErroreAgenda;
	private String motivazioneAgenda;
	private String statoAmmisibilita;
	private String codPratVn1;
	
	private Date dataAccertDocum;
	private Date dataAnnullam;
	private Date dataAttivazione;
	private Date dataConclusioneRichiesta;
	private Date dataConfermaAmmissibilita;
	private Date dataEsecLavori;
	private Date dataEvasioneDl;
	private Date dataIntervento;
	private Date dataInvioPrev;
	private Date dataLettura;
	private Date dataLettVerif;
	private Date dataPrevSost;
	private Date dataRicezDocum;
	private Date dataRicezioneBonus;
	private Date dataRicPrev;
	private Date dataRicRichiesta;
	private Date dataScadPrev;
	private Date dataSopralluogo;
	private Date dataSosp;
	private Date dataSostVerif;
	private Date dataTentativo;
	private Date dataUltimaVer;
	private Date dataVerifica;
	private Date dataVoltura;
	private Date daEseguireNonPrimaDel;
	
	private String noteEsito;
	private String note;
	
	private BigDecimal fkFiles;
	private BigDecimal fkMisuratore;
	private BigDecimal fkConvertitore;
	private BigDecimal fkMisuratoreCliente;
	private BigDecimal fkConvertitoreCliente;
	private BigDecimal fkMisuratoreRim;
	private BigDecimal fkConvertitoreRim;
	private BigDecimal fkIndirizzoForn;
	private BigDecimal fkIndirizzoEsaz;
	private BigDecimal fkIndirizzoBenef;
	private BigDecimal fkIndirizzoImmob;
	private BigDecimal fkIndirizzoLegale;
	private BigDecimal fkIndirizzoRef;
	private BigDecimal fkClienteUsc;
	private BigDecimal fkClienteFinale;
	private BigDecimal fkClienteRef;
	private BigDecimal fkClienteEsaz;
	private BigDecimal fkClienteBenef;

	private LavoriGasXMisuratore misuratore;
	private LavoriGasXMisuratore convertitore;
	private LavoriGasXMisuratore misuratoreCliente;
	private LavoriGasXMisuratore convertitoreCliente;
	private LavoriGasXMisuratore misuratoreRim;
	private LavoriGasXMisuratore convertitoreRim;
	
	private LavoriGasXCliente clienteUsc;
	private LavoriGasXCliente clienteFinale;
	private LavoriGasXCliente clienteRef;
	private LavoriGasXCliente clienteEsaz;
	private LavoriGasXCliente clienteBenef;
	
	private LavoriGasXIndirizzo indirizzoForn;
	private LavoriGasXIndirizzo indirizzoEsaz;
	private LavoriGasXIndirizzo indirizzoBenef;
	private LavoriGasXIndirizzo indirizzoImmob;
	private LavoriGasXIndirizzo indirizzoLegale;
	private LavoriGasXIndirizzo indirizzoRef;

	public String getFkLavoriGas() {
		return this.fkLavoriGas;
	}

	public void setFkLavoriGas(String fkLavoriGas) {
		this.fkLavoriGas = fkLavoriGas;
	}

	public String getCodiceFlusso() {
		return this.codiceFlusso;
	}

	public void setCodiceFlusso(String codiceFlusso) {
		this.codiceFlusso = codiceFlusso;
	}

	public String getIdRichiestaCrm() {
		return this.idRichiestaCrm;
	}

	public void setIdRichiestaCrm(String idRichiestaCrm) {
		this.idRichiestaCrm = idRichiestaCrm;
	}

	public String getCodiceContratto() {
		return this.codiceContratto;
	}

	public void setCodiceContratto(String codiceContratto) {
		this.codiceContratto = codiceContratto;
	}

	public String getSegmentoCliente() {
		return this.segmentoCliente;
	}

	public void setSegmentoCliente(String segmentoCliente) {
		this.segmentoCliente = segmentoCliente;
	}

	public Date getDataRicRichiesta() {
		return this.dataRicRichiesta;
	}

	public void setDataRicRichiesta(Date dataRicRichiesta) {
		this.dataRicRichiesta = dataRicRichiesta;
	}

	public BigDecimal getNPdrAttivi() {
		return this.NPdrAttivi;
	}

	public void setNPdrAttivi(BigDecimal NPdrAttivi) {
		this.NPdrAttivi = NPdrAttivi;
	}

	public String getPdrTipo() {
		return this.pdrTipo;
	}

	public void setPdrTipo(String pdrTipo) {
		this.pdrTipo = pdrTipo;
	}

	public String getPdrCodProfPrel() {
		return this.pdrCodProfPrel;
	}

	public void setPdrCodProfPrel(String pdrCodProfPrel) {
		this.pdrCodProfPrel = pdrCodProfPrel;
	}

	public String getCodiceRemi() {
		return this.codiceRemi;
	}

	public void setCodiceRemi(String codiceRemi) {
		this.codiceRemi = codiceRemi;
	}

	public String getPressioneMisura() {
		return this.pressioneMisura;
	}

	public void setPressioneMisura(String pressioneMisura) {
		this.pressioneMisura = pressioneMisura;
	}

	public String getMaxPrelOra() {
		return this.maxPrelOra;
	}

	public void setMaxPrelOra(String maxPrelOra) {
		this.maxPrelOra = maxPrelOra;
	}

	public String getMaxPotUtilizzazione() {
		return this.maxPotUtilizzazione;
	}

	public void setMaxPotUtilizzazione(String maxPotUtilizzazione) {
		this.maxPotUtilizzazione = maxPotUtilizzazione;
	}

	public String getCategoriaUso() {
		return this.categoriaUso;
	}

	public void setCategoriaUso(String categoriaUso) {
		this.categoriaUso = categoriaUso;
	}

	public String getDescCategoriaUso() {
		return this.descCategoriaUso;
	}

	public void setDescCategoriaUso(String descCategoriaUso) {
		this.descCategoriaUso = descCategoriaUso;
	}

	public String getClassePrelievo() {
		return this.classePrelievo;
	}

	public void setClassePrelievo(String classePrelievo) {
		this.classePrelievo = classePrelievo;
	}

	public String getDescClassePrelievo() {
		return this.descClassePrelievo;
	}

	public void setDescClassePrelievo(String descClassePrelievo) {
		this.descClassePrelievo = descClassePrelievo;
	}

	public String getPrelAnnuoPrev() {
		return this.prelAnnuoPrev;
	}

	public void setPrelAnnuoPrev(String prelAnnuoPrev) {
		this.prelAnnuoPrev = prelAnnuoPrev;
	}

	public String getPotMaxRichiesta() {
		return this.potMaxRichiesta;
	}

	public void setPotMaxRichiesta(String potMaxRichiesta) {
		this.potMaxRichiesta = potMaxRichiesta;
	}

	public String getPotTotInst() {
		return this.potTotInst;
	}

	public void setPotTotInst(String potTotInst) {
		this.potTotInst = potTotInst;
	}

	public String getRilevanza() {
		return this.rilevanza;
	}

	public void setRilevanza(String rilevanza) {
		this.rilevanza = rilevanza;
	}

	public String getValoreLettura() {
		return this.valoreLettura;
	}

	public void setValoreLettura(String valoreLettura) {
		this.valoreLettura = valoreLettura;
	}

	public Date getDataLettura() {
		return this.dataLettura;
	}

	public void setDataLettura(Date dataLettura) {
		this.dataLettura = dataLettura;
	}

	public String getTipoLettura() {
		return this.tipoLettura;
	}

	public void setTipoLettura(String tipoLettura) {
		this.tipoLettura = tipoLettura;
	}

	public String getValoreLetturaCl() {
		return this.valoreLetturaCl;
	}

	public void setValoreLetturaCl(String valoreLetturaCl) {
		this.valoreLetturaCl = valoreLetturaCl;
	}

	public Date getDataLetturaCl() {
		return this.dataLetturaCl;
	}

	public void setDataLetturaCl(Date dataLetturaCl) {
		this.dataLetturaCl = dataLetturaCl;
	}

	public String getTipoLetturaCl() {
		return this.tipoLetturaCl;
	}

	public void setTipoLetturaCl(String tipoLetturaCl) {
		this.tipoLetturaCl = tipoLetturaCl;
	}

	public String getReclamo() {
		return this.reclamo;
	}

	public void setReclamo(String reclamo) {
		this.reclamo = reclamo;
	}

	public String getRifReclamo() {
		return this.rifReclamo;
	}

	public void setRifReclamo(String rifReclamo) {
		this.rifReclamo = rifReclamo;
	}

	public String getDatiTecnRic() {
		return this.datiTecnRic;
	}

	public void setDatiTecnRic(String datiTecnRic) {
		this.datiTecnRic = datiTecnRic;
	}

	public String getRifQuesiti() {
		return this.rifQuesiti;
	}

	public void setRifQuesiti(String rifQuesiti) {
		this.rifQuesiti = rifQuesiti;
	}

	public String getConfermaCliente() {
		return this.confermaCliente;
	}

	public void setConfermaCliente(String confermaCliente) {
		this.confermaCliente = confermaCliente;
	}

	public BigDecimal getNumeroRinvio() {
		return this.numeroRinvio;
	}

	public void setNumeroRinvio(BigDecimal numeroRinvio) {
		this.numeroRinvio = numeroRinvio;
	}

	public Date getDataRicApp1() {
		return this.dataRicApp1;
	}

	public void setDataRicApp1(Date dataRicApp1) {
		this.dataRicApp1 = dataRicApp1;
	}

	public String getFasciaRicApp1() {
		return this.fasciaRicApp1;
	}

	public void setFasciaRicApp1(String fasciaRicApp1) {
		this.fasciaRicApp1 = fasciaRicApp1;
	}

	public Date getDataRicApp2() {
		return this.dataRicApp2;
	}

	public void setDataRicApp2(Date dataRicApp2) {
		this.dataRicApp2 = dataRicApp2;
	}

	public String getFasciaRicApp2() {
		return this.fasciaRicApp2;
	}

	public void setFasciaRicApp2(String fasciaRicApp2) {
		this.fasciaRicApp2 = fasciaRicApp2;
	}

	public Date getDataRicApp3() {
		return this.dataRicApp3;
	}

	public void setDataRicApp3(Date dataRicApp3) {
		this.dataRicApp3 = dataRicApp3;
	}

	public String getFasciaRicApp3() {
		return this.fasciaRicApp3;
	}

	public void setFasciaRicApp3(String fasciaRicApp3) {
		this.fasciaRicApp3 = fasciaRicApp3;
	}

	public Date getDataVoltura() {
		return this.dataVoltura;
	}

	public void setDataVoltura(Date dataVoltura) {
		this.dataVoltura = dataVoltura;
	}

	public String getVolumiAnnui() {
		return this.volumiAnnui;
	}

	public void setVolumiAnnui(String volumiAnnui) {
		this.volumiAnnui = volumiAnnui;
	}

	public String getCompetenzaLettura() {
		return this.competenzaLettura;
	}

	public void setCompetenzaLettura(String competenzaLettura) {
		this.competenzaLettura = competenzaLettura;
	}

	public String getDescCompetenzaLettura() {
		return this.descCompetenzaLettura;
	}

	public void setDescCompetenzaLettura(String descCompetenzaLettura) {
		this.descCompetenzaLettura = descCompetenzaLettura;
	}

	public String getPeriodLettura() {
		return this.periodLettura;
	}

	public void setPeriodLettura(String periodLettura) {
		this.periodLettura = periodLettura;
	}

	public String getDescPeriodLettura() {
		return this.descPeriodLettura;
	}

	public void setDescPeriodLettura(String descPeriodLettura) {
		this.descPeriodLettura = descPeriodLettura;
	}

	public String getQualificaClf() {
		return this.qualificaClf;
	}

	public void setQualificaClf(String qualificaClf) {
		this.qualificaClf = qualificaClf;
	}

	public String getDescQualificaClf() {
		return this.descQualificaClf;
	}

	public void setDescQualificaClf(String descQualificaClf) {
		this.descQualificaClf = descQualificaClf;
	}

	public String getResponsabileImpianto() {
		return this.responsabileImpianto;
	}

	public void setResponsabileImpianto(String responsabileImpianto) {
		this.responsabileImpianto = responsabileImpianto;
	}

	public String getTelefonoRespImpianto() {
		return this.telefonoRespImpianto;
	}

	public void setTelefonoRespImpianto(String telefonoRespImpianto) {
		this.telefonoRespImpianto = telefonoRespImpianto;
	}

	public String getNominativoUtf() {
		return this.nominativoUtf;
	}

	public void setNominativoUtf(String nominativoUtf) {
		this.nominativoUtf = nominativoUtf;
	}

	public String getMotivazione() {
		return this.motivazione;
	}

	public void setMotivazione(String motivazione) {
		this.motivazione = motivazione;
	}

	public Date getDataEsecLavori() {
		return this.dataEsecLavori;
	}

	public void setDataEsecLavori(Date dataEsecLavori) {
		this.dataEsecLavori = dataEsecLavori;
	}

	public String getInstMis() {
		return this.instMis;
	}

	public void setInstMis(String instMis) {
		this.instMis = instMis;
	}

	public String getInstConv() {
		return this.instConv;
	}

	public void setInstConv(String instConv) {
		this.instConv = instConv;
	}

	public String getIndInvioDocum() {
		return this.indInvioDocum;
	}

	public void setIndInvioDocum(String indInvioDocum) {
		this.indInvioDocum = indInvioDocum;
	}

	public Date getDataRicezDocum() {
		return this.dataRicezDocum;
	}

	public void setDataRicezDocum(Date dataRicezDocum) {
		this.dataRicezDocum = dataRicezDocum;
	}

	public String getDocumMancante() {
		return this.documMancante;
	}

	public void setDocumMancante(String documMancante) {
		this.documMancante = documMancante;
	}

	public String getRifComunicDocum() {
		return this.rifComunicDocum;
	}

	public void setRifComunicDocum(String rifComunicDocum) {
		this.rifComunicDocum = rifComunicDocum;
	}

	public String getNoteAmm() {
		return this.noteAmm;
	}

	public void setNoteAmm(String noteAmm) {
		this.noteAmm = noteAmm;
	}

	public String getEsitoDocum() {
		return this.esitoDocum;
	}

	public void setEsitoDocum(String esitoDocum) {
		this.esitoDocum = esitoDocum;
	}

	public Date getDataAccertDocum() {
		return this.dataAccertDocum;
	}

	public void setDataAccertDocum(Date dataAccertDocum) {
		this.dataAccertDocum = dataAccertDocum;
	}

	public Date getDataSosp() {
		return this.dataSosp;
	}

	public void setDataSosp(Date dataSosp) {
		this.dataSosp = dataSosp;
	}

	public String getRifComunSosp() {
		return this.rifComunSosp;
	}

	public void setRifComunSosp(String rifComunSosp) {
		this.rifComunSosp = rifComunSosp;
	}

	public Date getDataAnnullam() {
		return this.dataAnnullam;
	}

	public void setDataAnnullam(Date dataAnnullam) {
		this.dataAnnullam = dataAnnullam;
	}

	public String getCausaleAnnullam() {
		return this.causaleAnnullam;
	}

	public void setCausaleAnnullam(String causaleAnnullam) {
		this.causaleAnnullam = causaleAnnullam;
	}

	public Date getStimaTempiVerif() {
		return this.stimaTempiVerif;
	}

	public void setStimaTempiVerif(Date stimaTempiVerif) {
		this.stimaTempiVerif = stimaTempiVerif;
	}

	public String getNomeRespVerif() {
		return this.nomeRespVerif;
	}

	public void setNomeRespVerif(String nomeRespVerif) {
		this.nomeRespVerif = nomeRespVerif;
	}

	public String getCognomeRespVerif() {
		return this.cognomeRespVerif;
	}

	public void setCognomeRespVerif(String cognomeRespVerif) {
		this.cognomeRespVerif = cognomeRespVerif;
	}

	public String getTel1Verif() {
		return this.tel1Verif;
	}

	public void setTel1Verif(String tel1Verif) {
		this.tel1Verif = tel1Verif;
	}

	public String getTel2Verif() {
		return this.tel2Verif;
	}

	public void setTel2Verif(String tel2Verif) {
		this.tel2Verif = tel2Verif;
	}

	public String getVerifLabVerif() {
		return this.verifLabVerif;
	}

	public void setVerifLabVerif(String verifLabVerif) {
		this.verifLabVerif = verifLabVerif;
	}

	public Date getDataSostVerif() {
		return this.dataSostVerif;
	}

	public void setDataSostVerif(Date dataSostVerif) {
		this.dataSostVerif = dataSostVerif;
	}

	public String getCausaleLabVerif() {
		return this.causaleLabVerif;
	}

	public void setCausaleLabVerif(String causaleLabVerif) {
		this.causaleLabVerif = causaleLabVerif;
	}

	public String getRifResocontoVerif() {
		return this.rifResocontoVerif;
	}

	public void setRifResocontoVerif(String rifResocontoVerif) {
		this.rifResocontoVerif = rifResocontoVerif;
	}

	public String getValoreLettVerif() {
		return this.valoreLettVerif;
	}

	public void setValoreLettVerif(String valoreLettVerif) {
		this.valoreLettVerif = valoreLettVerif;
	}

	public Date getDataLettVerif() {
		return this.dataLettVerif;
	}

	public void setDataLettVerif(Date dataLettVerif) {
		this.dataLettVerif = dataLettVerif;
	}

	public String getTipoLettverif() {
		return this.tipoLettverif;
	}

	public void setTipoLettverif(String tipoLettverif) {
		this.tipoLettverif = tipoLettverif;
	}

	public String getCodPrevDl() {
		return this.codPrevDl;
	}

	public void setCodPrevDl(String codPrevDl) {
		this.codPrevDl = codPrevDl;
	}

	public Date getDataInvioPrev() {
		return this.dataInvioPrev;
	}

	public void setDataInvioPrev(Date dataInvioPrev) {
		this.dataInvioPrev = dataInvioPrev;
	}

	public Date getDataRicPrev() {
		return this.dataRicPrev;
	}

	public void setDataRicPrev(Date dataRicPrev) {
		this.dataRicPrev = dataRicPrev;
	}

	public Date getDataScadPrev() {
		return this.dataScadPrev;
	}

	public void setDataScadPrev(Date dataScadPrev) {
		this.dataScadPrev = dataScadPrev;
	}

	public String getCostoPrev() {
		return this.costoPrev;
	}

	public void setCostoPrev(String costoPrev) {
		this.costoPrev = costoPrev;
	}

	public String getCostoLabPrev() {
		return this.costoLabPrev;
	}

	public void setCostoLabPrev(String costoLabPrev) {
		this.costoLabPrev = costoLabPrev;
	}

	public Date getDataAppuntamento() {
		return this.dataAppuntamento;
	}

	public void setDataAppuntamento(Date dataAppuntamento) {
		this.dataAppuntamento = dataAppuntamento;
	}

	public String getFasciaAppuntamento() {
		return this.fasciaAppuntamento;
	}

	public void setFasciaAppuntamento(String fasciaAppuntamento) {
		this.fasciaAppuntamento = fasciaAppuntamento;
	}

	public String getPivaSocietaRichiedente() {
		return this.pivaSocietaRichiedente;
	}

	public void setPivaSocietaRichiedente(String pivaSocietaRichiedente) {
		this.pivaSocietaRichiedente = pivaSocietaRichiedente;
	}

	public String getNumeroRichiestaVenditore() {
		return this.numeroRichiestaVenditore;
	}

	public void setNumeroRichiestaVenditore(String numeroRichiestaVenditore) {
		this.numeroRichiestaVenditore = numeroRichiestaVenditore;
	}

	public String getNumeroServizioVenditore() {
		return this.numeroServizioVenditore;
	}

	public void setNumeroServizioVenditore(String numeroServizioVenditore) {
		this.numeroServizioVenditore = numeroServizioVenditore;
	}

	public String getPdfVenditore() {
		return this.pdfVenditore;
	}

	public void setPdfVenditore(String pdfVenditore) {
		this.pdfVenditore = pdfVenditore;
	}

	public String getNoteEsito() {
		return this.noteEsito;
	}

	public void setNoteEsito(String noteEsito) {
		this.noteEsito = noteEsito;
	}

	public String getEsito() {
		return this.esito;
	}

	public void setEsito(String esito) {
		this.esito = esito;
	}

	public Date getLastUpdated() {
		return this.lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public BigDecimal getNumeroRinvioDl() {
		return this.numeroRinvioDl;
	}

	public void setNumeroRinvioDl(BigDecimal numeroRinvioDl) {
		this.numeroRinvioDl = numeroRinvioDl;
	}

	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Character getFlgModifica() {
		return this.flgModifica;
	}

	public void setFlgModifica(Character flgModifica) {
		this.flgModifica = flgModifica;
	}

	public BigDecimal getFkFiles() {
		return this.fkFiles;
	}

	public void setFkFiles(BigDecimal fkFiles) {
		this.fkFiles = fkFiles;
	}

	public String getTipologiaVoltura() {
		return this.tipologiaVoltura;
	}

	public void setTipologiaVoltura(String tipologiaVoltura) {
		this.tipologiaVoltura = tipologiaVoltura;
	}

	public String getTipologiaPdr() {
		return this.tipologiaPdr;
	}

	public void setTipologiaPdr(String tipologiaPdr) {
		this.tipologiaPdr = tipologiaPdr;
	}

	public String getAliquotaIva() {
		return this.aliquotaIva;
	}

	public void setAliquotaIva(String aliquotaIva) {
		this.aliquotaIva = aliquotaIva;
	}

	public String getImposteAgevolate() {
		return this.imposteAgevolate;
	}

	public void setImposteAgevolate(String imposteAgevolate) {
		this.imposteAgevolate = imposteAgevolate;
	}

	public String getGestoreCalore() {
		return this.gestoreCalore;
	}

	public void setGestoreCalore(String gestoreCalore) {
		this.gestoreCalore = gestoreCalore;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDatiFatturazione() {
		return this.datiFatturazione;
	}

	public void setDatiFatturazione(String datiFatturazione) {
		this.datiFatturazione = datiFatturazione;
	}

	public String getErogServEner() {
		return this.erogServEner;
	}

	public void setErogServEner(String erogServEner) {
		this.erogServEner = erogServEner;
	}

	public String getNuovoTentativo() {
		return this.nuovoTentativo;
	}

	public void setNuovoTentativo(String nuovoTentativo) {
		this.nuovoTentativo = nuovoTentativo;
	}

	public String getAppuntamento() {
		return this.appuntamento;
	}

	public void setAppuntamento(String appuntamento) {
		this.appuntamento = appuntamento;
	}

	public String getTipoServizio() {
		return this.tipoServizio;
	}

	public void setTipoServizio(String tipoServizio) {
		this.tipoServizio = tipoServizio;
	}

	public String getRichVarDati() {
		return this.richVarDati;
	}

	public void setRichVarDati(String richVarDati) {
		this.richVarDati = richVarDati;
	}

	public String getCodRinSosMor() {
		return this.codRinSosMor;
	}

	public void setCodRinSosMor(String codRinSosMor) {
		this.codRinSosMor = codRinSosMor;
	}

	public String getCodPrevMor() {
		return this.codPrevMor;
	}

	public void setCodPrevMor(String codPrevMor) {
		this.codPrevMor = codPrevMor;
	}

	public String getNessIntGiud() {
		return this.nessIntGiud;
	}

	public void setNessIntGiud(String nessIntGiud) {
		this.nessIntGiud = nessIntGiud;
	}

	public String getTipologiaUtenza() {
		return this.tipologiaUtenza;
	}

	public void setTipologiaUtenza(String tipologiaUtenza) {
		this.tipologiaUtenza = tipologiaUtenza;
	}

	public String getMortisCausa() {
		return this.mortisCausa;
	}

	public void setMortisCausa(String mortisCausa) {
		this.mortisCausa = mortisCausa;
	}

	public String getCodTipPre() {
		return this.codTipPre;
	}

	public void setCodTipPre(String codTipPre) {
		this.codTipPre = codTipPre;
	}

	public String getDescLavoro() {
		return this.descLavoro;
	}

	public void setDescLavoro(String descLavoro) {
		this.descLavoro = descLavoro;
	}

	public String getPotTotUtil() {
		return this.potTotUtil;
	}

	public void setPotTotUtil(String potTotUtil) {
		this.potTotUtil = potTotUtil;
	}

	public String getMeseComp() {
		return this.meseComp;
	}

	public void setMeseComp(String meseComp) {
		this.meseComp = meseComp;
	}

	public String getAutoLettFatt() {
		return this.autoLettFatt;
	}

	public void setAutoLettFatt(String autoLettFatt) {
		this.autoLettFatt = autoLettFatt;
	}

	public String getNumChiave() {
		return this.numChiave;
	}

	public void setNumChiave(String numChiave) {
		this.numChiave = numChiave;
	}

	public Date getDaEseguireNonPrimaDel() {
		return this.daEseguireNonPrimaDel;
	}

	public void setDaEseguireNonPrimaDel(Date daEseguireNonPrimaDel) {
		this.daEseguireNonPrimaDel = daEseguireNonPrimaDel;
	}

	public String getCodiceApp() {
		return this.codiceApp;
	}

	public void setCodiceApp(String codiceApp) {
		this.codiceApp = codiceApp;
	}

	public String getPotMaxCliente() {
		return this.potMaxCliente;
	}

	public void setPotMaxCliente(String potMaxCliente) {
		this.potMaxCliente = potMaxCliente;
	}

	public String getTipoAnomaliaCodificata() {
		return this.tipoAnomaliaCodificata;
	}

	public void setTipoAnomaliaCodificata(String tipoAnomaliaCodificata) {
		this.tipoAnomaliaCodificata = tipoAnomaliaCodificata;
	}

	public String getEsitoConferma() {
		return this.esitoConferma;
	}

	public void setEsitoConferma(String esitoConferma) {
		this.esitoConferma = esitoConferma;
	}

	public String getEsitoValAutolettura() {
		return this.esitoValAutolettura;
	}

	public void setEsitoValAutolettura(String esitoValAutolettura) {
		this.esitoValAutolettura = esitoValAutolettura;
	}

	public String getCausaleNonValAutolettura() {
		return this.causaleNonValAutolettura;
	}

	public void setCausaleNonValAutolettura(String causaleNonValAutolettura) {
		this.causaleNonValAutolettura = causaleNonValAutolettura;
	}

	public Date getDataSopralluogo() {
		return this.dataSopralluogo;
	}

	public void setDataSopralluogo(Date dataSopralluogo) {
		this.dataSopralluogo = dataSopralluogo;
	}

	public String getIndDistr() {
		return this.indDistr;
	}

	public void setIndDistr(String indDistr) {
		this.indDistr = indDistr;
	}

	public String getClasseGruppoMis() {
		return this.classeGruppoMis;
	}

	public void setClasseGruppoMis(String classeGruppoMis) {
		this.classeGruppoMis = classeGruppoMis;
	}

	public String getEsitoAccertamento() {
		return this.esitoAccertamento;
	}

	public void setEsitoAccertamento(String esitoAccertamento) {
		this.esitoAccertamento = esitoAccertamento;
	}

	public String getEsitoBase() {
		return this.esitoBase;
	}

	public void setEsitoBase(String esitoBase) {
		this.esitoBase = esitoBase;
	}

	public String getEsitoProcesso() {
		return this.esitoProcesso;
	}

	public void setEsitoProcesso(String esitoProcesso) {
		this.esitoProcesso = esitoProcesso;
	}

	public Date getDataAttivazione() {
		return this.dataAttivazione;
	}

	public void setDataAttivazione(Date dataAttivazione) {
		this.dataAttivazione = dataAttivazione;
	}

	public Date getDataIntervento() {
		return this.dataIntervento;
	}

	public void setDataIntervento(Date dataIntervento) {
		this.dataIntervento = dataIntervento;
	}

	public Date getDataPrevSost() {
		return this.dataPrevSost;
	}

	public void setDataPrevSost(Date dataPrevSost) {
		this.dataPrevSost = dataPrevSost;
	}

	public Date getDataTentativo() {
		return this.dataTentativo;
	}

	public void setDataTentativo(Date dataTentativo) {
		this.dataTentativo = dataTentativo;
	}

	public Date getDataVerifica() {
		return this.dataVerifica;
	}

	public void setDataVerifica(Date dataVerifica) {
		this.dataVerifica = dataVerifica;
	}

	public String getClasseNuovoMis() {
		return this.classeNuovoMis;
	}

	public void setClasseNuovoMis(String classeNuovoMis) {
		this.classeNuovoMis = classeNuovoMis;
	}

	public String getCodProfiloPrel() {
		return this.codProfiloPrel;
	}

	public void setCodProfiloPrel(String codProfiloPrel) {
		this.codProfiloPrel = codProfiloPrel;
	}

	public String getCodPratRif() {
		return this.codPratRif;
	}

	public void setCodPratRif(String codPratRif) {
		this.codPratRif = codPratRif;
	}

	public String getAccMis() {
		return this.accMis;
	}

	public void setAccMis(String accMis) {
		this.accMis = accMis;
	}

	public String getAnnoFabbMis() {
		return this.annoFabbMis;
	}

	public void setAnnoFabbMis(String annoFabbMis) {
		this.annoFabbMis = annoFabbMis;
	}

	public String getAnnoFabbGdm() {
		return this.annoFabbGdm;
	}

	public void setAnnoFabbGdm(String annoFabbGdm) {
		this.annoFabbGdm = annoFabbGdm;
	}

	public String getAnnoFabNuovoMis() {
		return this.annoFabNuovoMis;
	}

	public void setAnnoFabNuovoMis(String annoFabNuovoMis) {
		this.annoFabNuovoMis = annoFabNuovoMis;
	}

	public String getAttiAutorizzativi() {
		return this.attiAutorizzativi;
	}

	public void setAttiAutorizzativi(String attiAutorizzativi) {
		this.attiAutorizzativi = attiAutorizzativi;
	}

	public String getIva() {
		return this.iva;
	}

	public void setIva(String iva) {
		this.iva = iva;
	}

	public String getAddebitoOneri() {
		return this.addebitoOneri;
	}

	public void setAddebitoOneri(String addebitoOneri) {
		this.addebitoOneri = addebitoOneri;
	}

	public String getCoeffCorr() {
		return this.coeffCorr;
	}

	public void setCoeffCorr(String coeffCorr) {
		this.coeffCorr = coeffCorr;
	}

	public String getOnOff() {
		return this.onOff;
	}

	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}

	public String getRifComL() {
		return this.rifComL;
	}

	public void setRifComL(String rifComL) {
		this.rifComL = rifComL;
	}

	public String getRifPreventivo() {
		return this.rifPreventivo;
	}

	public void setRifPreventivo(String rifPreventivo) {
		this.rifPreventivo = rifPreventivo;
	}

	public String getRifRispQuesiti() {
		return this.rifRispQuesiti;
	}

	public void setRifRispQuesiti(String rifRispQuesiti) {
		this.rifRispQuesiti = rifRispQuesiti;
	}

	public String getCauseLab() {
		return this.causeLab;
	}

	public void setCauseLab(String causeLab) {
		this.causeLab = causeLab;
	}

	public Date getDataUltimaVer() {
		return this.dataUltimaVer;
	}

	public void setDataUltimaVer(Date dataUltimaVer) {
		this.dataUltimaVer = dataUltimaVer;
	}

	public String getCostoLoco() {
		return this.costoLoco;
	}

	public void setCostoLoco(String costoLoco) {
		this.costoLoco = costoLoco;
	}

	public Date getDataMaxConf() {
		return this.dataMaxConf;
	}

	public void setDataMaxConf(Date dataMaxConf) {
		this.dataMaxConf = dataMaxConf;
	}

	public String getAlimentBp() {
		return this.alimentBp;
	}

	public void setAlimentBp(String alimentBp) {
		this.alimentBp = alimentBp;
	}

	public Date getDataApp() {
		return this.dataApp;
	}

	public void setDataApp(Date dataApp) {
		this.dataApp = dataApp;
	}

	public String getAutoletturaFinestra() {
		return this.autoletturaFinestra;
	}

	public void setAutoletturaFinestra(String autoletturaFinestra) {
		this.autoletturaFinestra = autoletturaFinestra;
	}

	public Date getDataRicezione() {
		return this.dataRicezione;
	}

	public void setDataRicezione(Date dataRicezione) {
		this.dataRicezione = dataRicezione;
	}

	public String getListaAllegati() {
		return this.listaAllegati;
	}

	public void setListaAllegati(String listaAllegati) {
		this.listaAllegati = listaAllegati;
	}

	public Date getDataForn() {
		return this.dataForn;
	}

	public void setDataForn(Date dataForn) {
		this.dataForn = dataForn;
	}

	public String getResoconto() {
		return this.resoconto;
	}

	public void setResoconto(String resoconto) {
		this.resoconto = resoconto;
	}

	public String getNoteAppVend() {
		return this.noteAppVend;
	}

	public void setNoteAppVend(String noteAppVend) {
		this.noteAppVend = noteAppVend;
	}

	public String getNoteAppDistr() {
		return this.noteAppDistr;
	}

	public void setNoteAppDistr(String noteAppDistr) {
		this.noteAppDistr = noteAppDistr;
	}

	public String getStatoElaborazione() {
		return this.statoElaborazione;
	}

	public void setStatoElaborazione(String statoElaborazione) {
		this.statoElaborazione = statoElaborazione;
	}

	public String getFlagNecessario() {
		return this.flagNecessario;
	}

	public void setFlagNecessario(String flagNecessario) {
		this.flagNecessario = flagNecessario;
	}

	public String getFlagVenditore() {
		return this.flagVenditore;
	}

	public void setFlagVenditore(String flagVenditore) {
		this.flagVenditore = flagVenditore;
	}

	public BigDecimal getGestApp() {
		return this.gestApp;
	}

	public void setGestApp(BigDecimal gestApp) {
		this.gestApp = gestApp;
	}

	public String getTipoLavoro() {
		return this.tipoLavoro;
	}

	public void setTipoLavoro(String tipoLavoro) {
		this.tipoLavoro = tipoLavoro;
	}

	public String getFlagPrimario() {
		return this.flagPrimario;
	}

	public void setFlagPrimario(String flagPrimario) {
		this.flagPrimario = flagPrimario;
	}

	public Date getDataConfermaAmmissibilita() {
		return this.dataConfermaAmmissibilita;
	}

	public void setDataConfermaAmmissibilita(Date dataConfermaAmmissibilita) {
		this.dataConfermaAmmissibilita = dataConfermaAmmissibilita;
	}

	public Date getDataEvasioneDl() {
		return this.dataEvasioneDl;
	}

	public void setDataEvasioneDl(Date dataEvasioneDl) {
		this.dataEvasioneDl = dataEvasioneDl;
	}

	public Date getDataConclusioneRichiesta() {
		return this.dataConclusioneRichiesta;
	}

	public void setDataConclusioneRichiesta(Date dataConclusioneRichiesta) {
		this.dataConclusioneRichiesta = dataConclusioneRichiesta;
	}

	public String getDettaglioVerificaEsito() {
		return this.dettaglioVerificaEsito;
	}

	public void setDettaglioVerificaEsito(String dettaglioVerificaEsito) {
		this.dettaglioVerificaEsito = dettaglioVerificaEsito;
	}

	public String getStrutturaDatiTecnici() {
		return this.strutturaDatiTecnici;
	}

	public void setStrutturaDatiTecnici(String strutturaDatiTecnici) {
		this.strutturaDatiTecnici = strutturaDatiTecnici;
	}

	public String getRevocaDisattivazione() {
		return this.revocaDisattivazione;
	}

	public void setRevocaDisattivazione(String revocaDisattivazione) {
		this.revocaDisattivazione = revocaDisattivazione;
	}

	public String getSospPotPericolo() {
		return this.sospPotPericolo;
	}

	public void setSospPotPericolo(String sospPotPericolo) {
		this.sospPotPericolo = sospPotPericolo;
	}

	public String getTipologiaAppartenenza() {
		return this.tipologiaAppartenenza;
	}

	public void setTipologiaAppartenenza(String tipologiaAppartenenza) {
		this.tipologiaAppartenenza = tipologiaAppartenenza;
	}

	public Date getDataRicezioneBonus() {
		return this.dataRicezioneBonus;
	}

	public void setDataRicezioneBonus(Date dataRicezioneBonus) {
		this.dataRicezioneBonus = dataRicezioneBonus;
	}

	public String getCodErroreAgenda() {
		return this.codErroreAgenda;
	}

	public void setCodErroreAgenda(String codErroreAgenda) {
		this.codErroreAgenda = codErroreAgenda;
	}

	public String getMotivazioneAgenda() {
		return this.motivazioneAgenda;
	}

	public void setMotivazioneAgenda(String motivazioneAgenda) {
		this.motivazioneAgenda = motivazioneAgenda;
	}

	public String getStatoAmmisibilita() {
		return this.statoAmmisibilita;
	}

	public void setStatoAmmisibilita(String statoAmmisibilita) {
		this.statoAmmisibilita = statoAmmisibilita;
	}

	public String getCodPratVn1() {
		return this.codPratVn1;
	}

	public void setCodPratVn1(String codPratVn1) {
		this.codPratVn1 = codPratVn1;
	}

	public BigDecimal getFkMisuratore() {
		return fkMisuratore;
	}

	public void setFkMisuratore(BigDecimal fkMisuratore) {
		this.fkMisuratore = fkMisuratore;
	}

	public BigDecimal getFkConvertitore() {
		return fkConvertitore;
	}

	public void setFkConvertitore(BigDecimal fkConvertitore) {
		this.fkConvertitore = fkConvertitore;
	}

	public BigDecimal getFkMisuratoreCliente() {
		return fkMisuratoreCliente;
	}

	public void setFkMisuratoreCliente(BigDecimal fkMisuratoreCliente) {
		this.fkMisuratoreCliente = fkMisuratoreCliente;
	}

	public BigDecimal getFkConvertitoreCliente() {
		return fkConvertitoreCliente;
	}

	public void setFkConvertitoreCliente(BigDecimal fkConvertitoreCliente) {
		this.fkConvertitoreCliente = fkConvertitoreCliente;
	}

	public BigDecimal getFkMisuratoreRim() {
		return fkMisuratoreRim;
	}

	public void setFkMisuratoreRim(BigDecimal fkMisuratoreRim) {
		this.fkMisuratoreRim = fkMisuratoreRim;
	}

	public BigDecimal getFkConvertitoreRim() {
		return fkConvertitoreRim;
	}

	public void setFkConvertitoreRim(BigDecimal fkConvertitoreRim) {
		this.fkConvertitoreRim = fkConvertitoreRim;
	}

	public BigDecimal getFkIndirizzoForn() {
		return fkIndirizzoForn;
	}

	public void setFkIndirizzoForn(BigDecimal fkIndirizzoForn) {
		this.fkIndirizzoForn = fkIndirizzoForn;
	}

	public BigDecimal getFkIndirizzoEsaz() {
		return fkIndirizzoEsaz;
	}

	public void setFkIndirizzoEsaz(BigDecimal fkIndirizzoEsaz) {
		this.fkIndirizzoEsaz = fkIndirizzoEsaz;
	}

	public BigDecimal getFkClienteUsc() {
		return fkClienteUsc;
	}

	public void setFkClienteUsc(BigDecimal fkClienteUsc) {
		this.fkClienteUsc = fkClienteUsc;
	}

	public BigDecimal getFkIndirizzoBenef() {
		return fkIndirizzoBenef;
	}

	public void setFkIndirizzoBenef(BigDecimal fkIndirizzoBenef) {
		this.fkIndirizzoBenef = fkIndirizzoBenef;
	}

	public BigDecimal getFkIndirizzoImmob() {
		return fkIndirizzoImmob;
	}

	public void setFkIndirizzoImmob(BigDecimal fkIndirizzoImmob) {
		this.fkIndirizzoImmob = fkIndirizzoImmob;
	}

	public BigDecimal getFkClienteFinale() {
		return fkClienteFinale;
	}

	public void setFkClienteFinale(BigDecimal fkClienteFinale) {
		this.fkClienteFinale = fkClienteFinale;
	}

	public BigDecimal getFkIndirizzoLegale() {
		return fkIndirizzoLegale;
	}

	public void setFkIndirizzoLegale(BigDecimal fkIndirizzoLegale) {
		this.fkIndirizzoLegale = fkIndirizzoLegale;
	}

	public BigDecimal getFkIndirizzoRef() {
		return fkIndirizzoRef;
	}

	public void setFkIndirizzoRef(BigDecimal fkIndirizzoRef) {
		this.fkIndirizzoRef = fkIndirizzoRef;
	}

	public BigDecimal getFkClienteRef() {
		return fkClienteRef;
	}

	public void setFkClienteRef(BigDecimal fkClienteRef) {
		this.fkClienteRef = fkClienteRef;
	}

	public BigDecimal getFkClienteEsaz() {
		return fkClienteEsaz;
	}

	public void setFkClienteEsaz(BigDecimal fkClienteEsaz) {
		this.fkClienteEsaz = fkClienteEsaz;
	}

	public BigDecimal getFkClienteBenef() {
		return fkClienteBenef;
	}

	public void setFkClienteBenef(BigDecimal fkClienteBenef) {
		this.fkClienteBenef = fkClienteBenef;
	}

	public LavoriGasXMisuratore getMisuratore() {
		return misuratore;
	}

	public void setMisuratore(LavoriGasXMisuratore misuratore) {
		this.misuratore = misuratore;
	}

	public LavoriGasXMisuratore getConvertitore() {
		return convertitore;
	}

	public void setConvertitore(LavoriGasXMisuratore convertitore) {
		this.convertitore = convertitore;
	}

	public LavoriGasXMisuratore getMisuratoreCliente() {
		return misuratoreCliente;
	}

	public void setMisuratoreCliente(LavoriGasXMisuratore misuratoreCliente) {
		this.misuratoreCliente = misuratoreCliente;
	}

	public LavoriGasXMisuratore getConvertitoreCliente() {
		return convertitoreCliente;
	}

	public void setConvertitoreCliente(LavoriGasXMisuratore convertitoreCliente) {
		this.convertitoreCliente = convertitoreCliente;
	}

	public LavoriGasXMisuratore getMisuratoreRim() {
		return misuratoreRim;
	}

	public void setMisuratoreRim(LavoriGasXMisuratore misuratoreRim) {
		this.misuratoreRim = misuratoreRim;
	}

	public LavoriGasXMisuratore getConvertitoreRim() {
		return convertitoreRim;
	}

	public void setConvertitoreRim(LavoriGasXMisuratore convertitoreRim) {
		this.convertitoreRim = convertitoreRim;
	}

	public LavoriGasXCliente getClienteUsc() {
		return clienteUsc;
	}

	public void setClienteUsc(LavoriGasXCliente clienteUsc) {
		this.clienteUsc = clienteUsc;
	}

	public LavoriGasXCliente getClienteFinale() {
		return clienteFinale;
	}

	public void setClienteFinale(LavoriGasXCliente clienteFinale) {
		this.clienteFinale = clienteFinale;
	}

	public LavoriGasXCliente getClienteRef() {
		return clienteRef;
	}

	public void setClienteRef(LavoriGasXCliente clienteRef) {
		this.clienteRef = clienteRef;
	}

	public LavoriGasXCliente getClienteEsaz() {
		return clienteEsaz;
	}

	public void setClienteEsaz(LavoriGasXCliente clienteEsaz) {
		this.clienteEsaz = clienteEsaz;
	}

	public LavoriGasXCliente getClienteBenef() {
		return clienteBenef;
	}

	public void setClienteBenef(LavoriGasXCliente clienteBenef) {
		this.clienteBenef = clienteBenef;
	}

	public LavoriGasXIndirizzo getIndirizzoForn() {
		return indirizzoForn;
	}

	public void setIndirizzoForn(LavoriGasXIndirizzo indirizzoForn) {
		this.indirizzoForn = indirizzoForn;
	}

	public LavoriGasXIndirizzo getIndirizzoEsaz() {
		return indirizzoEsaz;
	}

	public void setIndirizzoEsaz(LavoriGasXIndirizzo indirizzoEsaz) {
		this.indirizzoEsaz = indirizzoEsaz;
	}

	public LavoriGasXIndirizzo getIndirizzoBenef() {
		return indirizzoBenef;
	}

	public void setIndirizzoBenef(LavoriGasXIndirizzo indirizzoBenef) {
		this.indirizzoBenef = indirizzoBenef;
	}

	public LavoriGasXIndirizzo getIndirizzoImmob() {
		return indirizzoImmob;
	}

	public void setIndirizzoImmob(LavoriGasXIndirizzo indirizzoImmob) {
		this.indirizzoImmob = indirizzoImmob;
	}

	public LavoriGasXIndirizzo getIndirizzoLegale() {
		return indirizzoLegale;
	}

	public void setIndirizzoLegale(LavoriGasXIndirizzo indirizzoLegale) {
		this.indirizzoLegale = indirizzoLegale;
	}

	public LavoriGasXIndirizzo getIndirizzoRef() {
		return indirizzoRef;
	}

	public void setIndirizzoRef(LavoriGasXIndirizzo indirizzoRef) {
		this.indirizzoRef = indirizzoRef;
	}

}
