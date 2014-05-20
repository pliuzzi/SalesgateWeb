package eu.a2a.salesgate.pratiche.gas.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.pratiche.gas.bean.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasExtension;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXCliente;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXIndirizzo;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXMisuratore;
import eu.a2a.salesgate.pratiche.gas.dao.LavoriGasDAO;
import eu.a2a.salesgate.pratiche.gas.dao.impl.handler.LavoriGasExtensionJdbcHandler;
import eu.a2a.salesgate.pratiche.gas.dao.impl.handler.LavoriGasJdbcHandler;
import eu.a2a.salesgate.pratiche.gas.dao.impl.handler.LavoriGasXClienteJdbcHandler;
import eu.a2a.salesgate.pratiche.gas.dao.impl.handler.LavoriGasXIndirizzoJdbcHandler;
import eu.a2a.salesgate.pratiche.gas.dao.impl.handler.LavoriGasXMisuratoreJdbcHandler;

@Repository("lavoriGasDaoSalesgate")
public class LavoriGasDAOImpl extends AbstractDAO implements LavoriGasDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro) {

    String sql = "select * from lavori_gas where 1=1";
    if (!StringUtils.isEmpty(filtro.getCodicePraticaSG())) {
      sql += " and id = '" + filtro.getCodicePraticaSG() + "'";
    }
    if (!StringUtils.isEmpty(filtro.getCodicePraticaUtente())) {
      sql += " and id_sistema_sorgente = '" + filtro.getCodicePraticaUtente() + "'";
    }
    if (!StringUtils.isEmpty(filtro.getCodicePraticaDistributore())) {
      sql += " and codice_pratica_dl = '" + filtro.getCodicePraticaDistributore() + "'";
    }
    if (!StringUtils.isEmpty(filtro.getCodiceDistributore())) {
      sql += " and fk_distributore = '" + filtro.getCodiceDistributore() + "'";
    }

    if (filtro.isErroreVerificaEsito()) {
      sql += " and verifica_esito = '1'";
    } else {
      sql += " and verifica_esito = '0'";
    }

    if (!StringUtils.isEmpty(filtro.getPdr())) {
      sql += " and pdr = '" + filtro.getPdr() + "'";
    }

    if (!StringUtils.isEmpty(filtro.getStato())) {
      sql += " and stato = '" + filtro.getStato() + "'";
    }

    jdbcTemplateSalesgate.setMaxRows(1000);
    List<LavoriGas> list = jdbcTemplateSalesgate.query(sql, new LavoriGasJdbcHandler().getRowMapper());
    return list;
  }

  @Override
  public LavoriGas cercaPerCodicePraticaSG(String codicePraticaSG) {
    String sqlLavoriGas = "select * from lavori_gas where id = '" + codicePraticaSG + "'";
    LavoriGas pratica = jdbcTemplateSalesgate.query(sqlLavoriGas, new LavoriGasJdbcHandler().getResultSetExtractor());
    return pratica;
  }

  @Override
  public LavoriGasExtension estraiLavoriGasExtension(String codicePraticaSG) {
    String sql = "select * from lavori_gas_extension where fk_lavori_gas = '" + codicePraticaSG + "'";
    LavoriGasExtension lavoriGasExtension = jdbcTemplateSalesgate.query(sql, new LavoriGasExtensionJdbcHandler().getResultSetExtractor());
    return lavoriGasExtension;
  }

  @Override
  public LavoriGasXMisuratore estraiLavoriGasXMisuratore(String id) {
    String sql = "select * from lavori_gas_x_misuratore where id = " + id;
    LavoriGasXMisuratore lavoriGasXMisuratore = jdbcTemplateSalesgate.query(sql, new LavoriGasXMisuratoreJdbcHandler().getResultSetExtractor());
    return lavoriGasXMisuratore;
  }

  @Override
  public LavoriGasXIndirizzo estraiLavoriGasXIndirizzo(String id) {
    String sql = "select * from lavori_gas_x_indirizzo where id = " + id;
    LavoriGasXIndirizzo lavoriGasXIndirizzo = jdbcTemplateSalesgate.query(sql, new LavoriGasXIndirizzoJdbcHandler().getResultSetExtractor());
    return lavoriGasXIndirizzo;
  }

  @Override
  public LavoriGasXCliente estraiLavoriGasXCliente(String id) {
    String sql = "select * from lavori_gas_x_cliente where id = " + id;
    LavoriGasXCliente lavoriGasXCliente = jdbcTemplateSalesgate.query(sql, new LavoriGasXClienteJdbcHandler().getResultSetExtractor());
    return lavoriGasXCliente;
  }

  @Override
  public void aggiornaLavoriGas(LavoriGas pratica) {

    LavoriGasExtension lavoriGasExtension = pratica.getLavoriGasExtension();

    int nRowsClienteUsc = aggiornaLavoriGasXCliente(pratica.getLavoriGasExtension().getClienteUsc());
    int nRowsFkClienteRef = aggiornaLavoriGasXCliente(pratica.getLavoriGasExtension().getClienteRef());
    int nRowsClienteFinale = aggiornaLavoriGasXCliente(pratica.getLavoriGasExtension().getClienteFinale());
    int nRowsClienteEsaz = aggiornaLavoriGasXCliente(pratica.getLavoriGasExtension().getClienteEsaz());
    int nRowsClienteBenef = aggiornaLavoriGasXCliente(pratica.getLavoriGasExtension().getClienteBenef());

    int nRowsIndirizzoRef = aggiornaLavoriGasXIndirizzo(pratica.getLavoriGasExtension().getIndirizzoRef());
    int nRowsIndirizzoLegale = aggiornaLavoriGasXIndirizzo(pratica.getLavoriGasExtension().getIndirizzoLegale());
    int nRowsIndirizzoImmob = aggiornaLavoriGasXIndirizzo(pratica.getLavoriGasExtension().getIndirizzoImmob());
    int nRowsIndirizzoForn = aggiornaLavoriGasXIndirizzo(pratica.getLavoriGasExtension().getIndirizzoForn());
    int nRowsIndirizzoEsaz = aggiornaLavoriGasXIndirizzo(pratica.getLavoriGasExtension().getIndirizzoEsaz());
    int nRowsIndirizzoBenef = aggiornaLavoriGasXIndirizzo(pratica.getLavoriGasExtension().getIndirizzoBenef());

    int nRowsMisuratore = aggiornaLavoriGasXMisuratore(pratica.getLavoriGasExtension().getMisuratore());
    int nRowsMisuratoreCliente = aggiornaLavoriGasXMisuratore(pratica.getLavoriGasExtension().getMisuratoreCliente());
    int nRowsMisuratoreRim = aggiornaLavoriGasXMisuratore(pratica.getLavoriGasExtension().getMisuratoreRim());
    int nRowsConvertitore = aggiornaLavoriGasXMisuratore(pratica.getLavoriGasExtension().getConvertitore());
    int nRowsConvertitoreCliente = aggiornaLavoriGasXMisuratore(pratica.getLavoriGasExtension().getConvertitoreCliente());
    int nRowsConvertitoreRim = aggiornaLavoriGasXMisuratore(pratica.getLavoriGasExtension().getConvertitoreRim());

    int nRowsLavoriGasExtension = aggiornaLavoriGasExtension(pratica.getLavoriGasExtension());

    pratica.setVerificaEsito(new BigDecimal(0));
    String sql = "UPDATE LAVORI_GAS " + " SET CODICE_PRATICA_DL = NVL(CODICE_PRATICA_DL, ?), STATO = ?, VERIFICA_ESITO = ?" + " WHERE ID = ?";
    jdbcTemplateSalesgate.update(sql, pratica.getCodicePraticaDl(), pratica.getStato(), pratica.getVerificaEsito(), pratica.getId());

  }

  private int aggiornaLavoriGasExtension(LavoriGasExtension lge) {
    String sql = "UPDATE LAVORI_GAS_EXTENSION SET CODICE_FLUSSO = ?, ID_RICHIESTA_CRM = ?, CODICE_CONTRATTO = ?, SEGMENTO_CLIENTE = ?, DATA_RIC_RICHIESTA = ?,"
        + " N_PDR_ATTIVI = ?, PDR_TIPO = ?, PDR_COD_PROF_PREL = ?, CODICE_REMI = ?, PRESSIONE_MISURA = ?, MAX_PREL_ORA = ?, MAX_POT_UTILIZZAZIONE = ?,"
        + " CATEGORIA_USO = ?, DESC_CATEGORIA_USO = ?, CLASSE_PRELIEVO = ?, DESC_CLASSE_PRELIEVO = ?, PREL_ANNUO_PREV = ?, POT_MAX_RICHIESTA = ?,"
        + " POT_TOT_INST = ?, RILEVANZA = ?, VALORE_LETTURA = ?, DATA_LETTURA = ?, TIPO_LETTURA = ?, VALORE_LETTURA_CL = ?, DATA_LETTURA_CL = ?,"
        + " TIPO_LETTURA_CL = ?, RECLAMO = ?, RIF_RECLAMO = ?, DATI_TECN_RIC = ?, RIF_QUESITI = ?, CONFERMA_CLIENTE = ?, NUMERO_RINVIO = ?,"
        + " DATA_VOLTURA = ?, VOLUMI_ANNUI = ?, COMPETENZA_LETTURA = ?, DESC_COMPETENZA_LETTURA = ?, PERIOD_LETTURA = ?, DESC_PERIOD_LETTURA = ?,"
        + " QUALIFICA_CLF = ?, DESC_QUALIFICA_CLF = ?, RESPONSABILE_IMPIANTO = ?, TELEFONO_RESP_IMPIANTO = ?, NOMINATIVO_UTF = ?, MOTIVAZIONE = ?,"
        + " DATA_ESEC_LAVORI = ?, INST_MIS = ?, INST_CONV = ?, IND_INVIO_DOCUM = ?, DATA_RICEZ_DOCUM = ?, DOCUM_MANCANTE = ?, RIF_COMUNIC_DOCUM = ?,"
        + " NOTE_AMM = ?, ESITO_DOCUM = ?, DATA_ACCERT_DOCUM = ?, DATA_SOSP = ?, RIF_COMUN_SOSP = ?, DATA_ANNULLAM = ?, CAUSALE_ANNULLAM = ?,"
        + " STIMA_TEMPI_VERIF = ?, NOME_RESP_VERIF = ?, COGNOME_RESP_VERIF = ?, TEL1_VERIF = ?, TEL2_VERIF = ?, VERIF_LAB_VERIF = ?, DATA_SOST_VERIF = ?,"
        + " CAUSALE_LAB_VERIF = ?, RIF_RESOCONTO_VERIF = ?, VALORE_LETT_VERIF = ?, DATA_LETT_VERIF = ?, TIPO_LETTVERIF = ?, COD_PREV_DL = ?, DATA_INVIO_PREV = ?,"
        + " DATA_RIC_PREV = ?, DATA_SCAD_PREV = ?, COSTO_PREV = ?, COSTO_LAB_PREV = ?, DATA_APPUNTAMENTO = ?, FASCIA_APPUNTAMENTO = ?, PIVA_SOCIETA_RICHIEDENTE = ?,"
        + " NUMERO_RICHIESTA_VENDITORE = ?, NUMERO_SERVIZIO_VENDITORE = ?, PDF_VENDITORE = ?, NOTE_ESITO = ?, ESITO = ?, NUMERO_RINVIO_DL = ?,"
        + " FLG_MODIFICA = ?, TIPOLOGIA_VOLTURA = ?, TIPOLOGIA_PDR = ?, ALIQUOTA_IVA = ?, IMPOSTE_AGEVOLATE = ?, GESTORE_CALORE = ?, NOTE = ?,"
        + " DATI_FATTURAZIONE = ?, EROG_SERV_ENER = ?, NUOVO_TENTATIVO = ?, APPUNTAMENTO = ?, TIPO_SERVIZIO = ?, RICH_VAR_DATI = ?, COD_RIN_SOS_MOR = ?,"
        + " COD_PREV_MOR = ?, NESS_INT_GIUD = ?, TIPOLOGIA_UTENZA = ?, MORTIS_CAUSA = ?, COD_TIP_PRE = ?, DESC_LAVORO = ?, POT_TOT_UTIL = ?, MESE_COMP = ?,"
        + " AUTO_LETT_FATT = ?, NUM_CHIAVE = ?, DA_ESEGUIRE_NON_PRIMA_DEL = ?, CODICE_APP = ?, POT_MAX_CLIENTE = ?, TIPO_ANOMALIA_CODIFICATA = ?,"
        + " ESITO_CONFERMA = ?, ESITO_VAL_AUTOLETTURA = ?, CAUSALE_NON_VAL_AUTOLETTURA = ?, DATA_SOPRALLUOGO = ?, IND_DISTR = ?, CLASSE_GRUPPO_MIS = ?,"
        + " ESITO_ACCERTAMENTO = ?, ESITO_BASE = ?, ESITO_PROCESSO = ?, DATA_ATTIVAZIONE = ?, DATA_INTERVENTO = ?, DATA_PREV_SOST = ?, DATA_TENTATIVO = ?,"
        + " DATA_VERIFICA = ?, CLASSE_NUOVO_MIS = ?, COD_PROFILO_PREL = ?, COD_PRAT_RIF = ?, ACC_MIS = ?, ANNO_FABB_MIS = ?, ANNO_FABB_GDM = ?,"
        + " ANNO_FAB_NUOVO_MIS = ?, ATTI_AUTORIZZATIVI = ?, IVA = ?, ADDEBITO_ONERI = ?, COEFF_CORR = ?, ON_OFF = ?, RIF_COM_L = ?, RIF_PREVENTIVO = ?,"
        + " RIF_RISP_QUESITI = ?, CAUSE_LAB = ?, DATA_ULTIMA_VER = ?, COSTO_LOCO = ?, DATA_MAX_CONF = ?, ALIMENT_BP = ?, DATA_APP = ?, AUTOLETTURA_FINESTRA = ?,"
        + " DATA_RICEZIONE = ?, LISTA_ALLEGATI = ?, DATA_FORN = ?, RESOCONTO = ?, NOTE_APP_VEND = ?, NOTE_APP_DISTR = ?, STATO_ELABORAZIONE = ?,"
        + " FLAG_NECESSARIO = ?, FLAG_VENDITORE = ?, GEST_APP = ?, TIPO_LAVORO = ?, FLAG_PRIMARIO = ?, DATA_CONFERMA_AMMISSIBILITA = ?, DATA_EVASIONE_DL = ?,"
        + " DATA_CONCLUSIONE_RICHIESTA = ?, DETTAGLIO_VERIFICA_ESITO = ?, STRUTTURA_DATI_TECNICI = ?, REVOCA_DISATTIVAZIONE = ?, SOSP_POT_PERICOLO = ?,"
        + " TIPOLOGIA_APPARTENENZA = ?, DATA_RICEZIONE_BONUS = ?, COD_ERRORE_AGENDA = ?, MOTIVAZIONE_AGENDA = ?,  STATO_AMMISIBILITA = ?, COD_PRAT_VN1 = ?" + " WHERE FK_LAVORI_GAS = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, lge.getCodiceFlusso(), lge.getIdRichiestaCrm(), lge.getCodiceContratto(), lge.getSegmentoCliente(), lge.getDataRicRichiesta(), lge.getNPdrAttivi(), lge.getPdrTipo(),
        lge.getPdrCodProfPrel(), lge.getCodiceRemi(), lge.getPressioneMisura(), lge.getMaxPrelOra(), lge.getMaxPotUtilizzazione(), lge.getCategoriaUso(), lge.getDescCategoriaUso(), lge.getClassePrelievo(), lge.getDescClassePrelievo(),
        lge.getPrelAnnuoPrev(), lge.getPotMaxRichiesta(), lge.getPotTotInst(), lge.getRilevanza(), lge.getValoreLettura(), lge.getDataLettura(), lge.getTipoLettura(), lge.getValoreLetturaCl(), lge.getDataLetturaCl(),
        lge.getTipoLetturaCl(), lge.getReclamo(), lge.getRifReclamo(), lge.getDatiTecnRic(), lge.getRifQuesiti(), lge.getConfermaCliente(), lge.getNumeroRinvio(), lge.getDataVoltura(), lge.getVolumiAnnui(), lge.getCompetenzaLettura(),
        lge.getDescCompetenzaLettura(), lge.getPeriodLettura(), lge.getDescPeriodLettura(), lge.getQualificaClf(), lge.getDescQualificaClf(), lge.getResponsabileImpianto(), lge.getTelefonoRespImpianto(), lge.getNominativoUtf(),
        lge.getMotivazione(), lge.getDataEsecLavori(), lge.getInstMis(), lge.getInstConv(), lge.getIndInvioDocum(), lge.getDataRicezDocum(), lge.getDocumMancante(), lge.getRifComunicDocum(), lge.getNoteAmm(), lge.getEsitoDocum(),
        lge.getDataAccertDocum(), lge.getDataSosp(), lge.getRifComunSosp(), lge.getDataAnnullam(), lge.getCausaleAnnullam(), lge.getStimaTempiVerif(), lge.getNomeRespVerif(), lge.getCognomeRespVerif(), lge.getTel1Verif(),
        lge.getTel2Verif(), lge.getVerifLabVerif(), lge.getDataSostVerif(), lge.getCausaleLabVerif(), lge.getRifResocontoVerif(), lge.getValoreLettVerif(), lge.getDataLettVerif(), lge.getTipoLettverif(), lge.getCodPrevDl(),
        lge.getDataInvioPrev(), lge.getDataRicPrev(), lge.getDataScadPrev(), lge.getCostoPrev(), lge.getCostoLabPrev(), lge.getDataAppuntamento(), lge.getFasciaAppuntamento(), lge.getPivaSocietaRichiedente(),
        lge.getNumeroRichiestaVenditore(), lge.getNumeroServizioVenditore(), lge.getPdfVenditore(), lge.getNoteEsito(), lge.getEsito(), lge.getNumeroRinvioDl(), lge.getFlgModifica(), lge.getTipologiaVoltura(), lge.getTipologiaPdr(),
        lge.getAliquotaIva(), lge.getImposteAgevolate(), lge.getGestoreCalore(), lge.getNote(), lge.getDatiFatturazione(), lge.getErogServEner(), lge.getNuovoTentativo(), lge.getAppuntamento(), lge.getTipoServizio(), lge.getRichVarDati(),
        lge.getCodRinSosMor(), lge.getCodPrevMor(), lge.getNessIntGiud(), lge.getTipologiaUtenza(), lge.getMortisCausa(), lge.getCodTipPre(), lge.getDescLavoro(), lge.getPotTotUtil(), lge.getMeseComp(), lge.getAutoLettFatt(),
        lge.getNumChiave(), lge.getDaEseguireNonPrimaDel(), lge.getCodiceApp(), lge.getPotMaxCliente(), lge.getTipoAnomaliaCodificata(), lge.getEsitoConferma(), lge.getEsitoValAutolettura(), lge.getCausaleNonValAutolettura(),
        lge.getDataSopralluogo(), lge.getIndDistr(), lge.getClasseGruppoMis(), lge.getEsitoAccertamento(), lge.getEsitoBase(), lge.getEsitoProcesso(), lge.getDataAttivazione(), lge.getDataIntervento(), lge.getDataPrevSost(),
        lge.getDataTentativo(), lge.getDataVerifica(), lge.getClasseNuovoMis(), lge.getCodProfiloPrel(), lge.getCodPratRif(), lge.getAccMis(), lge.getAnnoFabbMis(), lge.getAnnoFabbGdm(), lge.getAnnoFabNuovoMis(),
        lge.getAttiAutorizzativi(), lge.getIva(), lge.getAddebitoOneri(), lge.getCoeffCorr(), lge.getOnOff(), lge.getRifComL(), lge.getRifPreventivo(), lge.getRifRispQuesiti(), lge.getCauseLab(), lge.getDataUltimaVer(), lge.getCostoLoco(),
        lge.getDataMaxConf(), lge.getAlimentBp(), lge.getDataApp(), lge.getAutoletturaFinestra(), lge.getDataRicezione(), lge.getListaAllegati(), lge.getDataForn(), lge.getResoconto(), lge.getNoteAppVend(), lge.getNoteAppDistr(),
        lge.getStatoElaborazione(), lge.getFlagNecessario(), lge.getFlagVenditore(), lge.getGestApp(), lge.getTipoLavoro(), lge.getFlagPrimario(), lge.getDataConfermaAmmissibilita(), lge.getDataEvasioneDl(),
        lge.getDataConclusioneRichiesta(), lge.getDettaglioVerificaEsito(), lge.getStrutturaDatiTecnici(), lge.getRevocaDisattivazione(), lge.getSospPotPericolo(), lge.getTipologiaAppartenenza(), lge.getDataRicezioneBonus(),
        lge.getCodErroreAgenda(), lge.getMotivazioneAgenda(), lge.getStatoAmmisibilita(), lge.getCodPratVn1(), lge.getFkLavoriGas());
    return nRows;
  }

  private int aggiornaLavoriGasXCliente(LavoriGasXCliente c) {
    // if (lavoriGasXCliente.getId().intValue() == 0)
    // return 0; // se � quello di default significa che non deve essere
    // modificato
    String sql = "UPDATE LAVORI_GAS_X_CLIENTE SET NOME = ?, COGNOME  = ?, RAGIONE_SOCIALE = ?, PIVA = ?, COD_FIS = ?, TELEFONO = ?, " + " CELLULARE = ?, EMAIL = ?, FAX  = ? WHERE  ID = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, c.getNome(), c.getCognome(), c.getRagioneSociale(), c.getPiva(), c.getCodFis(), c.getTelefono(), c.getCellulare(), c.getEmail(), c.getFax(), c.getId());
    return nRows;

  }

  private int aggiornaLavoriGasXIndirizzo(LavoriGasXIndirizzo i) {
    if (i.getId().equals("0")) {
      return 0; // se � quello di default significa che non deve essere
    }
    // modificato
    String sql = "UPDATE LAVORI_GAS_X_INDIRIZZO SET TOPONIMO = ?, VIA = ?, CIVICO= ?, SCALA = ?, PIANO = ?, INTERNO  = ?, " + "CAP = ?, ISTAT = ?, COMUNE = ?, PROVINCIA = ?, NAZIONE = ?, PRESSO = ? WHERE ID = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, i.getToponimo(), i.getVia(), i.getCivico(), i.getScala(), i.getPiano(), i.getInterno(), i.getCap(), i.getIstat(), i.getComune(), i.getProvincia(), i.getNazione(), i.getPresso(), i.getId());
    return nRows;
  }

  private int aggiornaLavoriGasXMisuratore(LavoriGasXMisuratore m) {
    if (m.getId().equals("0")) {
      return 0; // se � quello di default significa che non deve essere
    }
    // modificato
    String sql = "UPDATE LAVORI_GAS_X_MISURATORE SET MATRICOLA = ?, VALORE_LETTURA = ?, DATA_LETTURA = ?, TIPO_LETTURA = ?, "
        + " SEGN = ?, SOSTITUZIONE = ?, RIMOZIONE = ?, N_CIFRE = ?, STATO = ?, DATA_AUTOLETTURA = ?, VALORE_AUTOLETTURA = ?, " + " DATA_DISATTIVAZIONE = ? WHERE ID = ?";
    int nRows = jdbcTemplateSalesgate.update(sql, m.getMatricola(), m.getValoreLettura(), m.getDataAutolettura(), m.getTipoLettura(), m.getSegn(), m.getSostituzione(), m.getRimozione(), m.getNCifre(), m.getStato(), m.getDataAutolettura(),
        m.getValoreAutolettura(), m.getDataDisattivazione(), m.getId());
    return nRows;
  }

}