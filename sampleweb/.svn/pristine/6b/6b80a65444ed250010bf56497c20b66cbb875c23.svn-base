/**
 * 
 */
package kr.co.adup.test.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.adup.test.mapper.TestUpdateMapper;
import kr.co.adup.util.CamelMap;

/**
 * @author ADUP
 *
 */
@Service
public class TestUpdateService {

	@Autowired
	private TestUpdateMapper testUpdater;

	/**************************************************
	* @FileName   : insertStudent
	* @Description: 학생 정보 추가
	* @param      : CamelMap
	* @Author     : kang
	* @return     : int (inserted rows or id)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public int insertStudent(CamelMap param) throws SQLException {
		return this.testUpdater.insertStudent(param);
	}

	/**************************************************
	* @MethodName : updateStudent
	* @Description: 학생 정보 수정
	* @param      : paramMap
	* @return     : int (updated rows)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public int updateStudent(CamelMap param) throws SQLException {
		return this.testUpdater.updateStudent(param);
	}

	/**************************************************
	* @MethodName : deleteStudent
	* @Description: 학생 정보 삭제
	* @param      : paramMap
	* @return     : int (deleted rows)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public int deleteStudent(CamelMap param) throws SQLException {
		return this.testUpdater.deleteStudent(param);
	}

}
