package pickme.com.a.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.PremierMemDto;
import model.PremierServiceDto;

@Repository
public class PaymentDaoImpl implements PaymentDao{

	@Autowired
	SqlSession sqlSession;
	String namespace = "Payment.";
	@Override
	public List<PremierMemDto> getPremierMember() {
		return sqlSession.selectList(namespace + "getPremierMember");
	}
	
	@Override
	public List<PremierServiceDto> getPremierService() {
		return sqlSession.selectList(namespace + "getPremierService");
	}
}
