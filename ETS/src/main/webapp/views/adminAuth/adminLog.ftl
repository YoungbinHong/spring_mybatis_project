<!--
	* @FileName   : adminLog.ftl
	* @Description: 관리자 로그  View
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
				<h3>관리자 로그</h3>
			</div>
		</div>
		
		<div class="x_panel" style="padding-top: 30px;">
			
			<div>
				
				<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">직급 생성/변경 로그</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">계정 권한 변경 로그</a></li>
					<li class="nav-item"><a class="nav-link" id="set-tab"
						data-toggle="tab" href="#set" role="tab" aria-controls="set"
						aria-selected="false">직급 권한 변경 로그</a></li>
				</ul>
				
				<div class="tab-content" id="myTabContent">
				
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						
						<div class="table-responsive">
							
							<table class="table table-bordered jambo_table bulk_action">
								
								<colgroup>
									<col width="8%" />
									<col width="11%" />
									<col width="11%" />
									<col width="11%" />
									<col width="16%" />
									<col width="16%" />
									<col width="16%" />
									<col width="11%" />
								</colgroup>
								
								<thead>
								
									<tr class="headings">
										<th class="column-title text-center" rowspan="2">No</th>
										<th class="column-title text-center" rowspan="2">Date</th>
										<th class="column-title text-center" colspan="2">적용</th>
										<th class="column-title text-center" colspan="3">대상</th>
										<th class="column-title text-center" rowspan="2">동작</th>
									</tr>
									
									<tr class="headings">
										<th class="column-title text-center">ID</th>
										<th class="column-title text-center">직급</th>
										<th class="column-title text-center">ID</th>
										<th class="column-title text-center">전</th>
										<th class="column-title text-center">후</th>
									</tr>
									
								</thead>

								<tbody>
								
									<tr class="even pointer">
										<td class="  text-center">1</td>
										<td class="  text-center">2020-05-05 15:15</td>
										<td class="  text-center">ADUP3804</td>
										<td class="  text-center">슈퍼 히어로</td>
										<td class="  text-center">ADUP3804</td>
										<td class="  text-center">-</td>
										<td class="  text-center">슈퍼 히어로</td>
										<td class="  text-center">생성</td>
									</tr>
									
									<!-- Table body 구현 필요 -->
									
								</tbody>
								
							</table>
							
							<nav aria-label="Page navigation example">
								<ul class="pagination" style="justify-content: center;">
									<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
								</ul>
							</nav>
							
						</div>
						
					</div>

					<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						
						<div class="table-responsive">
							
							<table class="table table-bordered jambo_table bulk_action">
								
								<colgroup>
									<col width="10%" />
									<col width="22%" />
									<col width="17%" />
									<col width="17%" />
									<col width="17%" />
									<col width="17%" />
								</colgroup>
								
								<thead>
								
									<tr class="headings">
										<th class="column-title text-center" rowspan="2">No</th>
										<th class="column-title text-center" rowspan="2">Date</th>
										<th class="column-title text-center" colspan="2">적용</th>
										<th class="column-title text-center" colspan="2">대상</th>
									</tr>
									
									<tr class="headings">
										<th class="column-title text-center">ID</th>
										<th class="column-title text-center">직급</th>
										<th class="column-title text-center">ID</th>
										<th class="column-title text-center">직급</th>
									</tr>
									
								</thead>

								<tbody>
								
									<tr class="even pointer">
										<td class="  text-center">1</td>
										<td class="  text-center">2020-05-05 15:15</td>
										<td class="  text-center">ADUP3804</td>
										<td class="  text-center">슈퍼 히어로</td>
										<td class="  text-center">ADUP3804</td>
										<td class="  text-center">슈퍼 히어로</td>
									</tr>
									
									<!-- Table body 구현 필요 -->
									
								</tbody>
								
							</table>
							
						</div>
						
					</div>

					<div class="tab-pane fade show" id="set" role="tabpanel" aria-labelledby="set-tab">
						
						<div class="table-responsive">
							
							<table class="table table-bordered jambo_table bulk_action">
								
								<colgroup>
									<col width="10%" />
									<col width="30%" />
									<col width="20%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
								
								<thead>
								
									<tr class="headings">
										<th class="column-title text-center" rowspan="2">No</th>
										<th class="column-title text-center" rowspan="2">Date</th>
										<th class="column-title text-center" colspan="2">적용</th>
										<th class="column-title text-center">대상</th>
									</tr>
									
									<tr class="headings">
										<th class="column-title text-center">ID</th>
										<th class="column-title text-center">직급</th>
										<th class="column-title text-center">직급</th>
									</tr>
									
								</thead>

								<tbody>
								
									<tr class="even pointer">
										<td class="text-center">1</td>
										<td class="text-center">2020-05-05 15:15</td>
										<td class="text-center">ADUP3804</td>
										<td class="text-center">슈퍼 히어로</td>
										<td class="text-center">-</td>
									</tr>
									<!-- Table body 구현 필요 -->
									
								</tbody>
								
							</table>
							
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</div>
