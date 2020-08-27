<!--
	* @FileName   : standby.ftl
	* @Description: 가입 승인 - 승인 대기  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.18
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>
<#assign returnUrl = "standby" />

<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		});
	});
	
	function fn_list(){
		$("#noticeFrm").prop("action", "/memberApprove/standby");
		$('#nowPage').val('1');
 		formSubmit("noticeFrm");
	}
	
	var checkflag = 'false';
	
	function fn_select(){
		if( checkflag == 'false' ){
			$("input[name=chk]").prop("checked", true);
			checkflag = 'true';
	      }else{
	    	  $("input[name=chk]").prop("checked", false);
	    	  checkflag = 'false';
	      }
	}
	
	function fn_approve(){
		if($('input:checkbox[name=chk]').is(':checked') == false){
			jsAlert.alert("알림", "승인할 사용자를 선택해주세요");
			return false;
		}
		jsAlert.confirm("확인", "해당 사용자를 승인 하시겠습니까?", fn_approveYn, null, "확인", "취소");
	}
	
	function fn_delay(){
		if($('input:checkbox[name=chk]').is(':checked') == false){
			jsAlert.alert("알림", "반려할 사용자를 선택해주세요");
			return false;
		}
		jsAlert.confirm("확인", "해당 사용자를 반려 하시겠습니까?", fn_delayYn, null, "확인", "취소");
	}
	
	function fn_approveYn(){
		var seqs = [];
		$("input[name=chk]:checked").each(function() {
			seqs[seqs.length] = $(this).val();
		});
		
		$("#memSeq").val(seqs.join(","));
		
		ajaxFormExecute("noticeFrm", "/memberApprove/ajaxUserApprove", "post", false, false, ajaxReturnApprove);
	}
	
	function ajaxReturnApprove(data){
		if(data.sw){
    		jsAlert.alert("알림", "승인되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "승인에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_delayYn(){
		var seqs = [];
		$("input[name=chk]:checked").each(function() {
			seqs[seqs.length] = $(this).val();
		});
		
		$("#memSeq").val(seqs.join(","));
		
		ajaxFormExecute("noticeFrm", "/memberApprove/ajaxUserDelay", "post", false, false, ajaxReturnDelay);
	}
	
	function ajaxReturnDelay(data){
		if(data.sw){
    		jsAlert.alert("알림", "반려되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "반려에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function ready(){
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
	}
	
</script>

<div class="right_col" role="main">

	<div class="col-md-12 col-sm-12">
	
		<div class="page-title">
			<div class="title_left">
				<h3>가입 승인</h3>
			</div>
		</div>

		<div class="x_panel" style="padding-top: 30px;">
			
			<div>
				
				<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab" data-toggle="tab" href="/memberApprove/standby" role="tab" aria-controls="home" aria-selected="true">승인 대기</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab" data-toggle="tab" href="/memberApprove/sendback" role="tab" aria-controls="profile" aria-selected="false">반려</a></li>
				</ul>
					
				<div class="tab-content" id="myTabContent">
					
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						
						<div style="padding: 10px; font-weight: 700;">
							총 <span style="color: red;">${pageInfo.rowMax}</span>건
						</div>
						
						<div class="table-responsive">
							
							<table class="table jambo_table bulk_action">
								
								<thead>
									<tr class="headings">
										<th><input type="checkbox" id="checkAll" name="checkAll" class="flat"></th>
										<th class="column-title text-center">No</th>
										<th class="column-title text-center">가입일</th>
										<th class="column-title text-center">ID</th>
										<th class="column-title text-center">국가</th>
										<th class="column-title text-center">TimeZone</th>
										<th class="column-title text-center">Telegram ID</th>
										<th class="column-title text-center">래퍼럴 코드</th>
										<th class="bulk-actions" colspan="9"><a class="antoo" style="color: #fff; font-weight: 500;">총<span class="action-cnt"/>건</a></th>
									</tr>
								</thead>

								<tbody>
									<#if resultList?has_content>
									<#assign rNum = pageInfo.rowMax - pageInfo.startRowNum + 1 />
									<#list resultList as rMap>
									<tr class="even pointer">
										<td class="a-center "><input type="checkbox" class="flat" id="chk" name="chk" value="${rMap.memSeq!}"/></td>
										<td class="text-center">${rNum}</td>
										<td class="text-center">${rMap.adminDate!}</td>
										<td class="text-center">${rMap.id!}</td>
										<td class="text-center">${rMap.country!}</td>
										<td class="text-center">${rMap.timezone!}</td>
										<td class="text-center">${rMap.telegramId!}</td>
										<td class="a-right a-right  text-center">${rMap.refCode!}</td>
										</td>
									</tr>

									<#assign rNum = rNum - 1/>
									</#list>
									<#else>
									
									<tr>
										<td colspan="7"><strong>사용자가 존재하지 않습니다.</strong></td>
									</tr>
									</#if>
									
								</tbody>
								
							</table>
							
						</div>

						<div class="input-group justify-content-between">
							<div>
								<button class="btn btn-secondary" onclick="fn_delay();">반려</button>
							</div>
							<div>
								<button class="btn btn-secondary" onclick="fn_select();">전체 선택/해제</button>
								<button class="btn btn-success" onclick="fn_approve();">승인</button>
							</div>
						</div>

						<nav aria-label="Page navigation example" class="content-center text-center"><@pagingTag.Paging
							url="/memberApprove/standby" pageCount="${pageInfo.pageCount!}"
							rowCount="${pageInfo.rowCount!}" rowMax="${pageInfo.rowMax!}"
							nowPage="${pageInfo.nowPage!}" params="" />
						</nav>
						
					</div>

					
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</div>