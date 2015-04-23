package eu.a2a.salesgate.fileuploader.dao.impl.handler;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tika.io.IOUtils;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.fileuploader.bean.FileUploaderInstanceItem;

public class FileUploaderInstanceItemJdbcHandler extends JdbcHandler<FileUploaderInstanceItem> {
	@Override
	protected FileUploaderInstanceItem createObjectFromResultSet(ResultSet rs) throws SQLException {
		FileUploaderInstanceItem instance = new FileUploaderInstanceItem();
		if (contains("obj_id")) {
			instance.setId(rs.getString("obj_id"));
		}
		if(contains("cd_evento")) {
			instance.setEventCode(rs.getString("cd_evento"));
		}
		if(contains("cd_stato") && contains("status")) {
			instance.setStato(new CodDescBean(rs.getString("cd_stato"), rs.getString("status")));
		}
		if(contains("file_name")) {
			instance.setFileName(rs.getString("file_name"));
		}
		if(contains("d_post_timestamp")) {
			instance.setDataCreazione(rs.getString("d_post_timestamp"));
		}
		if(contains("d_get_timestamp")) {
			instance.setDataInizioLavorazione(rs.getString("d_get_timestamp"));
		}
		if(contains("d_end_timestamp")) {
			instance.setdataFineLavorazione(rs.getString("d_end_timestamp"));
		}
		if(contains("record_processati")) {
			instance.setRecordProcessati(rs.getInt("record_processati"));
		}
		if(contains("record_scartati")) {
			instance.setRecordScartati(rs.getInt("record_scartati"));
		}
		if(contains("record_totali")) {
			instance.setRecordTotali(rs.getInt("record_totali"));
		}
		if(contains("link_file_scartati")) {
			instance.setLinkFileScarti(rs.getString("link_file_scarti"));
		}
		if(contains("file_scarti")) {
			try {
				InputStream is = rs.getBinaryStream("file_scarti");
				if(is != null) {
					instance.setFileScarti(IOUtils.toByteArray(is));
				}
			}
			catch(IOException e) {
				instance.setFileScarti(null);
				e.printStackTrace();
			}
		}
		return instance;
	}

}
