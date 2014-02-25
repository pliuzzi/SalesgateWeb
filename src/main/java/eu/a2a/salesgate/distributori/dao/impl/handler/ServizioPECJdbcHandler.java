package eu.a2a.salesgate.distributori.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.distributori.bean.ServizioPEC;

public class ServizioPECJdbcHandler extends JdbcHandler<ServizioPEC> {

  @Override
  protected ServizioPEC createObjectFromResultSet(ResultSet rs) throws SQLException {

    ServizioPEC servizioPec = new ServizioPEC();
    servizioPec.setId(rs.getString("ID"));
    servizioPec.setDescription(rs.getString("DESCRIPTION"));
    servizioPec.setCodiceServizio(rs.getString("COD_SERVIZIO"));
    servizioPec.setCodiceDistributore(rs.getString("FK_DISTR"));
    servizioPec.setPecFrom(rs.getString("PEC_FROM_MAIL"));
    servizioPec.setPecUsername(rs.getString("PEC_FROM_USERNAME"));
    servizioPec.setPecPassword(rs.getString("PEC_FROM_PASSWORD"));
    servizioPec.setPecTo(rs.getString("PEC_TO_MAIL"));
    servizioPec.setSubject(rs.getString("SUBJECT"));
    servizioPec.setOraInizio(rs.getString("ORA_INIZIO"));
    servizioPec.setTempoReinvio(rs.getString("TEMPO_REINVIO"));

    return servizioPec;
  }
}
