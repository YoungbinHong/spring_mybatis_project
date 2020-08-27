package ETS.notice.mapper;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.sql.SQLException;
import java.util.List;

/**************************************************
* @FileName   : NoticeMapper.java
* @Description: 공지사항 관리 인터페이스
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 1. 31.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

public interface NoticeMapper {
	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 공지사항 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	int updateNoticeViewCount(DataMap paramMap) throws SQLException;

	
	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 공지사항 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	List<CamelMap> getNoticeList(DataMap paramMap) throws SQLException;
	
	
	/**************************************************
	* @MethodName : getNoticeListCount
	* @Description: 공지사항 리스트 카운트
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	int getNoticeListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getNoticeView
	* @Description: 공지사항 상세보기
	* @param paramMap
	* @return CamelMap
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	CamelMap getNoticeView(DataMap paramMap) throws SQLException;
	
	/*
	 * 
	 * 
	 * 등록,수정,삭제
	 * 
	 * 
	 * 
	 * 
	 */
	
	/**************************************************
	* @MethodName : deleteNotice
	* @Description: 공지사항 삭제
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	int deleteNotice(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : insertNotice
	* @Description: 공지사항 등록
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 2. 4.
	**************************************************/
	int insertNotice(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : updateNotice
	* @Description: 공지사항 수정
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 2. 4.
	**************************************************/
	int updateNotice(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getRollingList
	* @Description: 롤링 공지 가져오기
	* @param paramMap
	* @return CamelMap
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	List<CamelMap> getRollingList(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : getRollingListCount
	* @Description: 롤링 공지 리스트 수
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	int getRollingListCount(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : deleteRolling
	* @Description: 롤링 공지 삭제
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	int deleteRolling(DataMap paramMap) throws SQLException;
	
	/**************************************************
	* @MethodName : insertRolling
	* @Description: 롤링 공지 등록
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	int insertRolling(DataMap paramMap) throws SQLException;
}