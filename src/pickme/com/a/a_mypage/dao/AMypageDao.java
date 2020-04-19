package pickme.com.a.a_mypage.dao;

import model.AMemberDto;

public interface AMypageDao {
	
	
	// 프로필 정보 보여주기
	public AMemberDto profileSelect(int seq);
	
	// 프로필 업데이트
	public boolean profileUpdate(AMemberDto dto);
	
	
	
}
