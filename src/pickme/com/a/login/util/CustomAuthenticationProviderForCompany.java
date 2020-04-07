package pickme.com.a.login.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import pickme.com.a.login.service.CustomUserDetailsServiceForCompany;

public class CustomAuthenticationProviderForCompany implements AuthenticationProvider {
	
	@Autowired
	private CustomUserDetailsServiceForCompany service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("[CustomAuthenticationProviderForCompany] Authentication start...");
		String email = (String)authentication.getPrincipal();
		String rawPassword = (String)authentication.getCredentials();
		
		System.out.println("[CustomAuthenticationProviderForCompany] input email & pwd: " + email + ", " + rawPassword);
		UserDetails member = service.loadUserByUsername(email);
		
		if(!bCryptPasswordEncoder.matches(rawPassword, member.getPassword())) {
			System.out.println("[CustomAuthenticationProviderForCompany] Password dismatched.");
			throw new BadCredentialsException(email);
		}
		
		if(!member.isEnabled()) {
			System.out.println("[CustomAuthenticationProviderForCompany] Disabled member.");
			throw new BadCredentialsException(email);
		}
		return new UsernamePasswordAuthenticationToken(email, rawPassword, member.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
}
