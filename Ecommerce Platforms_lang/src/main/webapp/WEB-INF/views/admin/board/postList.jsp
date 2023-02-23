<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="1:1문의" name="title"/>
</jsp:include>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/> 
	<!-- jQuery 3 -->
	<script type="text/javascript">
		$(function(){
			//post 선택삭제 시작
			$("#deleteChoicePost").on("click", function(){
				
				var postArr = new Array();
				var mode = "delete";
				var boardNo = $("input[name='boardNo']").val();
							
				$("input[class='postNo']:checked").each(function(){
					postArr.push($(this).val());
				});
				if(postArr.length == 0){
					alert("항목을 선택하셔야 합니다.");
					return;
				}
				if(!confirm("해당 자료를 정말 삭제 하시겠습니까?")){
					alert("취소 되었습니다.");
					return;
				}else{
			  		$.ajax({
		  			 	 url : "/admin/board/json/postProcess?${_csrf.parameterName}=${_csrf.token}",
			  		  	 type : "POST",
		  		  	 	 data : { postArr : postArr,
		  		  	 		 	  mode
		  		  	 		  	},
		    		 	 success : function(result){
		   			  		alert("게시글이 삭제 되었습니다.")
		   			  		location.href = "/admin/board/postList?boardNo="+boardNo;
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
	
<style>
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

<div class="content-wrapper">
	<section class="content-header">
	    <h1>
	    ${board2.boardTitle} 관리
	    <small>${board2.boardTitle} list</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">${board2.boardTitle} 관리</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                    <label style="margin-top:5px;">총 ${pageCount} 건</label>	                    
	                    <form name="searchForm" method="post" action="/admin/board/postList?${_csrf.parameterName}=${_csrf.token}" style="margin-top: 8px;">
		                    <div class="box-tools pull-right" style="margin-bottom:5px;">
		                    	<input type="hidden" name="boardNo" value="${boardNo}">
		                    	<input type="hidden" name="cPage">
		                    	<input type="hidden" name="locale" value="${locale}"/>
		                        <div class="has-feedback">
			                        <span>
			                      	  <input type="text" name="searchKeyword" id="searchKeyword" class="form-control input-sm" placeholder="검색" value="${comm.searchKeyword}"/>
			                      	  <button class="form-control-feedback" type="submit" id="searchBtn" style="pointer-events: all;">검색</button>
			                        </span>
		                        </div>
		                    </div>
		                    <div class="box-tools pull-right" style="margin-bottom:5px;">
		                        <div class="has-feedback">
			                        <select name="searchType" class="form-control input-sm" style="float:left; width:130px;">
			      						<option value="1">제목</option>      
			      						<option value="2">작성자</option>                        
			      					</select>
		                        </div>
		                    </div>
	                    </form>
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
															$('.postNo').prop("checked", true);
														} else {
															$('.postNo').prop("checked", false);
														}
													});
												</script>
											</div>
				                        </td>
				                        <td style="width:60px;">NO</td>
				                        <td>제목</td>
				                        <td style="width:100px;">작성자</td>
				                        <td style="width:140px;">등록일</td>
				                        <td style="width:80px;">명령</td>
				                    </tr>
			                    </thead>
			                    <tbody>
			                    	<c:if test="${empty list}">
					                    <tr>
					                   		<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
					                   	</tr>
				                    </c:if>
				                   	<c:forEach var="post" items="${list}">
					                   		<c:set var="i" value="${ i+1 }" />
					                   		<tr>
					                        	<td>
							                        <div>
							                        	<input type="checkbox" class="postNo" name="postNo"  value="${post.postNo}" />
							                        	<script>
															$(".postNo").click(function() {
																$("#allCheck").prop("checked", false);
															});
														</script>
													</div>
					                        	</td>
					                   			<td>
					                   				<fmt:formatNumber type="number" maxFractionDigits="0" value="${post.rownum}" />
					                   			</td>
					                   			<td align="left">                           				     				
					                   				${post.postTitle}
					                   			</td>
					                   			<td>${post.postMemberName}</td>
					                   			<td>
						                        	${post.postDate}
						                        </td>
					                   			<td>
						                   			<button type="button" name="getPostBotton" data-toggle="modal" data-target="#modalContent4" class="btn btn-primary btn-xs" value="${post.postNo}">상세보기
						                   			<input type="hidden" class="post_member_no" value="${post.postMember.memberNo}"></button>
						                   			</button>
					                   			</td>
					                   		</tr>
				                   	 </c:forEach>                  	                   
			      				</tbody>
		      				</form>
	                    </table>
	                    <br>
	                    <button type="button" id="deleteChoicePost" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
	                    <button type="button" onclick="fncPost()" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalContent"><i class="fa fa-plus-square"></i> 글 등록</button>
	                    <button type="button" onclick="fncBoardTitle2()" class="btn btn-warning btn-sm"><i class="fa fa-random"></i> 게시물 복사</button>
	                    <button type="button" onclick="fncBoardTitle()" class="btn btn-warning btn-sm"><i class="fa fa-random"></i> 게시물 이전</button>
						<div style="text-align: right;">
							${pagebar}
						</div>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
	
	<div id="list_file_tag" class="sr-only">
	    <input type="file" name="file[]" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;">
	</div>
	
<jsp:include page="/WEB-INF/views/admin/board/addPost.jsp"/>
<jsp:include page="/WEB-INF/views/admin/board/getPost.jsp"/>
<jsp:include page="/WEB-INF/views/admin/board/boardCopy.jsp"/>
<jsp:include page="/WEB-INF/views/admin/board/boardChange.jsp"/>
</div><!-- /.content-wrapper -->

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>