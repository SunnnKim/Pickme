package pickme.com.a.login.service;

import model.AMemberDto;

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
}