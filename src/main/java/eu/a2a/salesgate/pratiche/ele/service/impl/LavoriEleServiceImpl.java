package eu.a2a.salesgate.pratiche.ele.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
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
import eu.a2a.salesgate.utility.dao.UtilityDAO;

@Service
@Transactional("transactionManagerSalesgate")
public class LavoriEleServiceImpl implements LavoriEleService {

  @Autowired
  private LavoriEleDAO lavoriEleDaoSalesgate;

  @Autowired
  private DistributoreDAO distributoreDaoSalesgate;

  @Autowired
  private UtilityDAO utilityDaoSalesgate;

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
    if (!StringUtils.isEmpty(pratica.getFkAmmissibilita())) {
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

    pratica.getLavoriEleExtension().setDettaglioVerificaEsito("");
    pratica.setCodFlusso(pratica.getFlussoAcc());
    pratica.getLavoriEleExtension().setCodiceFlusso(pratica.getFlussoAcc());
    if (StringUtils.isEmpty(pratica.getLavoriEleExtension().getEsito())) {
      // pratica.setStato("EVASA OK DL");
    } else {
      if (pratica.getLavoriEleExtension().getEsito().equals("0")) {
        pratica.setStato("EVASA KO DL");
      } else {
        pratica.setStato("EVASA OK DL");
      }
    }
    lavoriEleDaoSalesgate.aggiornaLavoriEle(pratica);
    if (inviaMittente) {
      pratica.getAvanzamentoFlussi().setCodFlusso(pratica.getFlussoAcc());
      pratica.getAvanzamentoFlussi().setStato("RICEVUTO_DL");
      pratica.getAvanzamentoFlussi().setFlagStato("I");
      utilityDaoSalesgate.aggiornaAvanzamentoFlussi(pratica.getAvanzamentoFlussi().getCodFlusso(), pratica.getAvanzamentoFlussi().getStato(), pratica.getAvanzamentoFlussi().getFlagStato(), pratica.getId());
    }

    GenericResponse response = GenericResponse.createGenericResponse(GenericResponse.OK, "Pratica salvata" + (inviaMittente ? " e inviata al sistema mittente " : " ") + "correttamente");

    return response;
  }

}
