package pickme.com.a.c_mypage.dao;

import java.util.List;

import model.CMemberDto;

public interface CMypageDao {

	CMemberDto dateTest(CMemberDto dto);
	
	// 기업 마이페이지 이동
	public void goCMypage(CMemberDto dto);

	// 기업 정보 수정페이지 이동
	public void goUpdate(CMemberDto dto);

	// 기업 탈퇴페이지 이동
	public void goWithdrawal(CMemberDto dto);
	
	// 기업 탈퇴
	public void withdrawal(CMemberDto dto);
	
	// 탈퇴를 위해 비밀번호 체크
	public boolean checkPassword(String email, String password);
	
	// 기업 정보 수정
	public void update(CMemberDto dto);

	
	// 주소 불러오기
	public CMemberDto showAddress(CMemberDto dto);
	
	// 연락처 불러오기
	public CMemberDto showTel(CMemberDto dto);

	// 수정 페이지 데이터 담기
	public CMemberDto select(int seq);
}
