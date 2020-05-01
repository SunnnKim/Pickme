package pickme.com.a.admin.dao;

import java.util.List;

import model.AMemberDto;
import model.AdminDto;
import model.CMemberDto;

public interface AdminDao {

	public AdminDto loginCheck(AdminDto dto);
	public List<AMemberDto> aMemberAll();
	public List<CMemberDto> cMemberAll();
	public int countNewAMember();
	public int countNewCMember();
	public int countAmember();
	public int countCmember();
	// 가입 미승인된 기업회원 리스트 불러오기
	public List<CMemberDto> getUnapprovalList();
	// 가입 승인하기 
	public boolean approveCompany(List<Integer> seqList);
	// 가입 승인 취소하기 
	public boolean unapproveCompany(List<Integer> seqList);
	// 일반 탈퇴회원 불러오기
	public List<AMemberDto> getWithdrawMemberA();
	// 기업 탈퇴회원 불러오기 
	public List<CMemberDto> getWithdrawMemberC();
	// 일반 탈퇴회원 복구하기 
	public boolean recoverMemberA(List<Integer> seqList);
	// 기업 탈퇴회원 복구하기
	public boolean recoverMemberC(List<Integer> seqList);
	// 일반회원 탈퇴처리 
	public boolean updateDelMemberA(List<Integer> seqList);
	// 기업회원 탈퇴처리 
	public boolean updateDelMemberC(List<Integer> seqList);
	
}
