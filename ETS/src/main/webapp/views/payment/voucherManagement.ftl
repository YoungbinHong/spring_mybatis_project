<!--
	* @FileName   : voucherManagement.ftl
	* @Description: 이용권 관리  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>


<script src="/js/download.js"></script>
<script type="text/javascript">
	var form;
	var seq;
	//설정 버튼 클릭 시 event관련 modal창 띄움
	$(document).ready(function(){
		$('#modalevent').on('show.bs.modal', function(event) {          
            seq = $(event.relatedTarget).data('id');
        });
	});

	//등록 버튼 클릭 시 event+이용권 modal창 띄움
	$(document).ready(function(){
		$('#modalEvUse').on('show.bs.modal', function(event) {
			//jsAlert.alert("알림", $('#ticketStatus2'));
			if ($(event.relatedTarget).data('event') != "x"){
				useTicketFrm.useTicketSeq.value = $(event.relatedTarget).data('id');
			} else{
				useTicketFrm.useTicketSeq.value ="";
			}
			document.getElementById('useticket').innerHTML = '&nbsp;:&nbsp;&nbsp;&nbsp; '+ $(event.relatedTarget).data('useticket')+"권";
			document.getElementById('period').innerHTML = '&nbsp;:&nbsp;&nbsp;&nbsp; '+ $(event.relatedTarget).data('period')+"일";
			document.getElementById('price').innerHTML = '&nbsp;:&nbsp;&nbsp;&nbsp; '+ $(event.relatedTarget).data('price')+"원";
			document.getElementById('event').innerHTML = '&nbsp;:&nbsp;&nbsp;&nbsp; '+ $(event.relatedTarget).data('event');
        });
	});
	
	//EVENT해제
	function fn_releaseEV(){
	$('#useTicketSeq').val(seq);
		jsAlert.confirm("확인", "해당 이벤트를 해제 하시겠습니까?", fn_releaseEVYn, null, "확인", "취소")
	}
	
	function fn_releaseEVYn(){
		ajaxFormExecute("useTicketFrm", "/payment/ajaxreleaseEV", "post", false, false, ajaxReturnreleaseEV);
	}
	
	function ajaxReturnreleaseEV(data){
		if(data.sw){
    		jsAlert.alert("알림", "해당 이벤트 해제 되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "해당 이벤트 등록에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	
	//modalEvUse modal창 안에 저장 버튼 누르면 + 해제 버튼 누르면
	function fn_updateState(check1, check2){
		if (!check1 && !check2){
			if (!useTicketFrm.useTicketSeq.value){
				jsAlert.alert("알림", "이벤트 등록 후에 등록 가능합니다");
			} else{
				useTicketFrm.searchType.value="";
				useTicketFrm.useTicketStatus.value=1;
				fn_releaseYn();
			}
		} else{
			useTicketFrm.searchType.value="";
			useTicketFrm.useTicketStatus.value=0;
			useTicketFrm.useTicketSeq.value = check1;
			jsAlert.confirm("확인", check2+"권을 해제 하시겠습니까?", fn_releaseYn, null, "확인", "취소");
		}
	}
	
	function fn_releaseYn(){
		ajaxFormExecute("useTicketFrm", "/payment/ajaxuseTicketRegister", "post", false, false, ajaxReturnrelease);
	}
	
	function ajaxReturnrelease(data){
		if(data.sw){
    		jsAlert.alert("알림", "성공하였습니다", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	//이용권 등록하는 form에서 버튼 누르면 일 수 증가
	function fn_addPeriod1(days){
		var period = Number(useTicketInsertFrm.useTicketPeriod.value);
		if (Number(days) == 0){
			period = 0;
		}
		else {
			period += Number(days);
		}
		useTicketInsertFrm.useTicketPeriod.value = period;
	}
	
	//이용권 정보 목록 가져오기
	function fn_list(){
		$("#useTicketInsertFrm").prop("action", "/payment/voucherManagement");
		$('#nowPage').val('1');
 		formSubmit("useTicketInsertFrm");
	}
	
	//이벤트 설정 + 이용권 등록
	function fn_register(){
		//seq없으면 이용권 등록, 있으면 이벤트 등록
		//jsAlert.alert("알림", seq);
		if(!seq){
			if (!useTicketInsertFrm.useTicketName.value || !useTicketInsertFrm.useTicketPeriod.value || !useTicketInsertFrm.EXsearchType.value || !useTicketInsertFrm.useTicketPrice.value){
				jsAlert.alert("알림", "빈칸을 모두 채워주세요");
			} else{
				jsAlert.confirm("확인", "이용권을 등록 하시겠습니까?", fn_registerYn, null, "확인", "취소")	
			}
    	}else{
    		jsAlert.confirm("확인", "해당 이벤트를 등록 하시겠습니까?", fn_registerYn, null, "확인", "취소")
    	}
	}
	
	
	
	function fn_registerYn(){
		$('#useTicketSeq').val(seq);
		//seq없으면 이용권 등록, 있으면 이벤트 등록
		if(!seq){
			form = "useTicketInsertFrm"
		}
		else{
			form = "useTicketFrm"
		}
		ajaxFormExecute(form, "/payment/ajaxuseTicketRegister", "post", false, false, ajaxReturnregister);
	}
	
	function ajaxReturnregister(data){
		seq = "";
		if(data.sw){
    		jsAlert.alert("알림", "등록 되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "등록에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_delete(useTicketSeq, useTicketName) {
		$('#useTicketSeq').val(useTicketSeq);
		jsAlert.confirm("확인", useTicketName+"일권 삭제 하시겠습니까?", fn_deleteYn, null, "확인", "취소");
	}
	
	function fn_deleteYn(useTicketSeq){
		ajaxFormExecute("useTicketFrm", "/payment/ajaxuseTicketDelete", "post", false, false, ajaxReturnDelete);
	}
	
	function ajaxReturnDelete(data){
		if(data.sw){
    		jsAlert.alert("알림", "삭제되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "삭제에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
</script>

<!-- 이용권 설정 modal창 -->
	<div class="modal" id="modalevent">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<div class="container text-center">
						<div class="text-left mb-4">
							<h1 class="page-sub-title m-0">이벤트 설정</h1>
						</div>
						<span>적용할 이벤트를 선택해 주세요.</span>
						<div class="mt-3">
							<form class="form-inline" name="useTicketFrm" id="useTicketFrm" method="post" >
								<input type="hidden" id="useTicketSeq" name="useTicketSeq" value="" />
								<input type="hidden" id="useTicketStatus" name="useTicketStatus" value="" />
			
							<select type="select" name="searchType" id="searchType" class="form-control" style="width: 100%;">
								<#if eventList?size != 1>
          							<#list eventList as eMap>
          								<#if eMap.eventseq != 0>
          									<option value="${eMap.eventseq}">${eMap.eventname} ${eMap.discountrate}%</option>
          								</#if>
          							</#list>
         					 	<#else>
          							<option value="${eMap.eventseq}">이벤트가 존재하지 않습니다</option>
          						</#if>
          					</select>
          					</form>
							
							<div class="text-center mt-3">
								<button type="button" class="btn btn-secondary btn-sm"  onclick="fn_releaseEV();">이벤트 해제</button>
							</div>
							<div class="row justify-content-around mt-3">
								<button type="button" class="btn btn-secondary btn-sm col-md-4"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-success btn-sm col-md-4" onclick="fn_register();">적용</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 23 페이지 이용권 등록 모달 -->
<div class="modal fade" id="modalEvUse">
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content">
      <!-- body -->
      <form class="form-inline" name="modalEveUse" id="modalEveUse" method="post" >
      	<input type="hidden" id="UseEveSeq" name="UseEveSeq" value="" />
      <div class="modal-body">
       	<div class="container text-center">
			<span>이용권을 등록하시겠습니까?</span>
       		<div class="mt-3 text-left">
				<table class="mx-auto">
					<tbody>
						<tr class="mb-2">
	          				<td>· 이용권 명</td><td id="useticket"></td>
	        			</tr>
	        			<tr class="mb-2">
	         				<td>· 적용 기간</td><td id="period"></td>
	       				</tr>
	        			<tr class="mb-2">
	          				<td>· 가격</td><td id="price"></td>
	        			</tr>
	        			<tr class="mb-2">
	          				<td>· 이벤트</td><td id="event"></td>
	        			</tr>
	      		</tbody>
	    	</table>
      	</div>
      	</form>
      		<!--</form> Footer -->
      		<div class="row justify-content-around mt-3">
        		<center>
        			<button type="button" class="btn btn-success btn-sm" onclick="fn_updateState()" style="width: 100px;">등록</button>
        			<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" style="width: 100px;">취소</button>
        		</center>
      		</div>
   		 </div>
  	  </div>
   </div>
 </div>
</div>
<!-- 23 이용권 등록 모달 END -->


<!-- 이용권 관리 페이지 -->
<div class="right_col" role="main">
	<div class="col-md-12 col-sm-12 ">
		<div class="page-title">
			<div class="title_left">
				<h3>이용권 관리</h3>
			</div>
		</div>
		<div class="x_panel" style="padding-top: 30px;">
			<div class="input-group justify-content-between">
				<form name="" id="useTicketInsertFrm" method="POST" style="width: 100%;">
					<div class="table-responsive">
						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="200" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="text-center">이용권 이름 설정</th>
									<td><input type="text" name="useTicketName" id="useTicketName" value=""
										class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">사용 기간 설정</th>
									<td>
										<button type="button" 
											class="btn btn-success btn-sm col-md-1 col-sm-6 col-xs-6 btn-frm m-0 mr-1" onclick="fn_addPeriod1(1)">
											<i class="fa fa-plus"></i> 1일
										</button>
										<button type="button"
											class="btn btn-success btn-sm col-md-1 col-sm-6 col-xs-6 btn-frm m-0 mr-1" onclick="fn_addPeriod1(7)">
											<i class="fa fa-plus"></i> 7일
										</button>
										<button type="button"
											class="btn btn-success btn-sm col-md-1 col-sm-6 col-xs-6 btn-frm m-0 mr-1" onclick="fn_addPeriod1(30)">
											<i class="fa fa-plus"></i> 30일
										</button>
										<button type="button"
											class="btn btn-success btn-sm col-md-1 col-sm-6 col-xs-6 btn-frm m-0 mr-1" onclick="fn_addPeriod1(365)">
											<i class="fa fa-plus"></i> 365일
										</button> <input type="text" name="useTicketPeriod" id="useTicketPeriod" value="0"
										class="form-control col-md-1" />
										<div class="col-md-1 txt-unit text-left">일</div>
										<button type="button"
											class="btn btn-success btn-sm col-md-1 col-sm-6 col-xs-6 btn-frm m-0 mr-1" onclick="fn_addPeriod1(0)">
											RESET
									</td>
								</tr>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">거래소</th>
									<td><select type="select" id="EXsearchType" name="EXsearchType" class="form-control">
											<#if resultExchangeList?has_content>
									          	<#list resultExchangeList as exMap>
									          		<option value="${exMap.exchangename}">${exMap.exchangename}</option>
									          	</#list>
									          	<#else>
									          		<option value="NONE">거래소가 존재하지 않습니다</option>
									         </#if>
									</select></td>
								</tr>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">가격</th>
									<td><input type="text" name="useTicketPrice" id="useTicketPrice" value=""
										class="form-control col-md-9" />
										<div class="col-md-1 txt-unit text-left">원</div>
										<button type="button"
											class="btn btn-success btn-sm col-md-2 m-0 btn-frm" onclick="fn_register()">저장</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div class="input-group justify-content-end">
				<button type="button"
					class="btn btn-secondary btn-sm col-md-2 col-sm-3 col-xs-3"
					data-toggle="modal" data-target="#controlTicket">위치 변경/삭제</button>
			</div>

			<div class="table-responsive">
				<table class="table jambo_table bulk_action">
					<colgroup>
						<col width="4%" />
						<col width="8%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
					</colgroup>
					<thead>
						<tr class="headings">
							<th class="column-title text-center">No</th>
							<th class="column-title text-center">거래소</th>
							<th class="column-title text-center">이용권 명</th>
							<th class="column-title text-center">적용기간</th>
							<th class="column-title text-center">상태</th>
							<th class="column-title text-center">가격</th>
							<th class="column-title text-center" colspan="2">이벤트</th>
							<th class="column-title text-center" colspan="2">등록</th>
							<th class="bulk-actions" colspan="10"><a class="antoo"
								style="color: #fff; font-weight: 500;">총<span
									class="action-cnt"> </span>건
							</a></th>
						</tr>
					</thead>

			<!-- 이용권 불러오기 -->
					<tbody>
						<#if resultUseTicketList?has_content>
							<#assign rNum = pageInfo.rowMax - pageInfo.startRowNum + 1 />
									<#list resultUseTicketList as rMap>
										<#if rMap.useTicketStatus == 1>
											<#assign ticketStatus1 = "등록" />
											<#assign ticketStatus2 = "해제" />
										<#else>
											<#assign ticketStatus1 = "미등록" />
											<#assign ticketStatus2 = "등록" />
										</#if>
									<tr style="cursor:pointer;">
										<td class="even pointer">${rNum}</td>
										<td class="even pointer">${rMap.exchangeName!}</td>
										<td class="even pointer">${rMap.useTicketName!}&nbsp;&nbsp;권</td>
										<td class="even pointer">${rMap.applicationPeriod!}&nbsp;&nbsp;일</td>
										<td class="even pointer">${ticketStatus1}</td>
										<td class="even pointer">${rMap.useTicketPrice!}&nbsp;&nbsp;원</td>
										<#if rMap.eventname != "">
											<td class="even pointer">${rMap.eventname} &nbsp;${rMap.discountrate}%</td>
											<td><button type="button" data-toggle="modal" data-target="#modalevent" data-id='${rMap.useTicketSeq}' class="btn btn-success" style="width: 100%;">설정</button></td>
										<#else>
											<td>&nbsp;&nbsp;ㅡ&nbsp;&nbsp; <button type="button" data-toggle="modal" data-target="#modalevent" data-id='${rMap.useTicketSeq}' class="btn btn-success">설정</button> </td>
										</#if>
										<td> 
											<#if ticketStatus2=="등록">
												<button type="button" data-toggle="modal" data-target="#modalEvUse" data-id='${rMap.useTicketSeq}' data-useticket='${rMap.useTicketName}' data-period='${rMap.applicationPeriod}' data-price='${rMap.useTicketPrice}' data-event='${rMap.eventname?default("x")}'class="btn btn-success" style="width: 100%;">${ticketStatus2}</button>
											<#else>
												<button type="button" id="release" onclick="javascript:fn_updateState('${rMap.useTicketSeq}','${rMap.useTicketName}')" class="btn btn-secondary btn-sm" style="width: 100%;">${ticketStatus2}</button>
										</td>
											</#if>
												<td> <button type="button" id="delete" onclick="javascript:fn_delete('${rMap.useTicketSeq}','${rMap.useTicketName}')" class="btn btn-secondary btn-sm" style="width: 100%;">삭제</button></td>
									</tr>
									<#assign rNum = rNum - 1/>
									</#list>
						<#else>
										<tr>
											<td colspan="8"><strong>게시물이 존재하지 않습니다.</strong></td>
										</tr>
						</#if>
					</tbody>
				</table>
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	


	<!-- 23 이용권 위치 변경/삭제 모달 -->
	<div class="modal" id="controlTicket">
		<div class="modal-dialog modal-dialog-centered modal-sm"
			style="min-width: 30%;">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<div class="container text-center">
						<div class="text-left mb-4">
							<h1 class="page-sub-title m-0">이용권 위치 변경/삭제</h1>
						</div>
						<form>
							<div class="input-group m-b1">
								<select name="" id="" class="form-control">
									<option value="">이용권</option>
									<option value="" selected>90일 권</option>
								</select>
								<button type="button" class="btn btn-success ml-2">추가</button>
							</div>
						</form>
						<div class="text-left">
							<div
								class="d-flex mx-auto justify-content-between border border-dark mb-3 p-2">
								<table>
									<tbody>
										<tr>
											<td>이용권</td>
											<td>:</td>
											<td>90일권</td>
										</tr>
										<tr>
											<td>이벤트</td>
											<td>:</td>
											<td>OPEN 할인(15%)</td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-secondary mt-1">삭제</button>
							</div>
							<div
								class="d-flex mx-auto justify-content-between border border-dark mb-3 p-2">
								<table>
									<tbody>
										<tr>
											<td>이용권</td>
											<td>:</td>
											<td>180일권</td>
										</tr>
										<tr>
											<td>이벤트</td>
											<td>:</td>
											<td>OPEN 할인(15%)</td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-secondary mt-1">삭제</button>
							</div>
							<div
								class="d-flex mx-auto justify-content-between border border-dark mb-3 p-2">
								<table>
									<tbody>
										<tr>
											<td>이용권</td>
											<td>:</td>
											<td>30일권</td>
										</tr>
										<tr>
											<td>이벤트</td>
											<td>:</td>
											<td>OPEN 할인(15%)</td>
										</tr>
									</tbody>
								</table>
								<button type="button" class="btn btn-secondary mt-1">삭제</button>
							</div>
						</div>
						<div class="row justify-content-center">
							<button type="button" class="btn btn-success mt-4 col-md-4"
								data-dismiss="modal">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 23 이용권 위치 변경/삭제 모달 END-->

	

	<!-- 24 이용권 해제 모달 -->
	<div class="modal" id="cancelTicket">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row justify-content-center mt-3">
						<span><span style="color: blue;">365일권</span>의 등록이 해제되었습니다.</span>
					</div>
					<div class="row justify-content-center mt-5">
						<button type="button" class="btn btn-success btn-sm col-md-4"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 24 이용권 해제 모달 END -->

	<!-- 24 이용권 삭제 모달 END -->
	<div class="modal" id="deleteTicket">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<div class="container text-center mt-5">
						<span><span style="color: blue;">365일권</span>을 삭제하시겠습니까?</span> <br>
						<span>등록되어 있을 경우 등록이 자동 해제됩니다.</span>
						<div class="row justify-content-around mt-5">
							<button type="button" class="btn btn-secondary btn-sm col-md-4"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success btn-sm col-md-4"
								data-toggle="modal" data-target="#deleteCompleteTicket"
								data-dismiss="modal">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 24 이용권 삭제 모달 END-->

	<!-- 24 이용권 삭제 완료 모달 -->
	<div class="modal" id="deleteCompleteTicket">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row justify-content-center mt-3">
						<span><span style="color: blue;">365일권</span>이 삭제되었습니다.</span>
					</div>
					<div class="row justify-content-center mt-5">
						<button type="button" class="btn btn-success btn-sm col-md-4"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 24 이용권 삭제 완료 모달 END -->
</div>