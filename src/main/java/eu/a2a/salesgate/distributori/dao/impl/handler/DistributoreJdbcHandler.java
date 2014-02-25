package eu.a2a.salesgate.distributori.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.dao.type.impl.BooleanType;
import eu.a2a.salesgate.distributori.bean.Distributore;

public class DistributoreJdbcHandler extends JdbcHandler<Distributore> {

  @Override
  protected Distributore createObjectFromResultSet(ResultSet rs) throws SQLException {
    Distributore distributore = new Distributore();

    distributore.setId(rs.getString("ID"));
    distributore.setName(rs.getString("NAME"));
    distributore.setPiva(rs.getString("PIVA"));
    distributore.setUtility(rs.getString("UTILITY"));
    distributore.setReferente(rs.getString("REFERENTE"));
    distributore.setTelReferente(rs.getString("TEL_REFERENTE"));
    distributore.setEmailReferente(rs.getString("EMAIL_REFERENTE"));
    distributore.setPec(rs.getString("PEC"));
    distributore.setFlagAdempiente147(rs.getString("FLAG_ADEMPIENTE_147"));
    distributore.setDataAdempiente(rs.getDate("DATA_ADEMPIENTE"));
    distributore.setFlagAttivo(new BooleanType(rs.getString("FLAG_ATTIVO")).fromSQL());
    distributore.setFlagNotificaSwo(new BooleanType(rs.getString("FLAG_NOTIFICA_SWO")).fromSQL());
    distributore.setFlagRuc(new BooleanType(rs.getString("FLAG_RUC")).fromSQL());
    distributore.setFlagAttivo(new BooleanType(rs.getString("FLAG_ATTIVO")).fromSQL());
    distributore.setLastUpdatedFlgSwo(rs.getDate("LAST_UPDATED_FLG_SWO"));
    distributore.setLastUpdatedFlgRuc(rs.getDate("LAST_UPDATED_FLG_RUC"));

    return distributore;
  }
}
