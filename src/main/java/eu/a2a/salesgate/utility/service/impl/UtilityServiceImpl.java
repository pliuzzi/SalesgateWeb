package eu.a2a.salesgate.utility.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.utility.dao.UtilityDAO;
import eu.a2a.salesgate.utility.service.UtilityService;

@Service
public class UtilityServiceImpl implements UtilityService {

  @Autowired
  private UtilityDAO utilityDao;

  @Override
  public List<FlussiSalvabili> estraiFlussiSalvabili(LavoriGas pratica) {

    List<FlussiSalvabili> list = utilityDao.getAllFlussiSalvabili(pratica);

    return list;
  }

  @Override
  public List<CampiObbligatori> estraiCampiObbligatori(LavoriGas pratica) {
    List<CampiObbligatori> list = utilityDao.getAllCampiObbligatori(pratica);
    return list;
  }

  @Override
  public List<Params> estraiParams(String category) {
    List<Params> list = utilityDao.getParams(category);
    return list;
  }

  @Override
  public List<FileType> estraiFileTypes(SiNo isTemplate) {
    List<FileType> list = utilityDao.getFileTypes(isTemplate.toString());
    return list;
  }

  @Override
  public FileType estraiFileType(String mimeType) {
    FileType fileType = utilityDao.getFileType(mimeType);
    return fileType;
  }

  @Override
  public List<AnagFlussi> estraiFlussi(String utility, String direzione) {
    List<AnagFlussi> list = utilityDao.getAnagFlussi(utility, direzione);
    return list;
  }

  @Override
  public List<AnagRichieste> estraiRichieste(String utility) {
    List<AnagRichieste> list = utilityDao.getAnagRichieste(utility);
    return list;
  }

  @Override
  public Integer estraiIdGenerico() {

    return utilityDao.getSeqGenericNextVal();
  }

}
