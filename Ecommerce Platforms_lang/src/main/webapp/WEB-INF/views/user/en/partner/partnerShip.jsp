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
<meta property="og:url" content="http://ndcc.co.kr/user/introduction/partnerShipList">

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
                                Support growth and capability enhancement in the partnership relationship with Naedam C&C.
                            </p>
                        </div>
                        <div class="layout_body is-margin2">
                            <div class="esg_program">
                                <ul class="esg_program_list">
                                    <li>
                                        <div class="esg_program_img">
                                        	<img src="${pageContext.request.contextPath}/resources/user/images/partner/partnership/partnerShipList_1.jpg" class="img_partnership">
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">Naedam C&C</p>
                                            <ul class="common-txt-list">
                                                <li>Naedam C&C have partnerships with several major companies and operate with them.</li>
                                                <li>Naedam C&C supports continuous business innovation with minimal operating costs.</li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="is-right">
                                        <div class="esg_program_img">
                                        	<img src="${pageContext.request.contextPath}/resources/user/images/partner/partnership/partnerShipList_2.jpg" class="img_partnership">
                                        	<%-- <img src="${pageContext.request.contextPath}/resources/user/images/delete/img-thumbnail-02-pc@2x.png" alt=""> --%>
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">For the benefit of the enterprise</p>
                                            <ul class="common-txt-list">
                                                <li>Naedam C&C provides a road map for diagnosing and promoting tasks  information system operation.</li>
                                                <li>Naedam C&C supports the enterprise with IT education and consulting, as well as establishing and improving business processes.</li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="esg_program_img">
                                            <img src="${pageContext.request.contextPath}/resources/user/images/partner/partnership/partnerShipList_3.jpg" class="img_partnership">
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">Our promise to Naedam C&C partners</p>
                                            <ul class="common-txt-list">
                                                <li>Through our services, Naedam C&C can promote continuous management innovation.</li>
                                                <li>We minimize unnecessary IT solution investments </li>
                                                <li>and reduce the burden of IT solution operations. </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="is-right">
                                        <div class="esg_program_img">
                                        	<img src="${pageContext.request.contextPath}/resources/user/images/partner/partnership/partnerShipList_4.jpg" class="img_partnership">
                                        </div>
                                        <div class="esg_program_desc">
                                            <p class="esg_program_txt">Naedam C&C's goal</p>
                                            <ul class="common-txt-list">
                                                <li>
                                                	Our ultimate goal at Naedam C&C<br>
                                                	is to secure IT competitiveness and eliminate waste factors <br>
                                                	in IT solutions by growing together with our clients.
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
