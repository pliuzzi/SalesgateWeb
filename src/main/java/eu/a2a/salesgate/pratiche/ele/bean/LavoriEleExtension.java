package eu.a2a.salesgate.pratiche.ele.bean;

// Generated 27-set-2013 11.36.08 by Hibernate Tools 4.0.0

import java.math.BigDecimal;
import java.util.Date;

import eu.a2a.salesgate.bean.CodDescBean;

public class LavoriEleExtension extends CodDescBean {

  private static final long serialVersionUID = 5489230871519830223L;

  private String fkLavoriEle;
  private String accertValoriNonCorretti;
  private String accettazione;
  private String accettazRinCliente;
  private String acquistoConsenso;
  private String addebitoOneri;
  private String appuntamentoReclamo;
  private String attiAutorizzativi;
  private String attivFuoriOrario;
  private String aumTensione;
  private String autocertAsl;
  private String autocertContrConn;
  private String autocertIstanza;
  private String autocertLiberatoria;
  private String autocertSollevPersone;
  private String catDisalim;
  private String causaleApp;
  private String causaleIntComplesso;
  private String causaleNonValAutolettura;
  private String cliTiv;
  private String codAreaPred;
  private String codCambioTariffaD3;
  private String codErroreAgenda;
  private String codFasciaDistanza;
  private String codiceContratto;
  private String codicee02;
  private String codiceFlusso;
  private String codicepod1;
  private String codicepod2;
  private String codicepodn;
  private String codicePrevDl;
  private String codiceRintracciabilita;
  private String codInamm;
  private String codPratDistSw;
  private String codPratRif;
  private String codReclamo;
  private String codRinSosMor;
  private String codSubentro;
  private String codTipLavPre;
  private String codTipoAnomalia;
  private String codViaPred;
  private String comunicIndFatt;
  private String comunicIndForn;
  private String conferma;
  private String contAlimFisicaPuntoCons;
  private String costiManodopera;
  private String costiMateriali;
  private String costiPrestTerzi;
  private String costiSpeseGen;
  private Date created;
  private Date daEseguireNonPrimaDel;
  private String dataAccet;
  private String dataapp;
  private Date dataAttTemp;
  private Date dataConclusioneRichiesta;
  private Date dataConfermaAmmissibilita;
  private Date dataDisattTemp;
  private Date dataEsecLavori;
  private Date dataEvasioneDl;
  private Date dataFineStag;
  private Date dataInizioStag;
  private Date dataIntervento;
  private Date dataInvioPreventivo;
  private Date dataPrevistaRipristino;
  private Date dataRiattRipr;
  private Date dataRichiestaPreventivo;
  private Date dataSospensione;
  private Date dataTentativo;
  private Date dataVerifica;
  private String datiFatturazione;
  private String datiTecniciRichiesti;
  private String descLavoro;
  private String detrazMaterialiRecup;
  private String dettaglioVerificaEsito;
  private String dichiarazione;
  private String disalimentabile;
  private String disattFuoriOrario;
  private String distanzaSpostamento;
  private String docDati;
  private String documentazione;
  private String elementiNecessari;
  private BigDecimal esito;
  private String esitoapp;
  private String esitoBase;
  private String esitoSostMisuratore;
  private String esitoValAutolettura;
  private String fabbComplPot;
  private String fase;
  private String faseRic;

  private BigDecimal fkResponsabile;
  private BigDecimal flagCanale;
  private String flagNecessario;
  private String flagVenditore;
  private Character flgModifica;
  private BigDecimal gestApp;
  private String idMis1;
  private String idMis2;
  private String idRichiestaCrm;
  private String immediataSostituzione;
  private String importoPrestazione;
  private String indDistr;
  private String indennizzo;
  private String infoRef;
  private String integrSpeseGenNonStd;
  private String intervento;
  private String intLimMis;
  private Date lastUpdated;
  private String linkAllegati;
  private String malfunzionamentoMis;
  private String mandConn;
  private String meseComp;
  private String meseComp1;
  private String modAccettazPrev;
  private String mortisCausa;
  private String motivazione;
  private String motivazioneAgenda;
  private String note;
  private String noteAmm;
  private String noteEsito;
  private String noteIndFor;
  private String noteIntA2A;
  private String noteUbicazionePod;
  private String numeroDeiPunti;
  private String numeroProtocollo;
  private String nuovaTipIntervento;
  private String nuovoCodRintr;
  private String nuovoTentativo;
  private String oneriAmministrativi;
  private String oneriPregressi;
  private String onOff;
  private String opzioneTariffaria;
  private String opzioneTariffaria2;
  private String ore;
  private String periodoValiditaMesi;
  private String podDaUnificare;
  private String potDispAttuale;
  private String potDisponibile;
  private String potDispRich;
  private String potFrancAttuale;
  private String potFranchigia;
  private String potImpegnata;
  private String presenzaAnomalia;
  private String presenzaCliente;
  private String presenzaClienteNoTele;
  private String preventivo;
  private String quotaDistanza;
  private String quotaFissa;
  private String quotaPotenza;
  private String revocaDisatt;
  private String revocaSospensione;
  private String richVarDati;
  private String riduzionePotenza;
  private String rifAllDaTrasm;
  private String riferimentoPreventivo;
  private String rifQuesiti;
  private String rifReclamo;
  private String rifResoconto;
  private String rifRispQuesiti;
  private String servizioCurveCarico;
  private String servizioRichiedibile;
  private String settoreMerceologico;
  private String sollevPersone;
  private String sospPotPer;
  private String sostMis;
  private String staEner;
  private String stagRicorrente;
  private String statoAmmisibilita;
  private String statoPec;
  private String stima;
  private String strutturaDatiTecnici;
  private String supplFuoriOrario;
  private String telCellPreavviso;
  private String temMaxEsecConfRichGgLav;
  private String tempiAutorizzazioni;
  private String tempoEsecPrevGgLav;
  private String tempoMaxEsecuzGgLav;
  private String tensione;
  private String tensioneAlim;
  private String tensioneFase;
  private String testoPredeterminabilita;
  private String tipoapp;
  private String tipoConnessione;
  private String tipoContratto;
  private String tipoInterv1;
  private String tipologiaIntervento;
  private String tipologiaUtenza;
  private String tipologiaVoltura;
  private String tipoServizio;
  private String trattamentoIva;
  private String usoEnergia;
  private String verificaLab;
  private String verificaNonEseguita;

  private LavoriEleXCliente clienteEsazione;
  private LavoriEleXCliente clienteFinale;
  private LavoriEleXCliente clienteReferente;
  private LavoriEleXCliente clienteUscente;

  private LavoriEleXIndirizzo indirizzoEsazione;
  private LavoriEleXIndirizzo indirizzoFornitura;
  private LavoriEleXIndirizzo indirizzoLegale;

  private LavoriEleXMisuratore misuratore;
  private LavoriEleXMisuratore misuratoreCliente;
  private LavoriEleXMisuratore misuratoreRimosso;
  private LavoriEleXMisuratore misuratoreVendita;

  private BigDecimal fkClienteEsazione;
  private BigDecimal fkClienteFinale;
  private BigDecimal fkClienteRef;
  private BigDecimal fkClienteUscente;
  private BigDecimal fkFiles;
  private BigDecimal fkIndirizzoEsazione;
  private BigDecimal fkIndirizzoFornitura;
  private BigDecimal fkIndirizzoLegale;
  private BigDecimal fkMisuratore;
  private BigDecimal fkMisuratoreCliente;
  private BigDecimal fkMisuratoreRimosso;
  private BigDecimal fkMisuratoreVendita;

  public String getAccertValoriNonCorretti() {
    return accertValoriNonCorretti;
  }

  public void setAccertValoriNonCorretti(String accertValoriNonCorretti) {
    this.accertValoriNonCorretti = accertValoriNonCorretti;
  }

  public String getAccettazione() {
    return accettazione;
  }

  public void setAccettazione(String accettazione) {
    this.accettazione = accettazione;
  }

  public String getAccettazRinCliente() {
    return accettazRinCliente;
  }

  public void setAccettazRinCliente(String accettazRinCliente) {
    this.accettazRinCliente = accettazRinCliente;
  }

  public String getAcquistoConsenso() {
    return acquistoConsenso;
  }

  public void setAcquistoConsenso(String acquistoConsenso) {
    this.acquistoConsenso = acquistoConsenso;
  }

  public String getAddebitoOneri() {
    return addebitoOneri;
  }

  public void setAddebitoOneri(String addebitoOneri) {
    this.addebitoOneri = addebitoOneri;
  }

  public String getAppuntamentoReclamo() {
    return appuntamentoReclamo;
  }

  public void setAppuntamentoReclamo(String appuntamentoReclamo) {
    this.appuntamentoReclamo = appuntamentoReclamo;
  }

  public String getAttiAutorizzativi() {
    return attiAutorizzativi;
  }

  public void setAttiAutorizzativi(String attiAutorizzativi) {
    this.attiAutorizzativi = attiAutorizzativi;
  }

  public String getAttivFuoriOrario() {
    return attivFuoriOrario;
  }

  public void setAttivFuoriOrario(String attivFuoriOrario) {
    this.attivFuoriOrario = attivFuoriOrario;
  }

  public String getAumTensione() {
    return aumTensione;
  }

  public void setAumTensione(String aumTensione) {
    this.aumTensione = aumTensione;
  }

  public String getAutocertAsl() {
    return autocertAsl;
  }

  public void setAutocertAsl(String autocertAsl) {
    this.autocertAsl = autocertAsl;
  }

  public String getAutocertContrConn() {
    return autocertContrConn;
  }

  public void setAutocertContrConn(String autocertContrConn) {
    this.autocertContrConn = autocertContrConn;
  }

  public String getAutocertIstanza() {
    return autocertIstanza;
  }

  public void setAutocertIstanza(String autocertIstanza) {
    this.autocertIstanza = autocertIstanza;
  }

  public String getAutocertLiberatoria() {
    return autocertLiberatoria;
  }

  public void setAutocertLiberatoria(String autocertLiberatoria) {
    this.autocertLiberatoria = autocertLiberatoria;
  }

  public String getAutocertSollevPersone() {
    return autocertSollevPersone;
  }

  public void setAutocertSollevPersone(String autocertSollevPersone) {
    this.autocertSollevPersone = autocertSollevPersone;
  }

  public String getCatDisalim() {
    return catDisalim;
  }

  public void setCatDisalim(String catDisalim) {
    this.catDisalim = catDisalim;
  }

  public String getCausaleApp() {
    return causaleApp;
  }

  public void setCausaleApp(String causaleApp) {
    this.causaleApp = causaleApp;
  }

  public String getCausaleIntComplesso() {
    return causaleIntComplesso;
  }

  public void setCausaleIntComplesso(String causaleIntComplesso) {
    this.causaleIntComplesso = causaleIntComplesso;
  }

  public String getCausaleNonValAutolettura() {
    return causaleNonValAutolettura;
  }

  public void setCausaleNonValAutolettura(String causaleNonValAutolettura) {
    this.causaleNonValAutolettura = causaleNonValAutolettura;
  }

  public String getCliTiv() {
    return cliTiv;
  }

  public void setCliTiv(String cliTiv) {
    this.cliTiv = cliTiv;
  }

  public String getCodAreaPred() {
    return codAreaPred;
  }

  public void setCodAreaPred(String codAreaPred) {
    this.codAreaPred = codAreaPred;
  }

  public String getCodCambioTariffaD3() {
    return codCambioTariffaD3;
  }

  public void setCodCambioTariffaD3(String codCambioTariffaD3) {
    this.codCambioTariffaD3 = codCambioTariffaD3;
  }

  public String getCodErroreAgenda() {
    return codErroreAgenda;
  }

  public void setCodErroreAgenda(String codErroreAgenda) {
    this.codErroreAgenda = codErroreAgenda;
  }

  public String getCodFasciaDistanza() {
    return codFasciaDistanza;
  }

  public void setCodFasciaDistanza(String codFasciaDistanza) {
    this.codFasciaDistanza = codFasciaDistanza;
  }

  public String getCodiceContratto() {
    return codiceContratto;
  }

  public void setCodiceContratto(String codiceContratto) {
    this.codiceContratto = codiceContratto;
  }

  public String getCodicee02() {
    return codicee02;
  }

  public void setCodicee02(String codicee02) {
    this.codicee02 = codicee02;
  }

  public String getCodiceFlusso() {
    return codiceFlusso;
  }

  public void setCodiceFlusso(String codiceFlusso) {
    this.codiceFlusso = codiceFlusso;
  }

  public String getCodicepod1() {
    return codicepod1;
  }

  public void setCodicepod1(String codicepod1) {
    this.codicepod1 = codicepod1;
  }

  public String getCodicepod2() {
    return codicepod2;
  }

  public void setCodicepod2(String codicepod2) {
    this.codicepod2 = codicepod2;
  }

  public String getCodicepodn() {
    return codicepodn;
  }

  public void setCodicepodn(String codicepodn) {
    this.codicepodn = codicepodn;
  }

  public String getCodicePrevDl() {
    return codicePrevDl;
  }

  public void setCodicePrevDl(String codicePrevDl) {
    this.codicePrevDl = codicePrevDl;
  }

  public String getCodiceRintracciabilita() {
    return codiceRintracciabilita;
  }

  public void setCodiceRintracciabilita(String codiceRintracciabilita) {
    this.codiceRintracciabilita = codiceRintracciabilita;
  }

  public String getCodInamm() {
    return codInamm;
  }

  public void setCodInamm(String codInamm) {
    this.codInamm = codInamm;
  }

  public String getCodPratDistSw() {
    return codPratDistSw;
  }

  public void setCodPratDistSw(String codPratDistSw) {
    this.codPratDistSw = codPratDistSw;
  }

  public String getCodPratRif() {
    return codPratRif;
  }

  public void setCodPratRif(String codPratRif) {
    this.codPratRif = codPratRif;
  }

  public String getCodReclamo() {
    return codReclamo;
  }

  public void setCodReclamo(String codReclamo) {
    this.codReclamo = codReclamo;
  }

  public String getCodRinSosMor() {
    return codRinSosMor;
  }

  public void setCodRinSosMor(String codRinSosMor) {
    this.codRinSosMor = codRinSosMor;
  }

  public String getCodSubentro() {
    return codSubentro;
  }

  public void setCodSubentro(String codSubentro) {
    this.codSubentro = codSubentro;
  }

  public String getCodTipLavPre() {
    return codTipLavPre;
  }

  public void setCodTipLavPre(String codTipLavPre) {
    this.codTipLavPre = codTipLavPre;
  }

  public String getCodTipoAnomalia() {
    return codTipoAnomalia;
  }

  public void setCodTipoAnomalia(String codTipoAnomalia) {
    this.codTipoAnomalia = codTipoAnomalia;
  }

  public String getCodViaPred() {
    return codViaPred;
  }

  public void setCodViaPred(String codViaPred) {
    this.codViaPred = codViaPred;
  }

  public String getComunicIndFatt() {
    return comunicIndFatt;
  }

  public void setComunicIndFatt(String comunicIndFatt) {
    this.comunicIndFatt = comunicIndFatt;
  }

  public String getComunicIndForn() {
    return comunicIndForn;
  }

  public void setComunicIndForn(String comunicIndForn) {
    this.comunicIndForn = comunicIndForn;
  }

  public String getConferma() {
    return conferma;
  }

  public void setConferma(String conferma) {
    this.conferma = conferma;
  }

  public String getContAlimFisicaPuntoCons() {
    return contAlimFisicaPuntoCons;
  }

  public void setContAlimFisicaPuntoCons(String contAlimFisicaPuntoCons) {
    this.contAlimFisicaPuntoCons = contAlimFisicaPuntoCons;
  }

  public String getCostiManodopera() {
    return costiManodopera;
  }

  public void setCostiManodopera(String costiManodopera) {
    this.costiManodopera = costiManodopera;
  }

  public String getCostiMateriali() {
    return costiMateriali;
  }

  public void setCostiMateriali(String costiMateriali) {
    this.costiMateriali = costiMateriali;
  }

  public String getCostiPrestTerzi() {
    return costiPrestTerzi;
  }

  public void setCostiPrestTerzi(String costiPrestTerzi) {
    this.costiPrestTerzi = costiPrestTerzi;
  }

  public String getCostiSpeseGen() {
    return costiSpeseGen;
  }

  public void setCostiSpeseGen(String costiSpeseGen) {
    this.costiSpeseGen = costiSpeseGen;
  }

  public Date getCreated() {
    return created;
  }

  public void setCreated(Date created) {
    this.created = created;
  }

  public Date getDaEseguireNonPrimaDel() {
    return daEseguireNonPrimaDel;
  }

  public void setDaEseguireNonPrimaDel(Date daEseguireNonPrimaDel) {
    this.daEseguireNonPrimaDel = daEseguireNonPrimaDel;
  }

  public String getDataAccet() {
    return dataAccet;
  }

  public void setDataAccet(String dataAccet) {
    this.dataAccet = dataAccet;
  }

  public String getDataapp() {
    return dataapp;
  }

  public void setDataapp(String dataapp) {
    this.dataapp = dataapp;
  }

  public Date getDataAttTemp() {
    return dataAttTemp;
  }

  public void setDataAttTemp(Date dataAttTemp) {
    this.dataAttTemp = dataAttTemp;
  }

  public Date getDataConclusioneRichiesta() {
    return dataConclusioneRichiesta;
  }

  public void setDataConclusioneRichiesta(Date dataConclusioneRichiesta) {
    this.dataConclusioneRichiesta = dataConclusioneRichiesta;
  }

  public Date getDataConfermaAmmissibilita() {
    return dataConfermaAmmissibilita;
  }

  public void setDataConfermaAmmissibilita(Date dataConfermaAmmissibilita) {
    this.dataConfermaAmmissibilita = dataConfermaAmmissibilita;
  }

  public Date getDataDisattTemp() {
    return dataDisattTemp;
  }

  public void setDataDisattTemp(Date dataDisattTemp) {
    this.dataDisattTemp = dataDisattTemp;
  }

  public Date getDataEsecLavori() {
    return dataEsecLavori;
  }

  public void setDataEsecLavori(Date dataEsecLavori) {
    this.dataEsecLavori = dataEsecLavori;
  }

  public Date getDataEvasioneDl() {
    return dataEvasioneDl;
  }

  public void setDataEvasioneDl(Date dataEvasioneDl) {
    this.dataEvasioneDl = dataEvasioneDl;
  }

  public Date getDataFineStag() {
    return dataFineStag;
  }

  public void setDataFineStag(Date dataFineStag) {
    this.dataFineStag = dataFineStag;
  }

  public Date getDataInizioStag() {
    return dataInizioStag;
  }

  public void setDataInizioStag(Date dataInizioStag) {
    this.dataInizioStag = dataInizioStag;
  }

  public Date getDataIntervento() {
    return dataIntervento;
  }

  public void setDataIntervento(Date dataIntervento) {
    this.dataIntervento = dataIntervento;
  }

  public Date getDataInvioPreventivo() {
    return dataInvioPreventivo;
  }

  public void setDataInvioPreventivo(Date dataInvioPreventivo) {
    this.dataInvioPreventivo = dataInvioPreventivo;
  }

  public Date getDataPrevistaRipristino() {
    return dataPrevistaRipristino;
  }

  public void setDataPrevistaRipristino(Date dataPrevistaRipristino) {
    this.dataPrevistaRipristino = dataPrevistaRipristino;
  }

  public Date getDataRiattRipr() {
    return dataRiattRipr;
  }

  public void setDataRiattRipr(Date dataRiattRipr) {
    this.dataRiattRipr = dataRiattRipr;
  }

  public Date getDataRichiestaPreventivo() {
    return dataRichiestaPreventivo;
  }

  public void setDataRichiestaPreventivo(Date dataRichiestaPreventivo) {
    this.dataRichiestaPreventivo = dataRichiestaPreventivo;
  }

  public Date getDataSospensione() {
    return dataSospensione;
  }

  public void setDataSospensione(Date dataSospensione) {
    this.dataSospensione = dataSospensione;
  }

  public Date getDataTentativo() {
    return dataTentativo;
  }

  public void setDataTentativo(Date dataTentativo) {
    this.dataTentativo = dataTentativo;
  }

  public Date getDataVerifica() {
    return dataVerifica;
  }

  public void setDataVerifica(Date dataVerifica) {
    this.dataVerifica = dataVerifica;
  }

  public String getDatiFatturazione() {
    return datiFatturazione;
  }

  public void setDatiFatturazione(String datiFatturazione) {
    this.datiFatturazione = datiFatturazione;
  }

  public String getDatiTecniciRichiesti() {
    return datiTecniciRichiesti;
  }

  public void setDatiTecniciRichiesti(String datiTecniciRichiesti) {
    this.datiTecniciRichiesti = datiTecniciRichiesti;
  }

  public String getDescLavoro() {
    return descLavoro;
  }

  public void setDescLavoro(String descLavoro) {
    this.descLavoro = descLavoro;
  }

  public String getDetrazMaterialiRecup() {
    return detrazMaterialiRecup;
  }

  public void setDetrazMaterialiRecup(String detrazMaterialiRecup) {
    this.detrazMaterialiRecup = detrazMaterialiRecup;
  }

  public String getDettaglioVerificaEsito() {
    return dettaglioVerificaEsito;
  }

  public void setDettaglioVerificaEsito(String dettaglioVerificaEsito) {
    this.dettaglioVerificaEsito = dettaglioVerificaEsito;
  }

  public String getDichiarazione() {
    return dichiarazione;
  }

  public void setDichiarazione(String dichiarazione) {
    this.dichiarazione = dichiarazione;
  }

  public String getDisalimentabile() {
    return disalimentabile;
  }

  public void setDisalimentabile(String disalimentabile) {
    this.disalimentabile = disalimentabile;
  }

  public String getDisattFuoriOrario() {
    return disattFuoriOrario;
  }

  public void setDisattFuoriOrario(String disattFuoriOrario) {
    this.disattFuoriOrario = disattFuoriOrario;
  }

  public String getDistanzaSpostamento() {
    return distanzaSpostamento;
  }

  public void setDistanzaSpostamento(String distanzaSpostamento) {
    this.distanzaSpostamento = distanzaSpostamento;
  }

  public String getDocDati() {
    return docDati;
  }

  public void setDocDati(String docDati) {
    this.docDati = docDati;
  }

  public String getDocumentazione() {
    return documentazione;
  }

  public void setDocumentazione(String documentazione) {
    this.documentazione = documentazione;
  }

  public String getElementiNecessari() {
    return elementiNecessari;
  }

  public void setElementiNecessari(String elementiNecessari) {
    this.elementiNecessari = elementiNecessari;
  }

  public BigDecimal getEsito() {
    return esito;
  }

  public void setEsito(BigDecimal esito) {
    this.esito = esito;
  }

  public String getEsitoapp() {
    return esitoapp;
  }

  public void setEsitoapp(String esitoapp) {
    this.esitoapp = esitoapp;
  }

  public String getEsitoBase() {
    return esitoBase;
  }

  public void setEsitoBase(String esitoBase) {
    this.esitoBase = esitoBase;
  }

  public String getEsitoSostMisuratore() {
    return esitoSostMisuratore;
  }

  public void setEsitoSostMisuratore(String esitoSostMisuratore) {
    this.esitoSostMisuratore = esitoSostMisuratore;
  }

  public String getEsitoValAutolettura() {
    return esitoValAutolettura;
  }

  public void setEsitoValAutolettura(String esitoValAutolettura) {
    this.esitoValAutolettura = esitoValAutolettura;
  }

  public String getFabbComplPot() {
    return fabbComplPot;
  }

  public void setFabbComplPot(String fabbComplPot) {
    this.fabbComplPot = fabbComplPot;
  }

  public String getFase() {
    return fase;
  }

  public void setFase(String fase) {
    this.fase = fase;
  }

  public String getFaseRic() {
    return faseRic;
  }

  public void setFaseRic(String faseRic) {
    this.faseRic = faseRic;
  }

  public BigDecimal getFkClienteEsazione() {
    return fkClienteEsazione;
  }

  public void setFkClienteEsazione(BigDecimal fkClienteEsazione) {
    this.fkClienteEsazione = fkClienteEsazione;
  }

  public BigDecimal getFkClienteFinale() {
    return fkClienteFinale;
  }

  public void setFkClienteFinale(BigDecimal fkClienteFinale) {
    this.fkClienteFinale = fkClienteFinale;
  }

  public BigDecimal getFkClienteRef() {
    return fkClienteRef;
  }

  public void setFkClienteRef(BigDecimal fkClienteRef) {
    this.fkClienteRef = fkClienteRef;
  }

  public BigDecimal getFkClienteUscente() {
    return fkClienteUscente;
  }

  public void setFkClienteUscente(BigDecimal fkClienteUscente) {
    this.fkClienteUscente = fkClienteUscente;
  }

  public BigDecimal getFkFiles() {
    return fkFiles;
  }

  public void setFkFiles(BigDecimal fkFiles) {
    this.fkFiles = fkFiles;
  }

  public BigDecimal getFkIndirizzoEsazione() {
    return fkIndirizzoEsazione;
  }

  public void setFkIndirizzoEsazione(BigDecimal fkIndirizzoEsazione) {
    this.fkIndirizzoEsazione = fkIndirizzoEsazione;
  }

  public BigDecimal getFkIndirizzoFornitura() {
    return fkIndirizzoFornitura;
  }

  public void setFkIndirizzoFornitura(BigDecimal fkIndirizzoFornitura) {
    this.fkIndirizzoFornitura = fkIndirizzoFornitura;
  }

  public BigDecimal getFkIndirizzoLegale() {
    return fkIndirizzoLegale;
  }

  public void setFkIndirizzoLegale(BigDecimal fkIndirizzoLegale) {
    this.fkIndirizzoLegale = fkIndirizzoLegale;
  }

  public String getFkLavoriEle() {
    return fkLavoriEle;
  }

  public void setFkLavoriEle(String fkLavoriEle) {
    this.fkLavoriEle = fkLavoriEle;
  }

  public BigDecimal getFkMisuratore() {
    return fkMisuratore;
  }

  public void setFkMisuratore(BigDecimal fkMisuratore) {
    this.fkMisuratore = fkMisuratore;
  }

  public BigDecimal getFkMisuratoreCliente() {
    return fkMisuratoreCliente;
  }

  public void setFkMisuratoreCliente(BigDecimal fkMisuratoreCliente) {
    this.fkMisuratoreCliente = fkMisuratoreCliente;
  }

  public BigDecimal getFkMisuratoreRimosso() {
    return fkMisuratoreRimosso;
  }

  public void setFkMisuratoreRimosso(BigDecimal fkMisuratoreRimosso) {
    this.fkMisuratoreRimosso = fkMisuratoreRimosso;
  }

  public BigDecimal getFkMisuratoreVendita() {
    return fkMisuratoreVendita;
  }

  public void setFkMisuratoreVendita(BigDecimal fkMisuratoreVendita) {
    this.fkMisuratoreVendita = fkMisuratoreVendita;
  }

  public BigDecimal getFkResponsabile() {
    return fkResponsabile;
  }

  public void setFkResponsabile(BigDecimal fkResponsabile) {
    this.fkResponsabile = fkResponsabile;
  }

  public BigDecimal getFlagCanale() {
    return flagCanale;
  }

  public void setFlagCanale(BigDecimal flagCanale) {
    this.flagCanale = flagCanale;
  }

  public String getFlagNecessario() {
    return flagNecessario;
  }

  public void setFlagNecessario(String flagNecessario) {
    this.flagNecessario = flagNecessario;
  }

  public String getFlagVenditore() {
    return flagVenditore;
  }

  public void setFlagVenditore(String flagVenditore) {
    this.flagVenditore = flagVenditore;
  }

  public Character getFlgModifica() {
    return flgModifica;
  }

  public void setFlgModifica(Character flgModifica) {
    this.flgModifica = flgModifica;
  }

  public BigDecimal getGestApp() {
    return gestApp;
  }

  public void setGestApp(BigDecimal gestApp) {
    this.gestApp = gestApp;
  }

  public String getIdMis1() {
    return idMis1;
  }

  public void setIdMis1(String idMis1) {
    this.idMis1 = idMis1;
  }

  public String getIdMis2() {
    return idMis2;
  }

  public void setIdMis2(String idMis2) {
    this.idMis2 = idMis2;
  }

  public String getIdRichiestaCrm() {
    return idRichiestaCrm;
  }

  public void setIdRichiestaCrm(String idRichiestaCrm) {
    this.idRichiestaCrm = idRichiestaCrm;
  }

  public String getImmediataSostituzione() {
    return immediataSostituzione;
  }

  public void setImmediataSostituzione(String immediataSostituzione) {
    this.immediataSostituzione = immediataSostituzione;
  }

  public String getImportoPrestazione() {
    return importoPrestazione;
  }

  public void setImportoPrestazione(String importoPrestazione) {
    this.importoPrestazione = importoPrestazione;
  }

  public String getIndDistr() {
    return indDistr;
  }

  public void setIndDistr(String indDistr) {
    this.indDistr = indDistr;
  }

  public String getIndennizzo() {
    return indennizzo;
  }

  public void setIndennizzo(String indennizzo) {
    this.indennizzo = indennizzo;
  }

  public String getInfoRef() {
    return infoRef;
  }

  public void setInfoRef(String infoRef) {
    this.infoRef = infoRef;
  }

  public String getIntegrSpeseGenNonStd() {
    return integrSpeseGenNonStd;
  }

  public void setIntegrSpeseGenNonStd(String integrSpeseGenNonStd) {
    this.integrSpeseGenNonStd = integrSpeseGenNonStd;
  }

  public String getIntervento() {
    return intervento;
  }

  public void setIntervento(String intervento) {
    this.intervento = intervento;
  }

  public String getIntLimMis() {
    return intLimMis;
  }

  public void setIntLimMis(String intLimMis) {
    this.intLimMis = intLimMis;
  }

  public Date getLastUpdated() {
    return lastUpdated;
  }

  public void setLastUpdated(Date lastUpdated) {
    this.lastUpdated = lastUpdated;
  }

  public String getLinkAllegati() {
    return linkAllegati;
  }

  public void setLinkAllegati(String linkAllegati) {
    this.linkAllegati = linkAllegati;
  }

  public String getMalfunzionamentoMis() {
    return malfunzionamentoMis;
  }

  public void setMalfunzionamentoMis(String malfunzionamentoMis) {
    this.malfunzionamentoMis = malfunzionamentoMis;
  }

  public String getMandConn() {
    return mandConn;
  }

  public void setMandConn(String mandConn) {
    this.mandConn = mandConn;
  }

  public String getMeseComp() {
    return meseComp;
  }

  public void setMeseComp(String meseComp) {
    this.meseComp = meseComp;
  }

  public String getMeseComp1() {
    return meseComp1;
  }

  public void setMeseComp1(String meseComp1) {
    this.meseComp1 = meseComp1;
  }

  public String getModAccettazPrev() {
    return modAccettazPrev;
  }

  public void setModAccettazPrev(String modAccettazPrev) {
    this.modAccettazPrev = modAccettazPrev;
  }

  public String getMortisCausa() {
    return mortisCausa;
  }

  public void setMortisCausa(String mortisCausa) {
    this.mortisCausa = mortisCausa;
  }

  public String getMotivazione() {
    return motivazione;
  }

  public void setMotivazione(String motivazione) {
    this.motivazione = motivazione;
  }

  public String getMotivazioneAgenda() {
    return motivazioneAgenda;
  }

  public void setMotivazioneAgenda(String motivazioneAgenda) {
    this.motivazioneAgenda = motivazioneAgenda;
  }

  public String getNote() {
    return note;
  }

  public void setNote(String note) {
    this.note = note;
  }

  public String getNoteAmm() {
    return noteAmm;
  }

  public void setNoteAmm(String noteAmm) {
    this.noteAmm = noteAmm;
  }

  public String getNoteEsito() {
    return noteEsito;
  }

  public void setNoteEsito(String noteEsito) {
    this.noteEsito = noteEsito;
  }

  public String getNoteIndFor() {
    return noteIndFor;
  }

  public void setNoteIndFor(String noteIndFor) {
    this.noteIndFor = noteIndFor;
  }

  public String getNoteIntA2A() {
    return noteIntA2A;
  }

  public void setNoteIntA2A(String noteIntA2A) {
    this.noteIntA2A = noteIntA2A;
  }

  public String getNoteUbicazionePod() {
    return noteUbicazionePod;
  }

  public void setNoteUbicazionePod(String noteUbicazionePod) {
    this.noteUbicazionePod = noteUbicazionePod;
  }

  public String getNumeroDeiPunti() {
    return numeroDeiPunti;
  }

  public void setNumeroDeiPunti(String numeroDeiPunti) {
    this.numeroDeiPunti = numeroDeiPunti;
  }

  public String getNumeroProtocollo() {
    return numeroProtocollo;
  }

  public void setNumeroProtocollo(String numeroProtocollo) {
    this.numeroProtocollo = numeroProtocollo;
  }

  public String getNuovaTipIntervento() {
    return nuovaTipIntervento;
  }

  public void setNuovaTipIntervento(String nuovaTipIntervento) {
    this.nuovaTipIntervento = nuovaTipIntervento;
  }

  public String getNuovoCodRintr() {
    return nuovoCodRintr;
  }

  public void setNuovoCodRintr(String nuovoCodRintr) {
    this.nuovoCodRintr = nuovoCodRintr;
  }

  public String getNuovoTentativo() {
    return nuovoTentativo;
  }

  public void setNuovoTentativo(String nuovoTentativo) {
    this.nuovoTentativo = nuovoTentativo;
  }

  public String getOneriAmministrativi() {
    return oneriAmministrativi;
  }

  public void setOneriAmministrativi(String oneriAmministrativi) {
    this.oneriAmministrativi = oneriAmministrativi;
  }

  public String getOneriPregressi() {
    return oneriPregressi;
  }

  public void setOneriPregressi(String oneriPregressi) {
    this.oneriPregressi = oneriPregressi;
  }

  public String getOnOff() {
    return onOff;
  }

  public void setOnOff(String onOff) {
    this.onOff = onOff;
  }

  public String getOpzioneTariffaria() {
    return opzioneTariffaria;
  }

  public void setOpzioneTariffaria(String opzioneTariffaria) {
    this.opzioneTariffaria = opzioneTariffaria;
  }

  public String getOpzioneTariffaria2() {
    return opzioneTariffaria2;
  }

  public void setOpzioneTariffaria2(String opzioneTariffaria2) {
    this.opzioneTariffaria2 = opzioneTariffaria2;
  }

  public String getOre() {
    return ore;
  }

  public void setOre(String ore) {
    this.ore = ore;
  }

  public String getPeriodoValiditaMesi() {
    return periodoValiditaMesi;
  }

  public void setPeriodoValiditaMesi(String periodoValiditaMesi) {
    this.periodoValiditaMesi = periodoValiditaMesi;
  }

  public String getPodDaUnificare() {
    return podDaUnificare;
  }

  public void setPodDaUnificare(String podDaUnificare) {
    this.podDaUnificare = podDaUnificare;
  }

  public String getPotDispAttuale() {
    return potDispAttuale;
  }

  public void setPotDispAttuale(String potDispAttuale) {
    this.potDispAttuale = potDispAttuale;
  }

  public String getPotDisponibile() {
    return potDisponibile;
  }

  public void setPotDisponibile(String potDisponibile) {
    this.potDisponibile = potDisponibile;
  }

  public String getPotDispRich() {
    return potDispRich;
  }

  public void setPotDispRich(String potDispRich) {
    this.potDispRich = potDispRich;
  }

  public String getPotFrancAttuale() {
    return potFrancAttuale;
  }

  public void setPotFrancAttuale(String potFrancAttuale) {
    this.potFrancAttuale = potFrancAttuale;
  }

  public String getPotFranchigia() {
    return potFranchigia;
  }

  public void setPotFranchigia(String potFranchigia) {
    this.potFranchigia = potFranchigia;
  }

  public String getPotImpegnata() {
    return potImpegnata;
  }

  public void setPotImpegnata(String potImpegnata) {
    this.potImpegnata = potImpegnata;
  }

  public String getPresenzaAnomalia() {
    return presenzaAnomalia;
  }

  public void setPresenzaAnomalia(String presenzaAnomalia) {
    this.presenzaAnomalia = presenzaAnomalia;
  }

  public String getPresenzaCliente() {
    return presenzaCliente;
  }

  public void setPresenzaCliente(String presenzaCliente) {
    this.presenzaCliente = presenzaCliente;
  }

  public String getPresenzaClienteNoTele() {
    return presenzaClienteNoTele;
  }

  public void setPresenzaClienteNoTele(String presenzaClienteNoTele) {
    this.presenzaClienteNoTele = presenzaClienteNoTele;
  }

  public String getPreventivo() {
    return preventivo;
  }

  public void setPreventivo(String preventivo) {
    this.preventivo = preventivo;
  }

  public String getQuotaDistanza() {
    return quotaDistanza;
  }

  public void setQuotaDistanza(String quotaDistanza) {
    this.quotaDistanza = quotaDistanza;
  }

  public String getQuotaFissa() {
    return quotaFissa;
  }

  public void setQuotaFissa(String quotaFissa) {
    this.quotaFissa = quotaFissa;
  }

  public String getQuotaPotenza() {
    return quotaPotenza;
  }

  public void setQuotaPotenza(String quotaPotenza) {
    this.quotaPotenza = quotaPotenza;
  }

  public String getRevocaDisatt() {
    return revocaDisatt;
  }

  public void setRevocaDisatt(String revocaDisatt) {
    this.revocaDisatt = revocaDisatt;
  }

  public String getRevocaSospensione() {
    return revocaSospensione;
  }

  public void setRevocaSospensione(String revocaSospensione) {
    this.revocaSospensione = revocaSospensione;
  }

  public String getRichVarDati() {
    return richVarDati;
  }

  public void setRichVarDati(String richVarDati) {
    this.richVarDati = richVarDati;
  }

  public String getRiduzionePotenza() {
    return riduzionePotenza;
  }

  public void setRiduzionePotenza(String riduzionePotenza) {
    this.riduzionePotenza = riduzionePotenza;
  }

  public String getRifAllDaTrasm() {
    return rifAllDaTrasm;
  }

  public void setRifAllDaTrasm(String rifAllDaTrasm) {
    this.rifAllDaTrasm = rifAllDaTrasm;
  }

  public String getRiferimentoPreventivo() {
    return riferimentoPreventivo;
  }

  public void setRiferimentoPreventivo(String riferimentoPreventivo) {
    this.riferimentoPreventivo = riferimentoPreventivo;
  }

  public String getRifQuesiti() {
    return rifQuesiti;
  }

  public void setRifQuesiti(String rifQuesiti) {
    this.rifQuesiti = rifQuesiti;
  }

  public String getRifReclamo() {
    return rifReclamo;
  }

  public void setRifReclamo(String rifReclamo) {
    this.rifReclamo = rifReclamo;
  }

  public String getRifResoconto() {
    return rifResoconto;
  }

  public void setRifResoconto(String rifResoconto) {
    this.rifResoconto = rifResoconto;
  }

  public String getRifRispQuesiti() {
    return rifRispQuesiti;
  }

  public void setRifRispQuesiti(String rifRispQuesiti) {
    this.rifRispQuesiti = rifRispQuesiti;
  }

  public String getServizioCurveCarico() {
    return servizioCurveCarico;
  }

  public void setServizioCurveCarico(String servizioCurveCarico) {
    this.servizioCurveCarico = servizioCurveCarico;
  }

  public String getServizioRichiedibile() {
    return servizioRichiedibile;
  }

  public void setServizioRichiedibile(String servizioRichiedibile) {
    this.servizioRichiedibile = servizioRichiedibile;
  }

  public String getSettoreMerceologico() {
    return settoreMerceologico;
  }

  public void setSettoreMerceologico(String settoreMerceologico) {
    this.settoreMerceologico = settoreMerceologico;
  }

  public String getSollevPersone() {
    return sollevPersone;
  }

  public void setSollevPersone(String sollevPersone) {
    this.sollevPersone = sollevPersone;
  }

  public String getSospPotPer() {
    return sospPotPer;
  }

  public void setSospPotPer(String sospPotPer) {
    this.sospPotPer = sospPotPer;
  }

  public String getSostMis() {
    return sostMis;
  }

  public void setSostMis(String sostMis) {
    this.sostMis = sostMis;
  }

  public String getStaEner() {
    return staEner;
  }

  public void setStaEner(String staEner) {
    this.staEner = staEner;
  }

  public String getStagRicorrente() {
    return stagRicorrente;
  }

  public void setStagRicorrente(String stagRicorrente) {
    this.stagRicorrente = stagRicorrente;
  }

  public String getStatoAmmisibilita() {
    return statoAmmisibilita;
  }

  public void setStatoAmmisibilita(String statoAmmisibilita) {
    this.statoAmmisibilita = statoAmmisibilita;
  }

  public String getStatoPec() {
    return statoPec;
  }

  public void setStatoPec(String statoPec) {
    this.statoPec = statoPec;
  }

  public String getStima() {
    return stima;
  }

  public void setStima(String stima) {
    this.stima = stima;
  }

  public String getStrutturaDatiTecnici() {
    return strutturaDatiTecnici;
  }

  public void setStrutturaDatiTecnici(String strutturaDatiTecnici) {
    this.strutturaDatiTecnici = strutturaDatiTecnici;
  }

  public String getSupplFuoriOrario() {
    return supplFuoriOrario;
  }

  public void setSupplFuoriOrario(String supplFuoriOrario) {
    this.supplFuoriOrario = supplFuoriOrario;
  }

  public String getTelCellPreavviso() {
    return telCellPreavviso;
  }

  public void setTelCellPreavviso(String telCellPreavviso) {
    this.telCellPreavviso = telCellPreavviso;
  }

  public String getTemMaxEsecConfRichGgLav() {
    return temMaxEsecConfRichGgLav;
  }

  public void setTemMaxEsecConfRichGgLav(String temMaxEsecConfRichGgLav) {
    this.temMaxEsecConfRichGgLav = temMaxEsecConfRichGgLav;
  }

  public String getTempiAutorizzazioni() {
    return tempiAutorizzazioni;
  }

  public void setTempiAutorizzazioni(String tempiAutorizzazioni) {
    this.tempiAutorizzazioni = tempiAutorizzazioni;
  }

  public String getTempoEsecPrevGgLav() {
    return tempoEsecPrevGgLav;
  }

  public void setTempoEsecPrevGgLav(String tempoEsecPrevGgLav) {
    this.tempoEsecPrevGgLav = tempoEsecPrevGgLav;
  }

  public String getTempoMaxEsecuzGgLav() {
    return tempoMaxEsecuzGgLav;
  }

  public void setTempoMaxEsecuzGgLav(String tempoMaxEsecuzGgLav) {
    this.tempoMaxEsecuzGgLav = tempoMaxEsecuzGgLav;
  }

  public String getTensione() {
    return tensione;
  }

  public void setTensione(String tensione) {
    this.tensione = tensione;
  }

  public String getTensioneAlim() {
    return tensioneAlim;
  }

  public void setTensioneAlim(String tensioneAlim) {
    this.tensioneAlim = tensioneAlim;
  }

  public String getTensioneFase() {
    return tensioneFase;
  }

  public void setTensioneFase(String tensioneFase) {
    this.tensioneFase = tensioneFase;
  }

  public String getTestoPredeterminabilita() {
    return testoPredeterminabilita;
  }

  public void setTestoPredeterminabilita(String testoPredeterminabilita) {
    this.testoPredeterminabilita = testoPredeterminabilita;
  }

  public String getTipoapp() {
    return tipoapp;
  }

  public void setTipoapp(String tipoapp) {
    this.tipoapp = tipoapp;
  }

  public String getTipoConnessione() {
    return tipoConnessione;
  }

  public void setTipoConnessione(String tipoConnessione) {
    this.tipoConnessione = tipoConnessione;
  }

  public String getTipoContratto() {
    return tipoContratto;
  }

  public void setTipoContratto(String tipoContratto) {
    this.tipoContratto = tipoContratto;
  }

  public String getTipoInterv1() {
    return tipoInterv1;
  }

  public void setTipoInterv1(String tipoInterv1) {
    this.tipoInterv1 = tipoInterv1;
  }

  public String getTipologiaIntervento() {
    return tipologiaIntervento;
  }

  public void setTipologiaIntervento(String tipologiaIntervento) {
    this.tipologiaIntervento = tipologiaIntervento;
  }

  public String getTipologiaUtenza() {
    return tipologiaUtenza;
  }

  public void setTipologiaUtenza(String tipologiaUtenza) {
    this.tipologiaUtenza = tipologiaUtenza;
  }

  public String getTipologiaVoltura() {
    return tipologiaVoltura;
  }

  public void setTipologiaVoltura(String tipologiaVoltura) {
    this.tipologiaVoltura = tipologiaVoltura;
  }

  public String getTipoServizio() {
    return tipoServizio;
  }

  public void setTipoServizio(String tipoServizio) {
    this.tipoServizio = tipoServizio;
  }

  public String getTrattamentoIva() {
    return trattamentoIva;
  }

  public void setTrattamentoIva(String trattamentoIva) {
    this.trattamentoIva = trattamentoIva;
  }

  public String getUsoEnergia() {
    return usoEnergia;
  }

  public void setUsoEnergia(String usoEnergia) {
    this.usoEnergia = usoEnergia;
  }

  public String getVerificaLab() {
    return verificaLab;
  }

  public void setVerificaLab(String verificaLab) {
    this.verificaLab = verificaLab;
  }

  public String getVerificaNonEseguita() {
    return verificaNonEseguita;
  }

  public void setVerificaNonEseguita(String verificaNonEseguita) {
    this.verificaNonEseguita = verificaNonEseguita;
  }

  public LavoriEleXCliente getClienteEsazione() {
    return clienteEsazione;
  }

  public void setClienteEsazione(LavoriEleXCliente clienteEsazione) {
    this.clienteEsazione = clienteEsazione;
  }

  public LavoriEleXCliente getClienteFinale() {
    return clienteFinale;
  }

  public void setClienteFinale(LavoriEleXCliente clienteFinale) {
    this.clienteFinale = clienteFinale;
  }

  public LavoriEleXCliente getClienteReferente() {
    return clienteReferente;
  }

  public void setClienteReferente(LavoriEleXCliente clienteReferente) {
    this.clienteReferente = clienteReferente;
  }

  public LavoriEleXCliente getClienteUscente() {
    return clienteUscente;
  }

  public void setClienteUscente(LavoriEleXCliente clienteUscente) {
    this.clienteUscente = clienteUscente;
  }

  public LavoriEleXIndirizzo getIndirizzoEsazione() {
    return indirizzoEsazione;
  }

  public void setIndirizzoEsazione(LavoriEleXIndirizzo indirizzoEsazione) {
    this.indirizzoEsazione = indirizzoEsazione;
  }

  public LavoriEleXIndirizzo getIndirizzoFornitura() {
    return indirizzoFornitura;
  }

  public void setIndirizzoFornitura(LavoriEleXIndirizzo indirizzoFornitura) {
    this.indirizzoFornitura = indirizzoFornitura;
  }

  public LavoriEleXIndirizzo getIndirizzoLegale() {
    return indirizzoLegale;
  }

  public void setIndirizzoLegale(LavoriEleXIndirizzo indirizzoLegale) {
    this.indirizzoLegale = indirizzoLegale;
  }

  public LavoriEleXMisuratore getMisuratore() {
    return misuratore;
  }

  public void setMisuratore(LavoriEleXMisuratore misuratore) {
    this.misuratore = misuratore;
  }

  public LavoriEleXMisuratore getMisuratoreCliente() {
    return misuratoreCliente;
  }

  public void setMisuratoreCliente(LavoriEleXMisuratore misuratoreCliente) {
    this.misuratoreCliente = misuratoreCliente;
  }

  public LavoriEleXMisuratore getMisuratoreRimosso() {
    return misuratoreRimosso;
  }

  public void setMisuratoreRimosso(LavoriEleXMisuratore misuratoreRimosso) {
    this.misuratoreRimosso = misuratoreRimosso;
  }

  public LavoriEleXMisuratore getMisuratoreVendita() {
    return misuratoreVendita;
  }

  public void setMisuratoreVendita(LavoriEleXMisuratore misuratoreVendita) {
    this.misuratoreVendita = misuratoreVendita;
  }

}
