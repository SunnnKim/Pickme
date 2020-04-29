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

	@Override
	public List<CMemberDto> getUnapprovalList() {
		return sqlSession.selectList(namespace + "getUnapprovalList");
	}

	@Override
	public boolean approveCompany(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "approveCompany", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public boolean unapproveCompany(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "unapproveCompany", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public List<AMemberDto> getWithdrawMemberA() {
		return sqlSession.selectList(namespace + "getWithdrawMemberA");
	}

	@Override
	public List<CMemberDto> getWithdrawMemberC() {
		return sqlSession.selectList(namespace + "getWithdrawMemberC");
	}

	@Override
	public boolean recoverMemberA(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "recoverMemberA", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public boolean recoverMemberC(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "recoverMemberC", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public void removeMemberA() {
		sqlSession.delete(namespace + "removeMemberA");
	}

	@Override
	public void removeMemberC() {
		sqlSession.delete(namespace + "removeMemberC");
	}

	
	
	
}
