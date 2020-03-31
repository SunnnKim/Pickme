package pickme.com.a.login.service;

import model.User;

public interface LoginService {
	public String idCheck(String id);
	public void signup(User user);
}
