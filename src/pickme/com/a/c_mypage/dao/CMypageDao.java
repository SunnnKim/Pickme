package pickme.com.a.c_mypage.dao;

import java.util.List;

import model.CMemberDto;
import model.FilesDto;
import model.PaymentDto;
import model.PremierMemDto;
import model.PremierServiceDto;

public interface CMypageDao {

	CMemberDto dateTest(CMemberDto dto);
	
	// 기업 마이페이지 이동
	public void goCMypage(CMemberDto dto);

	// 기업 정보 수정페이지 이동
	public void goUpdate(CMemberDto dto);

	// 기업 탈퇴페이지 이동
	public void goWithdrawal(CMemberDto dto);
	
	// 기업 정보 수정
	public void update(CMemberDto dto);	
	
	// 주소 불러오기
	public CMemberDto showAddress(CMemberDto dto);
	
	// 연락처 불러오기
	public CMemberDto showTel(CMemberDto dto);

	// 수정 페이지 데이터 담기
	public CMemberDto select(int seq);
	
	// 로고 업로드
	public boolean uploadLogo(CMemberDto dto);

	// 결제 승인 후 DB 저장
	public int setPaymentInfo(PaymentDto dto);
	
	// 결제 승인 후 DB 저장 (유료회원등록) *****************
	public int insertPremierMem(PremierMemDto member);

	// 결제 페이지 이동
	public List<PaymentDto> showPaymentDto(PaymentDto dto);


	// 현재 서비스 진행중인지
	public PaymentDto recentService(PaymentDto dto);
	
	// 가장 최근 결제 서비스의 종료일
//	public PaymentDto showRecentPay(PaymentDto dto);
	
	
	
	// 환불 - 환불할 서비스 가져오기
	public PaymentDto getRefundableService(int seq);

	// 유료서비스 데이터 가져오기
	public PremierServiceDto showPremier();
	
	// 이미지 업로드
	public boolean uploadImage(List<FilesDto> list);

	// to newName
	public void imageNameUpdate(int ref);

	// 마지막 시퀀스 불러오기
	public int getLastSeq();
	
	
}
