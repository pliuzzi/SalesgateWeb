package eu.a2a.salesgate.template.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.template.bean.Campo;

public class CampoJdbcHandler extends JdbcHandler<Campo> {

  @Override
  protected Campo createObjectFromResultSet(ResultSet rs) throws SQLException {

    Campo campo = new Campo();

    campo.setId(rs.getString("id"));
    campo.setNomeLogico(rs.getString("nome_logico"));
    campo.setNomeFisico(rs.getString("nome_fisico"));
    campo.setCategoria(rs.getString("categoria"));

    if (contains("posizione")) {
      campo.setPosizione(rs.getInt("posizione"));
    }

    return campo;
  }
}
