package eu.a2a.salesgate.dao.handler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class ListStringJdbcHandler extends JdbcHandler<List<String>> {

  @Override
  protected List<String> createObjectFromResultSet(ResultSet rs) throws SQLException {

    List<String> list = new ArrayList<String>(columnNames.size());
    for (String columnName : columnNames) {
      list.add(rs.getString(columnName));
    }
    return list;
  }

}
