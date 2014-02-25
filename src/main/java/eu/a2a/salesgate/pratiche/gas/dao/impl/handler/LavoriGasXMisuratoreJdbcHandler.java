package eu.a2a.salesgate.pratiche.gas.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXMisuratore;

public class LavoriGasXMisuratoreJdbcHandler extends JdbcHandler<LavoriGasXMisuratore> {

  @Override
  protected LavoriGasXMisuratore createObjectFromResultSet(ResultSet rs) throws SQLException {
    LavoriGasXMisuratore lavoriGasXMisuratore = new LavoriGasXMisuratore();
    lavoriGasXMisuratore.setId(rs.getBigDecimal("ID"));
    lavoriGasXMisuratore.setMatricola(rs.getString("MATRICOLA"));
    lavoriGasXMisuratore.setValoreLettura(rs.getString("VALORE_LETTURA"));
    lavoriGasXMisuratore.setDataLettura(rs.getDate("DATA_LETTURA"));
    lavoriGasXMisuratore.setTipoLettura(rs.getString("TIPO_LETTURA"));
    lavoriGasXMisuratore.setSegn(rs.getString("SEGN"));
    lavoriGasXMisuratore.setCreated(rs.getDate("CREATED"));
    lavoriGasXMisuratore.setLastUpdated(rs.getDate("LAST_UPDATED"));
    lavoriGasXMisuratore.setSostituzione(rs.getString("SOSTITUZIONE"));
    lavoriGasXMisuratore.setRimozione(rs.getString("RIMOZIONE"));
    lavoriGasXMisuratore.setNCifre(rs.getString("N_CIFRE"));
    lavoriGasXMisuratore.setStato(rs.getString("STATO"));
    lavoriGasXMisuratore.setDataAutolettura(rs.getDate("DATA_AUTOLETTURA"));
    lavoriGasXMisuratore.setValoreAutolettura(rs.getString("VALORE_AUTOLETTURA"));
    lavoriGasXMisuratore.setDataDisattivazione(rs.getDate("DATA_DISATTIVAZIONE"));
    return lavoriGasXMisuratore;
  }

}
