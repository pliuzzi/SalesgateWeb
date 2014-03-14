package eu.a2a.salesgate.security.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import eu.a2a.salesgate.security.bean.User;
import eu.a2a.salesgate.security.dao.UserSecurityDAO;
import eu.a2a.salesgate.security.dao.impl.handler.UserJdbcHandler;

@Repository
public class UserSecurityDAOImpl implements UserSecurityDAO {

  @Autowired
  private JdbcTemplate jdbcTemplateSalesgate;

  @Autowired
  private UserJdbcHandler userJdbcHandler;

  @Override
  public User findUserByUsername(String username) {
    User user = jdbcTemplateSalesgate.query("select * from users where username = ?", userJdbcHandler.getResultSetExtractor(), username);
    return user;
  }

}
