<!--
	* @FileName   : account.ftl
	* @Description: 계정 관리  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<script type="text/javascript">
function fn_save(){
	$("#accountForm").prop("action","/adminAuth/account");
	formSubmit("accountForm");
}
</script>

<div class="right_col" role="main">

	<div class="col-md-12 col-sm-12 ">
		
		<div class="page-title">
			<div class="title_left">
				<h3>계정 관리</h3>
			</div>
		</div>
		
		<div class="x_panel" style="padding-top: 30px;">
			<div class="input-group justify-content-between">
				
				<form name="accountForm" id="accountForm" method="POST" style="width: 100%;">
					<div class="table-responsive">
					
						<table class="table jambo_table bulk_action">
							
							<colgroup>
								<col width="200">
								<col width="*">
							</colgroup>
							
							<tbody>
							
								<tr>
									<th scope="row" class="bg-gray-100 text-center">계정 ID</th>
									<td colspan="2"><input type="text" name="ID" id="ID" value="" class="form-control"/></td>
								</tr>
								
								<tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">비밀번호</th>
									<td colspan="2"><input type="text" name="PASSWORD" id="PASSWORD" value=""class="form-control"/></td>
								</tr>
								
								<tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">비밀번호 확인</th>
									<td colspan="2"><input type="text" name="PASSWORD_RE" id="PASSWORD_RE" value="" class="form-control" /></td>
								</tr>
								
								<tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">이름</th>
									<td colspan="2"><input type="text" name="NAME" id="NAME" value="" class="form-control" /></td>
								</tr>
								
								<tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">소속</th>
									<td colspan="2"><input type="text" name="DEPARTMENT" id="DEPARTMENT" value="" class="form-control" /></td>
								</tr>
								
								<tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">관리자 직급</th>
									<td colspan="2">
										<select class="form-control col-md-9" value="">
											<option value="POSITION_OP">OP 관리자</option>
											<option value="POSITION_MIDDLE">중간 관리자</option>
											<option value="POSITION_GENERAL">일반 관리자</option>
											<option value="POSITION_CHIEF">최고 관리자</option>
										</select>
										<div class="col-md-1"></div>
										<button type="button" class="btn btn-success btn-sm col-md-2 m-0 btn-frm" onclick="fn_save()">저장</button>
									</td>
								</tr>
								
							</tbody>
							
						</table>
						
					</div>
				</form>
			</div>

			<div class="ln_solid"></div>

			<div class="input-group justify-content-between">
				<div style="padding: 10px; font-weight: 700; display: inline;">
					총 <span style="color: red;">?</span>건
				</div>
				<button type="button" class="btn btn-outline-success mb-0">EXCEL 다운로드</button>
			</div>
			
			<div class="table-responsive">
				<table id="bottomTable" class="table jambo_table bulk_action">
				
					<thead>
						<tr class="headings">
							<th class="column-title" style="text-align: center;">No</th>
							<th class="column-title" style="text-align: center;">계정 ID</th>
							<th class="column-title" style="text-align: center;">비밀번호</th>
							<th class="column-title" style="text-align: center;">비밀번호 확인</th>
							<th class="column-title" style="text-align: center;">이름</th>
							<th class="column-title" style="text-align: center;">소속</th>
							<th class="column-title" style="text-align: center;">관리자 직급</th>
							<th class="bulk-actions" colspan="10"><a class="antoo" style="color: #fff; font-weight: 500;">총<span class="action-cnt"></span>건</a></th>
						</tr>
					</thead>
					
					<tbody>
						
						<#if resultList?has_content>
						<#list resultList as rMap>
						
						<tr style="cursor:pointer;">
							<td class="even pointer">${rMap.no!}</td>
							<td class="even pointer">${rMap.id!}</td>
							<td class="even pointer">${rMap.password!}</td>
							<td class="even pointer">${rMap.passwordRe!}</td>
							<td class="even pointer">${rMap.name!}</td>
							<td class="even pointer">${rMap.department!}</td>
							<td class="even pointer">${rMap.position!}</td>
						</tr>
						
						</#list>
						<#else>
						
						<tr><td colspan="7"><strong>데이터가 존재하지 않습니다.</strong></td></tr>
						
						</#if>
						
					</tbody>
					<!-- Table body 구현 필요 -->
					
				</table>
			</div>
			
			
		</div>
		
	</div>
	
</div>
