package pickme.com.a.e_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EInterestDto;
import model.EInterestParam;

@Repository
public class EInterestDaoImpl implements EInterestDao {
	String ns = "eApplyInterest.";

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<EInterestDto> getInterComList(EInterestParam param) {
		
		return sqlSession.selectList(ns + "interestCompany", param);
	}

	@Override
	public int getTotalInterComCount(EInterestParam param) {
		
		return sqlSession.selectOne(ns + "getTotalInterComCount", param );
	}
	

	
	
}
