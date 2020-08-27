package daesang.common.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import daesang.common.service.CommonService;
import daesang.common.util.DateUtil;

/************************************************** 
 * @FileName   : Schedule.java
 * @Description: 스케줄러 cron 사용
 * 					- 참고 : http://kanetami.tistory.com/entry/Schedule-Spring-%EC%8A%A4%ED%94%84%EB%A7%81-%EC%8A%A4%EC%BC%80%EC%A5%B4-%EC%84%A4%EC%A0%95%EB%B2%95-CronTab
 * 					- 초 분 시 일 월 주(년) ex : (cron = "0 56 12 * * *")
 * 					=> 초 0-59 , - * /
 * 					=> 분 0-59 , - * /
 * 					=> 시 0-23 , - * /
 * 					=> 일 1-31 , - * ? / L W
 * 					=> 월 1-12 or JAN-DEC , - * /
 * 					=> 요일 1-7 or SUN-SAT , - * ? / L #
 * 					=> 년(옵션) 1970-2099 , - * /
 * 					=> * : 모든 값
 * 					=> ? : 특정 값 없음
 * 					=> - : 범위 지정에 사용
 * 					=> , : 여러 값 지정 구분에 사용
 * 					=> / : 초기값과 증가치 설정에 사용
 * 					=> L : 지정할 수 있는 범위의 마지막 값
 * 					=> W : 월~금요일 또는 가장 가까운 월/금요일
 * 					=> # : 몇 번째 무슨 요일 2#1 => 첫 번째 월요일
 * @Author     : joon
 * @Version    : 2017. 4. 18.
 * @Copyright  : ⓒADUP. All Right Reserved
 **************************************************/
@Component
public class Schedule extends QuartzJobBean {

	@Autowired
	private CommonService commonService;
	
	private static final Logger logger = LoggerFactory.getLogger(Schedule.class);
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		this.getCommonService();
	}
	
	public static void main(String[] arg) throws Exception {

	}
	
	/************************************************** 
	 * @MethodName : getSchedule
	 * @Description: 스케줄러 실행
	 * @throws Exception void
	 * @Author     : joon
	 * @Version    : 2016. 2. 22.
	**************************************************/
	@Scheduled(cron = "0 56 12 * * *")
	public void getSchedule() throws Exception {
		
		logger.debug("Schedule ::::: {}", DateUtil.getSimpleDate("yyyy-MM-dd HH:mm:ss"));
	}
	
	@Scheduled(cron = "0 57 12 * * *")
	public void getSchedule1() throws Exception {
		
		logger.debug("Schedule ::::: {}", DateUtil.getSimpleDate("yyyy-MM-dd HH:mm:ss"));
	}

	public CommonService getCommonService() {
		if (commonService == null) {
			commonService = (CommonService) this.getWebApplicationBean("commonService");
		}

		return commonService;
	}
	
	public WebApplicationContext getContext() {
		return ContextLoader.getCurrentWebApplicationContext();
	}

	public Object getWebApplicationBean(String beanName) {
		return getContext().getBean(beanName);
	}
}
