<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="1:1문의" name="title"/>
</jsp:include>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/>  

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<script type="text/javascript">
		$(function(){
			//post 선택삭제 시작
			$("#deleteChoiceBusinessPost").on("click", function(){
				
				var businessPostArr = new Array();
				var mode = "delete";
				var businessNo = $(".businessNo").val();
				$("input[class='businessPostNo']:checked").each(function(){
					businessPostArr.push($(this).val());
				});
				if(businessPostArr.length == 0){
					alert("항목을 선택하셔야 합니다.");
					return;
				}
				if(!confirm("해당 자료를 정말 삭제 하시겠습니까?")){
					alert("취소 되었습니다.");
					return;
				}else{
			  		$.ajax({
		  			 	 url : "/admin/business/json/businessPostProcess?${_csrf.parameterName}=${_csrf.token}",
			  		  	 type : "POST",
		  		  	 	 data : { businessPostArr : businessPostArr,
		  		  	 		 	  mode
		  		  	 		  	},
		    		 	 success : function(result){
		   			  		alert("게시글이 삭제 되었습니다.")
		   			  		location.href = "/admin/business/getBusinessPostList?businessNo="+businessNo;
		  		  	 	 }
			  		});		
				}
			})	
		})
		
		function fncPost(){
			var secNo = $("input[name='secNo']").val();
			$.ajax({
				url : "/admin/board/json/getMemberData/"+secNo,
				method : "GET",
				dataType : "JSON",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					$("#name").val(JSONData.lastName+JSONData.firstName);
					$("#phone").val(JSONData.phone);
					$("#email").val(JSONData.email);
					$("#name").val(JSONData.lastName+JSONData.firstName);
				}
			})
		}
		
		function fncBusinessContents(no){
			location.href = "/admin/business/getBusinessContentsList?businessPostNo="+no;
		}
		
		const paging = (cPage) => {
			$("input[name='cPage']").val(cPage)
			$("form[name='searchForm']").attr("method" , "POST").attr("action" , "/admin/board/postList?${_csrf.parameterName}=${_csrf.token}").submit();
		}
		
		function fncUp(){
			var boardAsc = $("input:radio[name='order_code']:checked").val();
			var boardIndex = $("input:radio[name='order_code']:checked").parent().parent().index()+1;
			var boardUpAsc = $("tr").eq(boardIndex-1).children().find("input:radio").val();
			var postNo = $("input:radio[name='order_code']:checked").parent().parent().find("input[name='originNo']").val();
			var boardNo = $("input[name='boardNo']").val();
			if(boardIndex == 0){
				alert("1개의 항목을 선택하여야 합니다.")
				return;
			}
			if(boardAsc == boardUpAsc){
				boardIndex--;
				boardUpAsc = $("tr").eq(boardIndex-1).children().find("input:radio").val();
				var upPostNo = $("tr").eq(boardIndex-1).children().find("input[name='originNo']").val();
			}else{
				var upPostNo = $("tr").eq(boardIndex-1).children().find("input[name='originNo']").val();
			}
			if(boardIndex == 1){
				alert("더이상 상위로의 위치 변경은 불가능합니다.");
				return;
			}else{
		  		$.ajax({
				 	 url : "/admin/board/json/updateUpAsc?${_csrf.parameterName}=${_csrf.token}",
		 		  	 type : "POST",
			  	 	 data : { 
			  	 		boardAsc,
			  	 		boardUpAsc,
			  	 		postNo,
			  	 		upPostNo
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
			var boardAsc = $("input:radio[name='order_code']:checked").val();
			var boardIndex = $("input:radio[name='order_code']:checked").parent().parent().index()+1;
			var boardDownAsc = $("tr").eq(boardIndex+1).children().find("input:radio").val();
			var postNo = $("input:radio[name='order_code']:checked").parent().parent().find("input[name='originNo']").val();
			var boardNo = $("input[name='boardNo']").val();
			if(boardIndex == 0){
				alert("1개의 항목을 선택하여야 합니다.")
				return;
			}
			if(boardAsc == boardDownAsc){
				boardIndex++;
				boardDownAsc = $("tr").eq(boardIndex+1).children().find("input:radio").val();
				var downPostNo = $("tr").eq(boardIndex+1).children().find("input[name='originNo']").val();
			}else{
				var downPostNo = $("tr").eq(boardIndex+1).children().find("input[name='originNo']").val();
			}
			if(boardIndex == 5){
				alert("더이상 하위로의 위치 변경은 불가능합니다.")
				return;
			}else{
		  		$.ajax({
				 	 url : "/admin/board/json/updateDownAsc?${_csrf.parameterName}=${_csrf.token}",
		 		  	 type : "POST",
			  	 	 data : { 
			  	 		boardAsc,
			  	 		boardDownAsc,
			  	 		postNo,
			  	 		downPostNo
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
	
	<script src="${pageContext.request.contextPath}/resources/admin/ckeditor/ckeditor.js"></script>
</head>

<div class="content-wrapper">
	<section class="content-header">
	    <h1>
	     ${business.businessTitle} 관리
	    <small>${business.businessTitle} list</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">${business.businessTitle} 관리</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">                               
	                    <table class="table table-bordered table-hover">
		                    <form name="form_list" method="post">
			                    <thead>
				                    <tr>
				                        <td style="width:30px;">
				                      		<div class="allCheck">
												<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label>
												<script>
													$("#allCheck").click(function() {
														var chk = $("#allCheck").prop("checked");
														if (chk) {
															$('.businessPostNo').prop("checked", true);
														} else {
															$('.businessPostNo').prop("checked", false);
														}
													});
												</script>
											</div>
				                        </td>
				                        <td style="width:60px;">NO</td>
				                        <td>제목</td>
				                        <td style="width:100px;">작성자</td>
				                        <td style="width:140px;">등록일</td>
				                        <td style="width:80px;">등록</td>
				                        <td style="width:80px;">명령</td>
				                    </tr>
			                    </thead>
			                    <tbody>
				                    <c:if test="${empty list}">
					                    <tr>
					                   		<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
					                   	</tr>
				                    </c:if>
				                    <c:set var="i" value="0"/>
				                   	<c:forEach var="businessPost" items="${list}">
			                   			<c:set var="i" value="${ i+1 }" />
			                   			<tr>
			                   				<td>
						                        <div>
						                        	<input type="checkbox" class="businessPostNo" name="businessPostNo"  value="${businessPost.businessPostNo}" />
						                        	<script>
														$(".businessPostNo").click(function() {
															$("#allCheck").prop("checked", false);
														});
													</script>
												</div>
				                        	</td>
				                        	<td>${ i }</td>
				                        	<td align="left">
				                   				<c:if test="${nowData eq businessPost.inDtm}">
				                   					<img src="${pageContext.request.contextPath}/resources/imgs/imageBoard/new.png" width="15">
				                   				</c:if>                     				     				
				                   				${businessPost.businessPostTitle}
				                   			</td>
				                   			<td>${businessPost.businessMember.memberNo}</td>
				                   			<td>${businessPost.inDtm}</td>
				                   			<td>
				                   				<button type="button" onclick="fncBusinessContents(${businessPost.businessPostNo})" class="btn btn-primary btn-xs" value="${businessPost.businessPostNo}">내용등록</button>
				                   			</td>      				                   			
				                   			<td>
					                   			<button type="button" id="getBusinessPostBotton" data-toggle="modal" data-target="#modalContent4" class="btn btn-primary btn-xs getBusinessPost" value="${businessPost.businessPostNo}">상세보기
					                   				<input type="hidden" value="${businessPost.businessMember.memberNo}">
					                   			</button>
				                   			</td>         			
			                   			</tr>
				                   	</c:forEach>
			      				</tbody>
		      				</form>
	                    </table>
	                    <br>
	                    <button type="button" id="deleteChoiceBusinessPost" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
	                    <button type="button" onclick="fncPost()" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalContent"><i class="fa fa-plus-square"></i> 글 등록</button>
						<div style="text-align: right;">
							
						</div>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
	
	<div id="list_file_tag" class="sr-only">
	    <input type="file" name="file[]" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;">
	</div>
	
<jsp:include page="/WEB-INF/views/admin/business/addBusinessPost.jsp"/>
<jsp:include page="/WEB-INF/views/admin/business/updateBusinessPost.jsp"/>
<jsp:include page="/WEB-INF/views/admin/board/addComment.jsp"/>
<jsp:include page="/WEB-INF/views/admin/board/boardCopy.jsp"/>
<jsp:include page="/WEB-INF/views/admin/board/boardChange.jsp"/>
</div><!-- /.content-wrapper -->

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>