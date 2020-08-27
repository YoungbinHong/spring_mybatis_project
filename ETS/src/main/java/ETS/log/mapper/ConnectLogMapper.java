package ETS.log.mapper;

import java.sql.SQLException;
import java.util.List;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

/**************************************************
* @FileName   : BoardMapper.java
* @Description: 공지사항 관리 인터페이스
* @Author     : hyngsk
* @Version    : 2020. 8. 19.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
public interface ConnectLogMapper {
	
	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 로그 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : hyngsk
	* @Version    : 2020. 8. 19.
	**************************************************/
	List<CamelMap> getLogList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getLogListCount
	* @Description: 로그 리스트 카운트
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : hyngsk
	* @Version    : 2020. 8. 19.
	**************************************************/
	int getLogListCount(DataMap paramMap) throws SQLException;

}
