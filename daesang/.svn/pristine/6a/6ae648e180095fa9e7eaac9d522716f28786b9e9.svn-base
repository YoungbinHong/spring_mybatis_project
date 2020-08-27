package daesang.common.mapper;

import java.sql.SQLException;
import java.util.List;

import daesang.common.CamelMap;
import daesang.common.DataMap;

/**************************************************
* @FileName   : CommonMapper.java
* @Description: 공통 인터페이스
* @Author     : Jong-Hoon. Jung
* @Version    : 2019. 1. 30.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
public interface CommonMapper {

	/**************************************************
	* @MethodName : selectUserLoginInfo
	* @Description: 로그인 회원 정보
	* @param paramMap
	* @return CamelMap
	* @throws SQLException 
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 15.
	**************************************************/
	CamelMap selectUserLoginInfo(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : selectAreaCodeMstForGrp
	* @Description: 지역 코드 조회
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException 
	* @Author     : Seung-Jun. Kim
	* @Version    : 2019. 1. 24.
	**************************************************/
	List<CamelMap> selectAreaCodeMstForGrp(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : selectCommonCodeMstForGrp
	* @Description: 공통 코드 조회
	* @param paramMap
	* @return  List<CamelMap>
	* @throws SQLException
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 29.
	**************************************************/
	List<CamelMap> selectCommonCodeMstForGrp(DataMap paramMap) throws SQLException;
}