package eu.a2a.salesgate.utility.service;

import java.math.BigDecimal;
import java.util.List;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.pratiche.beans.CampiObbligatori;
import eu.a2a.salesgate.pratiche.beans.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGas;

public interface UtilityService {

  public List<FlussiSalvabili> estraiFlussiSalvabili(LavoriGas pratica);

  public List<CampiObbligatori> estraiCampiObbligatori(LavoriGas pratica);

  public List<Params> estraiParams(String category);

  public List<FileType> estraiFileTypes(SiNo isTemplate);

  public FileType estraiFileType(String mimeType);

  public List<AnagFlussi> estraiFlussi(String utility, String direzione);

  public List<AnagRichieste> estraiRichieste(String utility);

  public BigDecimal estraiIdGenerico();

}
