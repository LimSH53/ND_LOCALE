<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>사업소개 | 사업소개 | MES | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="사업소개 | 사업소개 | MES | 내담씨앤씨">
<meta property="og:title" content="사업소개 | 사업소개 | MES | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 MES을 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 MES을 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 MES, 내담C&C MES, 내담 MES, 내담씨앤씨 제조 실행 시스템, 내담C&C 제조 실행 시스템, 내담 제조 실행 시스템">
<meta property="og:url" content="https://ndcc.co.kr/user/introduction/mes">

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
                                <span class="top_txt1">제조업체의 공장 관리를 위한 개념이자 구현 도구</span>
                                <p class="top_txt2">제조 실행 시스템 (MES)</p>
                                <p class="top_txt3">
                                    주문에서 제품 생산에 이르기까지 관련 정보를 제공해 가장 효과적으로 활용할 수 있도록 하며, 현장의 정확한 데이터를 사용함으로써<br class="hide_768"> 
                                    데이터들이 발생할 때마다 현장의 활동을 관리, 착수, 응답, 보고하는 솔루션을 제공합니다.
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
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_mes_1.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                           실시간 생산 관리 및 분석

                                        </p>
                                        <p class="difference_desc">
                                            내담은 수동 생산공정관리 및 원자재 수기관리 등 비효율적인 관리로 발생하는 
											문제를 해소하고자 하는 고객의 요구사항을 해결하기 위해 생산공정의 효율성을 높인 MES를 제공합니다.<br><br>
											내담이 제공하는 솔루션의 MES 서버 및 DB 서버는
											높은 가용성을 위해  365일 24시간 무정지 시스템으로
											구현 합니다.
											
                                        </p>
                                    </div>
                                </li>
                                <li class="is-right">
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_mes_2.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            품질관리 시스템 구축
                                        </p>
                                        <p class="difference_desc">
											생산품의 품질을 도출하고 유형을 분석하여 공정 별, 설비 별, 불량 유형 별 통계분석 결과를 제공합니다.
											불량 발생 시 LOT 추적을 통한 문제의 요인을 탐색 합니다.
											<br><br>
											시스템에 의한 생산 관리 및 집계를 통해 인원을 효율적 관리가 가능하며,
											공장 내 정보 표준화를 통해 공장 운영 효율 증가와 제품 불량률 감소에 효과적입니다. 
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_mes_3.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            통합관리를 통한 생산성 개선
                                        </p>
                                        <p class="difference_desc">
											제조현장과 주변 시스템의 통합, 최적화한 생산 활동 지원,생산현장의 실시간(real time) 정보통합 등 통합정보의 활용으로 최적의 의사결정을 지원하고 생산활동을 지원 합니다. <br>
											
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
