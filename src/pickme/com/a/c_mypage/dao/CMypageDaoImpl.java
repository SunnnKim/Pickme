package pickme.com.a.c_mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CMemberMypageDto;

@Repository
public class CMypageDaoImpl implements CMypageDao{
	
	@Autowired
	SqlSession session;
	
	String nameSpace = "payment.";

	@Override
	public CMemberMypageDto dateTest(CMemberMypageDto dto) {
		CMemberMypageDto dtoList = session.selectOne(nameSpace + "TestAll", dto);
		return dtoList;
	}
	
	
}
