package eu.a2a.salesgate.security.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.a2a.salesgate.security.bean.User;
import eu.a2a.salesgate.security.dao.UserSecurityDAO;
import eu.a2a.salesgate.security.service.UserSecurityService;
import eu.a2a.salesgate.service.base.AbstractService;

@Service
public class UserSecurityServiceImpl extends AbstractService implements UserSecurityService {

  @Autowired
  private UserSecurityDAO userSecurityDAO;

  @Override
  public User getUserByUsername(String username) {
    User user = userSecurityDAO.findUserByUsername(username);
    return user;
  }
  
  @Override
  public boolean verifyUser(String user) {
	  return userSecurityDAO.verifyUser(user);
  }

}
