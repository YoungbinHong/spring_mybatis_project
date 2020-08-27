/**
 * 
 */
package kr.co.adup.test.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.adup.test.mapper.TestSelectMapper;
import kr.co.adup.util.CamelMap;

/**
 * @author ADUP
 *
 */
@Service
public class TestSelectService {

	@Autowired
	private TestSelectMapper testSelecter;

	/**************************************************
	* @MethodName : selectStudent
	* @Description: 학생 정보 조회
	* @param      : paramMap
	* @return     : List<CamelMap)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public List<CamelMap> selectStudent(CamelMap paramMap) throws SQLException {
		return this.testSelecter.selectStudent(paramMap);
	}

}
