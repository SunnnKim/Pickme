package pickme.com.a.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAop {
	// logger AOP
	
	// 자동적으로 호출되는 함수
	@Around("within(pickme.com.a.*.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		
		// 사용자가 지정한 함수를 실행했을 때 아래 함수가 실행, 리턴
		String signatureStr = joinpoint.getSignature().toShortString();
		
		// session check
		
		Object obj	= joinpoint.proceed(); // 기능 실행 
		
		System.out.println("loggerAOP: " + signatureStr);
		
		return obj;
	}
}
