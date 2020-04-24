package pickme.com.a.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.PaymentParam;
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

	@Override
	public boolean insertService(PremierServiceDto serviceDto) {
		return sqlSession.insert(namespace + "insertService", serviceDto) > 0 ? true:false;
	}

	@Override
	public boolean updateService(PremierServiceDto dto) {
		return sqlSession.update(namespace + "updateService", dto) > 0 ? true:false;
	}

	@Override
	public boolean deleteService(List<Integer> seqList) {
		for( int i = 0; i < seqList.size(); i++ ) {
			int count = sqlSession.update(namespace + "deleteService", seqList.get(i));
			if( count == 0 ) return false;
		}
		return true;
	}

	@Override
	public List<PaymentParam> getStatistics() {
		return sqlSession.selectList(namespace + "getStatistics");
	}

	@Override
	public int getNewPremierMember() {
		return sqlSession.selectOne(namespace + "getNewPremierMember");
	}

	@Override
	public int getRefundNumber() {
		return sqlSession.selectOne(namespace + "getRefundNumber");
	}

}
