package eu.a2a.salesgate.files.dao.impl.handler;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.io.IOUtils;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.files.bean.Files;

public class FilesJdbcHandler extends JdbcHandler<Files> {

  @Override
  protected Files createObjectFromResultSet(ResultSet rs) throws SQLException {
    Files file = new Files();
    if (contains("id")) {
      file.setId(rs.getString("id"));
    }
    if (contains("nome_file")) {
      file.setNomeFile(rs.getString("NOME_FILE"));
    }
    if (contains("stato_file")) {
      file.setStatoFile(rs.getString("STATO_FILE"));
    }
    if (contains("cod_flusso")) {
      file.setCodiceFlusso(rs.getString("cod_flusso"));
    }
    if (contains("FILE_DATA")) {
      try {
        InputStream is = rs.getBinaryStream("FILE_DATA");
        if (is != null) {
          file.setFileData(IOUtils.toByteArray(is));
        }
      } catch (IOException e) {
        file.setFileData(null);
        e.printStackTrace();
      }
    }
    if (contains("CONTA_RIGHE")) {
      file.setContaRighe(rs.getInt("CONTA_RIGHE"));
    }
    if (contains("CLOSED_DATE")) {
      file.setClosedDate(rs.getDate("CLOSED_DATE"));
    }
    if (contains("CLOSED_BY")) {
      file.setClosedBy(rs.getString("CLOSED_BY"));
    }
    if (contains("CREATED")) {
      file.setCreated(rs.getDate("CREATED"));
    }
    return file;
  }

}
