package pickme.com.a.login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.AMemberDto;
import model.CMemberDto;
import model.NoticeDto;
import model.RecruitDto;

@Primary
@Repository
public class LoginDao {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "Login.";
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
		
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
	public boolean checkPasswordA(AMemberDto member) {
		String rawPassword = member.getPassword();
		int seq = member.getSeq();
		String encodePassword = sqlSession.selectOne(namespace + "getPasswordA", seq);
		boolean match = bCryptPasswordEncoder.matches(rawPassword, encodePassword);
		return match;
	}
	
	// 기업회원 비밀번호 변경시 현재 비밀번호 입력
	public boolean checkPasswordC(CMemberDto companyDto) {
		String rawPassword = companyDto.getPassword();
		int seq = companyDto.getSeq();
		System.out.println("rawPassword : "+ rawPassword);
		System.out.println("seq : "+ seq);
		String encodePassword = sqlSession.selectOne(namespace + "getPasswordC", seq);
		System.out.println(encodePassword);
		boolean match = bCryptPasswordEncoder.matches(rawPassword, encodePassword);
		return match;
	}
	
	// 일반회원 비밀번호 변경하기 
	public boolean updatePasswordA(AMemberDto member) {
		return sqlSession.update(namespace + "updatePasswordA", member)>0? true:false;
	}
	
	// 일반회원 탈퇴하기
	public boolean withdrawMemberA(int seq) {
		return sqlSession.update(namespace + "withdrawMemberA", seq) > 0 ? true:false;
	}
	
	// 기업회원 비밀번호 변경하기 
	public boolean updatePasswordC(CMemberDto member) {
		return sqlSession.update(namespace + "updatePasswordC", member)>0? true:false;
	}
	
	// 기업회원 탈퇴하기
	public boolean withdrawMemberC(int seq) {
		return sqlSession.update(namespace + "withdrawMemberC", seq) > 0 ? true:false;
	}

	// @@@@@@@@ 이메일 확인하기 @@@@@@@
	
	// 일반회원 이메일 있는지 확인하기 
	public boolean getLostEmailA(AMemberDto dto) {
		int count = sqlSession.selectOne(namespace + "getLostEmailA", dto);
		return count == 1 ? true:false;
	}
	
	// 일반회원 이메일 있는지 확인하기 2
	public boolean getLostEmailA2(AMemberDto dto) {
		int count = sqlSession.selectOne(namespace + "getLostEmailA2", dto);
		return count == 1 ? true:false;
	}
	
	// 일반회원 비밀번호 분실시 이메일로 변경하기 
	public boolean changePwdWithCodeA(AMemberDto member) {
		return sqlSession.update(namespace + "changePwdWithCodeA", member)>0? true:false;
	}
	
	
	
	// 기업회원 이메일 있는지 확인하기
	public boolean getLostEmailC(CMemberDto dto) {
		int count = sqlSession.selectOne(namespace + "getLostEmailC", dto);
		return count == 1 ? true:false;
	}
	// 기업회원 이메일 있는지 확인하기 2
	public boolean getLostEmailC2(CMemberDto dto) {
		int count = sqlSession.selectOne(namespace + "getLostEmailC2", dto);
		return count == 1 ? true:false;
	}
	
	// 일반회원 비밀번호 분실시 이메일로 변경하기 
	public boolean changePwdWithCodeC(CMemberDto member) {
		return sqlSession.update(namespace + "changePwdWithCodeC", member)>0? true:false;
	}
	
	// 기업 사업자등록번호 변경하기
	public boolean changeCompanyNumber(CMemberDto company) {
		return sqlSession.update(namespace + "changeCompanyNumber", company) > 0 ? true:false;
	}
	

	// 메인 채용공고 금주의 채용
	public List<RecruitDto> mainTopRec(){
		return sqlSession.selectList(namespace+"mainTopRecruit");
	}
	// 메인 추천 기업 
	public List<CMemberDto> mainTopCompany(){
		return sqlSession.selectList(namespace + "mainTopCompany"); 
	}
	
	// 메인 공지사항 뽑아오기 
	public List<NoticeDto> getMainNotice(){
		return sqlSession.selectList(namespace + "getMainNotice");
	}
	
	
}