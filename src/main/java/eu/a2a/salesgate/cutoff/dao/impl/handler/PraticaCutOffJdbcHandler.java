package eu.a2a.salesgate.cutoff.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.cutoff.bean.PraticaCutOff;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class PraticaCutOffJdbcHandler extends JdbcHandler<PraticaCutOff> {

  @Override
  protected PraticaCutOff createObjectFromResultSet(ResultSet rs) throws SQLException {

    PraticaCutOff pratica = new PraticaCutOff();
    pratica.setId(rs.getString("id"));
    pratica.setCodicePraticaMittente(rs.getString("id_sistema_sorgente"));
    pratica.setPod(rs.getString("pod"));
    pratica.setMercato(rs.getString("mercato"));
    pratica.setStato(rs.getString("stato"));
    pratica.setCreated(rs.getDate("created"));

    return pratica;
  }

}
