<!--
	* @FileName   : referralManagement.ftl
	* @Description: 레퍼럴 관리  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign crudText = "저장" />
<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>

<script type="text/javascript">
	
	function fn_list(){
		$("#manageFrm").prop("action", "/payment/referralManagement");
		$('#nowPage').val('1');
 		formSubmit("manageFrm");
	}

	function fn_save(){
		if(!refferalInsertFrm.refferalName.value){
			jsAlert.alert("알림", "refferalName을 입력하세요.");
			return false;
		}
		
		if(!refferalInsertFrm.refferalCode.value){
			jsAlert.alert("알림", "refferalCode를 입력하세요.");
			return false;
		}
		
		jsAlert.confirm("확인", "refferal 등록 하시겠습니까?", fn_submit, null, "확인", "취소");
		
	}
	function fn_submit(){
		ajaxFormExecute("refferalInsertFrm", "/refferal/ajaxRefferalSubmit", "post", false, false, ajaxReturnSubmit);
    }
    
    function ajaxReturnSubmit(data){
		if(data.sw){
    		jsAlert.alert("알림", "등록되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "등록에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_copyName(data){
		var dummy = document.createElement("textarea");
	  	document.body.appendChild(dummy);
	  	dummy.value = data;
	  	dummy.select();
	  	document.execCommand("copy");
	  	document.body.removeChild(dummy);
	}
</script>

<div class="right_col" role="main">
	<div class="col-md-12 col-sm-12 ">
		<div class="page-title">
			<div class="title_left">
				<h3>레퍼럴 관리</h3>
			</div>
		</div>
		<div class="x_panel" style="padding-top: 30px;">
			<div class="input-group justify-content-between">
				<form name="" id="" method="POST" style="width: 100%;">
					<div class="table-responsive">
						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="200" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="text-center">레퍼럴 코드 이름</th>
									<td><input type="text" name="" id="" value=""
										class="form-control" placeholder="20200701_마케팅 블로그 유입" /></td>
								</tr>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">레퍼럴 코드 등록</th>
									<td colspan=""><input type="text" name="" id="" value=""
										class="form-control col-md-9" placeholder="URL" />
										<div class="col-md-1"></div>
										<button type="button"
											class="btn btn-success btn-sm col-md-2 m-0 btn-frm">저장</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div style="padding: 10px; font-weight: 700;">
				총 <span style="color: red;">6</span>건
			</div>

			<div class="table-responsive">
				<table class="table jambo_table bulk_action">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="30%" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr class="headings">
							<th class="column-title text-center">No</th>
							<th class="column-title text-center" colspan="2">레퍼럴 코드</th>
							<th class="column-title text-center">레퍼럴 코드 이름</th>
							<th class="column-title text-center">유입 리스트</th>
							<th class="column-title text-center">상태</th>
							<th class="bulk-actions" colspan="6"><a class="antoo"
								style="color: #fff; font-weight: 500;">총<span
									class="action-cnt"> </span>건
							</a></th>
						</tr>
					</thead>

					<tbody>
						<tr class="even pointer">
							<td class="text-center">5</td>
							<td class="text-center">https://ftx.com/#a=3270227</td>
							<td class="text-center"><button type="button"
									class="btn btn-secondary btn-sm">copy</button></td>
							<td class="text-center">20200703_마케팅 블로그 유입</td>
							<td class="text-center"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target='#checkInflowList'>보기</button></td>
							<td class="text-center">사용중</td>
						</tr>
						<tr class="odd pointer">
							<td class="text-center">5</td>
							<td class="text-center">https://ftx.com/#a=3270227</td>
							<td class="text-center"><button type="button"
									class="btn btn-secondary btn-sm">copy</button></td>
							<td class="text-center">20200703_마케팅 블로그 유입</td>
							<td class="text-center"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target='#checkInflowList'>보기</button></td>
							<td class="text-center">사용중</td>
						</tr>
						<tr class="even pointer">
							<td class="text-center">5</td>
							<td class="text-center">https://ftx.com/#a=3270227</td>
							<td class="text-center"><button type="button"
									class="btn btn-secondary btn-sm">copy</button></td>
							<td class="text-center">20200703_마케팅 블로그 유입</td>
							<td class="text-center"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target='#checkInflowList'>보기</button></td>
							<td class="text-center">사용중</td>
						</tr>
						<tr class="odd pointer">
							<td class="text-center">5</td>
							<td class="text-center">https://ftx.com/#a=3270227</td>
							<td class="text-center"><button type="button"
									class="btn btn-secondary btn-sm">copy</button></td>
							<td class="text-center">20200703_마케팅 블로그 유입</td>
							<td class="text-center"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target='#checkInflowList'>보기</button></td>
							<td class="text-center">사용중</td>
						</tr>
						<tr class="even pointer">
							<td class="text-center">5</td>
							<td class="text-center">https://ftx.com/#a=3270227</td>
							<td class="text-center"><button type="button"
									class="btn btn-secondary btn-sm">copy</button></td>
							<td class="text-center">20200703_마케팅 블로그 유입</td>
							<td class="text-center"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target='#checkInflowList'>보기</button></td>
							<td class="text-center">사용중</td>
						</tr>
						<tr class="odd pointer">
							<td class="text-center">5</td>
							<td class="text-center">https://ftx.com/#a=3270227</td>
							<td class="text-center"><button type="button"
									class="btn btn-secondary btn-sm">copy</button></td>
							<td class="text-center">20200703_마케팅 블로그 유입</td>
							<td class="text-center"><button type="button"
									class="btn btn-success btn-sm" data-toggle="modal"
									data-target='#checkInflowList'>보기</button></td>
							<td class="text-center">사용중</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div>
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

	<!-- 26 유입 리스트 확인 모달 -->
	<div class="modal" id="checkInflowList">
		<div class="modal-dialog modal-dialog-center modal-lg"
			style="min-width: 70%">
			<div class="modal-content">
				<div class="modal-body">
					<div class="container text-center">
						<div class="input-group justify-content-between">
							<form name="" id="" method="POST" style="width: 100%;">
								<div class="table-responsive">
									<table class="table jambo_table bulk_action">
										<colgroup>
											<col width="200" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row" class="text-center">ID 검색</th>
												<td><input type="text" class="form-control"
													placeholder=""></td>
											</tr>
											<tr>
												<th scope="row" class="text-center">검색</th>
												<td><input type="text" class="form-control"
													placeholder=""></td>
											</tr>

											<tr>
												<th scope="row" class="text-center">기간 설정</th>
												<td>
													<div class="col-md-9 p-0">
														<div class="datepicker_wrap">
															<input id="" name="date" class="datepicker form-control"
																type="date" required="required"
																onfocus="this.type='date'"> <input id=""
																name="date" class="datepicker form-control" type="date"
																required="required" onfocus="this.type='date'">
														</div>
													</div>
													<div class="col-md-1"></div>
													<div class="col-md-2 text-left p-0 m-0">
														<button type="button"
															class="btn btn-success btn-sm wd100 m-0 btn-frm">저장</button>
													</div>
												</td>
											</tr>
										</tbody>
									</table>

									<div class="input-group justify-content-between mt-5">
										<span class="pt-3">총 <span style="color: red;">5</span>건
										</span>
										<button type="button" class="btn btn-light border">Excel
											다운로드</button>
									</div>

									<!-- 테이블 -->
									<div class="table-responsive">
										<table class="table table-striped jambo_table bulk_action">
											<thead>
												<tr class="headings">
													<th>No.</th>
													<th>유입 날짜</th>
													<th>ID</th>
													<th>국가</th>
													<th>Timezone</th>
													<th>Telegram ID</th>
													<th>레퍼럴 코드</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td>5</td>
													<td>2020-07-01 15:32:35</td>
													<td>tetetete21@gmail.com</td>
													<td>Algeria</td>
													<td>(GMT-05:00) Havana</td>
													<td>BeautyGOT</td>
													<td>https://www.coinbitler.com/ftxftx</td>
												</tr>
												<tr>
													<td>4</td>
													<td>2020-07-01 15:32:35</td>
													<td>tetetete21@gmail.com</td>
													<td>Algeria</td>
													<td>(GMT-05:00) Havana</td>
													<td>BeautyGOT</td>
													<td>https://www.coinbitler.com/ftxftx</td>
												</tr>
												<tr>
													<td>3</td>
													<td>2020-07-01 15:32:35</td>
													<td>tetetete21@gmail.com</td>
													<td>Algeria</td>
													<td>(GMT-05:00) Havana</td>
													<td>BeautyGOT</td>
													<td>https://www.coinbitler.com/ftxftx</td>
												</tr>
												<tr>
													<td>2</td>
													<td>2020-07-01 15:32:35</td>
													<td>tetetete21@gmail.com</td>
													<td>Algeria</td>
													<td>(GMT-05:00) Havana</td>
													<td>BeautyGOT</td>
													<td>https://www.coinbitler.com/ftxftx</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2020-07-01 15:32:35</td>
													<td>tetetete21@gmail.com</td>
													<td>Algeria</td>
													<td>(GMT-05:00) Havana</td>
													<td>BeautyGOT</td>
													<td>https://www.coinbitler.com/ftxftx</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 테이블 END -->
									<!-- 페이지 번호 넘김 -->
									<div>
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
									<!-- 페이지 번호 넘김 END -->
									<button type="button" class="btn btn-secondary text-center"
										data-dismiss="modal">닫기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 26 유입 리스트 확인 모달 END -->

</div>