<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>사업소개 | 사업소개 | 육가공관리시스템 | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="사업소개 | 사업소개 | 육가공관리시스템 | 내담씨앤씨">
<meta property="og:title" content="사업소개 | 사업소개 | 육가공관리시스템 | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 육가공관리시스템을 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 육가공관리시스템을 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 육가공관리시스템, 내담C&C 육가공관리시스템, 내담 육가공관리시스템">
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
                        <h2 class="sub_title">Solution</h2>
                    </div>
                </div><!-- // .sub_title_area -->

                <div class="top_visual_area service_top_area type02">
                    <div class="inner_container aos-init aos-animate" data-aos="fade-up" data-aos-offset="0" data-aos-duration="300" data-aos-delay="150" data-aos-easing="linear">
                        <div class="top_txt_outer">
                            <div class="top_txt_area">
                                <span class="top_txt1">생산이력 및 축산물 이력제 대응을 전제로 한  </span>
                                <p class="top_txt2">육가공 관리 시스템</p>
                                <p class="top_txt3">
                                    주문 -> 생산계획-> 작업지시-> 작업-> 포장-> 출고-> 배송<br class="hide_768">
									Process에 대한 업무처리지원

                                </p>
                            </div>
                        </div>
                    </div>
                </div><!-- // .top_visual_area -->

                <div class="layout_section_outer biz_difference is-gray" data-js="anchor-target">
                    <div class="inner_container">
                        <div class="layout_body">
                            <ol class="difference_list">
                                <li>
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_meat_1.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
											스마트 팩토리 공정 자동화
                                        </p>
                                        <p class="difference_desc">
                                            생산공정 자동화로 개체이력관리 및 작업상황의 실시간 모니터링 구현
                                        </p>
                                    </div>
                                </li>
                                <li class="is-right">
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_meat_2.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            APP을 통한 <br>
                                            모바일 기반의 생산관리시스템
                                        </p>
                                        <p class="difference_desc">
                                            축산물이력시스템과 연계하여 개체이력관리의 투명성을 확보하여,
                                            작업과 출고, 배송의 전과정을 관리하여 제품 이상 발생시에 신속한 리콜 대응 가능
                                        </p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div><!-- // .biz_difference -->
            </div><!-- // #contents -->
        </section><!-- // #container -->
    </div><!-- // #wrap -->
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />	
</body>
</html>
