<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
<fmt:parseDate value="${post.postDate}" var="registered" pattern="yyyy-MM-dd" />
</head>
  <body>
  <jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<div id="wrap" class="news">
        <section id="container">
            <div id="contents">
                <div class="layout_section_outer type04 no-btm-margin layout_notice_detail">
                    <div class="inner_container">
                        <div class="news_view">
							<div class="detail_wrap">
								<div class="detail_header">
									<h2 class="title tit_event">
										<p><span class="category">${board.boardTitle}</span>
										<span class="date"><fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/></span></p>
										<span>${post.postTitle}</span>
									</h2>
								</div>
								<div class="notice_file_area">
									<c:forEach var="file" items="${boardFile}" varStatus="status" >
										<ul class="noticeDetail_file">
											<li>
												<a href="/resources/user/downloadFile/${file.fileName}" download value="6012" name="fileDownload"> 
													<i class="file_icon"></i>
													${file.fileName}
												</a>
											</li>
										</ul>
									</c:forEach>
								</div>
								<div class="detail_body">
									<div id="bodyContent">
										${post.postContents}
									</div>
								</div>
							</div>
							<div class="pagination_preview">
								<c:if test="${empty postNext.postNo}">
									<dl class="no_list">
										<dt>
											<span class="spr ico_next"></span>다음
										</dt>
										<dd>다음 글이 없습니다.</dd>
									</dl>
								</c:if>
								<c:if test="${!empty postNext.postNo}">
									<dl>
										<dt>
											<span class="spr ico_next"></span>다음
										</dt>
										<dd>
											<a href="/user/notice/getNoticeDetail/${postNext.postNo}">${postNext.postTitle}</a>
										</dd>
									</dl>
								</c:if>
								<c:if test="${empty postPrev.postNo}">
									<dl class="no_list">
										<dt>
											<span class="spr ico_before"></span>이전
										</dt>
										<dd>이전 글이 없습니다.</dd>
									</dl>
								</c:if>
								<c:if test="${!empty postPrev.postNo}">
									<dl>
										<dt>
											<span class="spr ico_before"></span>이전
										</dt>
										<dd>
											<a href="/user/notice/getNoticeDetail/${postPrev.postNo}">${postPrev.postTitle}</a>
										</dd>
									</dl>
								</c:if>
							</div>
							<div class="btn_area">
								<a href="/user/notice/noticeList/${board.boardNo}" class="common-btn is-white2"><span>목록</span></a>
							</div>
						</div>
                    </div>
                </div>
				<!-- // .card-ui -->

            </div><!-- // #contents -->
        </section><!-- // #container -->
    </div>  
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />	
  </body>
</html>
