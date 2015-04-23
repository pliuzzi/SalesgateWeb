package eu.a2a.salesgate.fileuploader.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.AnagFlussi;
import eu.a2a.salesgate.bean.AnagRichieste;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.distributori.bean.factory.DistributoreFactory;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderItem;

public class FileUploaderItemJdbcHandler extends JdbcHandler<FileUploaderItem> {
	@Override
	protected FileUploaderItem createObjectFromResultSet(ResultSet rs) throws SQLException {
		FileUploaderItem fuItem = new FileUploaderItem();
		fuItem.setDistributore(DistributoreFactory.newDistributore(rs.getString("fk_distributore"), rs.getString("name"), ""));
		fuItem.setUtility(rs.getString("utility"));
		fuItem.setEventCode(rs.getString("event_code"));
		fuItem.setFlusso(new AnagFlussi(rs.getString("fk_cod_flusso"), ""));
		fuItem.setServizio(new AnagRichieste(rs.getString("fk_cod_servizio"), ""));
		return fuItem;
	}
}
