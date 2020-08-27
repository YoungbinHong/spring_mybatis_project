<p align="left">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
</p>
<div class="modal-header">
    <div class="col-md-8 col-sm-8 col-xs-8">
		<h4 class="modal-title" id="myModalLabel">공지사항</h4>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-4" style="text-align:right">
        <button type="button" class="btn btn-success" id="btPutData" onclick="fn_modi()">수정</button>
        <button type="button" class="btn btn-success" id="btPutData" onclick="fn_del()">삭제</button>	
	</div>
</div>
<div class="modal-body">
    <div class="row">
		<div class="col-md-8 col-sm-8 col-xs-8">
			<h2 class="modal-title" id="myModalLabel" style="text-align:left">${noticeInfo.noticeTitle!}</h4>
		</div>
		<div class="col-md-4 col-sm-4 col-xs-4 text-right">
			${noticeInfo.regDate!}&emsp;&emsp;조회 ${noticeInfo.viewcnt!}
		</div>
    </div>
    <hr />
    <p>
    <div>
        ${noticeInfo.noticeContent!}
    </div>
    </p>
</div>

<script>
	function fn_modi(){
        alert("hi");
		var request = $.ajax({
				url:"/notice/noticeWrite",
				method:"POST",
				data: {noticeSeq : getCookie('modalNoticeSeq')},
				dataType:"text"
			});
            alert("bye");
	}
	

	
	function fn_deleteYn(){
        var request = $.ajax({
				url:"/notice/ajaxNoticeDelete",
				method:"POST",
				data:${noticeSeq!},
				dataType:"text"
			});
			request.done(function(data){
    			jsAlert.alert("알림","삭제되었습니다.",null, fn_list,"확인");
    		});
    		
    		request.fail(function(jqXHR,textStatus){
    			jsAlert.alert("알림", "데이터 가져오기에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    		});	
    }

	function ajaxReturnDelete(data){
		if(data.sw){
    		jsAlert.alert("알림", "삭제되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "삭제에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_list(){
		location.href="/notice/notice";		
	}
	
    function ajaxFileFormExecute(formId, action, method, asyncFlag, progressFlag, callback){
        if(typeof(asyncFlag) == "undefined" || asyncFlag == null || asyncFlag == "") asyncFlag = true;
        
        var formName = $('#' + formId).attr("name");
        var formData = new FormData(document.forms.namedItem(formName));
        $.ajax({
            url : action,
            type: method,
            data: formData,
            contentType: false,
            processData: false,
            async: asyncFlag,
            success: function(data) {
                if (typeof callback == "function") {
                    callback.call(this, data);
                }
            },
            error: function(request,status,error) {
                //$('body').empty().append(data.responseText);
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                if(progressFlag) removeAjaxLoading();
                ajaxLoginCheck(request);
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("AJAX", true);
                if(progressFlag) appendAjaxLoading();
            },
            complete: function() {
                if(progressFlag) removeAjaxLoading();
            }
        });
    }
</script>