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
	
	// 기업 정보 수정
	public void update(CMemberDto dto);

	
	// 주소 불러오기
	public CMemberDto showAddress(CMemberDto dto);
	
	// 연락처 불러오기
	public CMemberDto showTel(CMemberDto dto);

	// 흑흑
	public CMemberDto select(int seq);
	
	// 로고 업로드
	public boolean uploadLogo(CMemberDto dto);
}
