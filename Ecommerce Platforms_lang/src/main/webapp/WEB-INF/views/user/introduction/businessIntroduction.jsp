<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>사업소개 | 사업소개 | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="사업소개 | 사업소개 | 내담씨앤씨">
<meta property="og:title" content="사업소개 | 사업소개 | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 사업들을 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 사업들을 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 사업, 내담C&C 사업, 내담 사업, 내담씨앤씨 사업소개, 내담C&C 사업소개, 내담 사업소개">
<meta property="og:url" content="https://ndcc.co.kr/user/introduction/businessIntroduction">

<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/user/common/header.jsp" />
    <div id="wrap" class="visual-center">
        <section id="container">
            <div id="contents" class="contents_top">
                <div class="sub_title_area">
                    <div class="inner_container">
                        <h2 class="sub_title">사업 소개</h2>
                    </div>
                </div><!-- // .sub_title_area -->

                <div class="layout_section_outer sub-main type03 service_sub_main">
                    <div class="inner_container">
                        <div class="layout_head">
                            <p class="top_txt1 service_txt1">
                                IT분야에서의 구축 경험을 토대로 고객사를 위한 
                                다양한 솔루션과 서비스를 제공합니다.
                            </p>
                        </div>
                    </div>
                    <div class="common-swiper_area sub-main">
                        <div class="inner_container">
                            <div class="common-swiper_tab swiper-container-initialized swiper-container-horizontal">
                                <ul class="swiper-wrapper service_swiper_wrapper">
                                	<c:forEach var="business" items="${businessList}" varStatus="status" >
                                		<li class="swiper-slide service_swiper_slide"><a href="#self">${business.businessTitle}</a></li>
                                	</c:forEach>
                                </ul>
                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                        </div>
                    </div><!-- // .common-swiper_area -->
                </div><!-- // .layout_section_outer -->
				<c:forEach var="business" items="${businessList}" varStatus="status" >
					<div class="layout_section_outer sub-main type08" data-js="anchor-target">
	                    <div class="inner_container">
	                        <div class="layout_head">
	                            <p class="top_txt1">
	                                ${business.businessTitle}
	                            </p>
	                        </div>
	                        <div class="layout_body">
	                            <div class="icon_item_box">
	                                <ul class="common-layout_3 is-vertical introduction_vertical">
	                                	<c:forEach var="businessPost" items="${businessPost}" varStatus="status">
	                                		<c:if test="${business.businessTitle == businessPost.business.businessTitle}">
			                                    <li class="items">
			                                        <a href="/user/introduction/introduction?businessPostNo=${businessPost.businessPostNo}" class="icon_item_inner">
			                                        	<div class="items_main_text">
			                                        		<i class="icon bi_ic bi_li_12" style="background-image: url(/resources/user/images/icon/${businessPost.businessPostIcon});"></i>
				                                            <p class="icon_item_title">${businessPost.businessPostTitle}</p>
				                                            <p class="icon_item_desc" style="white-space:pre-line;">${businessPost.businessPostContents}</p>
				                                            <i class="icon bi_1"></i>
				                                        </div>
			                                        </a>
			                                    </li>
			                                </c:if>
	                                    </c:forEach>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </div><!-- // .layout_section_outer -->				
				</c:forEach>
            </div><!-- // #contents -->
        </section><!-- // #container -->
    </div><!-- // #wrap -->
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />	
</body>
</html>
