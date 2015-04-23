package eu.a2a.salesgate.security.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.dao.base.AbstractDAO;
import eu.a2a.salesgate.security.bean.User;
import eu.a2a.salesgate.security.dao.UserSecurityDAO;
import eu.a2a.salesgate.security.dao.impl.handler.UserJdbcHandler;

@Repository
public class UserSecurityDAOImpl extends AbstractDAO implements UserSecurityDAO {

  @Autowired
  private JdbcTemplate jdbcTemplateSalesgate;

  @Autowired
  private UserJdbcHandler userJdbcHandler;

  @Override
  public User findUserByUsername(String username) {
    User user = jdbcTemplateSalesgate.query("select * from users where username = ?", userJdbcHandler.getResultSetExtractor(), username);
    return user;
  }
  
  @Override
	public boolean verifyUser(String user) {
		int nRow = 0;
		String query = "SELECT COUNT(*) FROM USER_CAUSALI_INAMMISSIBILITA WHERE LOGIN_NAME = '" + user + "'";
		nRow = jdbcTemplateSalesgate.queryForObject(query, Integer.class);
		if (nRow != 0) {
			return true;
		}
		return false;
	}

}
