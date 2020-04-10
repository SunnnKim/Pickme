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
}
