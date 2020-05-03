package pickme.com.a.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.sym.NameN;

import model.AMemberDto;
import model.AdminDto;
import model.AdminParam;
import model.CMemberDto;
import model.RecruitDto;
import model.StatisticsParam;



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
	public boolean updateDelMemberA(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "updateDelMemberA", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public boolean updateDelMemberC(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "updateDelMemberC", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public List<StatisticsParam> getDepartmentStatistics() {
		return sqlSession.selectList(namespace + "getDepartmentStatistics");
	}

	@Override
	public boolean updateDelResume(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "updateDelResume", seq); 
			if(a == 0) return false;
		}
		return true;
	}
	@Override
	public boolean updateDelResume2(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "updateDelResume2", seq); 
			if(a == 0) return false;
		}
		return true;
	}

	@Override
	public List<AdminParam> getAllResume() {
		return sqlSession.selectList(namespace + "getAllResume");
	}

	@Override
	public List<AdminParam> getAllResume2() {
		return sqlSession.selectList(namespace + "getAllResume2");
	}

	@Override
	public int getTotalResumeAfter() {
		return sqlSession.selectOne(namespace + "getTotalResumeAfter");
	}

	@Override
	public List<StatisticsParam> getResumeStatistics() {
		return sqlSession.selectList(namespace + "getResumeStatistics");
	}

	@Override
	public List<RecruitDto> getAllRecruit() {
		return sqlSession.selectList(namespace +  "getAllRecruit");
	}

	@Override
	public int getRecruitNumber() {
		return sqlSession.selectOne(namespace + "getRecruitNumber");
	}

	@Override
	public List<StatisticsParam> getRecruitStatistics() {
		return sqlSession.selectList(namespace + "getRecruitStatistics");
	}

	@Override
	public boolean updateDelRecruit(List<Integer> seqList) {
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.update(namespace + "updateDelRecruit", seq); 
			if(a == 0) return false;
		}
		return true;
	
	}


	
	
	
}
