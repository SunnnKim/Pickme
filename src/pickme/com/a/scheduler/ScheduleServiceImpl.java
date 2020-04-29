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
	
}
