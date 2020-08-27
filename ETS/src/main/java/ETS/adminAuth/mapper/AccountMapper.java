package ETS.adminAuth.mapper;

import java.sql.SQLException;
import java.util.List;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

/**************************************************
* @FileName   : AccountMapper.java
* @Description: 계정 관리 인터페이스
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 20.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public interface AccountMapper{
	
	/**************************************************
	* @MethodName : selectAccountList
	* @Description: 계정 관리 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> selectAccountList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : insertAccountList
	* @Description: 계정 추가
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 21.
	**************************************************/
	int insertAccountList(DataMap paramMap) throws SQLException;
	
}