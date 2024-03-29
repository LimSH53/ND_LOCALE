<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="상품 관리" name="title" />
</jsp:include>

<div class="content-wrapper" style="min-height: 868px;">
	<section class="content-header">
	    <h1>
		    헤더 관리
		    <small>head list</small>
	    </h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="#">메뉴 관리</a></li>
	        <li class="active">헤더 관리</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                    <div class="btn-group pull-right" style="margin-bottom:5px;">
      						<button type="button" id="locale_ko" onclick="location.href='${pageContext.request.contextPath}/admin/menu/headList?locale=ko'" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>   
      						<button type="button" id="locale_en" onclick="location.href='${pageContext.request.contextPath}/admin/menu/headList?locale=en'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>                    
      					</div>	                
	                    <table class="table table-bordered table-hover">
		                    <form name="form_list" method="post" action="?tpf=admin/menu/process"></form>
				            <input type="hidden" name="mode" id="mode">
				            <input type="hidden" name="locale" value="${locale}"/>
		                    <thead>
		                    	<tr>
		                        	<td style="width:30px;">
			                      		<div class="allCheck">
											<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
											<script>
												$("#allCheck").click(function() {
													var chk = $("#allCheck").prop("checked");
													if (chk) {
														$('.headNo').prop("checked", true);
													} else {
														$('.headNo').prop("checked", false);
													}
												});
											</script>
										</div>
			                        </td>
			                        <td>헤더명</td>
			                        <td style="width:55px;">상태</td>
			                        <td style="width:60px;">
			                        	<i onclick="fncDown();" class="fa fa-fw fa-arrow-circle-down cp" style="cursor:pointer"></i>
			                        	<i onclick="fncUp();" class="fa fa-fw fa-arrow-circle-up cp" style="cursor:pointer"></i>
			                        </td>
                        			<td style="width:60px;">명령</td>
                    			</tr>
                    		</thead>
      						<tbody>
      							<c:if test="${empty list}">
				                    <tr>
				                   		<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
				                   	</tr>
			                    </c:if>
      							<c:forEach var="head" items="${list}">
				      				<tr>
				                        <td>
					                        <div>
					                        	<input type="checkbox" class="headNo" name="headNo"  value="${head.headNo}" />
					                        	<script>
													$(".headNo").click(function() {
														$("#allCheck").prop("checked", false);
													});
												</script>
											</div>
				                        </td>
				                        <td style="white-space:pre-line;">${head.title}</td>
				                        <td>
				                          <c:if test="${head.status == 'y'}">
				                        	<button type="button" class="btn btn-success btn-xs">보임</button>
				                          </c:if>
				                          <c:if test="${head.status == 'n'}">
				                        	<button type="button" class="btn btn-success btn-xs">숨김</button>
				                          </c:if>			                          
				                        </td>
				                        <td>
				                        	<input type="radio" name="order_code" value="${head.headAsc}">
				                        </td>
				                        <td>
				                        	<button type="button" onclick="onclickUpdate(${head.headNo});" class="btn btn-primary btn-xs">수정하기</button>
				                        </td>
				                    </tr> 
				                </c:forEach>                 
                    		</tbody>
                    	</table>
                    	<br>
                    	<button type="button" onclick="deleteChoiceHead(${head.headNo});" class="btn btn-danger btn-sm"><i class="fa fa-minus-square" aria-hidden="true"></i> 선택삭제</button>
                    	<button type="button" onclick="onclickInsert();" class="btn btn-primary btn-sm"><i class="fa fa-plus-square"></i> 헤더 등록</button>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
	
	<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:800px">
	        <div class="modal-content">
	            <form name="form_register" method="post" action="/admin/menu/headProcess?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		            <input type="hidden" name="mode" value="insert">
		            <input type="hidden" name="part" value="head">
		            <input type="hidden" name="locale" value="${locale}"/>
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">헤더 등록</h4>
		            </div>
		            <div class="modal-body">
			            <div class="row">
			                <div class="col-xs-4">
			                	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 헤더 등록</p></h4>
			                </div>
		            	</div>
		            	<table class="table table-bordered">
			            	<tbody>
					            <tr>
					                <td class="menu">헤더명</td>
					                <td align="left"><textarea name="title" rows="3" cols="80" style="width:600px; writing-mode: horizontal-tb;"></textarea></td>
					            </tr>
					            <tr>
					                <td class="menu">상태</td>
					                <td>
					                	<select name="status" class="form-control input-sm" style="width:100px;">
					      					<option value="y">보임</option>      
					      					<option value="n">숨김</option>                
					      				</select>
					                </td>
					            </tr>
					            <tr>
					            	<td class="menu">내용</td>
					                <td colspan="2" style="text-align:left">
					                	<textarea name="content" rows="10" cols="80" style="width:600px; writing-mode: horizontal-tb;"></textarea>
					                </td>
					            </tr>
								<tr>
					            	<td class="menu">URL</td>
					            	<td align="left">
					            		<input type="text" class="form-control input-sm" name="headUrl" id="headUrl">
					            	</td>
					            </tr>					            
					            <tr>
					            	<td class="menu">이미지파일</td>
					            	<td>
					            		<input type="file" name="image" id="image" class="form-control input-sm">
					            	</td>
					            </tr>					            
				            </tbody>
			            </table>
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
	            <form name="form_register2" method="post" action="/admin/menu/headProcess?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		            <input type="hidden" name="mode" value="update">
		            <input type="hidden" name="part" value="head">
		            <input type="hidden" name="headNo">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">헤더 수정</h4>
		            </div>
		            <div class="modal-body">
			            <div class="row">
			                <div class="col-xs-4">
			                	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 헤더 수정</p></h4>
			                </div>
			            </div>
			            <table class="table table-bordered">
				            <tbody>
					            <tr>
					                <td class="menu">헤더명</td>
					                <td align="left">
					                <textarea name="title" rows="3" cols="80" style="width:600px; writing-mode: horizontal-tb;"></textarea></td>
					            </tr>
					            <tr>
					                <td class="menu">상태</td>
					                <td>
						                <select name="status" class="form-control input-sm" style="width:100px;">
						      				<option value="y">보임</option>      
						      				<option value="n">숨김</option>                
						      			</select>
					                </td>
					            </tr>
					            <tr>
					            	<td class="menu">내용</td>
					                <td colspan="2" style="text-align:left">
					                	<textarea name="content" rows="10" cols="80" style="width:600px; writing-mode: horizontal-tb;"></textarea>
					                </td>
					            </tr>
								<tr>
					            	<td class="menu">URL</td>
					            	<td align="left">
					            		<input type="text" class="form-control input-sm" name="headUrl" id="headUrl">
					            	</td>
					            </tr>					            
					            <tr>
					            	<td class="menu">이미지파일</td>
					            	<td align="left" >
					            		<div class="headImageTb" id="cImg"></div>
					            		<input type="file" name="image" id="image" style="display:inline;">
					            	</td>
					            </tr>
				            </tbody>
			            </table>
		            </div><!-- /.modal-body -->
		            <div class="modal-footer">
	            		<button type="button" onclick="register2();" class="btn btn-primary">저장하기</button>
	            	</div><!-- /.modal-footer -->
	            </form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade -->

	<div class="modal fade" id="modalCopyHeader" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:600px;">
	        <div class="modal-content">
	            <form name="formCopyHeader" method="post" action="?tpf=admin/menu/process">
		            <input type="hidden" name="mode" id="mode" value="copyHeader">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabelPortfolio">헤더 복사</h4>
		            </div>
		            <div class="modal-body">
			            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 헤더 <span id="board_sub_title">복사</span></p></h4>
			            <table class="table table-bordered">
				            <tbody>
					            <tr>
					                <td class="menu">언어</td>
					                <td align="left">
						                <select name="menu_locale" id="menu_locale" class="form-control input-sm">
						                    <option value="">선택</option>
						      				<option value="en">ENG</option>      
						      				<option value="zh">中国</option>      
						      				<option value="vn">Tiếng việt</option>                
						      			</select>
					                </td>
					            </tr>
				            </tbody>
			            </table>
		            </div><!-- /.modal-body -->
		            <div class="modal-footer">
            			<button type="button" onclick="registerCopyHeader()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
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
         if(form_register.title.value == '') { alert('헤더명이 입력되지 않았습니다.'); form_register.title.focus(); return false;}
         if(form_register.image.value == '') { alert('이미지가 등록되지 않았습니다.'); return false;}
         alert("헤더가 등록 되었습니다.");
         $("form[name='form_register']").submit();
     }
     
     function register2() {
         if(form_register2.title.value == '') { alert('헤더명이 입력되지 않았습니다.'); form_register2.title.focus(); return false;}
         alert("헤더가 수정 되었습니다.");
         $("form[name='form_register2']").submit();
     }   
     
     function setData(code) {
         // 정보
         $.ajax({
         	url:'/admin/menu/json/getHead?${_csrf.parameterName}=${_csrf.token}',
             type:'post',
             dataType:'json',
             data:{
                 method : 'head.getHead',
                 locale : $('[name=locale]').val(),
                 headNo : code
             },
             success:function(data, textStatus, jqXHR){
                 var json_data = data;
                 $('[name=mode]').val('update');
                 $('[name=headNo]').val(code);
                 $('[name=title]').val(json_data.title);
                 $('[name=status]').val(json_data.status);
                 $('[name=content]').text(json_data.content);
                 $('[name=headUrl]').val(json_data.headUrl);
				 if(json_data.headImage != null){
					 $("#display_headImage").remove();
					 $(".headImageTb").html('');
					 var headImage = "'${pageContext.request.contextPath}/resources/user/images/main/"+json_data.headImage+"'"
					 if(json_data.headImage != null && json_data.headImage != ''){
						 var display = json_data.headImage + '&nbsp;&nbsp;&nbsp;<span id="display_headImage" name="headImageSpan">'
										+ '<button type="button" onclick="window.open('+headImage+')" class="btn btn-success btn-xs">보기</button>'
										+ '<button type="button" onclick="fncDeleteImage()" name="deleteImage" value="'+json_data.headNo+'" class="btn btn-danger btn-xs">삭제</button>'
										+ '</span>';
					 $(".headImageTb").append(display);
					 }else{
						 var display = '<span id="display_headImage" name="headImageSpan">'
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
    			$("#display_headImage").parent().remove();
    			$("#imageStatus").remove();
    		}
     }
     
     function onclickInsert() {
    	 $('#content').val('');
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
     
     function deleteChoiceHead(code){
     	
     	var menuArr = new Array();
     	var mode = "delete";
     	var part = "head";
     	
		$("input[class='headNo']:checked").each(function(){
			menuArr.push($(this).val());
			});
		if(menuArr.length == 0){
			alert("항목을 선택하셔야 합니다.");
			return;
		}
		if(!confirm("해당 자료를 정말 삭제 하시겠습니까?")){
			alert("취소 되었습니다.");
			return;
			
		}else{
	 		$.ajax({
				 	 url : "/admin/menu/json/menuProcess?${_csrf.parameterName}=${_csrf.token}",
	 		  	 type : "POST",
			  	 	 data : { 
			  	 		menuArr : menuArr,
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
 		var headNo = $("input:radio[name='order_code']:checked").parent().parent().find("input[name='headNo']").val();
 		
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
 			 	 url : "/admin/menu/json/updateHeadUpAsc?${_csrf.parameterName}=${_csrf.token}",
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
 		var headNo = $("input:radio[name='order_code']:checked").parent().parent().find("input[name='headNo']").val();
 		
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
