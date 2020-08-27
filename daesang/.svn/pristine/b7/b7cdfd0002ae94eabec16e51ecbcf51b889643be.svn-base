package daesang.junit;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.StopWatch;

import daesang.common.util.DateUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/servlet-context.xml", "classpath:root-context.xml"})

public class sampleJunitTest {
	
	private static final Logger logger = LoggerFactory.getLogger(sampleJunitTest.class);

	private StopWatch stopWatch = new StopWatch();
	
	@Test
	public void test() throws Exception {
		
		//1. Junit 시작 로그
		this.startLog();
		
		//2. Junit test logic
		
		
		//3. Junit 종료 로그
		this.endLog();
	}
	
	private void startLog(){
		
		System.out.println("");		
		logger.debug("=====================================================================");
		logger.debug("junit test start!! : {}", DateUtil.getSimpleDate("yyyy-MM-dd HH:mm:ss"));
		logger.debug("=====================================================================");
		System.out.println("");
			
		stopWatch.start();
	}
	
	private void endLog(){
				
		stopWatch.stop();
		
		System.out.println("");		
		logger.debug("junit test RunTime!! : {}", stopWatch.getLastTaskTimeMillis() / (double)1000 + " s");
		logger.debug("=====================================================================");
		logger.debug("junit test end!! : {}", DateUtil.getSimpleDate("yyyy-MM-dd HH:mm:ss"));
		logger.debug("=====================================================================");
		System.out.println("");
	}
}
