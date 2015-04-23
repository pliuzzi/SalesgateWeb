package eu.a2a.salesgate.pratiche.ele.service.impl;

import java.rmi.RemoteException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.inbound.core.ele.bind.GecoInboundCoreELERequestDocument;
import eu.a2a.salesgate.inbound.core.ele.bind.GecoInboundCoreELERequestDocument.GecoInboundCoreELERequest;
import eu.a2a.salesgate.inbound.core.ele.bind.GecoInboundCoreELEResponseDocument;
import eu.a2a.salesgate.inbound.core.ele.client.GecoInboundCoreELE_ServiceStub;
import eu.a2a.salesgate.inbound.core.ele.client.InviaEsitoELEFaultMsg;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.ele.bean.FiltroPraticheEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleExtension;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXCliente;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXIndirizzo;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXMisuratore;
import eu.a2a.salesgate.pratiche.ele.dao.LavoriEleDAO;
import eu.a2a.salesgate.pratiche.ele.service.LavoriEleService;
import eu.a2a.salesgate.service.base.AbstractService;
import eu.a2a.salesgate.utility.StringUtils;
import eu.a2a.salesgate.utility.dao.UtilityDAO;

@Service
@Transactional("transactionManagerSalesgate")
public class LavoriEleServiceImpl extends AbstractService implements LavoriEleService {

  @Autowired
  private LavoriEleDAO lavoriEleDaoSalesgate;

  @Autowired
  private DistributoreDAO distributoreDaoSalesgate;

  @Autowired
  private UtilityDAO utilityDaoSalesgate;

  @Autowired
  private GecoInboundCoreELE_ServiceStub gecoInboundCoreEleClient;

  @Override
  public List<LavoriEle> cercaPerFiltro(FiltroPraticheEle filtro) {

    return lavoriEleDaoSalesgate.cercaPerFiltro(filtro);
  }

  @Override
  public LavoriEle cercaPraticaPerCodiceSG(String codicePraticaSG) {

    LavoriEle pratica = lavoriEleDaoSalesgate.cercaPerCodicePraticaSG(codicePraticaSG);
    LavoriEleExtension lavoriEleExtension = estraiLavoriEleExtension(codicePraticaSG);
    Distributore distributore = distributoreDaoSalesgate.getDistributore(pratica.getFkDistributore());
    AnagAmmissibilita anagAmmissibilita;
    if (!org.springframework.util.StringUtils.isEmpty(pratica.getFkAmmissibilita())) {
      anagAmmissibilita = utilityDaoSalesgate.getAnagAmmissibilita(pratica.getFkAmmissibilita());
    } else {
      anagAmmissibilita = new AnagAmmissibilita();
    }
    AvanzamentoFlussi avanzamentoFlussi = utilityDaoSalesgate.estraiAvanzamentoFlussi(pratica.getId());

    pratica.setLavoriEleExtension(lavoriEleExtension);
    pratica.setDistributore(distributore);
    pratica.setAnagAmmissibilita(anagAmmissibilita);
    pratica.setAvanzamentoFlussi(avanzamentoFlussi);

    return pratica;
  }

  private LavoriEleExtension estraiLavoriEleExtension(String codicePraticaSG) {

    LavoriEleExtension lavoriEleExtension = lavoriEleDaoSalesgate.estraiLavoriEleExtension(codicePraticaSG);

    LavoriEleXMisuratore misuratore = lavoriEleDaoSalesgate.estraiLavoriEleXMisuratore(lavoriEleExtension.getFkMisuratore().toPlainString());
    LavoriEleXMisuratore misuratoreCliente = lavoriEleDaoSalesgate.estraiLavoriEleXMisuratore(lavoriEleExtension.getFkMisuratoreCliente().toPlainString());
    LavoriEleXMisuratore misuratoreRim = lavoriEleDaoSalesgate.estraiLavoriEleXMisuratore(lavoriEleExtension.getFkMisuratoreRimosso().toPlainString());
    LavoriEleXMisuratore misuratoreVen = lavoriEleDaoSalesgate.estraiLavoriEleXMisuratore(lavoriEleExtension.getFkMisuratoreVendita().toPlainString());

    lavoriEleExtension.setMisuratore(misuratore);
    lavoriEleExtension.setMisuratoreCliente(misuratoreCliente);
    lavoriEleExtension.setMisuratoreRimosso(misuratoreRim);
    lavoriEleExtension.setMisuratoreVendita(misuratoreVen);

    LavoriEleXCliente clienteUsc = lavoriEleDaoSalesgate.estraiLavoriEleXCliente(lavoriEleExtension.getFkClienteUscente().toPlainString());
    LavoriEleXCliente clienteFinale = lavoriEleDaoSalesgate.estraiLavoriEleXCliente(lavoriEleExtension.getFkClienteFinale().toPlainString());
    LavoriEleXCliente clienteRef = lavoriEleDaoSalesgate.estraiLavoriEleXCliente(lavoriEleExtension.getFkClienteRef().toPlainString());
    LavoriEleXCliente clienteEsaz = lavoriEleDaoSalesgate.estraiLavoriEleXCliente(lavoriEleExtension.getFkClienteEsazione().toPlainString());

    lavoriEleExtension.setClienteUscente(clienteUsc);
    lavoriEleExtension.setClienteFinale(clienteFinale);
    lavoriEleExtension.setClienteReferente(clienteRef);
    lavoriEleExtension.setClienteEsazione(clienteEsaz);

    LavoriEleXIndirizzo indirizzoForn = lavoriEleDaoSalesgate.estraiLavoriEleXIndirizzo(lavoriEleExtension.getFkIndirizzoFornitura().toPlainString());
    LavoriEleXIndirizzo indirizzoEsaz = lavoriEleDaoSalesgate.estraiLavoriEleXIndirizzo(lavoriEleExtension.getFkIndirizzoEsazione().toPlainString());
    LavoriEleXIndirizzo indirizzoLegale = lavoriEleDaoSalesgate.estraiLavoriEleXIndirizzo(lavoriEleExtension.getFkIndirizzoLegale().toPlainString());

    lavoriEleExtension.setIndirizzoEsazione(indirizzoEsaz);
    lavoriEleExtension.setIndirizzoFornitura(indirizzoForn);
    lavoriEleExtension.setIndirizzoLegale(indirizzoLegale);

    return lavoriEleExtension;

  }

  @Override
  public GenericResponse savePratica(LavoriEle pratica) {

    return savePratica(pratica, false);

  }

  @Override
  public GenericResponse savePratica(LavoriEle pratica, boolean inviaMittente) {

    /*
     * pratica.getLavoriEleExtension().setDettaglioVerificaEsito("");
     * pratica.setCodFlusso(pratica.getFlussoAcc());
     * pratica.getLavoriEleExtension().setCodiceFlusso(pratica.getFlussoAcc());
     * if (StringUtils.isEmpty(pratica.getLavoriEleExtension().getEsito())) { //
     * pratica.setStato("EVASA OK DL"); } else { if
     * (pratica.getLavoriEleExtension().getEsito().equals("0")) {
     * pratica.setStato("EVASA KO DL"); } else {
     * pratica.setStato("EVASA OK DL"); } } //
     * lavoriEleDaoSalesgate.aggiornaLavoriEle(pratica);
     * 
     * if (inviaMittente) {
     * pratica.getAvanzamentoFlussi().setCodFlusso(pratica.getFlussoAcc());
     * pratica.getAvanzamentoFlussi().setStato("RICEVUTO_DL");
     * pratica.getAvanzamentoFlussi().setFlagStato("I");
     * utilityDaoSalesgate.aggiornaAvanzamentoFlussi
     * (pratica.getAvanzamentoFlussi().getCodFlusso(),
     * pratica.getAvanzamentoFlussi().getStato(),
     * pratica.getAvanzamentoFlussi().getFlagStato(), pratica.getId()); }
     */

    GecoInboundCoreELERequestDocument requestDocument = GecoInboundCoreELERequestDocument.Factory.newInstance();
    GenericResponse response = null;

    GecoInboundCoreELERequest request = requestDocument.addNewGecoInboundCoreELERequest();
    request.setACCERTVALORINONCORRETTI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getAccertValoriNonCorretti()));
    request.setACCETTAZIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getAccettazione()));
    request.setACQUISTOCONSENSO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getAcquistoConsenso()));
    request.setADDEBITOONERI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getAddebitoOneri()));
    request.setATTIAUTORIZZATIVI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getAttiAutorizzativi()));
    request.setCANALESG(StringUtils.spaceIfNull(pratica.getCanaleSg()));
    request.setCASENUMBER(StringUtils.spaceIfNull(pratica.getCaseNumber()));
    request.setCAUSALENONVALAUTOLETTURA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getCausaleNonValAutolettura()));

    request.setCLIENTEESAZCELL(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getCellulare()));
    request.setCLIENTEESAZCF(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getCodFis()));
    request.setCLIENTEESAZCOGNOME(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getCognome()));
    request.setCLIENTEESAZEMAIL(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getEmail()));
    request.setCLIENTEESAZFAX(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getFax()));
    request.setCLIENTEESAZNOME(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getNome()));
    request.setCLIENTEESAZPIVA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getPiva()));
    request.setCLIENTEESAZRAGSOC(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getRagioneSociale()));
    request.setCLIENTEESAZTELEFONO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteEsazione().getTelefono()));

    request.setCLIENTEFINALECELL(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getCellulare()));
    request.setCLIENTEFINALECF(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getCodFis()));
    request.setCLIENTEFINALECOGNOME(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getCognome()));
    request.setCLIENTEFINALEEMAIL(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getEmail()));
    request.setCLIENTEFINALEFAX(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getFax()));
    request.setCLIENTEFINALENOME(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getNome()));
    request.setCLIENTEFINALEPIVA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getPiva()));
    request.setCLIENTEFINALERAGSOC(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getRagioneSociale()));
    request.setCLIENTEFINALETELEFONO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteFinale().getTelefono()));

    request.setCLIENTEREFCELL(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getCellulare()));
    request.setCLIENTEREFCF(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getCodFis()));
    request.setCLIENTEREFCOGNOME(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getCognome()));
    request.setCLIENTEREFEMAIL(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getEmail()));
    request.setCLIENTEREFFAX(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getFax()));
    request.setCLIENTEREFNOME(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getNome()));
    request.setCLIENTEREFPIVA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getPiva()));
    request.setCLIENTEREFRAGSOC(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getRagioneSociale()));
    request.setCLIENTEREFTELEFONO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getClienteReferente().getTelefono()));

    request.setCODCAUSALE(StringUtils.spaceIfNull(pratica.getAnagAmmissibilita().getCodice()));
    request.setCODCONTRDISP("");
    request.setCODFLUSSO(StringUtils.spaceIfNull(pratica.getFlussoAcc()));
    request.setCODPOD(StringUtils.spaceIfNull(pratica.getPod()));
    request.setCODPRATDISTR(StringUtils.spaceIfNull(pratica.getCodicePraticaDl()));
    request.setCODPRATSG(StringUtils.spaceIfNull(pratica.getId()));
    request.setCODPRATUTENTE(StringUtils.spaceIfNull(pratica.getIdSistemaSorgente()));
    request.setCODPREVDISTR(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getCodicePrevDl()));
    request.setCODSERVIZIO(StringUtils.spaceIfNull(pratica.getCodServizio()));
    request.setCODICEAUTHORITYDISTRIBUTORE(StringUtils.spaceIfNull(pratica.getDistributore().getId()));
    request.setDATAACCET(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getDataAccet()));
    request.setDATADISATTIVAZIONE("");
    request.setDATAESECLAVORI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataEsecLavori()));
    // request.setDATALETTURA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getData));
    request.setDATAPREVISTARIPRISTINO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataPrevistaRipristino()));
    request.setDATARIATTRIPR(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataRiattRipr()));
    request.setDATATENTATIVO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataTentativo()));
    request.setDATAVERIFICA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataVerifica()));
    request.setDISALIMENTABILE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getDisalimentabile()));
    request.setESITO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getEsito().toPlainString()));
    // request.setESITOVALAUTOLETTURA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getEsitoValAutolettura()));
    request.setIMMEDIATASOSTITUZIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getImmediataSostituzione()));

    request.setINDESAZIONECAP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getCap()));
    request.setINDESAZIONECIVICO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getCivico()));
    request.setINDESAZIONECOMUNE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getComune()));
    request.setINDESAZIONEINTERNO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getInterno()));
    request.setINDESAZIONEISTAT(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getIstat()));
    request.setINDESAZIONENAZIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getNazione()));
    request.setINDESAZIONEPIANO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getPiano()));
    request.setINDESAZIONEPRESSO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getPresso()));
    request.setINDESAZIONEPROVINCIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getProvincia()));
    request.setINDESAZIONESCALA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getScala()));
    request.setINDESAZIONETOPONIMO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getToponimo()));
    request.setINDESAZIONEVIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoEsazione().getToponimo()));

    request.setINDFORNITURACAP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getCap()));
    request.setINDFORNITURACIVICO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getCivico()));
    request.setINDFORNITURACOMUNE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getComune()));
    request.setINDFORNITURAINTERNO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getInterno()));
    request.setINDFORNITURAISTAT(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getIstat()));
    request.setINDFORNITURANAZIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getNazione()));
    request.setINDFORNITURAPIANO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getPiano()));
    request.setINDFORNITURAPRESSO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getPresso()));
    request.setINDFORNITURAPROVINCIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getProvincia()));
    request.setINDFORNITURASCALA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getScala()));
    request.setINDFORNITURATOPONIMO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getToponimo()));
    request.setINDFORNITURAVIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoFornitura().getVia()));

    request.setINDSEDELEGALECAP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getCap()));
    request.setINDSEDELEGALECIVICO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getCivico()));
    request.setINDSEDELEGALECOMUNE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getComune()));
    request.setINDSEDELEGALEINTERNO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getInterno()));
    request.setINDSEDELEGALEISTAT(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getIstat()));
    request.setINDSEDELEGALENAZIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getNazione()));
    request.setINDSEDELEGALEPIANO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getPiano()));
    request.setINDSEDELEGALEPRESSO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getPresso()));
    request.setINDSEDELEGALEPROVINCIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getProvincia()));
    request.setINDSEDELEGALESCALA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getScala()));
    request.setINDSEDELEGALETOPONIMO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getToponimo()));
    request.setINDSEDELEGALEVIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndirizzoLegale().getVia()));

    request.setLETTATT1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaAttivaF1()));
    request.setLETTATT2(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaAttivaF2()));
    request.setLETTATT3(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaAttivaF3()));

    request.setLETTPOT1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaPotenzaF1()));
    request.setLETTPOT2(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaPotenzaF2()));
    request.setLETTPOT3(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaPotenzaF3()));

    request.setLETTREATT1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaReattivaF1()));
    request.setLETTREATT2(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaReattivaF2()));
    request.setLETTREATT3(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getLetturaReattivaF3()));

    // request.setMALFUNZIONAMENTOMIS(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getM));
    request.setMATRMISATTIVA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getMatricolaMisAttiva()));
    request.setMATRMISPOTENZA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getMatricolaMisPotenza()));
    request.setMATRMISREATTIVA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getMatricolaMisReattiva()));
    request.setMESECOMP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMeseComp()));
    request.setMISURATOREELETTRONICO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratoreRimosso().getMisuratoreElettronico()));
    // request.setMITTENTE(arg0));
    request.setMOTIVAZIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMotivazione()));
    request.setNOTE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getNoteEsito()));
    request.setNUMEROPUNTI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getNumeroDeiPunti()));
    request.setONOFF(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getOnOff()));
    request.setPIVADISTRIBUTORE(StringUtils.spaceIfNull(pratica.getDistributore().getPiva()));
    request.setPIVAUTENTE(StringUtils.spaceIfNull(pratica.getPivaUtente()));
    request.setTELEGESTITO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getPresenzaClienteNoTele()));

    request.setRIFRESOCONTO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getRifResoconto()));
    request.setRIFRISPQUESITI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getRifQuesiti()));
    request.setSETTOREMERCEOLOGICO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getSettoreMerceologico()));
    request.setSTRUTTURADATITECNICI(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getStrutturaDatiTecnici()));
    request.setTENSIONEALIM(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTensioneAlim()));
    request.setTIPOLOGIAUTENZA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTipologiaUtenza()));
    // request.setVERIFICAAMM());
    request.setVERIFICANONESEGUITA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getVerificaNonEseguita()));
    request.setESITOBASE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getEsitoBase()));
    request.setESITOAPP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getEsitoapp()));
    request.setDATAINTERVENTO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataIntervento()));
    request.setTIPOLETTURA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getTipologiaLettura()));
    
    request.setMISURATOREELETTRONICONEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getMisuratoreElettronico()));
    request.setMATRMISATTIVANEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getMatricolaMisAttiva()));
    request.setMATRMISPOTENZANEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getMatricolaMisPotenza()));
    request.setMATRMISREATTIVANEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getMatricolaMisReattiva()));
    request.setLETTATT1NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaAttivaF1()));
    request.setLETTATT2NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaAttivaF2()));
    request.setLETTATT3NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaAttivaF3()));
    request.setLETTPOT1NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaPotenzaF1()));
    request.setLETTPOT2NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaPotenzaF2()));
    request.setLETTPOT3NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaPotenzaF3()));
    request.setLETTREATT1NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaReattivaF1()));
    request.setLETTREATT2NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaReattivaF2()));
    request.setLETTREATT3NEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getLetturaReattivaF3()));

    request.setTIPOLOGIAMISURATORENEW(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMisuratore().getTipologiaMisuratore()));
    request.setSOSTMIS(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getSostMis()));
    request.setPOTENZADISP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getPotDispAttuale()));
    request.setPOTENZAFRANCHIGIA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getPotFranchigia()));
    request.setPOTENZAIMPEGNATA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getPotImpegnata()));
    request.setFASE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFase()));
    request.setTENSIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTensione()));
    request.setTENSIONEFASE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTensioneFase()));
    request.setTIPOLOGIALAVORO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTipologiaIntervento()));
    request.setINTERVENTOCOMPLESSO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIntervento()));
    request.setSTIMA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getStima()));
    request.setPREVENTIVO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getPreventivo()));
    request.setDATAAPP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getDataapp()));
    request.setTIPOAPP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTipoapp()));
    request.setCAUSALEAPP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getCausaleApp()));
    request.setCAUSALEINTERVENTOCOMPLESSO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getCausaleIntComplesso()));
    request.setCODICEE02(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getCodicee02()));
    // request.setCODINAMM(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().get));
    request.setINDDISTR(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIndDistr()));
    request.setIDMIS1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIdMis1()));
    request.setIDMIS2(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getIdMis2()));
    request.setMESECOMP1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getMeseComp1()));
    request.setREVOCADISATT(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getRevocaDisatt()));
    request.setSOSPPOTPER(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getSospPotPer()));
    request.setOPZIONETARF1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getOpzioneTariffaria()));
    request.setOPZIONETARF2(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getOpzioneTariffaria2()));
    request.setCODPRATRIF(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getCodPratRif()));
    request.setDATASOSPENSIONE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFormattedDataSospensione()));
    request.setVERIFICALAB(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getVerificaLab()));
    request.setGESTAPP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getGestApp()));
    request.setFLAGNECESSARIO(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFlagNecessario()));
    request.setFLAGVENDITORE(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getFlagVenditore()));
    // request.setNOMERESP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getn));
    // request.setTELEFONORESP(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().get));
    request.setTIPOINTERV1(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getTipoInterv1()));
    request.setNUOVOCODRINTRACCIABILITA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getNuovoCodRintr()));
    request.setSTATOAMMISSIBILITA(StringUtils.spaceIfNull(pratica.getLavoriEleExtension().getStatoAmmisibilita()));

    try {

      GecoInboundCoreELEResponseDocument responseDocument = gecoInboundCoreEleClient.inviaEsitoELE(requestDocument);

      logger.debug(responseDocument);

      if (responseDocument.getGecoInboundCoreELEResponse().getESITO().equals("OK")) {
        if (inviaMittente) {
          utilityDaoSalesgate.aggiornaAvanzamentoFlussi(pratica.getFlussoAcc(), "RICEVUTO_DL", "I", pratica.getId());
        }
        response = GenericResponse.createOkResponse("Pratica salvata" + (inviaMittente ? " e inviata al sistema mittente " : " ") + "correttamente");
      } else {
        response = GenericResponse.createKoResponse("Pratica NON salvata, contattare il supporto per risolvere il problema");
      }

    } catch (RemoteException e) {
      response = GenericResponse.createErrorResponse(e.getLocalizedMessage(), e);
    } catch (InviaEsitoELEFaultMsg e) {
      response = GenericResponse.createErrorResponse(e.getFaultMessage().getGecoInboundCoreELEFault().getCodice() + " - " + e.getFaultMessage().getGecoInboundCoreELEFault().getMessaggio(), e);
    }

    return response;
  }
}
