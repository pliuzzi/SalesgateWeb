package eu.a2a.salesgate.pratiche.service.impl;

import java.rmi.RemoteException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.inbound.core.ele.bind.GecoInboundCoreELERequestDocument;
import eu.a2a.salesgate.inbound.core.ele.bind.GecoInboundCoreELERequestDocument.GecoInboundCoreELERequest;
import eu.a2a.salesgate.inbound.core.ele.bind.GecoInboundCoreELEResponseDocument;
import eu.a2a.salesgate.inbound.core.ele.client.GecoInboundCoreELE_ServiceStub;
import eu.a2a.salesgate.inbound.core.ele.client.InviaEsitoELEFaultMsg;
import eu.a2a.salesgate.inbound.core.gas.bind.GecoInboundCoreGASRequestDocument;
import eu.a2a.salesgate.inbound.core.gas.bind.GecoInboundCoreGASRequestDocument.GecoInboundCoreGASRequest;
import eu.a2a.salesgate.inbound.core.gas.bind.GecoInboundCoreGASResponseDocument;
import eu.a2a.salesgate.inbound.core.gas.client.GecoInboundCoreGAS_ServiceStub;
import eu.a2a.salesgate.inbound.core.gas.client.InviaEsitoGASFaultMsg;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.Tracking;
import eu.a2a.salesgate.pratiche.ele.dao.LavoriEleDAO;
import eu.a2a.salesgate.pratiche.gas.dao.LavoriGasDAO;
import eu.a2a.salesgate.pratiche.service.AmmissibilitaService;
import eu.a2a.salesgate.service.base.AbstractService;
import eu.a2a.salesgate.utility.dao.UtilityDAO;

@Service("ammissibilitaServiceSalesgate")
public class AmmissibilitaServiceImpl extends AbstractService implements AmmissibilitaService {

  @Autowired
  LavoriEleDAO lavoriEleDaoSalesgate;

  @Autowired
  LavoriGasDAO lavoriGasDaoSalesgate;

  @Autowired
  private DistributoreDAO distributoreDaoSalesgate;

  @Autowired
  private UtilityDAO utilityDaoSalesgate;

  @Autowired
  GecoInboundCoreGAS_ServiceStub gecoInboundCoreGasClient;

  @Autowired
  GecoInboundCoreELE_ServiceStub gecoInboundCoreEleClient;

  @Override
  public Tracking getTracking(String id) {
    Tracking tracking = lavoriEleDaoSalesgate.cercaPerCodicePraticaSG(id);
    if (tracking == null) {
      tracking = lavoriGasDaoSalesgate.cercaPerCodicePraticaSG(id);
    }
    Distributore distributore = distributoreDaoSalesgate.getDistributore(tracking.getFkDistributore());
    AnagAmmissibilita anagAmmissibilita;
    if (!StringUtils.isEmpty(tracking.getFkAmmissibilita())) {
      anagAmmissibilita = utilityDaoSalesgate.getAnagAmmissibilita(tracking.getFkAmmissibilita());
    } else {
      anagAmmissibilita = new AnagAmmissibilita();
    }
    tracking.setDistributore(distributore);
    tracking.setAnagAmmissibilita(anagAmmissibilita);
    return tracking;
  }

  @Override
  public GenericResponse aggiornaAmmissibilita(Tracking tracking) {

    try {

      GenericResponse response;

      if (tracking.getUtility().equals("GAS")) {
        GecoInboundCoreGASRequestDocument soapRequestDoc = GecoInboundCoreGASRequestDocument.Factory.newInstance();

        AnagAmmissibilita am = utilityDaoSalesgate.getAllAnagAmmissibilita(tracking.getAnagAmmissibilita().getId(), null).get(0);
        String flussoDaInviare = tracking.getCodFlusso().equals("0052") ? "0101" : "0100";
        GecoInboundCoreGASRequest soapRequest = soapRequestDoc.addNewGecoInboundCoreGASRequest();
        soapRequest.setPIVADISTRIBUTORE(tracking.getDistributore().getPiva());
        soapRequest.setCODSERVIZIO(tracking.getCodServizio());
        soapRequest.setCODFLUSSO(flussoDaInviare);
        soapRequest.setCODPRATSG(tracking.getId());
        soapRequest.setCODPRATUTENTE(tracking.getIdSistemaSorgente());
        soapRequest.setCODPRATDISTR(tracking.getCodicePraticaDl());
        soapRequest.setVERIFICAAMM(am.getEsito() + "");
        soapRequest.setMOTIVAZIONE(am.getDescription());
        soapRequest.setCODCAUSALE(am.getCodice());

        GecoInboundCoreGASResponseDocument soapResponse = gecoInboundCoreGasClient.inviaEsitoGAS(soapRequestDoc);

        utilityDaoSalesgate.aggiornaAvanzamentoFlussi(flussoDaInviare, "RICEVUTO_DL", "I", tracking.getId());

        logger.debug(soapResponse);
        if (soapResponse.getGecoInboundCoreGASResponse().getESITO().equals(GenericResponse.OK)) {
          response = GenericResponse.createGenericResponse(GenericResponse.OK, "Pratica salvata correttamente");
        } else if (soapResponse.getGecoInboundCoreGASResponse().getESITO().equals(GenericResponse.KO)) {
          response = GenericResponse.createGenericResponse(GenericResponse.KO, soapResponse.getGecoInboundCoreGASResponse().getMOTIVAZIONE());
        } else {
          response = GenericResponse.createGenericResponse(GenericResponse.ERROR, "Risposta non corretta da Salesgate --> " + soapResponse.getGecoInboundCoreGASResponse().getMOTIVAZIONE() + " contattare il supporto");
        }
      } else {
        GecoInboundCoreELERequestDocument soapRequestDoc = GecoInboundCoreELERequestDocument.Factory.newInstance();

        AnagAmmissibilita am = utilityDaoSalesgate.getAllAnagAmmissibilita(tracking.getAnagAmmissibilita().getId(), null).get(0);
        String flussoDaInviare = "E100";
        GecoInboundCoreELERequest soapRequest = soapRequestDoc.addNewGecoInboundCoreELERequest();
        soapRequest.setPIVADISTRIBUTORE(tracking.getDistributore().getPiva());
        soapRequest.setCODSERVIZIO(tracking.getCodServizio());
        soapRequest.setCODFLUSSO(flussoDaInviare);
        soapRequest.setCODPRATSG(tracking.getId());
        soapRequest.setCODPRATUTENTE(tracking.getIdSistemaSorgente());
        soapRequest.setCODPRATDISTR(tracking.getCodicePraticaDl());
        soapRequest.setVERIFICAAMM(am.getEsito() + "");
        soapRequest.setMOTIVAZIONE(am.getDescription());
        soapRequest.setCODCAUSALE(am.getCodice());

        GecoInboundCoreELEResponseDocument soapResponse = gecoInboundCoreEleClient.inviaEsitoELE(soapRequestDoc);

        utilityDaoSalesgate.aggiornaAvanzamentoFlussi(flussoDaInviare, "RICEVUTO_DL", "I", tracking.getId());

        logger.debug(soapResponse);
        if (soapResponse.getGecoInboundCoreELEResponse().getESITO().equals(GenericResponse.OK)) {
          response = GenericResponse.createGenericResponse(GenericResponse.OK, "Pratica salvata correttamente");
        } else if (soapResponse.getGecoInboundCoreELEResponse().getESITO().equals(GenericResponse.KO)) {
          response = GenericResponse.createGenericResponse(GenericResponse.KO, soapResponse.getGecoInboundCoreELEResponse().getMOTIVAZIONE());
        } else {
          response = GenericResponse.createGenericResponse(GenericResponse.ERROR, "Risposta non corretta da Salesgate --> " + soapResponse.getGecoInboundCoreELEResponse().getMOTIVAZIONE() + " contattare il supporto");
        }
      }
      return response;
    } catch (RemoteException | InviaEsitoELEFaultMsg | InviaEsitoGASFaultMsg e) {

      return GenericResponse.createGenericResponse(GenericResponse.ERROR, e.getMessage(), e);

    }
  }
}
