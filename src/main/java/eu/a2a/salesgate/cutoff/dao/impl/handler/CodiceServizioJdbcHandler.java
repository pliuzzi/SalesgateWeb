package eu.a2a.salesgate.cutoff.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.cutoff.bean.CodiceServizio;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class CodiceServizioJdbcHandler extends JdbcHandler<CodiceServizio> {

  @Override
  protected CodiceServizio createObjectFromResultSet(ResultSet rs) throws SQLException {

    CodiceServizio codiceServizio = new CodiceServizio();
    codiceServizio.setCode(rs.getString("code"));
    codiceServizio.setDescription(rs.getString("description"));
    return codiceServizio;
  }

}
