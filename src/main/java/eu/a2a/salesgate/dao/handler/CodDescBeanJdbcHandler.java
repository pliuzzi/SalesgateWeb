package eu.a2a.salesgate.dao.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class CodDescBeanJdbcHandler extends JdbcHandler<CodDescBean> {

  @Override
  protected CodDescBean createObjectFromResultSet(ResultSet rs) throws SQLException {
    CodDescBean cdb = new CodDescBean(rs.getString("id"), rs.getString("description"));
    return cdb;
  }

}
