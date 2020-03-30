package pickme.com.a.login.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.authentication.AuthenticationProvider;

public class UserAuthProvider implements AuthenticationProvider {
	
	@Autowired
	private UserDetailsService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = (String)authentication.getPrincipal();
		String rawPassword = (String)authentication.getCredentials();
		UserDetails user = service.loadUserByUsername(id);
		
		if(!bCryptPasswordEncoder.matches(rawPassword, user.getPassword())) {
			throw new BadCredentialsException(id);
		}
		
		if(!user.isEnabled()) {
			throw new BadCredentialsException(id);
		}
		return new UsernamePasswordAuthenticationToken(id, rawPassword, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return false;
	}
}
