package pickme.com.a.login.util;

import java.util.List;

import org.springframework.context.ApplicationListener;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;

public class SessionDestroyListener implements ApplicationListener<SessionDestroyedEvent>{

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		// TODO Auto-generated method stub
		List<SecurityContext> securityContexts = event.getSecurityContexts();
		
		for(SecurityContext sc : securityContexts) {
			System.out.println("[SessionDestroyListener] " + sc.getAuthentication().getPrincipal());
		}
	}
}
