package eu.a2a.salesgate.pratiche.gas.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.dao.DistributoreDAO;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.gas.bean.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasExtension;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXCliente;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXIndirizzo;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXMisuratore;
import eu.a2a.salesgate.pratiche.gas.dao.LavoriGasDAO;
import eu.a2a.salesgate.pratiche.gas.service.LavoriGasService;
import eu.a2a.salesgate.utility.dao.UtilityDAO;

@Service
@Transactional("transactionManagerSalesgate")
public class LavoriGasServiceImpl implements LavoriGasService {

  @Autowired
  private LavoriGasDAO lavoriGasDaoSalesgate;

  @Autowired
  private DistributoreDAO distributoreDaoSalesgate;

  @Autowired
  private UtilityDAO utilityDaoSalesgate;

  @Override
  public List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro) {

    return lavoriGasDaoSalesgate.cercaPerFiltro(filtro);
  }

  @Override
  public LavoriGas cercaPraticaPerCodiceSG(String codicePraticaSG) {

    LavoriGas pratica = lavoriGasDaoSalesgate.cercaPerCodicePraticaSG(codicePraticaSG);
    LavoriGasExtension lavoriGasExtension = estraiLavoriGasExtension(codicePraticaSG);
    Distributore distributore = distributoreDaoSalesgate.getDistributore(pratica.getFkDistributore());
    AnagAmmissibilita anagAmmissibilita;
    if (!StringUtils.isEmpty(pratica.getFkAmmissibilita())) {
      anagAmmissibilita = utilityDaoSalesgate.getAnagAmmissibilita(pratica.getFkAmmissibilita());
    } else {
      anagAmmissibilita = new AnagAmmissibilita();
    }
    AvanzamentoFlussi avanzamentoFlussi = utilityDaoSalesgate.estraiAvanzamentoFlussi(pratica.getId());

    pratica.setLavoriGasExtension(lavoriGasExtension);
    pratica.setDistributore(distributore);
    pratica.setAnagAmmissibilita(anagAmmissibilita);
    pratica.setAvanzamentoFlussi(avanzamentoFlussi);

    return pratica;
  }

  private LavoriGasExtension estraiLavoriGasExtension(String codicePraticaSG) {

    LavoriGasExtension lavoriGasExtension = lavoriGasDaoSalesgate.estraiLavoriGasExtension(codicePraticaSG);

    LavoriGasXMisuratore misuratore = lavoriGasDaoSalesgate.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkMisuratore().toPlainString());
    LavoriGasXMisuratore convertitore = lavoriGasDaoSalesgate.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkConvertitore().toPlainString());
    LavoriGasXMisuratore misuratoreCliente = lavoriGasDaoSalesgate.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkMisuratoreCliente().toPlainString());
    LavoriGasXMisuratore convertitoreCliente = lavoriGasDaoSalesgate.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkConvertitoreCliente().toPlainString());
    LavoriGasXMisuratore misuratoreRim = lavoriGasDaoSalesgate.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkMisuratoreRim().toPlainString());
    LavoriGasXMisuratore convertitoreRim = lavoriGasDaoSalesgate.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkConvertitoreRim().toPlainString());

    lavoriGasExtension.setMisuratore(misuratore);
    lavoriGasExtension.setConvertitore(convertitore);
    lavoriGasExtension.setMisuratoreCliente(misuratoreCliente);
    lavoriGasExtension.setConvertitoreCliente(convertitoreCliente);
    lavoriGasExtension.setMisuratoreRim(misuratoreRim);
    lavoriGasExtension.setConvertitoreRim(convertitoreRim);

    LavoriGasXCliente clienteUsc = lavoriGasDaoSalesgate.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteUsc().toPlainString());
    LavoriGasXCliente clienteFinale = lavoriGasDaoSalesgate.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteFinale().toPlainString());
    LavoriGasXCliente clienteRef = lavoriGasDaoSalesgate.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteRef().toPlainString());
    LavoriGasXCliente clienteEsaz = lavoriGasDaoSalesgate.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteEsaz().toPlainString());
    LavoriGasXCliente clienteBenef = lavoriGasDaoSalesgate.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteBenef().toPlainString());

    lavoriGasExtension.setClienteUsc(clienteUsc);
    lavoriGasExtension.setClienteFinale(clienteFinale);
    lavoriGasExtension.setClienteRef(clienteRef);
    lavoriGasExtension.setClienteEsaz(clienteEsaz);
    lavoriGasExtension.setClienteBenef(clienteBenef);

    LavoriGasXIndirizzo indirizzoForn = lavoriGasDaoSalesgate.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoForn().toPlainString());
    LavoriGasXIndirizzo indirizzoEsaz = lavoriGasDaoSalesgate.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoEsaz().toPlainString());
    LavoriGasXIndirizzo indirizzoBenef = lavoriGasDaoSalesgate.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoBenef().toPlainString());
    LavoriGasXIndirizzo indirizzoImmob = lavoriGasDaoSalesgate.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoImmob().toPlainString());
    LavoriGasXIndirizzo indirizzoLegale = lavoriGasDaoSalesgate.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoLegale().toPlainString());
    LavoriGasXIndirizzo indirizzoRef = lavoriGasDaoSalesgate.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoRef().toPlainString());

    lavoriGasExtension.setIndirizzoForn(indirizzoForn);
    lavoriGasExtension.setIndirizzoEsaz(indirizzoEsaz);
    lavoriGasExtension.setIndirizzoBenef(indirizzoBenef);
    lavoriGasExtension.setIndirizzoImmob(indirizzoImmob);
    lavoriGasExtension.setIndirizzoLegale(indirizzoLegale);
    lavoriGasExtension.setIndirizzoRef(indirizzoRef);

    return lavoriGasExtension;

  }

  @Override
  public boolean savePratica(LavoriGas pratica) {

    return savePratica(pratica, false);

  }

  @Override
  public boolean savePratica(LavoriGas pratica, boolean inviaMittente) {

    pratica.getLavoriGasExtension().setDettaglioVerificaEsito("");
    pratica.setCodFlusso(pratica.getFlussoAcc());
    pratica.getLavoriGasExtension().setCodiceFlusso(pratica.getFlussoAcc());
    if (StringUtils.isEmpty(pratica.getLavoriGasExtension().getEsito())) {
      // pratica.setStato("EVASA OK DL");
    } else {
      if (pratica.getLavoriGasExtension().getEsito().equals("0")) {
        pratica.setStato("EVASA KO DL");
      } else {
        pratica.setStato("EVASA OK DL");
      }
    }
    lavoriGasDaoSalesgate.aggiornaLavoriGas(pratica);
    if (inviaMittente) {
      pratica.getAvanzamentoFlussi().setCodFlusso(pratica.getFlussoAcc());
      pratica.getAvanzamentoFlussi().setStato("RICEVUTO_DL");
      pratica.getAvanzamentoFlussi().setFlagStato("I");
      utilityDaoSalesgate.aggiornaAvanzamentoFlussi(pratica.getAvanzamentoFlussi().getCodFlusso(), pratica.getAvanzamentoFlussi().getStato(), pratica.getAvanzamentoFlussi().getFlagStato(), pratica.getId());
    }

    return true;
  }

}
