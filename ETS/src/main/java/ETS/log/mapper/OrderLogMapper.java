package ETS.log.mapper;

import java.sql.SQLException;
import java.util.List;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

public interface OrderLogMapper {
	
	List<CamelMap> noname(DataMap paramMap) throws SQLException;
}
