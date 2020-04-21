package pickme.com.a.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AMemberDto;
import model.AdminDto;
import model.CMemberDto;



@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Admin.";
	
	// 관리자 로그인 
	@Override
	public AdminDto loginCheck(AdminDto dto) {
		return sqlSession.selectOne(namespace + "loginCheck", dto);
	}
	
	// 일반 회원 데이터 모두 가져오기 
	@Override
	public List<AMemberDto> aMemberAll() {
		return sqlSession.selectList( namespace + "amemberAll");
	}
	// 3일간 가입한 신규 회원 수  
	@Override
	public int countNewAMember() {
		return sqlSession.selectOne(namespace + "countNewAMember");
	}

	@Override
	public int countAmember() {
		return sqlSession.selectOne(namespace + "countAllAMember");
	}

	@Override
	public int countCmember() {
		return sqlSession.selectOne(namespace + "countAllCMember");
	}

	@Override
	public List<CMemberDto> cMemberAll() {
		return sqlSession.selectList( namespace + "cmemberAll");
	}

	@Override
	public int countNewCMember() {
		return sqlSession.selectOne(namespace + "countNewCMember");
	}

	
	
	
}
