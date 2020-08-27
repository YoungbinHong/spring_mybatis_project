package kr.co.adup.test.mapper;

import java.sql.SQLException;

import kr.co.adup.util.CamelMap;

/**************************************************
* @FileName   : TestUpdateMapper.java
* @Description: 학생 관리
* @Author     : kang
* @Version    : 2020. 07. 28.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
public interface TestUpdateMapper {


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
	public int insertStudent(CamelMap param) throws SQLException;

	/**************************************************
	* @MethodName : updateStudent
	* @Description: 학생 정보 수정
	* @param      : paramMap
	* @return     : int (updated rows)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public int updateStudent(CamelMap param) throws SQLException;

	/**************************************************
	* @MethodName : deleteStudent
	* @Description: 학생 정보 삭제
	* @param      : paramMap
	* @return     : int (deleted rows)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public int deleteStudent(CamelMap param) throws SQLException;

}
