package eu.a2a.salesgate.log.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.log.bean.TibcoAudit;

public class TibcoAuditJdbcHandler extends JdbcHandler<TibcoAudit> {

  @Override
  protected TibcoAudit createObjectFromResultSet(ResultSet rs) throws SQLException {

    TibcoAudit ta = new TibcoAudit();
    ta.setId(rs.getString("ID"));
    ta.setServiceName(rs.getString("SERVICE_NAME"));
    ta.setProcessName(rs.getString("PROCESS_NAME"));
    ta.setServiceType(rs.getString("SERVICE_TYPE"));
    ta.setBusinessId(rs.getString("BUSINESS_ID"));
    ta.setSourceSystem(rs.getString("SOURCE_SYSTEM"));
    ta.setDestinationSystem(rs.getString("DESTINATION_SYSTEM"));
    ta.setDestination(rs.getString("DESTINATION"));
    ta.setPodPdr(rs.getString("PODPDR"));
    ta.setAppKey1(rs.getString("APPKEY1"));
    ta.setAppKey2(rs.getString("APPKEY2"));
    ta.setAppKey3(rs.getString("APPKEY3"));
    ta.setEsito(rs.getString("ESITO"));
    ta.setDescrizioneEsito(rs.getString("DESCRIZIONE_ESITO"));
    if (contains("MESSAGE")) {
      ta.setMessage(rs.getString("MESSAGE"));
    }
    ta.setMessageTimestamp(rs.getDate("MESSAGE_TIMESTAMP"));
    ta.setMessageType(rs.getString("MESSAGE_TYPE"));
    ta.setState(rs.getString("STATE"));

    return ta;
  }

}
