package ETS.log.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.log.mapper.ConnectLogMapper;

/**************************************************
* @FileName   : ConnectLogService.java
* @Description: 로그 관리 비지니스 로직
* @Author     : hyngsk
* @Version    : 2020. 8. 19.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/
@Service
public class ConnectLogService {
	
	@Autowired
	private ConnectLogMapper connectLogMapper;
	
	/**************************************************
	* @MethodName : getLogList
	* @Description: 로그 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws SQLException
	* @Author     : hyngsk
	* @Version    : 2020. 8. 19.
	**************************************************/
	public List<CamelMap> getLogList(DataMap paramMap) throws SQLException {
		return connectLogMapper.getLogList(paramMap);
	}
	
	/**************************************************
	* @MethodName : getNoticeList
	* @Description: 로그 리스트 수
	* @param paramMap
	* @return int
	* @throws SQLException
	* @Author     : hyngsk
	* @Version    : 2020. 8. 19.
	**************************************************/
	public int getLogListCount(DataMap paramMap) throws SQLException {
		return connectLogMapper.getLogListCount(paramMap);
	}

}
