package pickme.com.a.c_mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CMemberMypageDto;
import pickme.com.a.c_mypage.dao.CMypageDao;

@Service
public class CMypageServiceImpl implements CMypageService{
	
	@Autowired
	CMypageDao dao;

	@Override
	public CMemberMypageDto dateTest(CMemberMypageDto dto) {
		return dao.dateTest(dto);
	}

	
}
