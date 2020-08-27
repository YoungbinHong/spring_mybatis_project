<!--
	* @FileName   : telegramTransmission.ftl
	* @Description: 텔레그램 발송  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<style>
.my-custom-scrollbar {
	position: relative; 
	height: 200px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: block;
}
</style>

<script type="text/javascript">
function aaa() {
  var cnt = $("#userCountTable tbody td").length;
  $("#selectUser").modal("hide");

  if (cnt !== 1) {
    $("#sendLog2").modal("toggle");
    $("#sendLog2").modal("show");
  }
  else {
    $("#sendLog1").modal("toggle");
    $("#sendLog1").modal("show");
  }
}
</script>


<div class="right_col" role="main">

	<div class="col-md-12 col-sm-12">
	
		<div class="page-title">
			<div class="title_left">
				<h3>텔레그램 발송</h3>
			</div>
		</div>
		
		<div class="x_panel" style="padding-top:30px;">
			<div class="input-group justify-content-between">
			
				<form name="" id="" method="POST" style="width: 100%;">
					<div class="table-responsive">
						
						<table class="table jambo_table bulk_action">
							
							<colgroup>
								<col width="20%"/>
								<col width="80%"/>
							</colgroup>
							
							<tbody>
							
								<tr>
									<th scope="row" class="bg-gray-100 text-center">발송 조건</th>
									<td>
										<div class="input-group mb-0 p-0 text-left">
											<div class="col-md-2 col-sm-4 col-xs-12">
												<label class="txt-unit mb-0"><input type="radio" class="flat"/>즉시 발송</label>
											</div>
											<div class="col-md-2 col-sm-4 col-xs-12">
												<label class="txt-unit mb-0"><input type="radio" class="flat"/>예약 발송</label>
											</div>
											<input id="" name="date" class="datepicker form-control col-md-4 col-sm-6 col-xs-12" type="date" required="required" onfocus="this.type='date'">
										</div>
									</td>
								</tr>

								<tr>
									<th scope="row" class="bg-gray-100 text-center">발송 조건</th>
									<td>
										<div class="input-group mb-0 p-0 text-left">
											<div class="col-md-2 col-sm-3 col-xs-12">
												<label class="txt-unit mb-0"> <input type="radio" class="flat" />전체</label>
											</div>
											<div class="col-md-2 col-sm-3 col-xs-12">
												<label class="txt-unit mb-0"> <input type="radio"class="flat" />선택</label>
											</div>
											<button type="button" class="btn btn-light btn-sm border" style="margin: 0px;" data-toggle="modal" data-target="#selectUser">회원선택</button>
										</div>
									</td>
								</tr>

								<tr>
									<th scope="row" class="bg-gray-100 text-center">내용</th>
									<td><textarea style="width: 100%; height: 100px; margin-bottom: 10px;"></textarea>
										<ul class="text-left" style="padding-left: 15px; margin: 0px;">
											<li><div style="font-weight: 500;">1,000자까지 입력 가능</div></li>
											<li><div style="font-weight: 500;">줄바꿈 시 그대로 전송</div></li>
										</ul>
									</td>
								</tr>

							</tbody>
							
						</table>
						
					</div>
				</form>
				
				<div class="text-center wd100 mb-3">
					<button type="button" class="btn btn-success">발송</button>
				</div>

				<form name="" id="" method="POST" style="width: 100%;">
					<div class="table-responsive">
						<table class="table jambo_table bulk_action">
							
							<colgroup>
								<col width="20%" />
								<col width="80%" />
							</colgroup>
							
							<tbody>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">검색</th>
									<td><input type="text" name="" id="" value=""
										class="form-control col-md-9" placeholder="URL" />
										<div class="col-md-1"></div>
										<button type="button"
											class="btn btn-success btn-sm col-md-2 m-0 btn-frm">검색</button>
									</td>
								</tr>
								
								<tr>
									<th scope="row" class="text-center">검색 기간</th>
									<td>
										<div class="col-md-6 p-0">
											<div class="datepicker_wrap">
												<input id="" name="date" class="datepicker form-control"
													type="date" required="required" onfocus="this.type='date'">
												<input id="" name="date" class="datepicker form-control"
													type="date" required="required" onfocus="this.type='date'">
											</div>
										</div>
										
										<div class="col-md-6 text-left datepicker_btn p-0 pl-1">
											<div class="btn-group btn-group-sm p-0" role="group"
												aria-label="...">
												<button class="btn btn-light" type="button">오늘</button>
												<button class="btn btn-light" type="button">어제</button>
												<button class="btn btn-light" type="button">7일</button>
												<button class="btn btn-light" type="button">1개월</button>
												<button class="btn btn-light" type="button">3개월</button>
												<button class="btn btn-light" type="button">6개월</button>
												<button class="btn btn-light" type="button">1년</button>
											</div>
										</div>
										
									</td>
								</tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">발송
										상태</th>
									<td>
										<div class="input-group mb-0 p-0 text-left">
											<div class="checkbox col-md-2 col-sm-6 col-xs-12 mb-0">
												<label class="mb-0 txt-unit"> <input type="checkbox"
													class="flat"> 전체
												</label>
											</div>
											<div class="checkbox col-md-2 col-sm-6 col-xs-12 mb-0">
												<label class="mb-0 txt-unit"> <input type="checkbox"
													class="flat"> 예약
												</label>
											</div>
											<div class="checkbox col-md-2 col-sm-6 col-xs-12 mb-0">
												<label class="mb-0 txt-unit"> <input type="checkbox"
													class="flat"> 완료
												</label>
											</div>
										</div>
									</td>
								</tr>
								
							</tbody>
							
						</table>
					</div>
				</form>

			</div>

			<div class="input-group justify-content-start">
				<button type="button" class="btn btn-light btn-sm border" data-toggle="modal" data-target="#cancelReservation">예약 취소</button>
			</div>

			<div class="table-responsive">
			
				<table class="table jambo_table bulk_action">
				
					<colgroup>
						<col width="3%" />
						<col width="3%" />
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
						<col width="16%" />
						<col width="5%" />
						<col width="15%" />
						<col width="9%" />
						<col width="9%" />
					</colgroup>
					
					<thead>
						<tr class="headings">
							<th><input type="checkbox" id="check-all" class="flat">
							</th>
							<th class="column-title text-center">No</th>
							<th class="column-title text-center">발송일</th>
							<th class="column-title text-center">내용</th>
							<th class="column-title text-center">발송 회원 수</th>
							<th class="column-title text-center">Telegram Language</th>
							<th class="column-title text-center">국가</th>
							<th class="column-title text-center">Time zone</th>
							<th class="column-title text-center">이용권</th>
							<th class="column-title text-center">발송 상태</th>
							<th class="bulk-actions" colspan="10"><a class="antoo" style="color: #fff; font-weight: 500;">총<span class="action-cnt"> </span>건</a></th>
						</tr>
					</thead>
					
					<!-- Table body 구현 필요 -->
					
				</table>
				
			</div>
			
		</div>
		
	</div>
	
	<div class="modal" id="selectUser">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			style="max-width: 90%; min-width: 80%; width: auto;">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<div class="container mt-2 text-center">
						<div class="text-left">
							<h1 class="page-sub-title m-0">회원 선택</h1>
						</div>

						<div class="input-group justify-content-between mt-4">
							<form name="" id="" method="POST" style="width: 100%;">
								<table class="table jambo_table bulk_action">
									<colgroup>
										<col width="200" />
										<col width="30%" />
										<col width="30%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="text-center">ID 검색</th>
											<td colspan="2"><input type="text" name="" id=""
												value="" class="form-control passwd" placeholder="" /></td>
											<td rowspan="4">
												<button class="btn btn-success btn-sm btn-frm m-0 wd100"
													type="button">검색</button>
											</td>
										</tr>
										<tr>
											<th scope="row" class="bg-gray-100 text-center">Telegram
												ID 검색</th>
											<td colspan="2"><input type="text" name="" id=""
												value="" class="form-control passwd" placeholder="" /></td>
										</tr>
										<tr>
											<th scope="row" class="bg-gray-100 text-center">이용권 적용</th>
											<td colspan="2"><select name="" id=""
												class="form-control">
													<option value="">전체</option>
													<option value="">이용권1</option>
													<option value="">이용권2</option>
													<option value="">미적용</option>
											</select></td>
										</tr>
										<tr style="height: 30px;">
											<th scope="row" class="bg-gray-100 text-center">검색어</th>
											<td><select id="searchType" name="searchType"
												class="form-control">
													<option value="C" selected>국가</option>
													<option value="T">TimeZone</option>
													<option value="L">Language Telegram</option>
											</select></td>
											<td><select name="searchType2" id="searchType2"
												class="form-control">
													<option value="">국가 전체</option>
													<option value="">Afghanistan</option>
													<option value="">Aland Island</option>
													<option value="">Albania</option>
													<option value="">Algeria</option>
											</select></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>

						<div
							class="table-responsive table-wrapper-scroll-y my-custom-scrollbar">
							<table class="table jambo_table bulk_action">
								<thead class="text-center">
									<tr class="headings">
										<th><input type="checkbox" id="check-all" class="flat">
										</th>
										<th class="column-title">No</th>
										<th class="column-title">ID</th>
										<th class="column-title">Telegram ID</th>
										<th class="column-title">Telegram Language</th>
										<th class="column-title">국가</th>
										<th class="column-title">Time zone</th>
										<th class="column-title">이용권</th>
										<th class="bulk-actions" colspan="9"><a class="antoo"
											style="color: #fff; font-weight: 500;">총<span
												class="action-cnt"> </span>건
										</a></th>
									</tr>
								</thead>
								
								<!-- Table body DB와 연결 해야 할 부분 -->
								
							</table>
							<div class="text-right">
								<button type="button" class="btn btn-success">추가</button>
							</div>
						</div>

						<div
							class="container mt-5 table-wrapper-scroll-y my-custom-scrollbar">
							<div class="d-flex justify-content-between">
								<span class="pt-3">수신 대상자 <span style="color: red;">30</span></span>
								<button type="button" class="btn btn-secondary">전체 삭제</button>
							</div>
							<div class="border border-dark form-control"
								style="min-height: 200px; height: auto;">
								<table class="pb-1" id="userCountTable">
									<tbody>
										<tr>
											<!-- 수신 대상자 선택하는 공간 구현 해야 할 부분 -->
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="text-center">
							<button id="selectUserCountBtn" type="button"
								class="btn btn-success mt-3" onclick="aaa();">선택 완료</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="modal" id="cancelReservation">
	
		<div class="modal-dialog modal-dialog-centered modal-sm">
		
			<div class="modal-content">
			
				<div class="modal-body">
				
					<div class="container text-center">
					
						<div class="text-left mb-4">
							<h1 class="page-sub-title m-0">Confirm</h1>
						</div>
						
						<span>예약을 취소하시겠습니까?</span>
						
						<div class="row justify-content-around mt-5">
							<button type="button" class="btn btn-secondary btn-sm col-md-5" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success btn-sm col-md-5">삭제</button>
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		
	</div>

</div>
