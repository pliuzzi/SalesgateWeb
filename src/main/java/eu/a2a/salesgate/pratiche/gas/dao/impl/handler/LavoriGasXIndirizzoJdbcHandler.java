package eu.a2a.salesgate.pratiche.gas.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGasXIndirizzo;

public class LavoriGasXIndirizzoJdbcHandler extends JdbcHandler<LavoriGasXIndirizzo> {

  @Override
  protected LavoriGasXIndirizzo createObjectFromResultSet(ResultSet rs) throws SQLException {
    LavoriGasXIndirizzo lavoriGasXIndirizzo = new LavoriGasXIndirizzo();
    lavoriGasXIndirizzo.setId(rs.getString("ID"));
    lavoriGasXIndirizzo.setToponimo(rs.getString("TOPONIMO"));
    lavoriGasXIndirizzo.setVia(rs.getString("VIA"));
    lavoriGasXIndirizzo.setCivico(rs.getString("CIVICO"));
    lavoriGasXIndirizzo.setScala(rs.getString("SCALA"));
    lavoriGasXIndirizzo.setPiano(rs.getString("PIANO"));
    lavoriGasXIndirizzo.setInterno(rs.getString("INTERNO"));
    lavoriGasXIndirizzo.setCap(rs.getString("CAP"));
    lavoriGasXIndirizzo.setIstat(rs.getString("ISTAT"));
    lavoriGasXIndirizzo.setComune(rs.getString("COMUNE"));
    lavoriGasXIndirizzo.setProvincia(rs.getString("PROVINCIA"));
    lavoriGasXIndirizzo.setNazione(rs.getString("NAZIONE"));
    lavoriGasXIndirizzo.setPresso(rs.getString("PRESSO"));
    lavoriGasXIndirizzo.setCreated(rs.getDate("CREATED"));
    lavoriGasXIndirizzo.setLastUpdated(rs.getDate("LAST_UPDATED"));
    return lavoriGasXIndirizzo;
  }

}
