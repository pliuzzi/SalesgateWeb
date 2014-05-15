package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.bean.AnagAmmissibilita;

public class AnagAmmissibilitaJdbcHandler extends JdbcHandler<AnagAmmissibilita> {

  @Override
  protected AnagAmmissibilita createObjectFromResultSet(ResultSet rs) throws SQLException {
    AnagAmmissibilita aa = new AnagAmmissibilita();
    aa.setId(rs.getString("ID"));
    aa.setDescription(rs.getString("DESCRIPTION"));
    aa.setUtility(rs.getString("UTILITY"));
    aa.setCodice(rs.getString("CODICE"));
    aa.setEsito(rs.getInt("ESITO"));
    switch (aa.getEsito()) {
    case 0:
      aa.setGruppo("INAMMISSIBILE");
      break;
    case 1:
      aa.setGruppo("AMMISSIBILE");
      break;
    case 3:
      aa.setGruppo("PRESA IN CARICO VENDITA");
      break;
    case 6:
      aa.setGruppo("PRESA IN CARICO DISTRIBUZIONE");
      break;
    }
    return aa;
  }

}
