package pickme.com.a.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import pickme.com.a.recruit.service.RecruitService;

public class Scheduler {
	@Autowired
	RecruitService serv;
	
	@Scheduled(cron = "0 52 16 * * ?",zone = "Asia/Seoul")
	public void dayDelUpdate() {
		try {
			Calendar nowTime = Calendar.getInstance();
	        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	        String today = sd.format(nowTime.getTime());
			System.out.println("============= Scheduler 실행 =========== ");
			serv.dayUpdateDel(today);
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
}
