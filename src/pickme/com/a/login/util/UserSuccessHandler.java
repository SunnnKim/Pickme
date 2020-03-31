package pickme.com.a.login.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import model.User;
import pickme.com.a.login.service.LoginServiceImpl;

public class UserSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	LoginServiceImpl service;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String id = (String) authentication.getPrincipal();
		User user = (User) service.loadUserByUsername(id);
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
