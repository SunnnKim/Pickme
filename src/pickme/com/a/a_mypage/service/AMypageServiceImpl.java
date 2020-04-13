package pickme.com.a.a_mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import pickme.com.a.a_mypage.dao.AMypageDao;

@Service
public class AMypageServiceImpl implements AMypageService{
	
	@Autowired
	AMypageDao dao;
	
	// 프로필
	@Override
	public boolean profileUpdate(AMemberDto dto) {
		return dao.profileUpdate(dto);
	}
	
	
}
