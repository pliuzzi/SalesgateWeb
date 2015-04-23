package eu.a2a.salesgate.motivazioni.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;

public class MotivazioneVenditoreJdbcHandler extends JdbcHandler<MotivazioneVenditore> {
	@Override
	protected MotivazioneVenditore createObjectFromResultSet(ResultSet rs) throws SQLException {
		MotivazioneVenditore mv = new MotivazioneVenditore();
		mv.setId(rs.getString("id"));
		mv.setCodiceInterno(rs.getString("codice_causale"));
		mv.setMotivazione(rs.getString("motivazione"));
		return mv;
	}
}
