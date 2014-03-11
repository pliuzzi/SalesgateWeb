package eu.a2a.salesgate.etl.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.distributori.bean.factory.DistributoreFactory;
import eu.a2a.salesgate.etl.bean.ETLItem;

public class ETLItemJdbcHandler extends JdbcHandler<ETLItem> {

  @Override
  protected ETLItem createObjectFromResultSet(ResultSet rs) throws SQLException {

    ETLItem etlItem = new ETLItem();
    etlItem.setDistributore(DistributoreFactory.newDistributore(rs.getString("fk_distributore"), rs.getString("name"),
        ""));
    etlItem.setEventCode(rs.getString("event_code"));
    etlItem.setFlusso(new AnagFlussi(rs.getString("fk_cod_flusso"), ""));
    etlItem.setServizio(new AnagRichieste(rs.getString("fk_cod_servizio"), ""));
    etlItem.setUtility(rs.getString("fk_utility"));

    return etlItem;
  }

}
