package eu.a2a.salesgate.dao.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class IntegerJdbcHandler extends JdbcHandler<Integer> {

  @Override
  protected Integer createObjectFromResultSet(ResultSet rs) throws SQLException {
    return rs.getInt(columnNames.get(0));
  }

}
