package eu.a2a.salesgate.log.service;

import java.util.List;

import eu.a2a.salesgate.log.bean.TibcoAudit;

public interface LogService {

  List<TibcoAudit> getTibcoAudit(String serviceName, String podPdr, String appKey1, String appKey2, String appKey3, int maxRow);

  String getXmlMessage(String id);

}
