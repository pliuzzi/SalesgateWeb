package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.bean.FlussiSalvabili;

public class FlussiSalvabiliJdbcHandler extends JdbcHandler<FlussiSalvabili> {

  @Override
  protected FlussiSalvabili createObjectFromResultSet(ResultSet rs) throws SQLException {

    FlussiSalvabili fs = new FlussiSalvabili();
    fs.setCodFlussoAcc(rs.getString("cod_flusso_acc"));
    fs.setDescFlussoAcc(rs.getString("description"));

    return fs;
  }

}
