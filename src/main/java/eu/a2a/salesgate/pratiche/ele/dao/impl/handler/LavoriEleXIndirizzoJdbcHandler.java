package eu.a2a.salesgate.pratiche.ele.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXIndirizzo;

public class LavoriEleXIndirizzoJdbcHandler extends JdbcHandler<LavoriEleXIndirizzo> {

  @Override
  protected LavoriEleXIndirizzo createObjectFromResultSet(ResultSet rs) throws SQLException {
    LavoriEleXIndirizzo lavoriEleXIndirizzo = new LavoriEleXIndirizzo();
    lavoriEleXIndirizzo.setId(rs.getString("ID"));
    lavoriEleXIndirizzo.setToponimo(rs.getString("TOPONIMO"));
    lavoriEleXIndirizzo.setVia(rs.getString("VIA"));
    lavoriEleXIndirizzo.setCivico(rs.getString("CIVICO"));
    lavoriEleXIndirizzo.setScala(rs.getString("SCALA"));
    lavoriEleXIndirizzo.setPiano(rs.getString("PIANO"));
    lavoriEleXIndirizzo.setInterno(rs.getString("INTERNO"));
    lavoriEleXIndirizzo.setCap(rs.getString("CAP"));
    lavoriEleXIndirizzo.setIstat(rs.getString("ISTAT"));
    lavoriEleXIndirizzo.setComune(rs.getString("COMUNE"));
    lavoriEleXIndirizzo.setProvincia(rs.getString("PROVINCIA"));
    lavoriEleXIndirizzo.setNazione(rs.getString("NAZIONE"));
    lavoriEleXIndirizzo.setPresso(rs.getString("PRESSO"));
    lavoriEleXIndirizzo.setCreated(rs.getDate("CREATED"));
    lavoriEleXIndirizzo.setLastUpdated(rs.getDate("LAST_UPDATED"));
    return lavoriEleXIndirizzo;
  }

}
