package eu.a2a.salesgate.etl.service;

import java.util.List;

import eu.a2a.salesgate.bean.base.GenericResponse;
import eu.a2a.salesgate.bean.tree.RootNode;
import eu.a2a.salesgate.etl.bean.ETLInstanceItem;

public interface ETLService {

  List<RootNode> estraiElencoETL(String... groupBy);

  List<ETLInstanceItem> estraiElencoETLInstances(String eventCode);

  ETLInstanceItem estraiETLInstance(String eventCode, String objId);

  GenericResponse startETL(byte[] fileContent, String fileName, String eventCode, String user);

}
