<!--
	* @FileName   : voucherList.ftl
	* @Description: 이용권 결제 리스트  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>
<#assign Price=0>
<#if resultList?has_content>
	<#assign size=resultList?size>
	<#list resultList as R>
		<#assign Price = Price+(R.ticketprice)/> 
	</#list>
<#else>
	<#assign size=0>
</#if>

<script type="text/javascript">
	function fn_search(){
		$("#searchFrm").prop("action", "/payment/voucherList");
		$('#nowPage').val('1');
 		formSubmit("searchFrm");
	}
</script>

<div class="right_col" role="main">
	<div class="col-md-12 col-sm-12 ">
		<div class="page-title">
			<div class="title_left">
				<h3>이용권 결제 리스트</h3>
			</div>
		</div>
		<div class="x_panel" style="padding-top: 30px;">
			<div class="input-group justify-content-between">
				<form name="" id="" method="POST" style="width: 100%;">
					<div class="table-responsive">
						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="200">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="text-center">ID 검색</th>
									<td><input type="text" name="" id="" value=""
										class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row" class="text-center">기간</th>
									<td>
										<div class="datepicker_wrap">
											<input id="" name="date" class="datepicker form-control"
												type="date" required="required" onfocus="this.type='date'">
											<input id="" name="date" class="datepicker form-control"
												type="date" required="required" onfocus="this.type='date'">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">이용권</th>
									<td><select class="form-control col-md-9">
											<option value="">전체</option>
											<option value=""></option>
											<option value=""></option>
											<option value=""></option>
									</select>
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

			<div class="row">

				<div class="col-md-5 col-sm-5 col-xs-5"
					style="padding: 15px 10px 10px 20px; font-weight: 700;">
					총 <span style="color: red;">10</span>건, <span
						style="color: red; font-weight: 700;">1,275,000</span>원
				</div>

				<div
					class="col-md-7 col-sm-7 col-xs-7 input-group justify-content-end">
					<button type="button" class="btn btn-light border">Excel
						다운로드</button>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table jambo_table bulk_action">
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="20%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr class="headings">
							<th class="column-title text-center">No</th>
							<th class="column-title text-center">거래소</th>
							<th class="column-title text-center">결제일</th>
							<th class="column-title text-center">ID</th>
							<th class="column-title text-center">이용권 명</th>
							<th class="column-title text-center">이벤트 적용</th>
							<th class="column-title text-center">결제 금액</th>
							<th class="bulk-actions" colspan="7"><a class="antoo"
								style="color: #fff; font-weight: 500;">총<span
									class="action-cnt"> </span>건
							</a></th>
						</tr>
					</thead>

					<tbody>
						<tr class="even pointer">
							<td class="text-center">5</td>
							<td class="text-center">Binance</td>
							<td class="text-center">2020-07-01 15:32:35</td>
							<td class="text-center">tetetete21@gmail.com</td>
							<td class="text-center">365일권</td>
							<td class="text-center">OPEN 할인(15%)</td>
							<td class="text-center">935,000</td>
						</tr>
						<tr class="odd pointer">
							<td class="text-center">5</td>
							<td class="text-center">Binance</td>
							<td class="text-center">2020-07-01 15:32:35</td>
							<td class="text-center">tetetete21@gmail.com</td>
							<td class="text-center">365일권</td>
							<td class="text-center">OPEN 할인(15%)</td>
							<td class="text-center">935,000</td>
						</tr>
						<tr class="even pointer">
							<td class="text-center">5</td>
							<td class="text-center">Binance</td>
							<td class="text-center">2020-07-01 15:32:35</td>
							<td class="text-center">tetetete21@gmail.com</td>
							<td class="text-center">365일권</td>
							<td class="text-center">OPEN 할인(15%)</td>
							<td class="text-center">935,000</td>
						</tr>
						<tr class="odd pointer">
							<td class="text-center">5</td>
							<td class="text-center">Binance</td>
							<td class="text-center">2020-07-01 15:32:35</td>
							<td class="text-center">tetetete21@gmail.com</td>
							<td class="text-center">365일권</td>
							<td class="text-center">OPEN 할인(15%)</td>
							<td class="text-center">935,000</td>
						</tr>
						<tr class="even pointer">
							<td class="text-center">5</td>
							<td class="text-center">Binance</td>
							<td class="text-center">2020-07-01 15:32:35</td>
							<td class="text-center">tetetete21@gmail.com</td>
							<td class="text-center">365일권</td>
							<td class="text-center">OPEN 할인(15%)</td>
							<td class="text-center">935,000</td>
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
</div>