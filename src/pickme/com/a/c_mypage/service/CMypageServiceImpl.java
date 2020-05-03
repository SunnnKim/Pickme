package pickme.com.a.c_mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CMemberDto;
import model.PaymentDto;
import model.PremierMemDto;
import pickme.com.a.c_mypage.dao.CMypageDao;

@Service
public class CMypageServiceImpl implements CMypageService{
	
	@Autowired
	CMypageDao dao;

	@Override
	public CMemberDto dateTest(CMemberDto dto) {
		return dao.dateTest(dto);
	}

	
	// 기업 마이페이지 이동
	@Override
	public void goCMypage(CMemberDto dto) {
		dao.goCMypage(dto);
	}

	
	// 기업 정보 수정페이지 이동
	@Override
	public void goUpdate(CMemberDto dto) {
		dao.goUpdate(dto);
	}

	
	// 기업 탈퇴 페이지 이동
	@Override
	public void goWithdrawal(CMemberDto dto) {
		dao.goWithdrawal(dto);
	}


	// 기업 정보 수정
	@Override
	public void update(CMemberDto dto) {
		dao.update(dto);
	}

	
	
	// 주소 불러오기
	@Override
	public CMemberDto showAddress(CMemberDto dto) {
		return dao.showAddress(dto);
	}


	
	// 연락처 불러오기
	@Override
	public CMemberDto showTel(CMemberDto dto) {
		return dao.showTel(dto);
	}


	// 수정 페이지 데이터 담기
	@Override
	public CMemberDto select(int seq) {
		return dao.select(seq);
	}


	// 로고 업로드
	@Override
	public boolean uploadLogo(CMemberDto dto) {
		return dao.uploadLogo(dto);
	}

	
	// 결제 승인 후 DB 저장
	@Override
	public int setPaymentInfo(PaymentDto dto) {
		return dao.setPaymentInfo(dto);
	}
	
	// 결제 승인 후 DB 저장 (유료회원등록) *****************
	@Override
	public int insertPremierMem(PremierMemDto member) {
		return dao.insertPremierMem(member);
	}

	// 결제 페이지 이동
	@Override
	public List<PaymentDto> showPaymentDto(PaymentDto dto) {
		return dao.showPaymentDto(dto);
	}


	// 현재 서비스 진행중인지
	@Override
	public PaymentDto recentService(PaymentDto dto) {
		return dao.recentService(dto);
	}


	@Override
	public PaymentDto getRefundableService(int seq) {
		return dao.getRefundableService(seq);
	}


	
	
	
	// 가장 최근 결제 서비스의 종료일
//	@Override
//	public PaymentDto showRecentPay(PaymentDto dto) {
//		return dao.showRecentPay(dto);
//	}
	
}
