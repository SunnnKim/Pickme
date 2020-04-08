package pickme.com.a.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import pickme.com.a.login.dao.LoginDao;

@Service
public class CustomUserDetailsService implements LoginService, UserDetailsService {

   @Autowired
   private LoginDao dao;
   
   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      // TODO Auto-generated method stub
      // override의 파라미터 변수 username과 혼동되지 않도록 email 변수에 담아서 사용. (username = 클라이언트 아이디)
      String email = username;
      AMemberDto member = dao.getMemberByEmail(email);
      if(member == null) {
         System.out.println("[CustomUserDetailsService] Can't to find user.");
         throw new UsernameNotFoundException(email);
      }
      
      System.out.println("[CustomUserDetailsService] Success!");
      return member;
   }

   @Override
   public String emailCheck(String email) {
      return dao.emailCheck(email);
   }
   
   @Override
   public void signup(AMemberDto member) {
      dao.signup(member);
   }

	@Override
	public void emailValidateA(AMemberDto member) {
		dao.emailValidateA(member);
	}

	@Override
	public AMemberDto updateSession(String email) {
		return dao.getMemberByEmail(email);
	}

}