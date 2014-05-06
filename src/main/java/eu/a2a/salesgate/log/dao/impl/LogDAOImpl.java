package eu.a2a.salesgate.log.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import eu.a2a.salesgate.dao.handler.StringJdbcHandler;
import eu.a2a.salesgate.log.bean.TibcoAudit;
import eu.a2a.salesgate.log.dao.LogDAO;
import eu.a2a.salesgate.log.dao.impl.handler.TibcoAuditJdbcHandler;

@Repository("logDaoSalesgate")
public class LogDAOImpl implements LogDAO {

  @Autowired
  JdbcTemplate jdbcTemplateSalesgate;

  @Override
  public List<TibcoAudit> getTibcoAudit(String serviceName, String podPdr, String appKey1, String appKey2, String appKey3, int maxRows) {

    String sql = "SELECT ID, SERVICE_NAME, PROCESS_NAME, SERVICE_TYPE, BUSINESS_ID, SOURCE_SYSTEM, DESTINATION_SYSTEM, DESTINATION, PODPDR, APPKEY1, APPKEY2, APPKEY3, ESITO, DESCRIZIONE_ESITO, "
        + " MESSAGE_TIMESTAMP, MESSAGE_TYPE, STATE FROM SALESGATE.TIBCO_AUDIT" + " WHERE 1=1 ";
    if (!StringUtils.isEmpty(serviceName)) {
      sql += " AND SERVICE_NAME = '" + serviceName + "' ";
    }
    if (!StringUtils.isEmpty(podPdr)) {
      sql += " AND PODPDR = '" + podPdr + "' ";
    }
    if (!StringUtils.isEmpty(appKey1)) {
      sql += " AND APPKEY1 = '" + appKey1 + "' ";
    }
    if (!StringUtils.isEmpty(appKey2)) {
      sql += " AND APPKEY2 = '" + appKey2 + "' ";
    }
    if (!StringUtils.isEmpty(appKey3)) {
      sql += " AND APPKEY3 = '" + appKey3 + "' ";
    }
    sql += " ORDER BY ID DESC";
    jdbcTemplateSalesgate.setMaxRows(maxRows);
    return jdbcTemplateSalesgate.query(sql, new TibcoAuditJdbcHandler().getRowMapper());
  }

  @Override
  public String getXmlMessage(String id) {

    String sql = "SELECT replace(MESSAGE, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>', '') as MESSAGE FROM SALESGATE.TIBCO_AUDIT" + " WHERE id = ?";

    return jdbcTemplateSalesgate.query(sql, new StringJdbcHandler().getResultSetExtractor(), id);
  }

}
