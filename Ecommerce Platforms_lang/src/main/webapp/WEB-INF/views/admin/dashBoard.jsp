<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="Dashboard" name="title" />
</jsp:include>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-colorselector@0.1.0/dist/bootstrap-colorselector.min.js">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel='stylesheet'  href='${pageContext.request.contextPath}/resources/admin/fullcalendar/lib/main.css'/>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/admin/css/colorselector.css">
<script src='${pageContext.request.contextPath}/resources/admin/fullcalendar/lib/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/admin/fullcalendar/lib/locales/ko.js'></script>
<script src='${pageContext.request.contextPath}/resources/admin/js/moment.js'></script>

<style>
	ul { list-style: none; }
	
	.nav-tabs-custom .list li:not(:last-child) { margin: 0 0 13px; }
	
	.cs-m-right20 {
		margin-right: 20px;
		font-size: 14px;
		color: #97989b;
	}
	
	a { color: #333; }
	
	.fc .fc-button-primary {
	 	color: #444;
	  	color: var(--fc-button-text-color, #2C3E50);
	  	background-color: #f4f4f4;
	  	background-color: var(--fc-button-bg-color, #f4f4f4);
	  	border-color: #ddd;
	  	border-color: var(--fc-button-border-color, #ddd);
	}	
	
	.fc .fc-button-primary:not(:disabled):active, .fc .fc-button-primary:not(:disabled).fc-button-active {
    	color: #444;
    	color: var(--fc-button-text-color, #2C3E50);
    	background-color: #f4f4f4;
    	background-color: var(--fc-button-active-bg-color, #f4f4f4);
    	border-color: #ddd;
    	border-color: var(--fc-button-active-border-color, #ddd);
	}
	.fc .fc-button-primary:disabled {
	    color: #444;
	    color: var(--fc-button-text-color, #2C3E50);
	    background-color: #f4f4f4;
	    background-color: var(--fc-button-bg-color, #f4f4f4);
	    border-color: #ddd;
	    border-color: var(--fc-button-border-color, #ddd);
	}
	
	.fc-day-sun { color: red; }	
	
	.fc-sat { color: blue; }
	
	.fc-event, .fc-event:hover {
	    color: #fff;
	    text-decoration: none;
	}	
	
	.fc-event { border: #fff; }
	
	h3, h4, strong{ font-weight : bolder; }
	
	.nav-tabs-custom .recruitList li:not(:last-child) {
    margin: 0 0 13px;
	}
</style>

<script>
	function fncPostList(boardNo){
		$("li[name='postData']").remove();
		
		$.ajax({
			url : "/admin/board/json/getPostList/"+boardNo,
			method : "GET",
			dataType : "JSON",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"	 						
			} ,
			success : function(JSONData, status){
				if(status == 'success'){
					if(JSONData.list.length != 0){
						for(var i = 0; i < JSONData.list.length; i++){
							var post = JSONData.list;
							display = '<li name="postData">'
									+ '<a href="/admin/board/postList?boardNo='+post[i].postBoard.boardNo+'">'+post[i].postTitle+''
									+ '<span class="pull-right cs-m-right20">'+post[i].postDate+'</span>'
									+ '</a>'
									+ '</li>';
							$("ul[class='list']").append(display);
						}
					}else if(JSONData.list.length == 0){
						display = '<li name="postData">등록된 게시물이 없습니다.</li>';
						$("ul[class='list']").append(display);
					}
				}
			},
			error:function(request, status, error){
				alert("에러")
			}
		});
	}
	
	$(function(){
		
		<c:forEach var="board" items="${boardList}" varStatus="status">
			
			<c:if test="${status.first}">
				var boardNo = ${board.boardNo}
			</c:if>		
			
		</c:forEach>
	
		$.ajax({
			url : "/admin/board/json/getPostList/"+boardNo,
			method : "GET",
			dataType : "JSON",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"	 						
			} ,
			success : function(JSONData, status){
				console.log("status=====", JSONData);
				if(status == 'success'){
					if(JSONData.list.length != 0){
						for(var i = 0; i < JSONData.list.length; i++){
							var post = JSONData.list;
							console.log("post===="+i+"=====", post[i]);
							display = '<li name="postData">'
									+ '<a href="/admin/board/postList?boardNo='+post[i].postBoard.boardNo+'">'+post[i].postTitle+''
									+ '<span class="pull-right cs-m-right20">'+post[i].postDate+'</span>'
									+ '</a>'
									+ '</li>';
							$("ul[class='list']").append(display);
						}
					}else if(JSONData.list.length == 0){
						display = '<li name="postData">등록된 게시물이 없습니다.</li>';
						$("ul[class='list']").append(display);
					}
					
					if(JSONData.recruitList.length != 0){
						for(var i = 0; i < JSONData.recruitList.length; i++){
							console.log("JSONData.recruitList=====" , JSONData.recruitList);
							var recruit = JSONData.recruitList;
							display = '<li name="recruitData">'
									+ '<a href="/admin/recruitList">'+recruit[i].recruitTitle
									+ '<span class="pull-right cs-m-right20">'+recruit[i].recruitDate+'</span>'
									+ '</a>'
									+ '</li>';
							$("ul[class='recruitList']").append(display);
						}
					} else if(JSONData.recruitList.length == 0){
						display = '<li name="postData">등록된 게시물이 없습니다.</li>';
						$("ul[class='recruitList']").append(display);
					}
					
					
				}
			},
			error:function(request, status, error){
				alert("에러")
			}
		});	

	})

</script>

<div class="content-wrapper">
	<section class="content-header">
		<h1>
			Dashboard <small>운영현황</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li>Dashboard</li>
		</ol>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<!-- Custom Tabs -->
				<div class="nav-tabs-custom">
					<h3 style="padding-left: 10px; padding-top: 10px; ">게시판 관리</h3>
					<ul class="nav nav-tabs">
						<c:forEach var="board" items="${boardList}" varStatus="status">
							<c:if test="${status.first}">
								<li class="">
								<a aria-expanded="true" name="dashBoardNo"
									href="#tab_${board.boardNo}" data-toggle="tab"
									onclick="fncPostList(${board.boardNo})">${board.boardTitle}
								</a>
								</li>
							</c:if>
							<c:if test="${!status.first}">
								<li class="">
								<a aria-expanded="true" name="dashBoardNo" href="#tab_${board.boardNo}" data-toggle="tab"
									onclick="fncPostList(${board.boardNo})">${board.boardTitle}
								</a>
								</li>
							</c:if>
						</c:forEach>
						<li class="pull-right">
						<a class="text-muted"
							href="/admin/board/listBoard">더보기 
							<i class="fa fa-arrow-circle-right"></i>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_1">
							<ul class="list">
							</ul>
						</div>
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.nav-tabs-custom -->
				<div class="nav-tabs-custom">
					<h3 style="padding-left: 10px; padding-top: 10px; ">채용 관리</h3>
					<ul class="nav nav-tabs">
								<li class="">
								<a href="/admin/recruitList">채용 LIST</a>
								</li>
						<li class="pull-right">
						<a class="text-muted"
							href="/admin/recruitList">더보기 
							<i class="fa fa-arrow-circle-right"></i>
						</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_1">
							<ul class="recruitList">
							</ul>
						</div>
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>