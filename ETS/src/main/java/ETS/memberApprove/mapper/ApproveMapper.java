package ETS.memberApprove.mapper;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.sql.SQLException;
import java.util.List;

/**************************************************
* @FileName   : ApproveMapper.java
* @Description: 가입 승인 관리 인터페이스
* @Author     : Seungjun Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public interface ApproveMapper {
	
	/**************************************************
	* @MethodName : getUserList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getUserList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getDUserList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> getDUserList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getUserListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int getUserListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getDUserListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int getDUserListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : userApprove
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int userApprove(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : userDelay
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int userDelay(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : DuserApprove
	* @Description: 
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	int DuserApprove(DataMap paramMap) throws SQLException;
}
