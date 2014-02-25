package eu.a2a.salesgate.utility.dao;

import java.math.BigDecimal;
import java.util.List;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.pratiche.beans.AnagAmmissibilita;
import eu.a2a.salesgate.pratiche.beans.AvanzamentoFlussi;
import eu.a2a.salesgate.pratiche.beans.CampiObbligatori;
import eu.a2a.salesgate.pratiche.beans.FlussiSalvabili;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGas;

public interface UtilityDAO {

  List<AnagAmmissibilita> getAllAnagAmmissibilita();

  AnagAmmissibilita geAnagAmmissibilita(String id);

  List<FlussiSalvabili> getAllFlussiSalvabili(LavoriGas pratica);

  List<CampiObbligatori> getAllCampiObbligatori(LavoriGas pratica);

  AvanzamentoFlussi estraiAvanzamentoFlussi(LavoriGas pratica);

  int aggiornaAvanzamentoFlussi(LavoriGas pratica);

  List<Params> getParams(String category);

  List<FileType> getFileTypes(String isTemplate);

  FileType getFileType(String mimeType);

  List<AnagRichieste> getAnagRichieste(String utility);

  List<AnagFlussi> getAnagFlussi(String utility, String direzione);

  BigDecimal getSeqGenericNextVal();

}