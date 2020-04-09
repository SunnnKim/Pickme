package pickme.com.a.e_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EApplyDto;
import model.MessageParam;

@Repository
public class EApplyDaoImpl implements EApplyDao{

	@Autowired
	SqlSession sqlSession;

	String ns = "eApplyApply.";
	
	@Override
	public List<EApplyDto> getCurAList(MessageParam param) {
	
		return sqlSession.selectList(ns + "getCurAList", param);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		
		return sqlSession.selectOne(ns + "getTotalRecordCount", param);
	}

	@Override
	public int cancelApply(int seq) {
		
		return sqlSession.update(ns + "cancelApply", seq);
	}

	@Override
	public int[] deleteApply(int[] seqArray) {
		
		int seq = 0;
		int[]result = new int[seqArray.length]; 
		for (int i = 0; i < seqArray.length; i++) {
			
			seq = seqArray[i];
					
			result[i]=sqlSession.delete(ns + "deleteApply", seq);
			
		}
		
		return result;
		
	}

	@Override
	public List<EApplyDto> getPastAList(MessageParam param) {
		
		return sqlSession.selectList(ns + "getPastAList", param);
	}

	@Override
	public int getTotalPastCount(MessageParam param) {
		
		return sqlSession.selectOne(ns + "getTotalPastCount", param);
	}
	
	

}
