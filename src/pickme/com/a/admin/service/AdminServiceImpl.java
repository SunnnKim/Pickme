package pickme.com.a.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import model.AMemberDto;
import model.AdminDto;
import model.AdminParam;
import model.CMemberDto;
import model.RecruitDto;
import model.StatisticsParam;
import pickme.com.a.admin.dao.AdminDao;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao dao;

	@Override
	public AdminDto loginCheck(AdminDto dto) {
		return dao.loginCheck(dto);
	}

	@Override
	public List<AMemberDto> aMemberAll() {
		return dao.aMemberAll();
	}

	@Override
	public int countNewAMember() {
		return dao.countNewAMember();
	}

	@Override
	public int countAmember() {
		return dao.countAmember();
	}

	@Override
	public int countCmember() {
		return dao.countCmember();
	}

	@Override
	public List<CMemberDto> cMemberAll() {
		return dao.cMemberAll();
	}

	@Override
	public int countNewCMember() {
		return dao.countNewCMember();
	}

	@Override
	public List<CMemberDto> getUnapprovalList() {
		return dao.getUnapprovalList();
	}

	@Override
	public boolean approveCompany(List<Integer> seqList) {
		return dao.approveCompany(seqList);
	}

	@Override
	public boolean unapproveCompany(List<Integer> seqList) {
		return dao.unapproveCompany(seqList);
	}

	@Override
	public List<AMemberDto> getWithdrawMemberA() {
		return dao.getWithdrawMemberA();
	}

	@Override
	public List<CMemberDto> getWithdrawMemberC() {
		return dao.getWithdrawMemberC();
	}

	@Override
	public boolean recoverMemberA(List<Integer> seqList) {
		return dao.recoverMemberA(seqList);
	}

	@Override
	public boolean recoverMemberC(List<Integer> seqList) {
		return dao.recoverMemberC(seqList);
	}

	@Override
	public boolean updateDelMemberA(List<Integer> seqList) {
		return dao.updateDelMemberA(seqList);
	}

	@Override
	public boolean updateDelMemberC(List<Integer> seqList) {
		return dao.updateDelMemberC(seqList);
	}

	@Override
	public List<StatisticsParam> getDepartmentStatistics() {
		return dao.getDepartmentStatistics();
	}

	@Override
	public boolean updateDelResume(List<Integer> seqList) {
		return dao.updateDelResume(seqList);
	}

	@Override
	public List<AdminParam> getAllResume() {
		return dao.getAllResume();
	}
	
	@Override
	public List<AdminParam> getAllResume2() {
		return dao.getAllResume2();
	}
	@Override
	public boolean updateDelResume2(List<Integer> seqList) {
		return dao.updateDelResume2(seqList);
	}

	@Override
	public int getTotalResumeAfter() {
		return dao.getTotalResumeAfter();
	}

	@Override
	public List<StatisticsParam> getResumeStatistics() {
		return dao.getResumeStatistics();
	}

	@Override
	public List<RecruitDto> getAllRecruit() {
		return dao.getAllRecruit();
	}

	@Override
	public int getRecruitNumber() {
		return dao.getRecruitNumber();
	}

	@Override
	public List<StatisticsParam> getRecruitStatistics() {
		return dao.getRecruitStatistics();
	}

	@Override
	public boolean updateDelRecruit(List<Integer> seqList) {
		return dao.updateDelRecruit(seqList);
	}

	
	
	
}


