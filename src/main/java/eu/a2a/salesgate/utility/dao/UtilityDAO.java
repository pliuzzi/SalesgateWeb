package eu.a2a.salesgate.utility.dao;

import java.util.List;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;

public interface UtilityDAO {

  List<AnagAmmissibilita> getAllAnagAmmissibilita(String id, String utility);

  AnagAmmissibilita getAnagAmmissibilita(String id);

  List<FlussiSalvabili> getAllFlussiSalvabili(String codiceServizio, String codiceFlusso, String stato, String utility);

  List<CampiObbligatori> getAllCampiObbligatori(String pivaDistributore, String codiceServizio, String utility, String codiceFlusso);

  AvanzamentoFlussi estraiAvanzamentoFlussi(String id);

  int aggiornaAvanzamentoFlussi(String codiceFlusso, String getStato, String getFlagStato, String id);

  List<Params> getParams(String category);

  List<FileType> getFileTypes(String isTemplate);

  FileType getFileType(String mimeType);

  List<AnagRichieste> getAnagRichieste(String utility);

  List<AnagFlussi> getAnagFlussi(String utility, String direzione);

  Integer getSeqGenericNextVal();

  List<CodDescBean> getAllStati(String utility);

}