package ETS.member.mapper;

import java.sql.SQLException;
import java.util.List;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

/**************************************************
* @FileName   : MemberMapper.java
* @Description: 회원 관리 인터페이스
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public interface MemberMapper{
	
	/**************************************************
	* @MethodName : showMember
	* @Description: 회원관리 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	List<CamelMap> showMember(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : showMemberCount
	* @Description: 페이징 처리
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 25.
	**************************************************/
	int showMemberCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : showNormalOrder
	* @Description: 일반주문 명세
	* @param paramMap
	* @return void
	* @throws SQLException
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 26.
	**************************************************/
	List<CamelMap> showNormalOrder(DataMap paramMap) throws SQLException;
}