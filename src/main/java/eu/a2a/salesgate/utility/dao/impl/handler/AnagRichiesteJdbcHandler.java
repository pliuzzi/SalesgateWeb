package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.dao.type.impl.BooleanType;

public class AnagRichiesteJdbcHandler extends JdbcHandler<AnagRichieste> {

  @Override
  protected AnagRichieste createObjectFromResultSet(ResultSet rs) throws SQLException {
    AnagRichieste ar = new AnagRichieste();
    ar.setId(rs.getString("id"));
    ar.setDescription(rs.getString("description"));
    ar.setCode(rs.getString("code"));
    ar.setUtility(rs.getString("description"));
    ar.setFlagRisottomissione(new BooleanType(rs.getString("flag_risottomissione")).fromSQL());
    ar.setFlagSg(new BooleanType(rs.getString("flag_sg")).fromSQL());
    ar.setFlagMatrice(new BooleanType(rs.getString("flag_matrice")).fromSQL());
    ar.setFlagSemaforo(new BooleanType(rs.getString("flag_semaforo")).fromSQL());
    if (contains("flag_compatiblita"))
      ar.setFlagCompatiblita(new BooleanType(rs.getString("flag_compatiblita")).fromSQL());
    return ar;
  }

}
