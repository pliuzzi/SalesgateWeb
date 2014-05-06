package eu.a2a.salesgate.dao.handler.base;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Vector;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

public abstract class JdbcHandler<T> {

  protected abstract T createObjectFromResultSet(ResultSet rs) throws SQLException;

  protected Vector<String> columnNames;

  public ResultSetExtractor<T> getResultSetExtractor() {

    return new ResultSetExtractor<T>() {

      @Override
      public T extractData(ResultSet rs) throws SQLException, DataAccessException {
        initColumnNames(rs);
        if (rs.next()) {
          return createObjectFromResultSet(rs);
        } else {
          return null;
        }
      }
    };
  }

  public RowMapper<T> getRowMapper() {
    return new RowMapper<T>() {

      @Override
      public T mapRow(ResultSet rs, int rowNum) throws SQLException {
        initColumnNames(rs);
        return createObjectFromResultSet(rs);
      }
    };
  }

  protected void initColumnNames(ResultSet rs) throws SQLException {
    ResultSetMetaData rsmd = rs.getMetaData();
    columnNames = new Vector<>();
    for (int i = 1; i <= rsmd.getColumnCount(); i++) {
      columnNames.add(rsmd.getColumnLabel(i).toLowerCase());
    }
  }

  protected boolean contains(String columnName) {
    return columnNames.contains(columnName.toLowerCase());
  }
}
