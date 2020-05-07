package pickme.com.a.login.service;

import java.util.List;

import model.AMemberDto;
import model.CMemberDto;
import model.NoticeDto;
import model.RecruitDto;

public interface LoginService {
   public String emailCheck(String email);
   public void signup(AMemberDto member);
   public void emailValidateA(AMemberDto member);
   public AMemberDto updateSession(String email);
   // 일반회원 비밀번호 변경시 현재 비밀번호 입력
   public boolean checkPasswordA(AMemberDto memberDto);
   // 기업회원 비밀번호 변경
   public boolean updatePasswordA(AMemberDto memberDto);
   // 기업회원 탈퇴하기
   public boolean withdrawMemberA(int seq);
   // 일반회원 이메일 있는지 확인하기 
   public boolean getLostEmailA(AMemberDto dto);
   // 일반회원 이메일 있는지 확인하기 2
	public boolean getLostEmailA2(AMemberDto dto);
   // 일반회원 비밀번호 변경하기 
	public boolean changePwdWithCodeA(AMemberDto member);
	
	
	// 메인 금주의 채용
	public List<RecruitDto> mainTopRec();
	// 메인 공지사항 뽑아오기 
	public List<NoticeDto> getMainNotice();
	// 메인 추천 기업 
	public List<CMemberDto> mainTopCompany();
	
	
}