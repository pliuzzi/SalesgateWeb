package eu.a2a.salesgate.pratiche.gas.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.pratiche.gas.beans.LavoriGasXCliente;

public class LavoriGasXClienteJdbcHandler extends JdbcHandler<LavoriGasXCliente> {

  @Override
  protected LavoriGasXCliente createObjectFromResultSet(ResultSet rs) throws SQLException {

    LavoriGasXCliente lavoriGasXCliente = new LavoriGasXCliente();
    lavoriGasXCliente.setId(rs.getString("ID"));
    lavoriGasXCliente.setNome(rs.getString("NOME"));
    lavoriGasXCliente.setCognome(rs.getString("COGNOME"));
    lavoriGasXCliente.setRagioneSociale(rs.getString("RAGIONE_SOCIALE"));
    lavoriGasXCliente.setPiva(rs.getString("PIVA"));
    lavoriGasXCliente.setCodFis(rs.getString("COD_FIS"));
    lavoriGasXCliente.setTelefono(rs.getString("TELEFONO"));
    lavoriGasXCliente.setCellulare(rs.getString("CELLULARE"));
    lavoriGasXCliente.setEmail(rs.getString("EMAIL"));
    lavoriGasXCliente.setFax(rs.getString("FAX"));
    lavoriGasXCliente.setCreated(rs.getDate("CREATED"));
    lavoriGasXCliente.setLastUpdated(rs.getDate("LAST_UPDATED"));
    return lavoriGasXCliente;
  }

}
