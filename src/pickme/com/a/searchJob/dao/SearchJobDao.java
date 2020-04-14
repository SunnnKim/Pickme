package pickme.com.a.searchJob.dao;

import java.util.List;

import model.RecruitDto;

public interface SearchJobDao {

	//채용탐색 전체 리스트
	public List<RecruitDto> getRecAllList();
}
