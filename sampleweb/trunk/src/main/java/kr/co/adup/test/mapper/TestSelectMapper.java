package kr.co.adup.test.mapper;

import java.sql.SQLException;
import java.util.List;

import kr.co.adup.util.CamelMap;

/**************************************************
* @FileName   : TestSelectMapper.java
* @Description: 학생 관리
* @Author     : kang
* @Version    : 2020. 07. 28.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
public interface TestSelectMapper {

	/**************************************************
	* @MethodName : selectStudent
	* @Description: 학생 정보 조회
	* @param      : paramMap
	* @return     : List<CamelMap)
	* @throws     : SQLException
	* @Author     : kang
	* @Version    : 2020. 07. 28.
	**************************************************/
	public List<CamelMap> selectStudent(CamelMap paramMap) throws SQLException;

}
