<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>사업소개 | 사업소개 | Inno PLM | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="사업소개 | 사업소개 | Inno PLM | 내담씨앤씨">
<meta property="og:title" content="사업소개 | 사업소개 | Inno PLM | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 Inno PLM을 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 Inno PLM을 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 Inno PLM, 내담C&C Inno PLM, 내담 Inno PLM, 내담씨앤씨 제품 수명 주기 관리, 내담C&C 제품 수명 주기 관리, 내담 제품 수명 주기 관리">
<meta property="og:url" content="https://ndcc.co.kr/user/introduction/innoPlm">

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
                                <span class="top_txt1">초기 구상, 개발, 서비스, 폐기에 이르는 제품의 전체 여정을 관리하기 위한 전략적 프로세스의 소프트웨어</span>
                                <p class="top_txt2">제품 수명 주기 관리</p>
                                <p class="top_txt3">
                                    PLM은 제품의 탄생부터 폐기까지 제품과 관련된 모든 것의 관리함으로써<br class="hide_768">
                                    글로벌 공급망 기술의 솔루션을 제공합니다.
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
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_plm_1.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            Rule & Process 기반 시스템
                                        </p>
                                        <p class="difference_desc">
                                           선진 제조기업의 PLM 구축/운영의 노하우를 기반으로 솔루션 개발을 진행합니다. 
											고객사 제품개발절차와 솔루션에 내장된 Rule과 Process로 PLM 운영 기반을 정립하여,
											업무의 정확성과 일관성을 보장하기 위한 기준 정보를 표준화 시킵니다.
                                        </p>
                                    </div>
                                </li>
                                <li class="is-right">
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_plm_2.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                             Quick Implementation

                                        </p>
                                        <p class="difference_desc">
                                            JAVA 기반의 Open Framework와 시스템 아키텍처 및 Framework가 가지고 있는
											Template 기반의 Configuration을 통한 구축 기간을 단축하고,
											선진 제조기업의 시스템 구축의 운영 노하우를 활용하여 시행 착오를 최소화시키는데 목적이 있습니다.

                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_plm_3.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
											Q.C.C 기반 가시성(Visibility)
                                        </p>
                                        <p class="difference_desc">
                                            Milestone을 통한 과제진척도 및 이력 관리와 WBS 기반의 과제 관리, To Do List 기반 업무 수행과 같은 다양한 Dashboard 제공으로 신속한 의사 결정을 지원합니다
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
