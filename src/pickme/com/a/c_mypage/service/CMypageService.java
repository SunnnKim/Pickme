package pickme.com.a.c_mypage.service;

import java.util.List;

import model.CMemberDto;

public interface CMypageService {

	CMemberDto dateTest(CMemberDto dto);

	public void goCMypage(CMemberDto dto);

	public void goUpdate(CMemberDto dto);

	public void goWithdrawal(CMemberDto dto);
}
