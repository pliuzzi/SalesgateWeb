package eu.a2a.salesgate.log.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import eu.a2a.salesgate.log.bean.TibcoAudit;
import eu.a2a.salesgate.log.dao.LogDAO;
import eu.a2a.salesgate.log.service.LogService;
import eu.a2a.salesgate.service.base.AbstractService;

@Service("logServiceSalesgate")
@Transactional("transactionManagerSalesgate")
public class LogServiceImpl extends AbstractService implements LogService {

  @Autowired
  LogDAO logDaoSalesgate;

  @Override
  public List<TibcoAudit> getTibcoAudit(String serviceName, String podPdr, String appKey1, String appKey2, String appKey3, int maxRows) {

    return logDaoSalesgate.getTibcoAudit(serviceName, podPdr, appKey1, appKey2, appKey3, maxRows);
  }

  @Override
  public String getXmlMessage(String id) {

    return logDaoSalesgate.getXmlMessage(id);
  }

}
