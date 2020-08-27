package ETS.event.service;

import ETS.event.mapper.EventMapper;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**************************************************
* @FileName   : EventmanageService.java
* @Description: 이벤트 페이지 로직
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Service
public class EventService {
	
	@Autowired
	private EventMapper eventMapper;
	
	/**************************************************
	* @MethodName : geteventList
	* @Description: 이벤트 리스트 가져오기
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> geteventList(DataMap paramMap) throws Exception {
		return eventMapper.geteventList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : geteventListCount
	* @Description: 이벤트 리스트 가져오기
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int geteventListCount(DataMap paramMap) throws Exception {
		return eventMapper.geteventListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : getExchangeList
	* @Description: 거래소 리스트 가져오기
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getExchangeList() throws Exception {
		return eventMapper.getExchangeList();		
	}
	
	/**************************************************
	* @MethodName : getTicketList
	* @Description: 이용권 리스트 가져오기
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getTicketList(DataMap paramMap) throws Exception {
		return eventMapper.getTicketList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : SaveEvent
	* @Description: 이벤트 저장
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int SaveEvent(DataMap paramMap) throws Exception {
		return eventMapper.SaveEvent(paramMap);
	}
	
	/**************************************************
	* @MethodName : deleteEvent
	* @Description: 이벤트 삭제
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seung-Jun. Kim
	* @Version    : 2020. 1. 31.
	**************************************************/
	public boolean deleteEvent(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.eventMapper.deleteEvent(paramMap);
		
		return rst > 0 ? true : false;
	}
	
	/**************************************************
	* @MethodName : UpdateEvent
	* @Description: 이벤트 업데이트
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int UpdateEvent(DataMap paramMap) throws Exception {
		return eventMapper.UpdateEvent(paramMap);
	}
	
}
