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
    file.setId(rs.getString("id"));
    file.setNomeFile(rs.getString("NOME_FILE"));
    file.setStatoFile(rs.getString("STATO_FILE"));
    try {
      InputStream is = rs.getBinaryStream("FILE_DATA");
      if (is != null)
        file.setFileData(IOUtils.toByteArray(is));
    } catch (IOException e) {
      file.setFileData(null);
      e.printStackTrace();
    }
    file.setContaRighe(rs.getInt("CONTA_RIGHE"));
    file.setClosedDate(rs.getDate("CLOSED_DATE"));
    file.setClosedBy(rs.getString("CLOSED_BY"));
    file.setCreated(rs.getDate("CLOSED_BY"));
    return file;
  }

}
