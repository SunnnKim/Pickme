package pickme.com.a.scheduler;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.AMemberDto;

@Repository
public class ScheduleDao {

	@Autowired
	SqlSession sqlSession;
	String namespace = "Schedule.";
	
	public int scheduleTest(AMemberDto dto) {
		return sqlSession.insert(namespace + "scheduleTest", dto);
	}
	
	public int dayUpdateDel(String today) {
		return sqlSession.update(namespace+"dayUpdateDel",today);
	}

	public void deleteMemberA() {
		sqlSession.delete(namespace + "deleteMemberA");
	}

	public void deleteMemberC() {
		sqlSession.delete(namespace + "deleteMemberC");
	}
}
