<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="채용" name="title"/>
</jsp:include>
	
	<script type="text/javascript">
		$(function(){
			//post 선택삭제 시작
			$("#deleteChoicePost").on("click", function(){
				
				var postArr = new Array();
				/* var mode = "delete"; */
				/* var boardNo = $("input[name='boardNo']").val(); */
							
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
		  			 	 /* url : "/admin/board/json/postProcess?${_csrf.parameterName}=${_csrf.token}", */
		  			 	 url : "/admin/deleteRecruit?${_csrf.parameterName}=${_csrf.token}",
			  		  	 type : "POST",
		  		  	 	 data : { postArr : postArr,
		  		  	 		  	},
		    		 	 success : function(result){
		   			  		alert("게시글이 삭제 되었습니다.")
		   			  		location.href = "/admin/recruitList";
		  		  	 	 },
		  		  	 	 error : function(result){
			   			  		alert("게시글 삭제 실패.")
			   			  		location.href = "/admin/recruitList";
			  		  	 	 }
			  		});		
				}
			})	
		})
		
		function fncPost(){
			var secNo = $("input[name='secNo']").val();
			$("#addContents").html('');
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
			$("form[name='searchForm']").attr("method" , "POST").attr("action" , "/admin/recruitList?${_csrf.parameterName}=${_csrf.token}").submit();
		} 
	</script>
	
<style>
/* recruit css */

#searchBox {
	width: 210px;
	height: 30px;
    border: 1px solid #3c8dbc;
    background: fffff;
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
<div class="content-wrapper">
	<section class="content-header">
	    <h1>
	    채용 관리
	    <small>채용 list</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">채용 관리</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                    <label style="margin-top:5px;">총 ${pageCount} 건</label>
	                    <div class="btn-group pull-right">
      						<button type="button" name="locale" id="ko" onclick="" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>   
      						<button type="button" name="locale" id="en" onclick="" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>                    
      					</div>	                    
	                    <form name="searchForm" method="post" action="/admin/recruitList?${_csrf.parameterName}=${_csrf.token}">
		                    <div class="box-tools pull-right" style="margin-bottom:5px;">
		                    	<%-- <input type="hidden" name="boardNo" value="${boardNo}"> --%>
		                    	<input type="hidden" name="cPage">
		                    	<!-- <input type="hidden" name="searchKeyword"> -->
		                        <div id="searchBox">
			                      	  <input type="text" name="searchKeyword" id="searchKeyword" placeholder="제목으로 검색" value="${searchKeyword}">
			                      	  <button type="submit" id="searchBtn" >검색</button>
		                        </div>
		                    </div>
	                    </form>
	                    <table class="table table-bordered table-hover">
		                    <form name="form_list" method="post">
			                    <thead>
				                    <tr>
				                        <td style="width:30px;">
				                      		<div class="allCheck">
												<input type="checkbox" name="allCheck" id="allCheck" />
												<!-- <label for="allCheck"></label> -->
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
				                        <td style="width:100px;">경력</td>
				                        <td style="width:140px;">시작일</td>
				                        <td style="width:140px;">마감일</td>
				                        <td style="width:140px;">등록일</td>
				                        <td style="width:90px;">상태</td>
				                        <td style="width:80px;">명령</td>
				                    </tr>
			                    </thead>
			                    <tbody>
				                    <c:forEach var="post" items="${list}">
						                    <tr>
						                        <td>
						                        	<div>
						                        		<input type="checkbox" class="postNo" name="postNo" value="${post.recruitNo}">
						                        	</div>
						                        </td><!-- 체크박스 -->
						                        <td>${post.rownum}</td>   <!-- 번호 -->       
						                   		<td align="left">${post.recruitTitle}</td>        
						                        <td>${post.career}</td>
						                        <c:choose>
						                        	<c:when test="${post.recruitStart == null}">
						                        		<td>-</td>
						                        	</c:when>
						                        	<c:when test="${post.recruitStart != null}">
						                        		<td>${post.recruitStart}</td>
						                        	</c:when>
						                         </c:choose>
						                         <c:choose>
						                        	<c:when test="${post.recruitEnd == null}">
						                        		<td>-</td>
						                        	</c:when>
						                        	<c:when test="${post.recruitEnd != null}">
						                        		<td>${post.recruitEnd}</td>
						                        	</c:when>
						                        </c:choose>           
						               			<td>${post.recruitDate}</td>        
						               			<td>
							               			<c:if test="${post.contentsStatus == 'Y'}">채용중</c:if>
							               			<c:if test="${post.contentsStatus == 'N'}">채용마감</c:if>
							               			<c:if test="${post.contentsStatus == 'R'}">상시채용</c:if>
												</td>
						                        <td>
						                			<button type="button" name="getPostBotton" data-toggle="modal" data-target="#modalContent4" class="btn btn-primary btn-xs" value="${post.recruitNo}">상세보기</button>
						                			<%-- <input type="hidden" value="${post.postMember.memberNo}"></button> --%>
						                   		</td>
						                    </tr>
				                    </c:forEach>
				                    <c:if test="${empty list}">
					                    <tr>
					                   		<td colspan="10"><br>등록된 자료가 없습니다.<br><br></td>
					                   	</tr>
				                    </c:if>            
			      				</tbody>
		      				</form>
	                    </table>
	                    <br>
	                    <button type="button" id="deleteChoicePost" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
	                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalContent" onclick="addData()"><i class="fa fa-plus-square"></i> 글 등록</button>
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
	
<script>
function addData() {
	// 글 등록 전 초기화
    $("#title").val("");
    $("#startDay").val("");
    $("#endDay").val("");
    $("#fileName").val("");
    $("#subTitle").val("");
    $("#contents").val("");
    $("#addContents").html("");  
    $("#jobTitle").val("");
    $("#recruitType").val("");
    $("#recruitPlace").val("");
    $("#jobIntro").val("");
    $("#qualification").val("");
    
    let managerComment = `E-mail:
Tel:           
FAX:
    `
    $("#recruitManager").val(managerComment);
    $("input:checkbox[name='always']").prop("checked", false);
    document.getElementById('startDay').disabled = false;
	document.getElementById('endDay').disabled = false;
    
};
</script>
	
<jsp:include page="/WEB-INF/views/admin/recruit/addRecruit.jsp"/>
<jsp:include page="/WEB-INF/views/admin/recruit/updateRecruit.jsp"/>
</div><!-- /.content-wrapper -->

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>