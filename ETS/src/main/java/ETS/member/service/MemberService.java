package ETS.member.service;

import org.springframework.stereotype.Service;

import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;
import ETS.member.mapper.MemberMapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

/**************************************************
* @FileName   : MemberService.java
* @Description: 회원 관리 로직
* @Author     : Youngbin Hong
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	/**************************************************
	* @MethodName : showMember
	* @Description: 회원 명세
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> showMember(DataMap paramMap) throws Exception {
		return memberMapper.showMember(paramMap);
	}
	
	/**************************************************
	* @MethodName : showMemberCount
	* @Description: 페이징 처리
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 25.
	**************************************************/
	public int showMemberCount(DataMap paramMap) throws Exception {
		return memberMapper.showMemberCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : showNormalOrder
	* @Description: 일반주문 명세
	* @param paramMap
	* @return void
	* @throws Exception
	* @Author     : Youngbin Hong
	* @Version    : 2020. 8. 26.
	**************************************************/
	public List<CamelMap> showNormalOrder(DataMap paramMap) throws Exception {
		return memberMapper.showNormalOrder(paramMap);
	}
}