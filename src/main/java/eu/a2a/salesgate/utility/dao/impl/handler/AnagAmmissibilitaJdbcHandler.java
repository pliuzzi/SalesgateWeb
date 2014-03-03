package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;

public class AnagAmmissibilitaJdbcHandler extends JdbcHandler<AnagAmmissibilita> {

  @Override
  protected AnagAmmissibilita createObjectFromResultSet(ResultSet rs) throws SQLException {
    AnagAmmissibilita aa = new AnagAmmissibilita();
    aa.setId(rs.getString("ID"));
    aa.setDescription(rs.getString("DESCRIPTION"));
    aa.setUtility(rs.getString("UTILITY"));
    aa.setCodice(rs.getString("CODICE"));
    aa.setEsito(rs.getInt("ESITO"));
    return aa;
  }

}
