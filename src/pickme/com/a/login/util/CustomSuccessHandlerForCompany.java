package pickme.com.a.login.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import model.CMemberDto;
import pickme.com.a.login.service.CustomUserDetailsServiceForCompany;

public class CustomSuccessHandlerForCompany extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	CustomUserDetailsServiceForCompany service;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("[CustomSuccessHandlerForCompany] Access permited by successHandler.");
		String id = (String) authentication.getPrincipal();
		CMemberDto company = (CMemberDto) service.loadUserByUsername(id);
		company.setPassword("");
		System.out.println("기업용 석세스 핸들러 : " + company );
		HttpSession session = request.getSession(); 
		session.setAttribute("logincompany", company);
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
