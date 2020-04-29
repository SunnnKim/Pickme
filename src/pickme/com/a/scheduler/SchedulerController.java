package pickme.com.a.scheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import model.AMemberDto;

@Controller
public class SchedulerController {

	@Autowired
	ScheduleService serivce;
	static int number = 0;
	
	//테스트 
	//@Scheduled(cron = "0 0/1 * ? * *" )	// 삭제할 시간주기 
	public void scheduleTest() {
		System.out.println("시작 ");
		String pwd = new BCryptPasswordEncoder().encode("bitcamp.1");
		AMemberDto dto = new AMemberDto(0, "Test_" +  number + "@naver.com", "김선주",
				pwd, null, null, null, null, null, null, null, 0, 0, null, 0, null);
		int a = 1;
		//int a = serivce.scheduleTest(dto);
		System.out.println("성공? :  " + a);
		number++;
		System.out.println(number);
		
	}
	
	// 관리자 
	// 월요일 밤 12시에 맞춰 삭제된 데이터 데이터베이스에서 삭제하기
	@Scheduled(cron = "0 55 23 * * 3")
	public void deleteFromDatabase() {
		Calendar today = Calendar.getInstance();
		serivce.deleteMemberA();
		System.out.println( "[Scheduler] Delete A_Member : " + today.getTime());
		serivce.deleteMemberC();
		System.out.println( "[Scheduler] Delete C_Member : " + today.getTime());
		
	}
	
	
	// 채용관리 매일밤 12시 채용 마감일이 오늘 날짜를 지나면 DEL=1로 바꾸기
	//@Scheduled(cron = "0 0/1 * ? * *" )
	public void dayUpdateDel() {
		System.out.println("Day update Del ");
		Calendar nowTime = Calendar.getInstance();
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String today = sd.format(nowTime.getTime());
        System.out.println("today: "+today);
        serivce.dayUpdateDel(today);
        System.out.println("del=1 change ok ");
	}
	
	
	
}
