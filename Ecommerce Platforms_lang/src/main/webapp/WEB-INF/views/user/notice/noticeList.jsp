<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>공지사항 | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="공지사항 | 내담씨앤씨">
<meta property="og:title" content="공지사항 | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 소식을 알려드립니다.">
<meta property="og:description" content="내담씨앤씨의 소식을 알려드립니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 공지사항, 내담C&C 공지사항">

<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<section id="container">
		<div id="contents" class="contents_top">
			<div class="sub_title_area">
				<div class="inner_container">
					<h2 class="sub_title">${board2.boardTitle}</h2>
				</div>
			</div>
			<!-- // .sub_title_area -->

			<div class="top_visual_area recruit">
				<div class="inner_container">
					<div class="top_txt_outer">
						<div class="top_txt_area txt_notice">
							<p class="top_txt2">${board2.boardCategory}</p>
							<p class="top_txt3">${board2.boardEmail}</p>
						</div>
					</div>
				</div>
			</div>
			<!-- // .top_visual_area -->

			<div class="layout_section_outer_notice recruit">
				<div class="inner_container inner_container_notice">
					<div id="recruit_DB"></div>
					<div class="common-search_box_wrap" id="recruit_search">
						<div class="common-search_box">
							<form name="searchForm" onsubmit="return false"
								onkeypress="if(event.keyCode==13){paging();}">
								<input type="hidden" name="boardNo" value="${board2.boardNo}">
								<input type="hidden" name="searchType" value="1"> <label
									class="common-search_label" for="recruit_search_txt">검색</label>
								<input class="common-search_input" name="searchKeyword"
									id="recruit_search_txt" type="text" placeholder="검색어를 입력해주세요."
									title="검색어을 입력해주세요.">
								<button type="button" class="common-search_btn" id="btnSearch">검색</button>
							</form>
						</div>
					</div>
					<div class="search-result" id="recruit_result"
						style="display: none;">
						<div class="search-result_inner">
							<span class="result_keyword" id="recruit_result_txt"></span> <span
								class="result_txt">검색 결과가 없습니다.</span>
							<div class="result_msg">
								<ul class="common-txt-list size_16">
									<li>검색어가 올바르게 입력되었는지 확인해주세요.</li>
									<li>검색어의 띄어쓰기를 다르게 해보세요.</li>
									<li>키보드 언어 설정을 확인해주세요.</li>
									<li>일반적인 단어로 다시 검색해보세요.</li>
								</ul>
							</div>
							<div class="result_btn">
								<a href="" class="common-btn is-white2" id="btnList"><span>목록</span></a>
							</div>
						</div>
					</div>

					<div class="common-text_list_area" id="recruit_detail">
						<ul class="common-text_list">
							<li class="main_notice">
								<div class="subj_box">
									<p class="common-text_title">제목</p>
								</div>
								<div class="date_box center-left">
									<p class="common-text_reg-date">작성일자</p>
								</div>
							</li>
							<c:if test="${!empty list}">
								<c:forEach var="post" items="${list}">
									<li id="postList">
										<div class="subj_box">
											<p class="common-text_txt2">
												<a href="/user/notice/getNoticeDetail/${post.postNo}">
													${post.postTitle} </a>
											</p>
										</div>
										<div class="date_box center-left">
											<p class="common-text_txt4">${post.postDate}</p>
										</div>
									</li>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<li id="postList">
									<div class="subj_box">
										<p class="common-text_txt2 notice_empty_txt">등록된 자료가 없습니다.
										</p>
									</div>
								</li>
							</c:if>
						</ul>
					</div>
					<div id="page">${pagebar}</div>
					<!--#include virtual ="/page/_include/inc_pagination.html"-->
				</div>
			</div>
			<!-- // .layout_section_outer -->
		</div>
		<!-- // #contents -->
	</section>
	<!-- // #container -->
	</div>


	<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
<script type="text/javascript">
 	function paging(cPage){
 		
 		if(cPage == 'prev'){
 			alert("이전 페이지가 없습니다.");
 			return;
 		}else if(cPage == 'next'){
 			alert("다음 페이지가 없습니다.");
 			return;
 		}
 		
 		$("li[id='postList']").remove();
 		$("#page .common-pagination").remove();
		var search = $("form[name='searchForm']").serialize();
		var boardNo = $("input[name='boardNo']").val();
		var searchKeyword = $("input[name='searchKeyword']").val();
		var searchType = $("input[name='searchType']").val();
		$.ajax({
			url : "/user/notice/noticeListCom?${_csrf.parameterName}=${_csrf.token}",
			type : "POST",
			data : {
				cPage,
				boardNo,
				searchKeyword,
				searchType
			},
			success : function(JSONData, status){
				var display = '';
				for(var i = 0; i < JSONData.list.length; i++){
					console.log("접근")
					display = '<li id ="postList">'
							+ 	'<div class="subj_box">'
							+ 	   '<p class="common-text_txt2">'
							+ 		  '<a href="/user/notice/getNoticeDetail/'+JSONData.list[i].postNo+'">'
							+			 JSONData.list[i].postTitle
							+			 '<br />'
							+		  '</a>'
							+		'</p>'
							+	 '</div>'
							+	 '<div class="date_box center-left">'
							+		 '<p class="common-text_txt4">'+JSONData.list[i].postDate+'</p>'
							+	 '</div>'
							+ '</li>';
					$(".common-text_list_area .common-text_list").append(display);
				}
				$("#page").append(JSONData.pagebar);
			} ,
			error : function(check){
				alert("실패")
			}
		})
	}
</script>
</html>
