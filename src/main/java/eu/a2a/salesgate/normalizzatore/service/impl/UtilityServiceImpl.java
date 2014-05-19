package eu.a2a.salesgate.normalizzatore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.normalizzatore.dao.UtilityDAO;
import eu.a2a.salesgate.normalizzatore.service.UtilityService;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.service.base.AbstractService;

@Service("utilityServiceSdm")
@Transactional("transactionManagerSdm")
public class UtilityServiceImpl extends AbstractService implements UtilityService {

  @Autowired
  private UtilityDAO utilityDaoSdm;

  @Override
  public List<FlussiSalvabili> estraiFlussiSalvabili(LavoriGas pratica) {

    List<FlussiSalvabili> list = utilityDaoSdm.getAllFlussiSalvabili(pratica);

    return list;
  }

  @Override
  public List<CampiObbligatori> estraiCampiObbligatori(LavoriGas pratica) {
    List<CampiObbligatori> list = utilityDaoSdm.getAllCampiObbligatori(pratica);
    return list;
  }

  @Override
  public List<Params> estraiParams(String category) {
    List<Params> list = utilityDaoSdm.getParams(category);
    return list;
  }

  @Override
  public List<FileType> estraiFileTypes(SiNo isTemplate) {
    List<FileType> list = utilityDaoSdm.getFileTypes(isTemplate.toString());
    return list;
  }

  @Override
  public FileType estraiFileType(String mimeType) {
    FileType fileType = utilityDaoSdm.getFileType(mimeType);
    return fileType;
  }

  @Override
  public List<AnagFlussi> estraiFlussi(String utility, String direzione) {
    List<AnagFlussi> list = utilityDaoSdm.getAnagFlussi(utility, direzione);
    return list;
  }

  @Override
  public List<AnagRichieste> estraiRichieste(String utility) {
    List<AnagRichieste> list = utilityDaoSdm.getAnagRichieste(utility);
    return list;
  }

  @Override
  public Integer estraiIdGenerico() {

    return utilityDaoSdm.getSeqGenericNextVal();
  }

}
