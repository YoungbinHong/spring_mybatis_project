package kr.co.adup.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.adup.test.service.TestSelectService;
import kr.co.adup.util.CamelMap;
import kr.co.adup.util.Obj;

/***************************************************
 * @FileName : CommonController.java
 * @Description: Commonly used functions
 * @Author : joon
 * @Version : 2016. 01. 14.
 * @Copyright : ⓒ ADUP. All Right Reserved
 ***************************************************/
@Controller
@RequestMapping("test")
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	@Autowired
	private TestSelectService testSelecter;

	@RequestMapping(value="/student/list", method=RequestMethod.GET, produces = "application/json; charset=utf8")
	public ResponseEntity<?> studentList(HttpServletRequest request) {

		Map<String, Object> res = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;


		List<Map<String, Object>> data = new ArrayList<Map<String,Object>>();
		try {
			List<CamelMap> list = this.testSelecter.selectStudent(null);
			res.put("result", "ok");
			res.put("data", list);
			logger.debug("size: {}", data.size());
		} catch (Exception e) {
			e.printStackTrace();
			res.put("result", "fail");
			res.put("message", "failed to select student data");
			status = HttpStatus.INTERNAL_SERVER_ERROR;
			logger.debug(Obj.toString(res));
		}
		
		return new ResponseEntity<Map<String,Object>>(res, status);
	}
}