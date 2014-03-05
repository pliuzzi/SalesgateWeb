package eu.a2a.salesgate.dao.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class StringJdbcHandler extends JdbcHandler<String> {

  @Override
  protected String createObjectFromResultSet(ResultSet rs) throws SQLException {
    return rs.getString(columnNames.get(0));
  }

}
