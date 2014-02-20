package eu.a2a.salesgate.security.dao;

import eu.a2a.salesgate.security.bean.User;

public interface UserSecurityDAO {

	User findUserByUsername(String username);

}
