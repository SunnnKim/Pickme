	package pickme.com.a.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import model.User;
import pickme.com.a.login.dao.LoginDao;

@Service
public class LoginServiceImpl implements LoginService, UserDetailsService {

	@Autowired
	private LoginDao mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("[LoginServiceImpl] Searching input id: " + username);
		UserDetails userDetails = mapper.login(username);
		if(userDetails == null) {
			System.out.println("[LoginServiceImpl] Fail to find user");
			throw new UsernameNotFoundException(username);
		}
		System.out.println("[LoginServiceImpl] Success..");
		return userDetails;
	}

	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		return mapper.idCheck(id);
	}

	@Override
	public void signup(User user) {
		// TODO Auto-generated method stub
		mapper.signup(user);
	}

}
