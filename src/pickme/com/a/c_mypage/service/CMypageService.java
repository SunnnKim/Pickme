package pickme.com.a.c_mypage.service;

import java.util.List;

import model.CMemberDto;

public interface CMypageService {

	CMemberDto dateTest(CMemberDto dto);

	// 기업 마이페이지 이동
	public void goCMypage(CMemberDto dto);
	
	// 기업 정보 수정 페이지 이동
	public void goUpdate(CMemberDto dto);

	// 기업 탈퇴 페이지 이동
	public void goWithdrawal(CMemberDto dto);
	
	// 기업 탈퇴
	public void withdrawal(CMemberDto dto);
	
	// 탈퇴를 위해 비밀번호 체크
	public boolean checkPassword(String email, String password);
	
	// 기업 정보 수정
	public void update(CMemberDto dto);
}
