package pickme.com.a.c_mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CMemberDto;
import pickme.com.a.c_mypage.dao.CMypageDao;

@Service
public class CMypageServiceImpl implements CMypageService{
	
	@Autowired
	CMypageDao dao;

	@Override
	public CMemberDto dateTest(CMemberDto dto) {
		return dao.dateTest(dto);
	}

	
	// 기업 마이페이지 이동
	@Override
	public void goCMypage(CMemberDto dto) {
		dao.goCMypage(dto);
	}

	
	// 기업 정보 수정페이지 이동
	@Override
	public void goUpdate(CMemberDto dto) {
		dao.goUpdate(dto);
	}

	
	// 기업 탈퇴 페이지 이동
	@Override
	public void goWithdrawal(CMemberDto dto) {
		dao.goWithdrawal(dto);
	}

	
}
