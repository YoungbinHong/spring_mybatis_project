package ETS.payment.mapper;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.sql.SQLException;
import java.util.List;

/**************************************************
* @FileName   : PaymentMapper.java
* @Description: 
* @Author     : Seungjun Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public interface PaymentMapper {
	
	/**************************************************
	* @MethodName : getuseTicketList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getuseTicketList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getuseTicketListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int getuseTicketListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : geteventList
	* @Description: 
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> geteventList() throws SQLException;
	
	/**************************************************
	* @MethodName : getExchangeList
	* @Description: 
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getExchangeList() throws SQLException;
	
	/**************************************************
	* @MethodName : registerEvent
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int registerEvent(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : registeruseTicket
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int registeruseTicket(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : deleteuseTicket
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int deleteuseTicket(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : releaseEvent
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int releaseEvent(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getPaymentList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getPaymentList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getPaymentListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int getPaymentListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getManageList
	* @Description: 레퍼럴 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getManageList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getManageListCount
	* @Description: 레퍼럴 리스트 카운트
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int getManageListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : insertManage
	* @Description: 레퍼럴 정보 등록
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int insertManage(DataMap paramMap) throws SQLException;
	
}
