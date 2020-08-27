package ETS.adminAuth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ETS.adminAuth.mapper.AccountMapper;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

/**************************************************
* @FileName   : AccountService.java
* @Description: 계정 관리 로직
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 20.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Service
public class AccountService{
	
	@Autowired
	private AccountMapper accountMapper;
	
	/**************************************************
	* @MethodName : selectAccountList
	* @Description: 계정 관리 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 20.
	**************************************************/
	public List<CamelMap> selectAccountList(DataMap paramMap) throws Exception {
		return accountMapper.selectAccountList(paramMap);
	}
	
	/**************************************************
	* @MethodName : insertAccountList
	* @Description: 계정 추가
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 21.
	**************************************************/
	public int insertAccountList(DataMap paramMap) throws Exception {
		return accountMapper.insertAccountList(paramMap);
	}
	
}