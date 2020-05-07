package pickme.com.a.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import model.CMemberDto;
import model.NoticeDto;
import model.RecruitDto;
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

	@Override
	public boolean checkPasswordA(AMemberDto memberDto) {
		return dao.checkPasswordA(memberDto);
	}

	@Override
	public boolean updatePasswordA(AMemberDto memberDto) {
		return dao.updatePasswordA(memberDto);
	}

	@Override
	public boolean withdrawMemberA(int seq) {
		return dao.withdrawMemberA(seq);
	}

	@Override
	public boolean getLostEmailA(AMemberDto dto) {
		return dao.getLostEmailA(dto);
	}

	@Override
	public boolean changePwdWithCodeA(AMemberDto member) {
		return dao.changePwdWithCodeA(member);
	}

	@Override
	public boolean getLostEmailA2(AMemberDto dto) {
		return dao.getLostEmailA2(dto);
	}

	@Override
	public List<RecruitDto> mainTopRec() {
		return dao.mainTopRec();
	}

	@Override
	public List<NoticeDto> getMainNotice() {
		return dao.getMainNotice();
	}

	@Override
	public List<CMemberDto> mainTopCompany() {
		return dao.mainTopCompany();
	}


}