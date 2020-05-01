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
	
/*
 	 *** Scheduler cron 사용법 ***
 	 
	cron ( (1), (2), (3), (4), (5), (6), (7 - 생략가능) ) 
	
 	(1) : 초 0~59
 	(2) : 분 0~59
 	(3) : 시 0~23
 	(4) : 일 1~31
 	(5) : 월 1~12
 	(6) : 요일 0~7 (0,7 = 일요일, 1 = 월요일 ... )
 	(7) : 년도 (생략가능)
 	요일 : 0 (일요일) ~ 6( 토요일)

	
	// 표현식  
	
	? : 설정 값 없을 때 - 일과 요일 에서만 사용가능
	* : 모든조건
	시작시간/단위 : 시작시간부터 해당 단위 때
			예) ( 0 0/10 12  *  *  * ) ====> 매일 12시 0분부터 10분 간격으로 1시 전까지 실행 
	시작범위-끝범위 : 시작범위 부터 끝범위까지
			예) ( 0  10-15  10  *  * ) =====> 매일 매시간마다 10분부터 1분간격으로 실행 ( 10시 10분, 10시 11분, 10시 12분... 10시 15분까지)
	L : 마지막 - 일, 요일 에서만 사용가능
			예) ( 0 0 0 * * 0L ) =====> 매월 마지막 일요일 밤 12시에 실행 
	W : 가장 가까운 평일 찾는다 - 일 에서만 사용가능
			예) 10W
				-10일이 평일 일 때 : 10일에 실행
				-10일이 토요일 일 때 : 가장 가까운 평일인 금요일(9일)에 실행 
				-10일이 일요일 일 때 : 가장 가까운 평일인 월요일(11일)에 실행 
				
	# : 몇주 째인지 찾는다 - 요일 에서만 사용가능
			예) 3#2 : 수요일#2째주에 실행

 */
	
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
	@Scheduled(cron = "0 0 0 * * 1")
	public void deleteFromDatabase() {
		Calendar today = Calendar.getInstance();
		serivce.deleteMemberA();
		System.out.println( "[Scheduler] Delete A_Member : " + today.getTime());
		serivce.deleteMemberC();
		System.out.println( "[Scheduler] Delete C_Member : " + today.getTime());
		
	}
	// 삭제된 이력서 자동으로 지우기 ( + 딸린 테이블도 지움 )
	
	
	
	
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
