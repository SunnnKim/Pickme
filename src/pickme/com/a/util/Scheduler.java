package pickme.com.a.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import pickme.com.a.recruit.service.RecruitService;


@Component
public class Scheduler{
	@Autowired
	RecruitService recruitServ;
	
	@Scheduled(cron = "0 0-1 0 * * *",zone = "Asia/Seoul")
	public void dayDelUpdate() {
		try {
			System.out.println("============= Scheduler 실행 =========== ");
			recruitServ.dayUpdateDel();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	

}
