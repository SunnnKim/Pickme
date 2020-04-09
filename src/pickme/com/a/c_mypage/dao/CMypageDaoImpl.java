package pickme.com.a.c_mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CMemberDto;

@Repository
public class CMypageDaoImpl implements CMypageDao{
	
	@Autowired
	SqlSession session;
	
	String nameSpace = "cMember.";

	@Override
	public CMemberDto dateTest(CMemberDto dto) {
		CMemberDto dtoList = session.selectOne(nameSpace + "TestAll", dto);
		return dtoList;
	}

	
	// 기업 마이페이지 이동
	@Override
	public void goCMypage(CMemberDto dto) {
		session.selectList(nameSpace + "goCMypage", dto);
	}

	
	// 기업 정보 수정페이지 이동
	@Override
	public void goUpdate(CMemberDto dto) {
		session.selectList(nameSpace + "goUpdate", dto);
	}

	
	// 기업 탈퇴페이지 이동
	@Override
	public void goWithdrawal(CMemberDto dto) {
		session.selectList(nameSpace + "goWithdrawal", dto);
	}
	
	
}
