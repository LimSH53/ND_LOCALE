<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>파트너 | Partner Ship | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="파트너 | Partner Ship | 내담씨앤씨">
<meta property="og:title" content="파트너 | Partner Ship | 내담씨앤씨">
<meta name="description" content="내담씨앤씨의 파트너쉽을 소개합니다.">
<meta property="og:description" content="내담씨앤씨의 파트너쉽을 소개합니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 PartnerShip, 내담C&C PartnerShip, 내담 PartnerShip, 내담씨앤씨 파트너쉽, 내담C&C 파트너쉽, 내담 파트너쉽">
<meta property="og:url" content="https://ndcc.co.kr/user/introduction/partnerShipList">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/partnerShip.css">
<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/user/common/header.jsp" />
        <section id="container">
            <div id="contents" class="contents_top">
                <div class="sub_title_area">
                    <div class="inner_container">
                        <h2 class="sub_title">Partner Ship</h2>
                    </div>
                </div><!-- // .sub_title_area -->
                <div class="layout_section_outer esg_program-area type04 partner_layout">
                    <div class="inner_container">
                        <div class="layout_head">
                            <p class="top_txt1 partnerShip_top_txt1">
                                내담씨앤씨의 파트너십의 관계에 있어서
                                성장 및 역량 강화를 지원합니다.
                            </p>
                        </div>
                        <div class="layout_body is-margin2">
                            <div class="esg_program">
                                <ul class="esg_program_list">
                                    <li>
                                        <div class="esg_program_img">
                                        	<%-- <img src="${pageContext.request.contextPath}/resources/user/images/delete/img-thumbnail-01-pc@2x.png" alt=""> --%>
                                        	<img src="${pageContext.request.contextPath}/resources/user/images/delete/partner1_2.jpg" class="img_partnership">
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">내담씨앤씨</p>
                                            <ul class="common-txt-list">
                                                <li>유수의 대기업들과 파트너쉽을 맺고 운영하고 있습니다.</li>
                                                <li>내담씨앤씨는 최소 운영비로 지속적인 경영 혁신을 추진 가능하도록 지원합니다.</li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="is-right">
                                        <div class="esg_program_img">
                                        	<img src="${pageContext.request.contextPath}/resources/user/images/delete/partner1.jpg" class="img_partnership">
                                        	<%-- <img src="${pageContext.request.contextPath}/resources/user/images/delete/img-thumbnail-02-pc@2x.png" alt=""> --%>
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">기업의 이익 위하여</p>
                                            <ul class="common-txt-list">
                                                <li>내담씨앤씨는 정보시스템 운영 진단 및 추진과제의 Road map을 제공합니다.</li>
                                                <li>내담씨앤씨는 기업의 정보화 교육 및 컨설팅, Business Process 정립 및 보완을 지원합니다.</li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="esg_program_img">
                                            <img src="${pageContext.request.contextPath}/resources/user/images/delete/patner_promise.jpg" class="img_partnership">
                                            <%-- <img src="${pageContext.request.contextPath}/resources/user/images/delete/img-thumbnail-03-pc@2x.png" alt=""> --%>
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">내담 파트너에 대한 우리의 약속</p>
                                            <ul class="common-txt-list">
                                                <li>내담씨앤씨는 서비스를 통해 지속적인 경영 혁신을 추진할 수 있습니다.</li>
                                                <li>내담씨앤씨는 불필요한 IT Solution 투자를 최소화 합니다. </li>
                                                <li>내담씨앤씨는 IT Solution 운영부담을 최소화 합니다. </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="is-right">
                                        <div class="esg_program_img">
                                            <%-- <img src="${pageContext.request.contextPath}/resources/user/images/delete/img-thumbnail-04-pc@2x.png" alt=""> --%>
                                        	<img src="${pageContext.request.contextPath}/resources/user/images/delete/partner_goal.jpg" class="img_partnership">
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">내담의 목표</p>
                                            <ul class="common-txt-list">
                                                <li>
                                                	고객과 내담씨앤씨와 함께 성장함으로써<br>
                                                	IT 경쟁력을 확보하고 IT Solution의 낭비요소를 제거하는 것이<br>
                                                	내담씨앤씨의 궁극적인 목표입니다.
                                                </li>
                                                
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div><!-- // #contents -->
        </section><!-- // #container -->  
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
  </body>
</html>
