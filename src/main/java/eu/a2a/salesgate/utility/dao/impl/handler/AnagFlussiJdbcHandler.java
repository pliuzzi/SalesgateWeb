package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class AnagFlussiJdbcHandler extends JdbcHandler<AnagFlussi> {

  @Override
  protected AnagFlussi createObjectFromResultSet(ResultSet rs) throws SQLException {
    AnagFlussi af = new AnagFlussi();
    af.setId(rs.getString("cod_flusso"));
    af.setDescription(rs.getString("description"));
    af.setUtility(rs.getString("utility"));
    af.setGruppoProcedure(rs.getString("gruppo_procedure"));
    af.setNomeAction(rs.getString("nome_action"));
    af.setDirezione(rs.getString("direzione"));
    return af;
  }

}
