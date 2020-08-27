package ETS.payment.service;

import ETS.payment.mapper.PaymentMapper;
import ETS.common.util.CamelMap;
import ETS.common.util.DataMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**************************************************
* @FileName   : NoticeService.java
* @Description: 공지사항 관리 비지니스 로직
* @Author     : Seungjun Kim
* @Version    : 2020. 8. 14.
* @Copyright  : ⓒADUP. All Right Reserved
**************************************************/

@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper;
	
	/**************************************************
	* @MethodName : getuseTicketList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getuseTicketList(DataMap paramMap) throws Exception {
		return paymentMapper.getuseTicketList(paramMap);		
	}
	
	/**************************************************
	* @MethodName : getuseTicketListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int getuseTicketListCount(DataMap paramMap) throws Exception {
		return paymentMapper.getuseTicketListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : geteventList
	* @Description: 
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> geteventList() throws Exception {
		return paymentMapper.geteventList();		
	}
	
	/**************************************************
	* @MethodName : getExchangeList
	* @Description: 
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getExchangeList() throws Exception {
		return paymentMapper.getExchangeList();		
	}
	
	/**************************************************
	* @MethodName : registerEvent
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int registerEvent(DataMap paramMap) throws Exception {
		return paymentMapper.registerEvent(paramMap);
	}
	
	/**************************************************
	* @MethodName : registeruseTicket
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int registeruseTicket(DataMap paramMap) throws Exception {
		return paymentMapper.registeruseTicket(paramMap);
	}
	
	/**************************************************
	* @MethodName : deleteuseTicket
	* @Description: 
	* @param paramMap
	* @return boolean
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public boolean deleteuseTicket(DataMap paramMap) throws Exception{
		int rst = 0;
		rst = this.paymentMapper.deleteuseTicket(paramMap);
		
		return rst > 0 ? true : false;
	}
	
	/**************************************************
	* @MethodName : releaseEvent
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int releaseEvent(DataMap paramMap) throws Exception {
		return paymentMapper.releaseEvent(paramMap);
	}
	
	/**************************************************
	* @MethodName : getPaymentList
	* @Description: 
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getPaymentList(DataMap paramMap) throws Exception {
		return paymentMapper.getPaymentList(paramMap);
	}
	
	/**************************************************
	* @MethodName : getPaymentListCount
	* @Description: 
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int getPaymentListCount(DataMap paramMap) throws Exception {
		return paymentMapper.getPaymentListCount(paramMap);
	}
	
	//레퍼럴 관리 비즈니스 로직
	
	/**************************************************
	* @MethodName : getManageList
	* @Description: 레퍼럴 리스트
	* @param paramMap
	* @return List<CamelMap>
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public List<CamelMap> getManageList(DataMap paramMap) throws Exception {
		return paymentMapper.getManageList(paramMap);	
	}
	
	/**************************************************
	* @MethodName : getManageListCount
	* @Description: 레퍼럴 리스트 카운트
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int getManageListCount(DataMap paramMap) throws Exception {
		return paymentMapper.getManageListCount(paramMap);
	}
	
	/**************************************************
	* @MethodName : insertManage
	* @Description: 레퍼럴 등록
	* @param paramMap
	* @return int
	* @throws Exception
	* @Author     : Seungjun Kim
	* @Version    : 2020. 8. 14.
	**************************************************/
	public int insertManage(DataMap paramMap) throws Exception {
		return paymentMapper.insertManage(paramMap);
	}
	
}
