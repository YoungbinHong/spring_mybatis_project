<!--
	* @FileName   : sendback.ftl
	* @Description: 가입승인 - 반려  View
	* @Author     : 알 수 없음
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>
<#assign returnUrl = "sendback" />

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
		$("#noticeFrm").prop("action", "/memberApprove/sendback");
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
	
	function fn_Dapprove(){
		if($('input:checkbox[name=chk]').is(':checked') == false){
			jsAlert.alert("알림", "승인할 사용자를 선택해주세요");
			return false;
		}
		jsAlert.confirm("확인", "해당 사용자를 승인 하시겠습니까?", fn_DapproveYn, null, "확인", "취소");
	}
	
	function fn_DapproveYn(){
		var seqs = [];
		$("input[name=chk]:checked").each(function() {
			seqs[seqs.length] = $(this).val();
		});
		
		$("#memSeq").val(seqs.join(","));
		
		ajaxFormExecute("noticeFrm", "/memberApprove/ajaxDUserApprove", "post", false, false, ajaxReturnDApprove);
	}
	
	function ajaxReturnDApprove(data){
		if(data.sw){
    		jsAlert.alert("알림", "승인되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "승인에 실패하였습니다.<br>관리자에게 문의바랍니다.");
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

<style>
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
</style>

<!--form class="form-inline" name="noticeFrm" id="noticeFrm" method="post" >
	<input type="hidden" id="noticeSeq" name="noticeSeq" value="" />
</form-->

<div class="right_col" role="main">
	<div class="">
    	<div class="page-title">
  			<div class="title_left">
				<ul class="tabs">
  					<li class="tab-link" data-tab="tab-1"><a href='/memberApprove/standby'>승인 대기</a></li>
					<li class="tab-link current" data-tab="tab-2"><a href='/memberApprove/sendback'>반려</a></li>
  				</ul>
			</div>
		</div>
	
		<div class="clearfix"></div>

		<div id="tab-2" class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_content">
					
						<form class="form-inline" name="noticeFrm" id="noticeFrm" method="post" >
							<input type="hidden" id="memSeq" name="memSeq" value="" />
						</form>
						
						<td class="">총 ${pageInfo.rowMax}건</td>
					
						<div class="table-responsive">
							<table class="table table-striped jambo_table bulk_action">
								<thead>
									<tr class="headings">
										<th class="column-title"><input type="checkbox" id="checkAll" name="checkAll" /></th>
										<th class="column-title">NO</th>
										<th class="column-title">가입일 </th>
										<th class="column-title">ID</th>
										<th class="column-title">국가</th>
										<th class="column-title">TimeZone</th>
										<th class="column-title">Telegram ID</th>
										<th class="column-title">래퍼럴 코드</th>
										<th class="column-title">상태</th>
									</tr>
								</thead>
								<tbody>
									<#if resultList?has_content>
									<#assign rNum = pageInfo.rowMax - pageInfo.startRowNum + 1 />
									<#list resultList as rMap>
									<tr style="cursor:pointer;">
										<td class=""><input type="checkbox" name="chk" value="${rMap.memSeq!}" /></td>
										<td class="" >${rNum}</td>
										<td class="" >${rMap.adminDate!}</td>
										<td class="" >${rMap.id!}</td>
										<td class="" >${rMap.country!}</td>
										<td class="" >${rMap.timezone!}</td>
										<td class="" >${rMap.telegramId!}</td>
										<td class="" >${rMap.refCode!}</td>
										<td class="" >반려</td>
									</tr>
									
									<#assign rNum = rNum - 1/>
									</#list>
									<#else>
										<tr>
											<td colspan="8"><strong>사용자가 존재하지 않습니다.</strong></td>
										</tr>
									</#if>
								</tbody>
							</table>
							
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6 text-left">
									<button type="button" class="btn btn-secondary" onclick="fn_select();">전체선택/해제</button>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6 text-right">
									<button type="button" class="btn btn-primary" onclick="fn_Dapprove();">승인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<nav aria-label="Page navigation example" class="content-center text-center">
					<@pagingTag.Paging url="/memberApprove/sendback" pageCount="${pageInfo.pageCount!}" rowCount="${pageInfo.rowCount!}" rowMax="${pageInfo.rowMax!}" nowPage="${pageInfo.nowPage!}" params="" />
				</nav>
			</div>
		</div>
	</div>
</div>