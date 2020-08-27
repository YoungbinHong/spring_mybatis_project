package ETS.log.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.log.mapper.OrderLogMapper;

@Service
public class OrderLogService {
	
	@Autowired
	private OrderLogMapper orderLogMapper;
	
	public List<CamelMap> noname(DataMap paramMap) throws SQLException{
		return orderLogMapper.noname(paramMap);
	}	
}
