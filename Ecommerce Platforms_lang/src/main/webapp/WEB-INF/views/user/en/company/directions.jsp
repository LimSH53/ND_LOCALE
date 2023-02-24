<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>회사소개 | 오시는 길 | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="회사소개 | 오시는 길 | 내담씨앤씨">
<meta property="og:title" content="회사소개 | 오시는 길 | 내담씨앤씨">
<meta name="description" content="내담씨앤씨는 판교 본사, 서울 지사를 두고 있습니다.">
<meta property="og:description" content="내담씨앤씨는 판교 본사, 서울 지사를 두고 있습니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 본사, 내담씨앤씨본사, 내담C&C 본사, 내담C&C본사, 내담 본사, 내담본사, 내담씨앤씨 지사, 내담씨앤씨지사, 내담C&C 지사, 내담C&C지사, 내담 지사, 내담지사">
<meta property="og:url" content="https://ndcc.co.kr/user/company/directionsList">

<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/location.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<div id="wrap" class="history">
        <section id="container">
            <div id="contents" class="contents_top">
                <div class="sub_title_area">
                    <div class="inner_container">
                        <h2 class="sub_title">오시는 길</h2>
                    </div>
                </div><!-- // .sub_title_area -->

                <div class="layout_section_outer location_area type03">
                    <div class="inner_container">
                        <p class="common_txt-40">
                            내담씨앤씨는 판교 본사와 서울 지사를 두고 있습니다.
                        </p>

                        <ul class="common-layout_2 is-vertical location_list introduction_vertical">
                            <li class="items">
                                <div class="location_text">
	                                <h3 class="location_name">본사</h3>
	                                <p class="location_info">
	                                    경기도 성남시 분당구 판교역로231, S동 711호 (삼평동, H square) <br>
	                                    신분당선 판교역 1~4번 출구에서 버스로 3분 소요 <br>
	                                    TEL 031-712-8315 <br>
	                                    FAX 031-789-3545
	                                </p>
	                            </div>
                                <p class="location_img">
                                	<img src="${pageContext.request.contextPath}/resources/user/images/naedam_map_1.png" alt="">
                                </p>
                            </li>
                            <li class="items">
								<iframe class="location_btn" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3169.5178989113956!2d127.108642!3d37.401232!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca7f434577899%3A0xae71bdfacd6566b1!2z64K064u07JSo7JWk7JSo!5e0!3m2!1sko!2skr!4v1676277572347!5m2!1sko!2skr" 
										style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
								</iframe>
                            </li>
                            <li class="items">
                                <div class="location_text">
	                                <h3 class="location_name">서울 지사</h3>
	                                <p class="location_info">
	                                    서울시 금천구 벛꽃로 298 대륭포스트타워6차 1104호 (가산동 50-3) <br>
	                                    7호선 가산디지털단지역 2번 출구 연결 <br>
	                                    TEL 02-2083-5590 <br>
	                                    FAX 02-2083-5594
	                                </p>
	                            </div>
                                <p class="location_img">
                                	<img src="${pageContext.request.contextPath}/resources/user/images/naedam_map_2.jpg" alt="">
                                </p>
                            </li>
                            <li class="items">
								<iframe class="location_btn" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3166.127224953282!2d126.883779!3d37.481324!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9f210b865e0d%3A0xadfac5f743c8151a!2z64yA66Wt7Y-s7Iqk7Yq47YOA7JuMNuywqA!5e0!3m2!1sko!2skr!4v1676277774896!5m2!1sko!2skr" 
										style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
								</iframe>
                            </li>
                        </ul>
                    </div>
                </div>

            </div><!-- // #contents -->
      </section><!-- // #container -->
	</div>
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</body>
</html>
