package pickme.com.a.admin.service;

import java.util.List;

import model.AMemberDto;
import model.AdminDto;
import model.AdminParam;
import model.CMemberDto;
import model.NoticeDto;
import model.RecruitDto;
import model.StatisticsParam;

public interface AdminService {
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
	
	// 이력서 모두 불러오기
	public List<AdminParam> getAllResume();
	// 이력서 모두 불러오기
	public List<AdminParam> getAllResume2();
	// 이력서 삭제처리 
	public boolean updateDelResume(List<Integer> seqList);
	// 제출 이력서 삭제처리 
	public boolean updateDelResume2(List<Integer> seqList);
	
	
	// 공고 모두보기 
	public List<RecruitDto> getAllRecruit();
	// 제출 이력서 삭제처리 
	public boolean updateDelRecruit(List<Integer> seqList);

	
	// 통계 
	// 기업회원 회사 분류 비율
	public List<StatisticsParam> getDepartmentStatistics();
	// 제출이력서 수 
	public int getTotalResumeAfter();
	// 지원한 직무 비율
	public List<StatisticsParam> getResumeStatistics();
	// 현재 진행중인 공고
	public int getRecruitNumber();
	// 현재 진행준인 공고 통계 
	public List<StatisticsParam> getRecruitStatistics();
	
}
