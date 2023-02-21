<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}">
	<meta name="_csrf" id="_scrf" content="${_csrf.token}">
	<meta name="naver-site-verification" content="b08b53e0660f883a76f509d68079560f01abf7bf" />
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title>ND C&C | ${param.title}</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<script src="https://kit.fontawesome.com/76afde4c0b.js" crossorigin="anonymous"></script>
	<!-- Ionicons -->
	<script src="https://unpkg.com/ionicons@4.4.1/dist/ionicons.js"></script>
	
	<!-- jvectormap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/jquery.vector-map.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/_all-skins.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/admin.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/jquery-ui.css" />


	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<style>
	.modal-body {
	    background-color: #fff;
	}	  
	</style>

	<script type="text/javascript">
		$(function(){
			
			$.ajax({
				url : "/admin/board/json/getAdminMenu",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(Data, status){
					if(Data[0].status == 'N'){
						document.getElementById("menuManage").style.display = 'none';
					}if(Data[1].status == 'N'){
						document.getElementById("boardManage").style.display = 'none';
					}if(Data[2].status == 'N'){
						document.getElementById("businessManage").style.display = 'none';
					}if(Data[3].status == 'N'){
						document.getElementById("employmentManage").style.display = 'none';
					}
				}
			})
		})
		
		window.onload=function(){
			$.ajax({
				url : "/admin/board/json/listBoard",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(Data, status){
					var display = '';
					if(Data.length > 0){
						for(var i = 0; i < Data.length; i++){
							display = "<li>"
									+ "<a href=/admin/board/postList?boardNo="+Data[i].boardNo+">"
									+ "<i class='fa fa-circle-o'></i> "+Data[i].boardTitle
									+ "</a>"
									+ "</li>"
							$('#boardMenu').append(display);
						}
					}			
				}
			});		
			$.ajax({
				url : "/admin/business/json/getBusinessList",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(Data, status){
					var display = '';
					if(Data.length > 0){
						for(var i = 0; i < Data.length; i++){
							display = "<li>"
									+ "<a href=/admin/business/getBusinessPostList?businessNo="+Data[i].businessNo+">"
									+ "<i class='fa fa-circle-o'></i> "+Data[i].businessTitle
									+ "</a>"
									+ "</li>"
							$('#businessMenu').append(display);
						}
					}			
				}
			});					
		}
		

	
		function logoutSubmit(){
			$(document.memberLogoutFrm).submit();
		}
		
	</script>
	
	<!-- redirect Msg 처리 : deliveryController 참조 -->
	<c:if test="${not empty msg}">
		<script>
			alert("${msg}");
			location.reload();
		</script>
	</c:if>
</head>

<body class="hold-transition skin-red sidebar-mini">
	<iframe name="iframe_process" width="0" height="0" frameborder="0" style="display: none;"></iframe>

	<div class="wrapper">
		<!-- header -->
		<header class="main-header">
			<a href="${pageContext.request.contextPath}/admin/dashBoard" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg">
					<b><img src="${pageContext.request.contextPath}/resources/admin/imgs/imageBoard/neadam_logo.png"></b>
				</span>
			</a>
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> 
					<span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
								<img src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/img/avatar5.png" class="user-image" alt="User Image" /> 
								<span class="hidden-xs">
									<sec:authentication property="principal.username" />
									<sec:authentication property="authorities" />${loginMember.lastName}${loginMember.firstName}님
								</span>
							</a>
							<ul class="dropdown-menu">
								<li class="user-header">
									<img src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/img/avatar5.png" class="img-circle" alt="User Image" />
									<p>
										<sec:authentication property="principal.username" />
										${loginMember.lastName}${loginMember.firstName}님 - Web Administrator 
										<small>NaeDam 관리자</small>
									</p>
								</li>
								<li class="user-footer">
									<div class="pull-left">
										<button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/member/memberWithdrawal.do';">탈퇴</button>
									</div>
									<div class="pull-right">
										<form:form id="memberLogoutFrm" name="memberLogoutFrm" method="POST" action="${pageContext.request.contextPath}/admin/member/memberLogout.do">
											<a onclick="logoutSubmit()" class="btn btn-danger btn-flat" type="submit">Sign out</a>
										</form:form>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header> <!-- /.header -->
		
		<!-- sidebar -->
		<aside class="main-sidebar">
			<section class="sidebar">
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">NaeDam Admin</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/dashBoard"> 
							<i class="fa fa-dashboard"></i> <span>Dashboard</span>
						</a>
					</li>
					<li class="treeview" id="menuManage">
						<a href="#"> 
							<i class="fa fa-file-text-o"></i> <span>메뉴 관리</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath}/admin/menu/menu">
									<i class="fa fa-circle-o"></i> 메뉴 관리
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/admin/menu/headList">
									<i class="fa fa-circle-o"></i> 헤더 관리
								</a>
							</li>
						</ul>
					</li>
					<li class="treeview" id="boardManage">
						<a href="#" name="board"> 
							<i class="fa fa-list-alt"></i> <span>게시판 관리</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu" id="boardMenu" >
							<li>
								<a href="/admin/board/listBoard">
									<i class="fa fa-circle-o"></i> 리스트
								</a>
							</li>
						</ul>
					</li>
					<li class="treeview" id="businessManage">
						<a href="#" name="business"> 
							<i class="fa fa-list-alt"></i> <span>사업 관리</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu" id="businessMenu" >
							<li>
								<a href="/admin/business/getBusinessList">
									<i class="fa fa-circle-o"></i> 리스트
								</a>
							</li>
						</ul>
					</li>					
					<!-- 230201_미사용_임시로 닫음 -->
					<%-- <li class="treeview" id="memberManage">
						<a href="#"> 
							<i class="fa fa-user"></i> <span>회원 관리</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath}/admin/member/list.do">
									<i class="fa fa-circle-o"></i> 회원 리스트
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/admin/member/log">
									<i class="fa fa-circle-o"></i> 회원 접속이력 관리
								</a>
							</li>
						</ul>
					</li> --%>
					<li class="treeview" id="employmentManage">
						<a href="#"> 
							<i class="fa fa-user"></i> 
							<span>채용 관리</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="${pageContext.request.contextPath}/admin/recruitList">
									<i class="fa fa-circle-o"></i> 채용
								</a>
							</li>
						</ul>
					</li>											
					<li class="treeview">
						<a href="#"> 
							<i class="fa fa-gear"></i> <span>설정</span> 
							<i class="fa fa-angle-left pull-right"></i>
						</a>
						<ul class="treeview-menu">
							<li id="historyManage">
								<a href="${pageContext.request.contextPath }/admin/setting/history">
									<i class="fa fa-circle-o"></i> 연혁 관리
								</a>
							</li>
							<li id="awardManage">
								<a href="${pageContext.request.contextPath }/admin/setting/award">
									<i class="fa fa-circle-o"></i> 수상 관리
								</a>
							</li>
							<li id="partnerManage">
								<a href="${pageContext.request.contextPath }/admin/setting/listPartner">
									<i class="fa fa-circle-o"></i> 파트너 관리
								</a>
							</li>							
							<li id="infoManage">
								<a href="${pageContext.request.contextPath}/admin/setting/info">
									<i class="fa fa-circle-o"></i> 기본 설정
								</a>
							</li>									
						</ul>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/setting/version"> 
							<i class="fa fa-exclamation-circle"></i> <span>Version</span> 
							<small class="label pull-right bg-green">2.8.1</small>
						</a>
					</li>
				</ul>
			</section>
		</aside> <!-- /.sidebar -->
