package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;

public class CampiObbligatoriJdbcHandler extends JdbcHandler<CampiObbligatori> {

  private final String utility;

  public CampiObbligatoriJdbcHandler(String utility) {
    this.utility = utility;
  }

  @Override
  protected CampiObbligatori createObjectFromResultSet(ResultSet rs) throws SQLException {
    CampiObbligatori co = new CampiObbligatori(utility);
    co.setCampo(rs.getString("campo"));
    co.setAlert(rs.getString("alert"));

    return co;
  }

}
