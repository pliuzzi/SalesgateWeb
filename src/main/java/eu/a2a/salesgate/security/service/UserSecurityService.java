package eu.a2a.salesgate.security.service;

import eu.a2a.salesgate.security.bean.User;

public interface UserSecurityService {

	User getUserByUsername(String username);

}
