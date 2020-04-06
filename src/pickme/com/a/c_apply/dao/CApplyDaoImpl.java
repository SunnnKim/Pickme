package pickme.com.a.c_apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CApplyDto;

@Repository
public class CApplyDaoImpl implements CApplyDao{
	
	@Autowired
	SqlSession sqlSession;
	String ns = "CApply.";
	@Override
	public List<CApplyDto> getRequestList() {
		List<CApplyDto> list = sqlSession.selectList(ns+"getRequestList");
		return list;
	}
	
	
}
