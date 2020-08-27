<!--
	* @FileName   : auth.ftl
	* @Description: 권한 관리  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<script>

</script>

<div class="right_col" role="main">

	<div class="col-md-12 col-sm-12 ">
	
		<div class="page-title">
			<div class="title_left">
				<h3>권한 관리</h3>
			</div>
		</div>
		
		<div class="x_panel" style="padding-top: 30px;">
			
			<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">관리자 직급 생성</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">관리자 권한 설정</a></li>
				<li class="nav-item"><a class="nav-link" id="set-tab"
					data-toggle="tab" href="#set" role="tab" aria-controls="set"
					aria-selected="false">계정 별 권한 설정</a></li>
			</ul>
			
			<div class="tab-content" id="myTabContent">
			
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					
					<div class="table-responsive">
					
						<div class="table-responsive">
						
							<table class="table jambo_table bulk_action" style="margin-bottom: 60px">
								<colgroup>
									<col width="17%" />
									<col width="16%" />
									<col width="17%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<thead>
									<tr class="headings">
										<th class="text-center">No</th>
										<th class="text-center">직급</th>
										<th class="text-center">계정 수</th>
										<th class="text-center">상태</th>
										<th class="text-center">직급 삭제</th>
									</tr>
								</thead>
								
								<tbody>
									<!-- Table body 구현해야 하는 부분 -->
									<tr class="even pointer">
										<td class="text-center">프로도</td>
										<td class="text-center">네오</td>
										<td class="text-center">무지</td>
										<td class="text-center">콘</td>
										<td class="text-center">어피치</td>
								</tbody>
								
							</table>
							
						</div>

						<div class="table-responsive">
							
							<table class="table jambo_table bulk_action">
								
								<colgroup>
									<col width="200">
									<col width="*">
								</colgroup>
								
								<tbody>
									<tr>
										<th scope="row" class="bg-gray-100 text-center">관리자 직급 이름</th>
										<td colspan="2"><input type="text" name="" id="" value="" class="form-control" placeholder="생성하려는 관리자 직급 명을 입력해 주세요." /></td>
									</tr>
								</tbody>
								
							</table>
							
						</div>

						<table class="table table-striped jambo_table bulk_action">
							<colgroup>
								<col width="90%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr class="headings">
									<th class="column-title" class="text-center">권한 항목</th>
									<th class="text-center"><input type="checkbox"
										id="check-all" class="flat"></th>
									<th class="bulk-actions" colspan=""><a class="antoo"
										style="color: #fff; font-weight: 500;">총<span
											class="action-cnt"> </span>건
									</a></th>
								</tr>
							</thead>

							<tbody>
							
								<tr class="even pointer">
									<td class=" ">회원 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
								</tr>
								
								<tr class="odd pointer">
									<td class=" ">로그 관리 > 접속 로그</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="even pointer">
									<td class=" ">로그 관리 > 주문 로그</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="odd pointer">
									<td class=" ">결제 관리 > 이용권 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="even pointer">
									<td class=" ">결제 관리 > 레퍼럴 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="odd pointer">
									<td class=" ">결제 관리 > 이용권 결제 리스트</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="even pointer">
									<td class=" ">공지 사항 > 롤링 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="odd pointer">
									<td class=" ">공지 사항 > 텍스트 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>

								<tr class="even pointer">
									<td class=" ">공지 사항 > Telegram 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								
								<tr class="odd pointer">
									<td class=" ">이벤트 > 이벤트 등록</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="text-center">
							<button type="button" class="btn btn-success">저장</button>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					
					<div class="table-responsive">

						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="200">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">권한 선택</th>
									<td colspan="2"><select class="form-control col-md-9">
											<option value="">중간 관리자</option>
											<option value=""></option>
											<option value=""></option>
											<option value=""></option>
									</select>
										<div class="col-md-1"></div>
										<button type="button"
											class="btn btn-success btn-sm col-md-2 m-0 btn-frm">불러오기</button>
									</td>
								</tr>
							</tbody>
						</table>


						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="90%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr class="headings">
									<th class="column-title" class="text-center">권한 항목</th>
									<th><input type="checkbox" id="check-all" class="flat">
									</th>
									<th class="bulk-actions" colspan=""><a class="antoo"
										style="color: #fff; font-weight: 500;">총<span
											class="action-cnt"> </span>건
									</a></th>
								</tr>
							</thead>

							<tbody>
								<tr class="even pointer">
									<td class=" ">회원 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">로그 관리 > 접속 로그</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">로그 관리 > 주문 로그</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">결제 관리 > 이용권 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">결제 관리 > 레퍼럴 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">결제 관리 > 이용권 결제 리스트</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">공지 사항 > 롤링 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">공지 사항 > 텍스트 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">공지 사항 > Telegram 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">이벤트 > 이벤트 등록</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="text-center">
							<button type="button" class="btn btn-success">저장</button>
						</div>
						
					</div>
					
				</div>

				<div class="tab-pane fade show" id="set" role="tabpanel" aria-labelledby="set-tab">
					
					<div class="table-responsive">
						
						<table class="table jambo_table bulk_action">
							
							<colgroup>
								<col width="200">
								<col width="*">
							</colgroup>
							
							<tbody>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">관리자 ID 검색</th>
									<td colspan="2"><input type="text" name="" id="" value=""
										class="form-control col-md-9" />
										<div class="col-md-1"></div>
										<button type="button"
											class="btn btn-success btn-sm col-md-2 m-0 btn-frm">검색</button>
									</td>
								</tr>
							</tbody>
							
						</table>

						<table class="table jambo_table bulk_action" style="margin-bottom: 60px">
							
							<colgroup>
								<col width="13%" />
								<col width="13%" />
								<col width="14%" />
								<col width="25%" />
								<col width="15%" />
								<col width="25%" />
							</colgroup>
							
							<thead>
								<tr class="headings">
									<th class="text-center">No</th>
									<th class="text-center">ID</th>
									<th class="text-center">이름</th>
									<th class="text-center">소속</th>
									<th class="text-center">권한</th>
									<th class="text-center">상태</th>
								</tr>
							</thead>

							<tbody>
							
								<tr class="even pointer">
									<td class="text-center">1</td>
									<td class="text-center">Adup3804</td>
									<td class="text-center">어피치</td>
									<td class="text-center">크리에이티브</td>
									<td class="text-center">일반관리자</td>
									<td class="text-center"><button type="button" class="btn btn-outline-danger btn-sm">권한 불러오기</button></td>
								</tr>
								
								<!-- Table row 구현 필요 -->
								
							</tbody>
							
						</table>

						<table class="table jambo_table bulk_action">
							
							<colgroup>
								<col width="90%" />
								<col width="10%" />
							</colgroup>
							
							<thead>
								<tr class="headings">
									<th class="column-title" class="text-center">권한 항목</th>
									<th><input type="checkbox" id="check-all" class="flat">
									</th>
									<th class="bulk-actions" colspan=""><a class="antoo"
										style="color: #fff; font-weight: 500;">총<span
											class="action-cnt"> </span>건
									</a></th>
								</tr>
							</thead>

							<tbody>
								<tr class="even pointer">
									<td class=" ">회원 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">로그 관리 > 접속 로그</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">로그 관리 > 주문 로그</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">결제 관리 > 이용권 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">결제 관리 > 레퍼럴 관리</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">결제 관리 > 이용권 결제 리스트</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="even pointer">
									<td class=" ">공지 사항 > 롤링 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">공지 사항 > 텍스트 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>

								<tr class="even pointer">
									<td class=" ">공지 사항 > Telegram 공지</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
								<tr class="odd pointer">
									<td class=" ">이벤트 > 이벤트 등록</td>
									<td class="a-center "><input type="checkbox" class="flat"
										name="table_records"></td>
									</td>
								</tr>
							</tbody>
							
						</table>
						
						<div>
							<div class="text-center">
								<button type="button" class="btn btn-success">저장</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<!-- </div> -->
		</div>
	</div>
</div>