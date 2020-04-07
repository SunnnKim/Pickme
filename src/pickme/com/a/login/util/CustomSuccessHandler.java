package pickme.com.a.login.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import model.AMemberDto;
import pickme.com.a.login.service.CustomUserDetailsService;

public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	CustomUserDetailsService service;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("[CustomSuccessHandler] Access permited by successHandler.");
		String id = (String) authentication.getPrincipal();
		AMemberDto user = (AMemberDto) service.loadUserByUsername(id);
		user.setPassword("");
		System.out.println("석세스 핸들러 : " + user );
		HttpSession session = request.getSession();
		session.setAttribute("loginuser", user);
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
