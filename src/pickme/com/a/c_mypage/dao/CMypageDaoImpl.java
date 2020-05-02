	package pickme.com.a.c_mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CMemberDto;
import model.PaymentDto;
import model.PremierMemDto;

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
		session.selectOne(nameSpace + "goCMypage", dto);
	}

	
	// 기업 정보 수정페이지 이동
	@Override
	public void goUpdate(CMemberDto dto) {
		session.selectOne(nameSpace + "goUpdate", dto);
	}

	
	// 기업 탈퇴페이지 이동
	@Override
	public void goWithdrawal(CMemberDto dto) {
		session.selectList(nameSpace + "goWithdrawal", dto);
	}

	

	
	// 기업회원 정보 수정
	@Override
	public void update(CMemberDto dto) {
		session.update(nameSpace + "update", dto);
	}

	
	
	// 주소 불러오기
	@Override
	public CMemberDto showAddress(CMemberDto dto) {
		CMemberDto address = session.selectOne(nameSpace + "showAddress", dto);
		return address;
	}

	
	// 연락처 불러오기
	@Override
	public CMemberDto showTel(CMemberDto dto) {
		CMemberDto tel = session.selectOne(nameSpace + "showTel", dto);
		return tel;
	}


	// 수정 페이지 데이터 담기
	@Override
	public CMemberDto select(int seq) {
		CMemberDto dto = session.selectOne(nameSpace + "select", seq);
		return dto;
	}

	// 로고 업로드
	@Override
	public boolean uploadLogo(CMemberDto dto) {
		int n = session.insert(nameSpace + "uploadLogo", dto);
		return n>0? true : false;
	}


	// 결제 승인 후 DB 저장
	@Override
	public int setPaymentInfo(PaymentDto dto) {

		int n = session.insert("Payment." + "setPaymentInfo", dto);
	    return n;
	}
	
	// 결제 승인 후 DB 저장 (유료회원등록) *****************
	@Override
	public int insertPremierMem(PremierMemDto member) {
		return session.insert("Payment.insertPremierMem", member);
	}

	// 결제 페이지 이동
	@Override
	public List<PaymentDto> showPaymentDto(PaymentDto dto) {
		List<PaymentDto> list = session.selectList("Payment." + "showPayment", dto);
		return list;
	}


	// 현재 서비스 진행중인지
	@Override
	public PaymentDto recentService(PaymentDto dto) {
		PaymentDto recentDto = session.selectOne("Payment." + "recentService", dto);
		return recentDto;
	}


	@Override
	public PaymentDto getRefundableService(int seq) {
		return session.selectOne("Payment.getRefundableService", seq);
	}


	
	// 가장 최근 결제 서비스의 종료일
//	@Override
//	public PaymentDto showRecentPay(PaymentDto dto) {
//		PaymentDto recentDto = session.selectOne("Payment." + "showRecentPay", dto);
//		return recentDto;
//	}
	
}
