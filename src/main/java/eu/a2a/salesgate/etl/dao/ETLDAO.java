package eu.a2a.salesgate.etl.dao;

import java.util.List;

import eu.a2a.salesgate.etl.bean.ETLInstanceItem;
import eu.a2a.salesgate.etl.bean.ETLItem;

public interface ETLDAO {

  List<ETLItem> estraiAllETLItem();

  List<ETLInstanceItem> estraiAllInstances(String eventCode);

  ETLInstanceItem estraiETLInstance(String eventCode, String objId);

}
