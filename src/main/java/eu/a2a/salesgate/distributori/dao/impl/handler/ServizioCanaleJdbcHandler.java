package eu.a2a.salesgate.distributori.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.distributori.bean.ServizioCanale;

public class ServizioCanaleJdbcHandler extends JdbcHandler<ServizioCanale> {

  @Override
  protected ServizioCanale createObjectFromResultSet(ResultSet rs) throws SQLException {
    ServizioCanale servizioCanale = new ServizioCanale();

    servizioCanale.setId(rs.getString("ID"));
    CodDescBean canale = new CodDescBean(rs.getString("flag_canale"), rs.getString("desc_canale"));
    servizioCanale.setCanale(canale);
    servizioCanale.setCodiceServizio(rs.getString("cod_servizio"));
    servizioCanale.setDescription(rs.getString("desc_servizio"));

    return servizioCanale;
  }

}
