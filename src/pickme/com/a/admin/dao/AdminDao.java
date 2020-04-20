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
}
