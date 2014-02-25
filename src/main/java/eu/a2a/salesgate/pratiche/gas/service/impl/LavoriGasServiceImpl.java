package eu.a2a.salesgate.pratiche.gas.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.distributori.dao.impl.DistributoreDAOImpl;
import eu.a2a.salesgate.pratiche.beans.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.beans.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.gas.beans.FiltroPraticheGas;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGas;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasExtension;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXCliente;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXIndirizzo;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXMisuratore;
import eu.a2a.salesgate.pratiche.gas.dao.LavoriGasDAO;
import eu.a2a.salesgate.pratiche.gas.service.LavoriGasService;
import eu.a2a.salesgate.utility.dao.impl.UtilityDAOImpl;

@Service
public class LavoriGasServiceImpl implements LavoriGasService {

  @Autowired
  private LavoriGasDAO lavoriGasDao;

  @Autowired
  private DistributoreDAOImpl distributoreDao;

  @Autowired
  private UtilityDAOImpl utilityDao;

  @Override
  public List<LavoriGas> cercaPerFiltro(FiltroPraticheGas filtro) {

    return lavoriGasDao.cercaPerFiltro(filtro);
  }

  @Override
  public LavoriGas cercaPraticaPerCodiceSG(String codicePraticaSG) {

    LavoriGas pratica = lavoriGasDao.cercaPerCodicePraticaSG(codicePraticaSG);
    LavoriGasExtension lavoriGasExtension = estraiLavoriGasExtension(codicePraticaSG);
    Distributore distributore = distributoreDao.getDistributore(pratica.getFkDistributore());
    AnagAmmissibilita anagAmmissibilita;
    if (!StringUtils.isEmpty(pratica.getFkAmmissibilita()))
      anagAmmissibilita = utilityDao.geAnagAmmissibilita(pratica.getFkAmmissibilita());
    else
      anagAmmissibilita = new AnagAmmissibilita();
    AvanzamentoFlussi avanzamentoFlussi = utilityDao.estraiAvanzamentoFlussi(pratica);

    pratica.setLavoriGasExtension(lavoriGasExtension);
    pratica.setDistributore(distributore);
    pratica.setAnagAmmissibilita(anagAmmissibilita);
    pratica.setAvanzamentoFlussi(avanzamentoFlussi);

    return pratica;
  }

  private LavoriGasExtension estraiLavoriGasExtension(String codicePraticaSG) {

    LavoriGasExtension lavoriGasExtension = lavoriGasDao.estraiLavoriGasExtension(codicePraticaSG);

    LavoriGasXMisuratore misuratore = lavoriGasDao.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkMisuratore()
        .toPlainString());
    LavoriGasXMisuratore convertitore = lavoriGasDao.estraiLavoriGasXMisuratore(lavoriGasExtension.getFkConvertitore()
        .toPlainString());
    LavoriGasXMisuratore misuratoreCliente = lavoriGasDao.estraiLavoriGasXMisuratore(lavoriGasExtension
        .getFkMisuratoreCliente().toPlainString());
    LavoriGasXMisuratore convertitoreCliente = lavoriGasDao.estraiLavoriGasXMisuratore(lavoriGasExtension
        .getFkConvertitoreCliente().toPlainString());
    LavoriGasXMisuratore misuratoreRim = lavoriGasDao.estraiLavoriGasXMisuratore(lavoriGasExtension
        .getFkMisuratoreRim().toPlainString());
    LavoriGasXMisuratore convertitoreRim = lavoriGasDao.estraiLavoriGasXMisuratore(lavoriGasExtension
        .getFkConvertitoreRim().toPlainString());

    lavoriGasExtension.setMisuratore(misuratore);
    lavoriGasExtension.setConvertitore(convertitore);
    lavoriGasExtension.setMisuratoreCliente(misuratoreCliente);
    lavoriGasExtension.setConvertitoreCliente(convertitoreCliente);
    lavoriGasExtension.setMisuratoreRim(misuratoreRim);
    lavoriGasExtension.setConvertitoreRim(convertitoreRim);

    LavoriGasXCliente clienteUsc = lavoriGasDao.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteUsc()
        .toPlainString());
    LavoriGasXCliente clienteFinale = lavoriGasDao.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteFinale()
        .toPlainString());
    LavoriGasXCliente clienteRef = lavoriGasDao.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteRef()
        .toPlainString());
    LavoriGasXCliente clienteEsaz = lavoriGasDao.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteEsaz()
        .toPlainString());
    LavoriGasXCliente clienteBenef = lavoriGasDao.estraiLavoriGasXCliente(lavoriGasExtension.getFkClienteBenef()
        .toPlainString());

    lavoriGasExtension.setClienteUsc(clienteUsc);
    lavoriGasExtension.setClienteFinale(clienteFinale);
    lavoriGasExtension.setClienteRef(clienteRef);
    lavoriGasExtension.setClienteEsaz(clienteEsaz);
    lavoriGasExtension.setClienteBenef(clienteBenef);

    LavoriGasXIndirizzo indirizzoForn = lavoriGasDao.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoForn()
        .toPlainString());
    LavoriGasXIndirizzo indirizzoEsaz = lavoriGasDao.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoEsaz()
        .toPlainString());
    LavoriGasXIndirizzo indirizzoBenef = lavoriGasDao.estraiLavoriGasXIndirizzo(lavoriGasExtension
        .getFkIndirizzoBenef().toPlainString());
    LavoriGasXIndirizzo indirizzoImmob = lavoriGasDao.estraiLavoriGasXIndirizzo(lavoriGasExtension
        .getFkIndirizzoImmob().toPlainString());
    LavoriGasXIndirizzo indirizzoLegale = lavoriGasDao.estraiLavoriGasXIndirizzo(lavoriGasExtension
        .getFkIndirizzoLegale().toPlainString());
    LavoriGasXIndirizzo indirizzoRef = lavoriGasDao.estraiLavoriGasXIndirizzo(lavoriGasExtension.getFkIndirizzoRef()
        .toPlainString());

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
  @Transactional
  public boolean savePratica(LavoriGas pratica, boolean inviaMittente) {

    pratica.getLavoriGasExtension().setDettaglioVerificaEsito("");
    pratica.setCodFlusso(pratica.getFlussoAcc());
    pratica.getLavoriGasExtension().setCodiceFlusso(pratica.getFlussoAcc());
    if (StringUtils.isEmpty(pratica.getLavoriGasExtension().getEsito())) {
      // pratica.setStato("EVASA OK DL");
    } else {
      if (pratica.getLavoriGasExtension().getEsito().equals("0"))
        pratica.setStato("EVASA KO DL");
      else
        pratica.setStato("EVASA OK DL");
    }
    lavoriGasDao.aggiornaLavoriGas(pratica);
    if (inviaMittente) {
      pratica.getAvanzamentoFlussi().setCodFlusso(pratica.getFlussoAcc());
      pratica.getAvanzamentoFlussi().setStato("RICEVUTO_DL");
      pratica.getAvanzamentoFlussi().setFlagStato("I");
      utilityDao.aggiornaAvanzamentoFlussi(pratica);
    }

    return true;
  }

}
