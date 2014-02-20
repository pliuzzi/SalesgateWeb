package eu.a2a.salesgate.security.dao.impl.handler;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import eu.a2a.salesgate.dao.handler.base.JdbcHandler;
import eu.a2a.salesgate.security.bean.User;

@Component
public final class UserJdbcHandler extends JdbcHandler<User> {

	@Override
	protected User createObjectFromResultSet(ResultSet rs) throws SQLException {
		User user = null;
		user = new User(rs.getString("id"), rs.getString("first_name"),
				rs.getString("last_name"), rs.getString("username"),
				rs.getString("username"));
		return user;
	}

}
