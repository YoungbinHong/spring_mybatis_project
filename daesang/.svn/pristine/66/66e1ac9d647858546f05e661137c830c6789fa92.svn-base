package daesang.junit;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import daesang.common.util.DateUtil;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

public class logFileJunitTest {
	
	private static final Logger logger = LoggerFactory.getLogger(sampleJunitTest.class);
	
	private StopWatch stopWatch = new StopWatch();
	
	@Test
	public void test() throws Exception {
		
		//1. Junit 시작 로그
		this.startLog();
		
		//2. Junit test logic
		List<String> filesList = new ArrayList<String>();
		
		String path = "D:/upload/logs";
		File file = new File(path);
				
		File[] files = file.listFiles();		
		for (File f : files) {
			if (f.isFile()) {
				if(f.getName().contains("starbox.log.")){
					filesList.add(f.getName());
				}
			}
		}
		
		Collections.reverse(filesList);
		
		filesList.add(0, "starbox.log");
		
		for(int i=0;i<filesList.size();i++){
			System.out.println("i : " + i + ", file name : " + filesList.get(i));
		}
		
		BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(path + "/" + filesList.get(1)), "euc-kr"));
		@SuppressWarnings("unused")
		String returnStr = "";
		String s;
		int i = 0;
		while ((s = in.readLine()) != null) {
			if((s.contains("BaseInterceptor") || s.contains("HttpUtil") || s.contains("[ERROR]")) 
					&& !s.contains("menu is font")){
				String[] arg = s.trim().split("menu");
				if(!arg[arg.length - 1].trim().equals("is")){
					if(i > 0 && s.contains("BaseInterceptor")) returnStr += "<br/>";//System.out.println("");
					returnStr += s + "<br/>";//System.out.println(s);
					i++;
				}							
			}
		}
		in.close();
		
//		System.out.println("returnStr : " + returnStr);
		
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
