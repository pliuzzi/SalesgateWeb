package eu.a2a.salesgate.motivazioni.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;

public class MotivazioneJdbcHandler extends JdbcHandler<Motivazione> {
	@Override
	protected Motivazione createObjectFromResultSet(ResultSet rs) throws SQLException {
		Motivazione m = new Motivazione();
		MotivazioneVenditore mv = new MotivazioneVenditore();
		m.setId(rs.getString("id"));
		m.setCodiceCausale(rs.getString("codice_causale"));
		m.setMotivazioneDistributore(rs.getString("motivazione_distributore"));
		mv.setId(rs.getString("id_venditore"));
		mv.setCodiceInterno(rs.getString("codice_interno"));
		mv.setMotivazione(rs.getString("motivazione_venditore"));
		m.setMotivazioneVenditore(mv);
		m.setAttivo(rs.getString("attivo"));
		return m;
	}
}
