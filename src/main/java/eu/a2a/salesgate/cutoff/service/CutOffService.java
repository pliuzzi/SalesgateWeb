package eu.a2a.salesgate.cutoff.service;

import java.io.ByteArrayOutputStream;
import java.util.List;

import eu.a2a.salesgate.cutoff.bean.CutOffItem;
import eu.a2a.salesgate.cutoff.bean.RootNode;

public interface CutOffService {

  List<RootNode> estraiElencoCutoff(String stato, String... groupBy);

  CutOffItem estraiCutoff(String id);

  ByteArrayOutputStream eseguiCutOff(String id);

  void chiudiCutOff(String id, String closedBy);

}