<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>사업소개 | 사업소개 | Inno AMS | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="사업소개 | 사업소개 | Inno AMS | 내담씨앤씨">
<meta property="og:title" content="사업소개 | 사업소개 | Inno AMS | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 Inno AMS을 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 Inno AMS을 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 Inno AMS, 내담C&C Inno AMS, 내담 Inno AMS, 내담씨앤씨 설비자산관리시스템, 내담C&C 설비자산관리시스템, 내담 설비자산관리시스템">
<meta property="og:url" content="https://ndcc.co.kr/user/introduction/innoAms">

<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/user/common/header.jsp" />
   <div id="wrap" class="visual-center">
        <section id="container">
            <div id="contents" class="contents_top">
                <div class="sub_title_area">
                    <div class="inner_container">
                        <h2 class="sub_title">SOLUTION</h2>
                    </div>
                </div><!-- // .sub_title_area -->

                <div class="top_visual_area service_top_area type02">
                    <div class="inner_container aos-init aos-animate" data-aos="fade-up" data-aos-offset="0" data-aos-duration="300" data-aos-delay="150" data-aos-easing="linear">
                        <div class="top_txt_outer">
                            <div class="top_txt_area">
                                <span class="top_txt1">시스템에서 발생하는 데이터를 수집, 관리하여, 설비의 신뢰성을 높입니다.</span>
                                <p class="top_txt2">설비자산관리시스템(Inno AMS)</p>
                                <p class="top_txt3">
                                    시스템에서 발생하는 데이터를 수집하여, 설비의 신뢰성을 높입니다.<br class="hide_768">
                                    라이프사이클(Life Cycle)관리를 통해 최적화된 설비를 제공합니다.
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
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_ams_4.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                           생애 관리를 통한 설비의 최적화
                                        </p>
                                        <p class="difference_desc">
                                            설비 생산성을 생산현장의 관리로 국한된 것이 아닌 기업경영의 차원인 자산관리로 
											그 관리영역을 확장하여 설비의 최적 경영관리를 목표로 하며, 설비가 그 생애(Life Cycle)를 통해 
											최고의 효율성과 경제성 즉 수익을 창출하는 설비로서의 역할을 감당할 수 있도록 관리합니다
                                        </p>
                                    </div>
                                </li>
                                <li class="is-right">
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_ams_2.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            주요 기능
                                        </p>
                                        <p class="difference_desc">
                                            표준화 - 체계적인 설비자산 정보<br>
											계    획 - 예방작업 전략 수립<br>
											실    행 - 프로세스 전 구간에 가시성을 제공하는 부품관리<br>
											분    석 - 다양한 Analytics 정보 제공<br>
											환    경 - 공통 컴포넌트 및 다양한 기본 모듈 제공<br>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_ams_3.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            기대 효과
                                        </p>
                                        <p class="difference_desc">
                                            설비의 Availability 확보  - 설비점검 주기와 부품교체 주기 최적화를 통한 설비 성능 증대 <br>
											설비의 Reliability 확보 - 예방/예지 정비를 통한 고장 감소 <br>
											설비부품 Visibility 확보 - 정확한 설비부품 수요 예측 <br>
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
