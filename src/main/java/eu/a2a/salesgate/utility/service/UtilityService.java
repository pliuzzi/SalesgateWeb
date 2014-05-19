package eu.a2a.salesgate.utility.service;

import java.util.List;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.bean.base.SiNo;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;

public interface UtilityService {

  public List<FlussiSalvabili> estraiFlussiSalvabili(String codiceServizio, String codiceFlusso, String stato, String utility);

  public List<CampiObbligatori> estraiCampiObbligatori(String pivaDistributore, String codiceServizio, String utility, String codiceFlusso);

  public List<Params> estraiParams(String category);

  public List<FileType> estraiFileTypes(SiNo isTemplate);

  public FileType estraiFileType(String mimeType);

  public List<AnagFlussi> estraiFlussi(String utility, String direzione);

  public List<AnagRichieste> estraiRichieste(String utility);

  public Integer estraiIdGenerico();

  public List<AnagAmmissibilita> getAllAnagAmmissibilita(String id, String utility);

  public int aggiornaAvanzamentoFlussi(String codiceFlusso, String getStato, String getFlagStato, String id);

}
