package ETS.event.mapper;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.sql.SQLException;
import java.util.List;

/**************************************************
* @FileName   : EventmanageMapper.java
* @Description: 이벤트 관리 인터페이스
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public interface EventMapper {
	
	/**************************************************
	* @MethodName : geteventList
	* @Description: 이벤트 리스트 가져오기
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> geteventList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : geteventListCount
	* @Description: 이벤트 리스트 카운트 가져오기
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int geteventListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getExchangeList
	* @Description: 이벤트 리스트 카운트 가져오기
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getExchangeList() throws SQLException;
	
	/**************************************************
	* @MethodName : geteventList
	* @Description: 이용권 리스트 가져오기
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : 
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getTicketList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : SaveEvent
	* @Description: 이벤트 저장하기
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int SaveEvent(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : deleteEvent
	* @Description: 이벤트 삭제
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	int deleteEvent(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : UpdateEvent
	* @Description: 이벤트 업데이트
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int UpdateEvent(DataMap paramMap) throws SQLException;
	
}
