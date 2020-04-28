package pickme.com.a.searchPeople.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AMemberDto;
import model.CvRequestDto;
import model.SearchPeopleParam;

@Repository
public class SearchPeopleDaoImpl implements SearchPeopleDao{

	@Autowired
	SqlSession sqlSesssion;
	String namespace = "SearchPeople.";
	
	@Override
	public boolean isPremierMember(int seq) {
		int success = sqlSesssion.selectOne(namespace + "isPremierMember", seq);
		return success > 0 ? true:false;
	}
	
	@Override
	public List<AMemberDto> getSearchBasic(SearchPeopleParam param) {
		return sqlSesssion.selectList(namespace + "getSearchBasic", param);
	}

	@Override
	public int getSearchBasicNumber(SearchPeopleParam param) {
		return sqlSesssion.selectOne(namespace + "getSearchBasicNumber", param);
	}

	@Override
	public List<AMemberDto> getSearchDetail(SearchPeopleParam param) {
		return sqlSesssion.selectList(namespace + "getSearchDetail", param);
	}

	@Override
	public int getSearchDetailNumber(SearchPeopleParam param) {
		return sqlSesssion.selectOne(namespace + "getSearchDetailNumber", param);
	}

	@Override
	public AMemberDto getPeopleDetail(int seq) {
		return sqlSesssion.selectOne(namespace + "getPeopleDetail", seq);
	}

	@Override
	public boolean insertCvRequest(CvRequestDto dto) {
		return sqlSesssion.insert(namespace + "insertCvRequest", dto) > 0 ? true:false;
	}



}
