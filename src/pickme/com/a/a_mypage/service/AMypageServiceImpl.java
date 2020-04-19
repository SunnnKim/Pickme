package pickme.com.a.a_mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import pickme.com.a.a_mypage.dao.AMypageDao;

@Service
public class AMypageServiceImpl implements AMypageService{
	
	@Autowired
	AMypageDao dao;
	
	// 프로필 정보 보여주기
	@Override
	public AMemberDto profileSelect(int seq) {		
		return dao.profileSelect(seq);
	}
	
	// 프로필 업데이트
	@Override
	public boolean profileUpdate(AMemberDto dto) {
		return dao.profileUpdate(dto);
	}

	
	
	
}
