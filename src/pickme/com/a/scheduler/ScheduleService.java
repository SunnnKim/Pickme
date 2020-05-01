package pickme.com.a.scheduler;

import model.AMemberDto;

public interface ScheduleService {
	
	public int scheduleTest(AMemberDto dto);
	
	public int dayUpdateDel(String today);

	public void deleteMemberA();

	public void deleteMemberC();
	
}
