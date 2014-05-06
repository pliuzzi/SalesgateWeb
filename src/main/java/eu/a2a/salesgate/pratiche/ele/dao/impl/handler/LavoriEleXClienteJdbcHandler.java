package eu.a2a.salesgate.pratiche.ele.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEleXCliente;

public class LavoriEleXClienteJdbcHandler extends JdbcHandler<LavoriEleXCliente> {

  @Override
  protected LavoriEleXCliente createObjectFromResultSet(ResultSet rs) throws SQLException {

    LavoriEleXCliente lavoriEleXCliente = new LavoriEleXCliente();
    lavoriEleXCliente.setId(rs.getString("ID"));
    lavoriEleXCliente.setNome(rs.getString("NOME"));
    lavoriEleXCliente.setCognome(rs.getString("COGNOME"));
    lavoriEleXCliente.setRagioneSociale(rs.getString("RAGIONE_SOCIALE"));
    lavoriEleXCliente.setPiva(rs.getString("PIVA"));
    lavoriEleXCliente.setCodFis(rs.getString("COD_FIS"));
    lavoriEleXCliente.setTelefono(rs.getString("TELEFONO"));
    lavoriEleXCliente.setCellulare(rs.getString("CELLULARE"));
    lavoriEleXCliente.setEmail(rs.getString("EMAIL"));
    lavoriEleXCliente.setFax(rs.getString("FAX"));
    lavoriEleXCliente.setCreated(rs.getDate("CREATED"));
    lavoriEleXCliente.setLastUpdated(rs.getDate("LAST_UPDATED"));
    return lavoriEleXCliente;
  }

}
