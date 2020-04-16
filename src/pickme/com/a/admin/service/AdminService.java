package pickme.com.a.admin.service;

import java.util.List;

import model.AMemberDto;
import model.AdminDto;
import model.CMemberDto;
import model.NoticeDto;

public interface AdminService {
	public AdminDto loginCheck(AdminDto dto);
	public List<AMemberDto> aMemberAll();
	public List<CMemberDto> cMemberAll();
	public int countNewAMember();
	public int countNewACMember();
	public int countAmember();
	public int countCmember();

}
