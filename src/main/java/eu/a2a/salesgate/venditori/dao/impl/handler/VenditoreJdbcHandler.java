package eu.a2a.salesgate.venditori.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.venditori.bean.Venditore;

public class VenditoreJdbcHandler extends JdbcHandler<Venditore>  {
	@Override
	protected Venditore createObjectFromResultSet(ResultSet rs) throws SQLException {
		Venditore venditore = new Venditore();
		venditore.setId(rs.getString("ID"));
		venditore.setNome(rs.getString("NAME"));
		venditore.setPtIva(rs.getString("PT_IVA"));
		venditore.setAttivo(rs.getString("FLAG_ATTIVO"));
		venditore.setTmsCreated(rs.getString("TMS_CREATED"));
		venditore.setUsrCreated(rs.getString("USR_CREATED"));
		venditore.setTmsUpdated(rs.getString("TMS_UPDATED"));
		venditore.setUsrUpdated(rs.getString("USR_UPDATED"));
		return venditore;
	}
}
