package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.bean.AvanzamentoFlussi;

public class AvanzamentoFlussiJdbcHandler extends JdbcHandler<AvanzamentoFlussi> {

  @Override
  protected AvanzamentoFlussi createObjectFromResultSet(ResultSet rs) throws SQLException {
    AvanzamentoFlussi af = new AvanzamentoFlussi();
    af.setFkPratica(rs.getString("fk_pratica"));
    af.setFkLavori(rs.getString("fk_lavori"));
    af.setCodServizio(rs.getString("cod_servizio"));
    af.setCommodity(rs.getString("commodity"));
    af.setCodFlusso(rs.getString("cod_flusso"));
    af.setStato(rs.getString("stato"));
    af.setFlagStato(rs.getString("flag_stato"));
    af.setNumReinvio(rs.getInt("num_reinvio"));
    return af;
  }

}
