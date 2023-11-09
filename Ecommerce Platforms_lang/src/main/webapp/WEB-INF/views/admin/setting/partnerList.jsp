<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="상품 관리" name="title" />
</jsp:include>

<style>
#searchBox {
    width: 210px;
    height: 30px;
    border: 1px solid #3c8dbc;
    background: fffff;
    float: right;
    margin-top: 20px;
    margin-bottom: 5px;
}

#searchKeyword {
    font-size: 12px;
    width: 150px;
    padding: 5px 10px;
    border: 0px;
    outline: none;
    float: left;
}

#searchBtn {
    width: 50px;
    height: 100%;
    border: 0px;
    background: #3c8dbc;
    outline: none;
    float: right;
    color: #ffffff;
}
</style>
<script>
const paging = (cPage) => {
	$("input[name='cPage']").val(cPage)
	$("form[name='searchForm']").attr("method" , "POST").attr("action" , "/admin/setting/listPartner?${_csrf.parameterName}=${_csrf.token}").submit();
} 

</script>
<div class="content-wrapper" style="min-height: 868px;">
	<section class="content-header">
	    <h1>
		    파트너 관리
		    <small>partner list</small>
	    </h1>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                	<label style="margin-top:5px;">총 ${totalCount} 건</label>               	
	                    <table class="table table-bordered table-hover">
		                    <form name="searchForm" method="post" action="/admin/setting/listPartner?${_csrf.parameterName}=${_csrf.token}">
					            <input type="hidden" name="mode" id="mode">
					            <input type="hidden" name="cPage">
					            <input type="hidden" name="locale" value="${locale }">
					            <div id="searchBox">
				                      	  <input type="text" name="searchKeyword" id="searchKeyword" placeholder="제목으로 검색" value="${searchKeyword}">
				                      	  <button type="submit" id="searchBtn">검색</button>
			                     </div>
			                </form>
		                    <thead>
		                    	<tr>
		                        	<td style="width:30px;">
			                      		<div class="allCheck">
											<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
											<script>
												$("#allCheck").click(function() {
													var chk = $("#allCheck").prop("checked");
													if (chk) {
														$('.partnerNo').prop("checked", true);
													} else {
														$('.partnerNo').prop("checked", false);
													}
												});
											</script>
										</div>
			                        </td>
			                        <td>파트너명</td>
			                        <td style="width:150px;">등록일자</td>
			                        <!-- <td style="width:60px;">
			                        	<i onclick="fncDown();" class="fa fa-fw fa-arrow-circle-down cp" style="cursor:pointer"></i>
			                        	<i onclick="fncUp();" class="fa fa-fw fa-arrow-circle-up cp" style="cursor:pointer"></i>
			                        </td> -->
                        			<td style="width:60px;">명령</td>
                    			</tr>
                    		</thead>
      						<tbody>
      							<c:forEach var="partner" items="${list}">
				      				<tr>
				                        <td>
					                        <div>
					                        	<input type="checkbox" class="partnerNo" name="partnerNo"  value="${partner.partnerNo}" />
					                        	<script>
													$(".partnerNo").click(function() {
														$("#allCheck").prop("checked", false);
													});
												</script>
											</div>
				                        </td>
				                        <td>${partner.partnerName}</td>
				                        <td>${partner.in_dtm}</td>
				                        <%-- <td>
				                        	<input type="radio" name="order_code" value="${partnerAsc}">
				                        </td> --%>
				                        <td>
				                        	<button type="button" onclick="onclickUpdate(${partner.partnerNo});" class="btn btn-primary btn-xs">수정하기</button>
				                        </td>
				                    </tr> 
				                </c:forEach>                 
                    		</tbody>
                    	</table>
                    	<br>
                    	<button type="button" onclick="deleteChoicePartner(${partner.partnerNo});" class="btn btn-danger btn-sm"><i class="fa fa-minus-square" aria-hidden="true"></i> 선택삭제</button>
                    	<button type="button" onclick="onclickInsert();" class="btn btn-primary btn-sm"><i class="fa fa-plus-square"></i> 파트너 등록</button>
                    	<div style="text-align: right;">
							${pagebar}
						</div>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
	
	<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:800px">
	        <div class="modal-content">
	            <form name="form_register" method="post" action="/admin/setting/partnerProcess?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		            <input type="hidden" name="mode" value="insert">
		             <input type="hidden" name="locale" value="${locale }">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">파트너 등록</h4>
		            </div>
		            <div class="modal-body">
			            <div class="row">
			                <div class="col-xs-4">
			                	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i>파트너 등록</p></h4>
			                </div>
		            	</div>
		            	<table class="table table-bordered">
			            	<tbody>
					            <tr>
					                <td class="menu">파트너명</td>
					                <td align="left"><input type="text" name="partnerName" class="form-control input-sm"></td>
					            </tr>					            
					            <tr>
					            	<td class="menu">이미지파일</td>
					            	<td>
					            		<input type="file" name="file" id="file" class="form-control input-sm">
					            	</td>
					            </tr>					            
				            </tbody>
			            </table>
			            <div style="color: red;"><b>&nbsp;&nbsp;* 이미지는 배경이 없는 .png 타입으로 등록 바랍니다.</b></div>
		            </div><!-- /.modal-body -->
		            <div class="modal-footer">
	            		<button type="button" onclick="register();" class="btn btn-primary">저장하기</button>
	            	</div><!-- /.modal-footer -->
	            </form>	
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade -->
	
	<div class="modal fade" id="modalContent2" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:800px">
	        <div class="modal-content">
	            <form name="form_register2" method="post" action="/admin/setting/partnerProcess?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		            <input type="hidden" name="mode" value="update">
		            <input type="hidden" name="partnerNo">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">파트너 수정</h4>
		            </div>
		            <div class="modal-body">
			            <div class="row">
			                <div class="col-xs-4">
			                	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 파트너 수정</p></h4>
			                </div>
			            </div>
			            <table class="table table-bordered">
				            <tbody>
					            <tr>
					                <td class="menu">파트너명</td>
					                <td align="left">
					                <input type="text" name="partnerName" class="form-control input-sm"></td>
					            </tr>				            
					            <tr>
					            	<td class="menu">이미지파일</td>
					            	<td align="left" >
					            		<div class="partnerImageTb"></div>
					            		<input type="file" name="file" id="file" style="display:inline;">
					            	</td>
					            </tr>
				            </tbody>
				            <div style="color: red;"><b>&nbsp;&nbsp;* 이미지는 배경이 없는 .png 타입으로 등록 바랍니다.</b></div>
			            </table>
		            </div><!-- /.modal-body -->
		            <div class="modal-footer">
	            		<button type="button" onclick="register2();" class="btn btn-primary">저장하기</button>
	            	</div><!-- /.modal-footer -->
	            </form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade -->
</div><!-- /.content-wrapper -->

<script>
     function setLocale(locale) {
         $('button[id^=locale_]').attr('class', 'btn btn-default');
         $('#locale_'+locale).attr('class', 'btn btn-primary');
         $('[name=locale]').val(locale);
         setData($('[name=code]').val());
     }
     
     function register() {
         if(form_register.title.value == '') { alert('파트너명이 입력되지 않았습니다.'); form_register.title.focus(); return false;}
 	     if(form_register.file.value == '') { alert('이미지는 필수 사항입니다.'); form_register.content.focus(); return false;}
         alert("파트너가 등록 되었습니다.");
         $("form[name='form_register']").submit();
     }
     
     function register2() {
         if(form_register2.title.value == '') { alert('파트너명이 입력되지 않았습니다.'); form_register2.title.focus(); return false;}
         alert("파트너가 수정 되었습니다.");
         $("form[name='form_register2']").submit();
     }   
     
     function setData(code) {
         // 정보
         $.ajax({
         	url:'/admin/setting/json/getPartner?${_csrf.parameterName}=${_csrf.token}',
             type:'post',
             dataType:'json',
             data:{
                 method : 'partner.getPartner',
                 locale : $('[name=locale]').val(),
                 code : code
             },
             success:function(data, textStatus, jqXHR){
                 var json_data = data;
                 console.log(json_data);
                 $('[name=mode]').val('update');
                 $('[name=partnerNo]').val(code);
                 $('[name=partnerName]').val(json_data.partnerName);
				 if(json_data.partnerImage != null){
					 $("#display_partnerImage").remove();
					 $(".partnerImageTb").html('');
					 var partnerImage = "'${pageContext.request.contextPath}/resources/user/images/partner/"+json_data.partnerImage+"'"
					 if(json_data.partnerImage != null && json_data.partnerImage != ''){
						 var display = json_data.partnerImage + '&nbsp;&nbsp;&nbsp;<span id="display_partnerImage" name="headImageSpan">'
										+ '<button type="button" onclick="window.open('+partnerImage+')" class="btn btn-success btn-xs">보기</button>'
										+ '<button type="button" onclick="fncDeleteImage()" name="deleteImage" value="'+json_data.partnerNo+'" class="btn btn-danger btn-xs">삭제</button>'
										+ '</span>';
					 $(".partnerImageTb").append(display);
					 }else{
						 var display = '<span id="display_partnerImage" name="partnerImageSpan">'
									  + '</span>';	
					 }
				 }
             },
             error:function(jqXHR, textStatus, errorThrown){
                 console.log(textStatus);
                 // $('#content').val(errorThrown);
             }
         });
     }
     
     function fncDeleteImage(){
    	 if(confirm('정말 삭제하시겠습니까?')){
    			$("#display_partnerImage").parent().remove();
    			$("#imageStatus").remove();
    		}
     }
     
     function onclickInsert() {
         $('#modalContent').modal('show');
         form_register.reset();
         form_register.mode.value = 'insert';
         $('input:radio[name=icon_code]').attr('checked', false);
     }
     
     function onclickUpdate(code) {
         $('#modalContent2').modal({backdrop:'static', show:true});
         setData(code);
     }
     
     // 헤더 복사
     function onclickCopyHeader() {
         parent.$('#modalCopyHeader').modal({backdrop:'static', show:true});
     }
     
     function registerCopyHeader() {
         if(formCopyHeader.menu_locale.value == '') { alert('언어가 선택되지 않았습니다.'); formCopyHeader.menu_locale.focus(); return false;}
         formCopyHeader.target = 'iframe_process';
         formCopyHeader.submit();            
     }
     
     function deleteChoicePartner(code){
     	
     	var partnerArr = new Array();
     	var mode = "delete";
     	var part = "head";
     	
		$("input[class='partnerNo']:checked").each(function(){
			partnerArr.push($(this).val());
			});
		if(partnerArr.length == 0){
			alert("항목을 선택하셔야 합니다.");
			return;
		}
		if(!confirm("해당 자료를 정말 삭제 하시겠습니까?")){
			alert("취소 되었습니다.");
			return;
			
		}else{
	 		$.ajax({
				 	 url : "/admin/setting/json/partnerProcess?${_csrf.parameterName}=${_csrf.token}",
	 		  	 	 type : "POST",
			  	 	 data : { 
			  	 		partnerArr : partnerArr,
			  	 		mode,
			  	 		part
			  	 	 },
	  		 	 success : function(result){
	  		 		alert("해당 자료가 삭제 되었습니다.")
	  				location.reload();
			  	 }
	 		});		
		}
     }      
     
 	function fncUp(){
 		var headAsc = $("input:radio[name='order_code']:checked").val();
 		var headIndex = $("input:radio[name='order_code']:checked").parent().parent().index()+1;
 		var headUpAsc = $("tr").eq(headIndex-1).children().find("input:radio").val();
 		var headNo = $("input:radio[name='order_code']:checked").parent().parent().find("input[name='partnerNo']").val();
 		
 		if(headIndex == 0){
 			alert("1개의 항목을 선택하여야 합니다.")
 			return;
 		}
 		if(headAsc == headUpAsc){
 			headIndex--;
 			headUpAsc = $("tr").eq(headIndex-1).children().find("input:radio").val();
 			var upHeadNo = $("tr").eq(headIndex-1).children().find("input[name='headNo']").val();
 		}else{
 			var upHeadNo = $("tr").eq(headIndex-1).children().find("input[name='headNo']").val();
 		}
 		if(headIndex == 1){
 			alert("더이상 상위로의 위치 변경은 불가능합니다.");
 			return;
 		}else{
 	  		$.ajax({
 			 	 url : "/admin/setting/updatePartnerUpAsc?${_csrf.parameterName}=${_csrf.token}",
 	 		  	 type : "POST",
 		  	 	 data : { 
 		  	 		headAsc,
 		  	 		headUpAsc,
 		  	 		headNo,
 		  	 		upHeadNo
 		  	 	 },
 			 	 success : function(result){
 			 		if(result == true){
 			 			location.reload();
 			 		}
 			  	 }
 	 		});	
 		}
 	}		
 	
 	function fncDown(){
 		var lastIndex = $("input:radio[name='order_code']:checked").parent().parent().parent().find("tr").last().index()+1;    		
 		var headAsc = $("input:radio[name='order_code']:checked").val();
 		var headIndex = $("input:radio[name='order_code']:checked").parent().parent().index()+1;
 		var headDownAsc = $("tr").eq(headIndex+1).children().find("input:radio").val();
 		var headNo = $("input:radio[name='order_code']:checked").parent().parent().find("input[name='partnerNo']").val();
 		
		console.log("lastIndex", lastIndex);
		console.log("headAsc", headAsc);
		console.log("headIndex", headIndex);
		console.log("headDownAsc", headDownAsc);
		console.log("headNo", headNo);
 		
 		
 		if(headIndex == 0){
 			alert("1개의 항목을 선택하여야 합니다.")
 			return;
 		}
 		if(headAsc == headDownAsc){
 			headIndex++;
 			headDownAsc = $("tr").eq(headIndex+1).children().find("input:radio").val();
 			var downHeadNo = $("tr").eq(headIndex+1).children().find("input[name='headNo']").val();
 		}else{
 			var downHeadNo = $("tr").eq(headIndex+1).children().find("input[name='headNo']").val();
 		}
 		if(headIndex == lastIndex){
 			alert("더이상 하위로의 위치 변경은 불가능합니다.")
 			return;
 		}else{
 	  		$.ajax({
 			 	 url : "/admin/menu/json/updateHeadDownAsc?${_csrf.parameterName}=${_csrf.token}",
 	 		  	 type : "POST",
 		  	 	 data : { 
 		  	 		headAsc,
 		  	 		headDownAsc,
 		  	 		headNo,
 		  	 		downHeadNo
 		  	 	 },
 			 	 success : function(result){
 			 		if(result == true){
 			 			location.reload();
 			 		}
 			  	 }
 	 		});				
 		}
 	}      
</script>
	
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>
