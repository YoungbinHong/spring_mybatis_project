package ETS.memberApprove.service;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.memberApprove.mapper.ApproveMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**************************************************
* @FileName   : ApproveService.java
* @Description: 가입 승인 관리 로직
* @Author     : Seungjun Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Service
public class ApproveService {
	@Autowired
	private ApproveMapper approveMapper;
	
	/**************************************************
	* @MethodName : getUserList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getUserList(DataMap paramMap) throws Exception {
		return approveMapper.getUserList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : getDUserList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getDUserList(DataMap paramMap) throws Exception {
		return approveMapper.getDUserList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : getUserListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int getUserListCount(DataMap paramMap) throws Exception {
		return approveMapper.getUserListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : getDUserListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int getDUserListCount(DataMap paramMap) throws Exception {
		return approveMapper.getDUserListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : userDelay
	* @Description: 
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public boolean userDelay(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.approveMapper.userDelay(paramMap);
		
		return rst > 0 ? true : false;
	}
	
	/**************************************************
	* @MethodName : userApprove
	* @Description: 
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public boolean userApprove(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.approveMapper.userApprove(paramMap);
		
		return rst > 0 ? true : false;
	}
	
	/**************************************************
	* @MethodName : DuserApprove
	* @Description: 
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public boolean DuserApprove(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.approveMapper.DuserApprove(paramMap);
		
		return rst > 0 ? true : false;
	}
	
}
