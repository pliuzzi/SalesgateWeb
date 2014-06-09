package eu.a2a.salesgate.cutoff.dao;

import java.util.List;

import eu.a2a.salesgate.cutoff.bean.CutOffItem;

public interface CutOffDAO {

  List<CutOffItem> estraiAllCutOff(String stato, String canale, String servizio);

  CutOffItem estraiCutOff(String id);

  int updateStato(String id, String statoFile);

  int updateFile(String id, byte[] fileData);

  List<String> estraiRequestContent(String id, String utility);

  int chiudiCutOff(String id, String closedBy);

}