package pickme.com.a.searchPeople.dao;

import java.util.List;

import model.AMemberDto;
import model.SearchPeopleParam;

public interface SearchPeopleDao {
	
	// 유료회원인지 알아보기
	public boolean isPremierMember(int seq);
	// 기본 인재찾기
	public List<AMemberDto> getSearchBasic( SearchPeopleParam param );
	// 기본 인재 찾기 인원수
	public int getSearchBasicNumber( SearchPeopleParam param );
	// 디테일 인재찾기 ( +해시태그 )
	public List<AMemberDto> getSearchDetail( SearchPeopleParam param );
	// 디테일 인재 찾기 인원수
	public int getSearchDetailNumber( SearchPeopleParam param );
}
