package eu.a2a.salesgate.dao.handler.base;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

public abstract class JdbcHandler<T> {

	protected abstract T createObjectFromResultSet(ResultSet rs)
			throws SQLException;

	public ResultSetExtractor<T> getResultSetExtractor() {
		return new ResultSetExtractor<T>() {

			@Override
			public T extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					return createObjectFromResultSet(rs);
				} else {
					throw new SQLException("ResultSet Finito!");
				}
			}
		};
	}

	public RowMapper<T> getRowMapper() {
		return new RowMapper<T>() {

			@Override
			public T mapRow(ResultSet rs, int rowNum) throws SQLException {
				return createObjectFromResultSet(rs);
			}
		};
	}

}
