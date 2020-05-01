package pickme.com.a.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AMemberDto;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleDao dao;

	@Override
	public int scheduleTest(AMemberDto dto) {
		return dao.scheduleTest(dto);
	}

	@Override
	public int dayUpdateDel(String today) {
		return dao.dayUpdateDel(today);
	}

	@Override
	public void deleteMemberA() {
		dao.deleteMemberA();
	}

	@Override
	public void deleteMemberC() {
		dao.deleteMemberC();
	}
	
}
