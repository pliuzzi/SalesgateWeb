package eu.a2a.salesgate.fileuploader.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderItem;
import eu.a2a.salesgate.venditori.bean.factory.VenditoriFactory;

public class FileUploaderItemVenditoreJdbcHandler extends JdbcHandler<FileUploaderItem> {
	@Override
	protected FileUploaderItem createObjectFromResultSet(ResultSet rs) throws SQLException {
		FileUploaderItem fuItem = new FileUploaderItem();
		fuItem.setVenditore(VenditoriFactory.newVenditore(rs.getString("fk_distributore"), rs.getString("name"), ""));
		fuItem.setUtility(rs.getString("fk_utility"));
		fuItem.setEventCode(rs.getString("event_code"));
		fuItem.setFlusso(new AnagFlussi(rs.getString("fk_cod_flusso"), ""));
		fuItem.setServizio(new AnagRichieste(rs.getString("fk_cod_servizio"), ""));
		return fuItem;
	}
}
