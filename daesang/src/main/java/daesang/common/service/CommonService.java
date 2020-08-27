package daesang.common.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import daesang.common.CamelMap;
import daesang.common.DataMap;
import daesang.common.Global;
import daesang.common.mapper.CommonMapper;
import daesang.common.util.DateUtil;
import daesang.common.util.FileUtil;

/************************************************** 
 * @FileName   : CommonService.java
 * @Description: 공통 비지니스 로직
 * @Author     : joon
 * @Version    : 2016. 4. 16.
 * @Copyright  : ⓒADUP. All Right Reserved
 **************************************************/
@Service
public class CommonService {

	private static final Logger logger = LoggerFactory.getLogger(CommonService.class);

	@Autowired
	private CommonMapper commonMapper;
	
	
	/**************************************************
	* @MethodName : selectUserLoginInfo
	* @Description: 로그인 회원 정보
	* @param paramMap
	* @return
	* @throws Exception CamelMap
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 17.
	**************************************************/
	public CamelMap selectUserLoginInfo(DataMap paramMap) throws Exception{
		return this.commonMapper.selectUserLoginInfo(paramMap);
	}
	
	/************************************************** 
	 * @MethodName : saveFile
	 * @Description: 파일 저장 후 파일 정보 리턴
	 * @param multipartRequest
	 * @param paramMap - filePath : 저장할 파일 경로
	 * @return List<DataMap> 
	 * 			saveFileName : 저장된 파일 명
	 *       	realFileName : 실제 파일 명
	 *       	saveFilePath : 저장된 파일 경로
	 *       	fileSize     : 파일 사이즈
	 *       	uploadName   : 업로드 오브젝트의 네임값
	 * @throws Exception
	 * @Author     : Won-Joon. Lee
	 * @Version    : 2017. 6. 1.
	**************************************************/
	@SuppressWarnings("unchecked")
	public List<DataMap> saveFile(HttpServletRequest request, DataMap paramMap) throws Exception{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
	    Iterator<String> iterator = multipartRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    
	    List<DataMap> rstFileList = new ArrayList<DataMap>();
	    
	    String root = "";
	    
	    String osname = System.getProperty("os.name");
		if(osname.startsWith("Window")){
			root = Global.resource.getString("FILE_ROOT_WINDOW");
		}else{
			root = Global.resource.getString("FILE_ROOT_LINUX");
		}
	    
	    String filePath = null;
	    if(StringUtils.isNotEmpty(paramMap.getString("filePath")))
	    	filePath = paramMap.getString("filePath");
	    else{
	    	filePath = "DAESANG/" + DateUtil.getSimpleDate("yyyy") + "/" + DateUtil.getSimpleDate("MMdd");
	    }
	    
	    root = root + "/" + filePath;
	    FileUtil fileUtil = new FileUtil();
	    
	    fileUtil.createDirectory(root);
	    
	    while(iterator.hasNext()){
	        multipartFile = multipartRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	        	logger.debug("------------- file start -------------");
	        	logger.debug("name : "+multipartFile.getName());
	        	logger.debug("filename : "+multipartFile.getOriginalFilename());
	        	logger.debug("size : "+multipartFile.getSize());
	        	logger.debug("-------------- file end --------------\n");
	        	String filename = multipartFile.getOriginalFilename();
	        	
	        	String saveFile = DateUtil.getSimpleDate() + "_" + RandomStringUtils.randomAlphabetic(8);		            	
            	if(filename.lastIndexOf(".") > -1) saveFile += filename.substring(filename.lastIndexOf("."));
	        	
	        	fileUtil.writeFile(multipartFile, root, saveFile);
	        	
	        	DataMap fileMap = new DataMap();
	        	fileMap.put("saveFileName", saveFile);
	        	fileMap.put("realFileName", filename);
	        	fileMap.put("saveFilePath", filePath);
	        	fileMap.put("fileSize", multipartFile.getSize());
	        	fileMap.put("uploadName", multipartFile.getName());
	        	
	        	rstFileList.add(fileMap);
	        }
	    }
	    
	    return rstFileList;
	}
	
	/**************************************************
	* @MethodName : getCommonCodeMstForGrp
	* @Description: 지역 코드 조회
	* @param paramMap
	* @return List<CamelMap>
	* @Author     : Seung-Jun. Kim
	* @Version    : 2019. 1. 24.
	**************************************************/
	public List<CamelMap> getAreaCodeMstForGrp(DataMap paramMap){
		List<CamelMap> codeList = new ArrayList<CamelMap>();
		
		try {
			codeList = this.commonMapper.selectAreaCodeMstForGrp(paramMap);
		} catch (Exception e) {
			logger.debug("area code list for group/parent info error : {}", e);
		}
		
		return codeList;
	}
	
	/**************************************************
	* @MethodName : getCommonCodeMstForGrp
	* @Description: 공통 코드 조회
	* @param paramMap
	* @return List<CamelMap>
	* @Author     : Jong-Hoon. Jung
	* @Version    : 2019. 1. 29.
	**************************************************/
	public List<CamelMap> getCommonCodeMstForGrp(DataMap paramMap){
		List<CamelMap> commonCodeList = new ArrayList<CamelMap>();
		
		try {
			commonCodeList = this.commonMapper.selectCommonCodeMstForGrp(paramMap);
		} catch (Exception e) {
			logger.debug("common code list for group/parent info error : {}", e);
		}
		
		return commonCodeList;
	}
	
}