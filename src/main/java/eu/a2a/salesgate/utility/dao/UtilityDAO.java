package eu.a2a.salesgate.utility.dao;

import java.util.List;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;

public interface UtilityDAO {

  List<AnagAmmissibilita> getAllAnagAmmissibilita(String id);

  AnagAmmissibilita getAnagAmmissibilita(String id);

  List<FlussiSalvabili> getAllFlussiSalvabili(LavoriGas pratica);

  List<CampiObbligatori> getAllCampiObbligatori(LavoriGas pratica);

  AvanzamentoFlussi estraiAvanzamentoFlussi(LavoriGas pratica);

  int aggiornaAvanzamentoFlussi(LavoriGas pratica);

  List<Params> getParams(String category);

  List<FileType> getFileTypes(String isTemplate);

  FileType getFileType(String mimeType);

  List<AnagRichieste> getAnagRichieste(String utility);

  List<AnagFlussi> getAnagFlussi(String utility, String direzione);

  Integer getSeqGenericNextVal();

}