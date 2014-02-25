package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.Params;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class ParamsJdbcHandler extends JdbcHandler<Params> {

  @Override
  protected Params createObjectFromResultSet(ResultSet rs) throws SQLException {

    Params p = new Params();
    p.setId(rs.getString("ID"));
    p.setDescription(rs.getString("NAME"));
    p.setValue(rs.getString("VALUE"));
    p.setCategory(rs.getString("CATEGORY"));

    return p;
  }

}
