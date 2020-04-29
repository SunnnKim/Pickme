package pickme.com.a.e_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EInterestDto;
import model.EInterestParam;

@Repository
public class EInterestDaoImpl implements EInterestDao {
	

	@Autowired
	SqlSession sqlSession;
	
	String ns = "eApplyInterest.";
	
	@Override
	public List<EInterestDto> getInterComList(EInterestParam param) {
		
		return sqlSession.selectList(ns + "interestCompany", param);
	}

	@Override
	public int getTotalInterComCount(EInterestParam param) {
		
		return sqlSession.selectOne(ns + "getTotalInterComCount", param );
	}

	@Override
	public int removefav(EInterestParam param) {
		
		System.out.println("removefav DAO");
		System.out.println("lkepickseq: " + param.toString());
		return sqlSession.delete(ns + "removefav", param);
	}

	@Override
	public List<EInterestDto> getInterComRecruitList(EInterestParam param) {
		
		return sqlSession.selectList(ns + "getInterComRecruitList", param);
	}

	@Override
	public int getTotalinterComRecruit(EInterestParam param) {
	
		return sqlSession.selectOne(ns + "totalinterComRecruit", param);
	}

	@Override
	public int applychk(EInterestParam param) {
		
		return sqlSession.selectOne(ns + "applychk", param) ;
	}

	@Override
	public List<EInterestDto> getLikeRecruitList(EInterestParam param) {
		
		return sqlSession.selectList(ns + "getLikeRecruitList", param);
	}

	@Override
	public int getTotallikeRecruitCount(EInterestParam param) {
		
		System.out.println("param: " + param.toString());
		return sqlSession.selectOne(ns + "getTotallikeRecruitCount" , param);
	}

	@Override
	public List<EInterestDto> getRecentLikeRecruit(String email) {
		
		return sqlSession.selectList(ns + "getRecentlikeRecruitList", email);
	}
	

	
	
}
