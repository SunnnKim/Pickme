package pickme.com.a.login.service;

import model.CMemberDto;

public interface LoginServiceForCompany {
   public String emailCheck(String email);
   public void signup(CMemberDto member);
   public void emailValidateC(CMemberDto member);
   public CMemberDto updateSession(String email);
   
   // 기업회원 비밀번호 변경시 현재 비밀번호 입력
   public boolean checkPasswordC(CMemberDto companyDto);
   // 기업회원 비밀번호 변경
   public boolean updatePasswordC(CMemberDto companyDto);
   // 기업회원 탈퇴하기
   public boolean withdrawMemberC(int seq);
   // 기업회원 이메일 있는지 확인하기
   public boolean getLostEmailC(CMemberDto dto);
   // 기업회원 이메일 있는지 확인하기 2
   public boolean getLostEmailC2(CMemberDto dto);
   // 일반회원 비밀번호 분실시 이메일로 변경하기 
   public boolean changePwdWithCodeC(CMemberDto member);
	// 기업 사업자등록번호 변경하기
	public boolean changeCompanyNumber(CMemberDto company);
   
}