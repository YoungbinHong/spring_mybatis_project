package ETS.notice.service;

import ETS.notice.mapper.NoticeMapper;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**************************************************
* @FileName   : NoticeService.java
* @Description: 공지사항 관리 비지니스 로직
* @Author     : Seung-Jun. Kim
* @Version    : 2020. 1. 31.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 공지사항 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	public int updateNoticeViewCount(DataMap paramMap) throws Exception {
		return noticeMapper.updateNoticeViewCount(paramMap);		
	}

	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 공지사항 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	public List<CamelMap> getNoticeList(DataMap paramMap) throws Exception {
		return noticeMapper.getNoticeList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : getNoticeListCount
	* @Description: 공지사항 리스트 카운트
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	public int getNoticeListCount(DataMap paramMap) throws Exception {
		return noticeMapper.getNoticeListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : getNoticeView
	* @Description: 공지사항 상세보기
	* @param paramMap
	* @return CamelMap
	* @throws SQLException
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	public CamelMap getNoticeView(DataMap paramMap) throws SQLException{
		return noticeMapper.getNoticeView(paramMap);
	}
	
	/**************************************************
	* @MethodName : deleteNotice
	* @Description: 공지사항 삭제
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	public boolean deleteNotice(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.noticeMapper.deleteNotice(paramMap);
		
		return rst > 0 ? true : false;
	}
	
	/**************************************************
	* @MethodName : insertNotice
	* @Description: 공지사항 등록
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 2. 4.
	**************************************************/
	public int insertNotice(DataMap paramMap) throws Exception {
		return noticeMapper.insertNotice(paramMap);
	}
	
	/**************************************************
	* @MethodName : updateNotice
	* @Description: 공지사항 수정
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 2. 4.
	**************************************************/
	public int updateNotice(DataMap paramMap) throws Exception {
		return noticeMapper.updateNotice(paramMap);
	}
	
	/**************************************************
	* @MethodName : getRollingList
	* @Description: 롤링 공지 가져오기
	* @param paramMap
	* @return CamelMap
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	public List<CamelMap> getRollingList(DataMap paramMap) throws Exception {
		return noticeMapper.getRollingList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : getRollingListCount
	* @Description: 롤링 공지 리스트 수
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	public int getRollingListCount(DataMap paramMap) throws Exception {
		return noticeMapper.getRollingListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : deleteRolling
	* @Description: 롤링 공지 삭제
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	public boolean deleteRolling(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.noticeMapper.deleteRolling(paramMap);
		
		return rst > 0 ? true : false;
	}
	
	/**************************************************
	* @MethodName : insertRolling
	* @Description: 롤링 공지 등록
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 알 수 없음
	**************************************************/
	public int insertRolling(DataMap paramMap) throws Exception {
		return noticeMapper.insertRolling(paramMap);
	}
}
