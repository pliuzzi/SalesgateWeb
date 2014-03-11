package eu.a2a.salesgate.etl.dao.impl.handler;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.io.IOUtils;

import eu.a2a.salesgate.bean.CodDescBean;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.etl.bean.ETLInstanceItem;

public class ETLInstanceItemJdbcHandler extends JdbcHandler<ETLInstanceItem> {

  @Override
  protected ETLInstanceItem createObjectFromResultSet(ResultSet rs) throws SQLException {

    ETLInstanceItem instance = new ETLInstanceItem();

    instance.setId(rs.getString("obj_id"));
    instance.setEventCode(rs.getString("cd_evento"));
    instance.setStato(new CodDescBean(rs.getString("cd_stato"), rs.getString("status")));
    instance.setFileName(rs.getString("file_name"));
    instance.setDataCreazione(rs.getDate("d_post_timestamp"));
    instance.setDataInizioLavorazione(rs.getDate("d_get_timestamp"));
    instance.setDataFineLavorazione(rs.getDate("d_end_timestamp"));
    instance.setRecordProcessati(rs.getInt("record_processati"));
    instance.setRecordScartati(rs.getInt("record_scartati"));
    instance.setRecordTotali(rs.getInt("record_totali"));
    instance.setLinkFileScarti(rs.getString("link_file_scarti"));
    try {
      InputStream is = rs.getBinaryStream("file_scarti");
      if (is != null) {
        instance.setFileScarti(IOUtils.toByteArray(is));
      }
    } catch (IOException e) {
      instance.setFileScarti(null);
      e.printStackTrace();
    }

    return instance;
  }

}
