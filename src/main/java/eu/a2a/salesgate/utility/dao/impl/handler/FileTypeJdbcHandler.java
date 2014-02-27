package eu.a2a.salesgate.utility.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import eu.a2a.salesgate.bean.FileType;
import eu.a2a.salesgate.dao.handler.base.JdbcHandler;

public class FileTypeJdbcHandler extends JdbcHandler<FileType> {

  @Override
  protected FileType createObjectFromResultSet(ResultSet rs) throws SQLException {

    FileType ft = new FileType();
    ft.setId(rs.getString("id"));
    ft.setCode(rs.getString("code"));
    ft.setDescription(rs.getString("description"));
    ft.setMimeType(rs.getString("mime_type"));
    ft.setIsTemplate(rs.getString("is_template"));

    return ft;
  }

}
