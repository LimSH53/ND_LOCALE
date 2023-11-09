<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="서비스 관리" name="title"/>
</jsp:include>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Ionicons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
	<!-- jvectormap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-jvectormap.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/_all-skins.min.css">
	<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet">
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<style>
		.option_tab { display:inline-block; width:130px;}
	</style>

	<script type="text/javascript">
		$(function(){
			
			$("#deleteChoiceBusiness").on("click", function(){
				
				var businessArr = new Array();
				var mode = "delete";
				$("input[class='businessNo']:checked").each(function(){
					businessArr.push($(this).val());
	 			});
				if(businessArr.length == 0){
					alert("항목을 선택하셔야 합니다.");
					return;
				}
				if(!confirm("해당 자료를 정말 삭제 하시겠습니까?")){
					alert("취소 되었습니다.");
					return;
					
				}else{
			  		$.ajax({
		  			 	 url : "/admin/business/json/businessProcess?${_csrf.parameterName}=${_csrf.token}",
			  		  	 type : "POST",
		  		  	 	 data : { 
		  		  	 		businessArr : businessArr,
		  		  	 		mode
		  		  	 	 },
		    		 	 success : function(result){
		   					alert("해당 자료가 삭제 되었습니다.")
		   					location.href = "/admin/business/getBusinessList";    		 		
		  		  	 	 }
			  		});		
				}
			})	
			//business 선택삭제 종료
			
 			// business 상세보기 시작
			$("button[name='updateBusiness']").on("click", function(){
				var businessNo = $(this).find('input').val();

				$.ajax({
					url : "/admin/business/json/getBusiness/"+businessNo,
					method : "GET",
					dataType : "JSON",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"	 						
					} ,
					success : function(JSONData, status){
						$("#businessTitle2").val(JSONData.businessTitle);
					},
					error:function(request,status,error){
						  alert("에러")     
					}
				});			
			}); 	 
		});
		
		function fncUpdateBusiness(){
			
			var businessTitle = $("input[id='businessTitle2']").val();
			var businessCategory = $("input[id='businessCategory2']").val();
			if(businessTitle == null || businessTitle == ''){
				alert("제목이 입력되지 않았습니다.");
				return;
			}else if(businessCategory == null || businessCategory == ''){
				alert("카테고리가 입력되지 않았습니다.");
				return;
			}
			
			alert("게시판이 수정 되었습니다.")
			$("form[name='updateBusinessForm']").attr("method", "POST").attr("action", "/admin/business/businessProcess?${_csrf.parameterName}=${_csrf.token}").submit();
		}			
		
	</script>	
	
</head>
 
<div class="content-wrapper">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<section class="content-header">
	    <h1>
		    사업관리
		    <small>사업관리 list</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li>사업관리</li> 
	        <li class="active">사업관리 리스트</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">                   
	                    <table class="table table-bordered table-hover">
		                    <form name="form_list" method="post" action="?tpf=admin/board/manage_process">
					            <input type="hidden" name="mode" id="mode">
					            <thead>
				                    <tr>
				                        <td style="width:30px;">
				                      		<div class="allCheck">
												<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
												<script>
													$("#allCheck").click(function() {
														var chk = $("#allCheck").prop("checked");
														if (chk) {
															$('.businessNo').prop("checked", true);
														} else {
															$('.businessNo').prop("checked", false);
														}
													});
												</script>
											</div>
				                        </td>
				                        <td style="width:60px;">NO</td>
				                        <td>제목</td>
				                        <td style="width:250px;">연결주소</td>
				                        <td style="width:220px;">명령</td>
				                    </tr>
			                    </thead>
			                    <tbody>
			                    	<c:set var="i" value="0"/>
			                    	<c:if test="${empty business}">
					                    <tr>
					                   		<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
					                   	</tr>
				                    </c:if>
			                    	<c:forEach var="business" items="${business}" varStatus="status" >
				                    	<c:set var="i" value="${ i+1 }" />
										<tr>
					                        <td>
						                        <div>
						                        	<input type="checkbox" class="businessNo" name="businessNo"  value="${business.businessNo}" />
						                        	<script>
														$(".businessNo").click(function() {
															$("#allCheck").prop("checked", false);
														});
													</script>
												</div>
					                        </td>
										  <td>${i}</td>
										  <td align="left">${business.businessTitle}</td>
										  <td align="left">http://localhost:8080/admin/board/postList</td>
										  <td>
					                        <button type="button" onclick="onclickView(${business.businessNo});" class="btn btn-success btn-xs">바로가기</button>
					                        <button type="button" onclick="copyURL(${business.businessNo});" class="btn btn-warning btn-xs" value="${business.businessNo}">
					                        	<input type="hidden" name="hiddenBusinessNo2" value="${business.businessNo}" />링크복사</button>
					                        <button type="button" class="btn btn-primary btn-xs" name="updateBusiness" data-toggle="modal" data-target="#updateBusinessModal">
					                        	<input type="hidden" name="hiddenBusinessNo" value="${business.businessNo}" />상세보기</button>							  
										  </td>
										</tr>
									</c:forEach>
			                    </tbody>
		                    </table>
	                    </form>
	                    <br>
	                    <button type="button" id="deleteChoiceBusiness" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
	                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalRegister"><i class="fa fa-plus-square"></i> 게시판 생성</button>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
<!-- addBusiness 모달 시작 -->
<jsp:include page="/WEB-INF/views/admin/business/addBusiness.jsp"/>
<!-- updateBoard 모달 시작 -->
<jsp:include page="/WEB-INF/views/admin/business/updateBusiness.jsp"/>
</div>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>