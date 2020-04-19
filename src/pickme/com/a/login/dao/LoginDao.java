package pickme.com.a.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import model.AMemberDto;
import model.CMemberDto;

@Component
public class LoginDao {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "Login.";
	
	// 일반 + 기업 회원가입 이메일 찾기 
	public String emailCheck(String email) {
		CMemberDto dto1 = sqlSession.selectOne( namespace + "emailCheckC", new CMemberDto(email));
		AMemberDto dto2 = sqlSession.selectOne( namespace + "emailCheckA", new AMemberDto(email));
		if( dto1 == null && dto2 == null ) return "";
		if( dto1 != null ) return dto1.getEmail();
		return dto2.getEmail();
		
	}
	
	// 일반 회원가입 
	@Transactional
	public void signup(AMemberDto member) {
		sqlSession.insert( namespace + "memberJoin", member);
	}
	
	// 일반 로그인용 세션 빼기
	public AMemberDto getMemberByEmail (String email) {
		AMemberDto member = sqlSession.selectOne(namespace + "getLoginInfo", new AMemberDto(email));
		System.out.println("logindao : " + member);
		return member;
	}
	
	// --- 기업 ---	
	// 기업 회원가입 이메일 찾기 
	public String emailCheckForCompany(String email) {
		CMemberDto dto1 = sqlSession.selectOne( namespace + "emailCheckC", new CMemberDto(email));
		AMemberDto dto2 = sqlSession.selectOne( namespace + "emailCheckA", new AMemberDto(email));
		if( dto1 == null && dto2 == null ) return "";
		if( dto1 != null ) return dto1.getEmail();
		return dto2.getEmail();
		
	}
	// 기업 회원가입 
	@Transactional
	public void signupForCompany(CMemberDto member) {
		sqlSession.insert( namespace + "companyJoin", member);
	}
	// 기업 세션 데이터 가져오기 
	public CMemberDto getMemberByEmailForCompany(String email) {
		CMemberDto member = sqlSession.selectOne(namespace + "getLoginInfoForCompany", new CMemberDto(email));
		System.out.println("logindao : " + member);
		return member;
	}
	
	// 일반회원 인증받기
	public void emailValidateA(AMemberDto member) {
		sqlSession.update(namespace + "AMemberValidate", member);
	}
	// 기업회원 인증받기
	public void emailValidateC(CMemberDto member) {
		sqlSession.update(namespace + "CMemberValidate", member);
	}
	
	// 일반회원 비밀번호 변경시 현재 비밀번호 입력
	public void amemberChangePwd(AMemberDto member) {
		
	}
	
}