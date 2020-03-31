package pickme.com.a.login.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import pickme.com.a.login.service.LoginServiceImpl;

public class UserAuthProvider implements AuthenticationProvider {
	
	@Autowired
	private UserDetailsService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
//	protected final Logger logger = LoggerFactory.getLogger(UserAuthProvider.class);

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("Authentication start...");
		String id = (String)authentication.getPrincipal();
		String rawPassword = (String)authentication.getCredentials();
		System.out.println("id / pwd: " + id + ", " + rawPassword);
		UserDetails user = service.loadUserByUsername(id);
		
		if(!bCryptPasswordEncoder.matches(rawPassword, user.getPassword())) {
			System.out.println("Dismatched.");
			throw new BadCredentialsException(id);
		}
		
		if(!user.isEnabled()) {
			System.out.println("User is enabled.");
			throw new BadCredentialsException(id);
		}
		return new UsernamePasswordAuthenticationToken(id, rawPassword, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
}
