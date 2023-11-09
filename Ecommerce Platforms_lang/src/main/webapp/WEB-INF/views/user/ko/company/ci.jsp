<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>회사소개 | CI | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="회사소개 | CI | 내담씨앤씨">
<meta property="og:title" content="회사소개 | CI | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 CI를 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 CI를 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 CI">
<meta property="og:url" content="https://ndcc.co.kr/user/company/ciList">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/company.css">
<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/user/common/header.jsp" />
    <div id="wrap" class="visual-center">
        <section id="container">
            <div id="contents" class="contents_top">
                <div class="sub_title_area">
                    <div class="inner_container">
                        <h2 class="sub_title">C I</h2>
                    </div>
                </div><!-- // .sub_title_area -->


                <div class="layout_section_outer intro tech type01 layout_symbol" data-js="anchor-target">
                    <div class="inner_container">
                        <div class="layout_body">
                            <div class="common-img_box naedam_main_img">
                                <img src="${pageContext.request.contextPath}/resources/user/images/ci_contents.png" class="nd_main" alt="">
                            </div>
                        </div>
                            <div class="img-txt_box">
	                            <div class="common-img_box naedam_main_img">
	                                <img src="${pageContext.request.contextPath}/resources/user/images/ci_footer.png" class="nd_reverse" alt="">
	                            </div>
                            </div>
                    </div>
                </div><!-- // .layout_section_outer -->

            </div><!-- // #contents -->
        </section><!-- // #container -->
    </div>
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>
