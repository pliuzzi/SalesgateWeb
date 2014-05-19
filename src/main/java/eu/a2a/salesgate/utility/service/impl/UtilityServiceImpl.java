package eu.a2a.salesgate.utility.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.utility.dao.UtilityDAO;
import eu.a2a.salesgate.utility.service.UtilityService;

@Service("utilityServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class UtilityServiceImpl implements UtilityService {

  @Autowired
  private UtilityDAO utilityDaoSalesgate;

  @Override
  public List<FlussiSalvabili> estraiFlussiSalvabili(String codiceServizio, String codiceFlusso, String stato, String utility) {

    List<FlussiSalvabili> list = utilityDaoSalesgate.getAllFlussiSalvabili(codiceServizio, codiceFlusso, stato, utility);

    return list;
  }

  @Override
  public List<CampiObbligatori> estraiCampiObbligatori(String pivaDistributore, String codiceServizio, String utility, String codiceFlusso) {
    List<CampiObbligatori> list = utilityDaoSalesgate.getAllCampiObbligatori(pivaDistributore, codiceServizio, utility, codiceFlusso);
    return list;
  }

  @Override
  public List<Params> estraiParams(String category) {
    List<Params> list = utilityDaoSalesgate.getParams(category);
    return list;
  }

  @Override
  public List<FileType> estraiFileTypes(SiNo isTemplate) {
    List<FileType> list = utilityDaoSalesgate.getFileTypes(isTemplate.toString());
    return list;
  }

  @Override
  public FileType estraiFileType(String mimeType) {
    FileType fileType = utilityDaoSalesgate.getFileType(mimeType);
    return fileType;
  }

  @Override
  public List<AnagFlussi> estraiFlussi(String utility, String direzione) {
    List<AnagFlussi> list = utilityDaoSalesgate.getAnagFlussi(utility, direzione);
    return list;
  }

  @Override
  public List<AnagRichieste> estraiRichieste(String utility) {
    List<AnagRichieste> list = utilityDaoSalesgate.getAnagRichieste(utility);
    return list;
  }

  @Override
  public Integer estraiIdGenerico() {

    return utilityDaoSalesgate.getSeqGenericNextVal();
  }

  @Override
  public List<AnagAmmissibilita> getAllAnagAmmissibilita(String id, String utility) {

    return utilityDaoSalesgate.getAllAnagAmmissibilita(id, utility);
  }

  @Override
  public int aggiornaAvanzamentoFlussi(String codiceFlusso, String getStato, String getFlagStato, String id) {
    return utilityDaoSalesgate.aggiornaAvanzamentoFlussi(codiceFlusso, getStato, getFlagStato, id);
  }

}
