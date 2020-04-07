package pickme.com.a.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import model.CMemberDtoTest;
import pickme.com.a.login.dao.LoginDao;

@Service
public class CustomUserDetailsServiceForCompany implements LoginServiceForCompany, UserDetailsService {

   @Autowired
   private LoginDao dao;
   
   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      // TODO Auto-generated method stub
      // override의 파라미터 변수 username과 혼동되지 않도록 email 변수에 담아서 사용. (username = 클라이언트 아이디)
      String email = username;
      CMemberDtoTest member = dao.getMemberByEmailForCompany(email);
      if(member == null) {
         System.out.println("[CustomUserDetailsServiceForCompany] Can't to find company user.");
         throw new UsernameNotFoundException(email);
      }
      
      System.out.println("[CustomUserDetailsServiceForCompany] Success!");
      return member;
   }

   @Override
   public String emailCheck(String email) {
      return dao.emailCheckForCompany(email);
   }
   
   @Override
   public void signup(AMemberDto member) {
      dao.signupForCompany(member);
   }

}