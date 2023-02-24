<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>인재정보 | 인재상 | 내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="robots" content="index,nofollow">
<meta name="title" content="인재정보 | 인재상 | 내담씨앤씨">
<meta property="og:title" content="인재정보 | 인재상 | 내담씨앤씨">
<meta name="description" content="내담씨앤씨는 이러한 인재를 찾고 있습니다.">
<meta property="og:description" content="내담씨앤씨는 이러한 인재를 찾고 있습니다.">
<meta name="keywords" content="내담C&C, 내담씨앤씨, ndcnc, 내담, NDCNC, 내담씨앤씨 신입사원, 내담C&C 신입사원, 내담씨앤씨 인재상, 내담씨앤씨 인재, 내담C&C 인재상, 내담C&C 인재">
<meta property="og:url" content="https://ndcc.co.kr/user/highflier/qualifiedEmployee">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/user/css/employee.css">
<jsp:include page="/WEB-INF/views/user/common/script_css_js.jsp" />
</head>
<body>
<script type="text/javascript">

function over(num){
	let p = document.getElementById('p'+num);
	p.classList.remove("overP"+num);
}

function out(num){
	let p = document.getElementById('p'+num);
	p.classList.add("overP"+num);
}

</script>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<div id="wrap qulified">
        <section id="container">
            <div id="contents" class="contents_top employee_contents">
                <div class="sub_title_area">
                    <div class="inner_container">
                        <h2 class="sub_title">인재상</h2>
                    </div>
                </div><!-- // .sub_title_area -->
				<div class="top_visual_area recruit">
                    <div class="inner_container">
                        <div class="top_txt_outer">
                            <div class="top_txt_area txt_notice">
                                <p class="top_txt2">
                                	최고의 경쟁력을 가진 인재 육성
                                </p>
                                <p class="top_txt3">
                                    내담씨앤씨는 진취적이고 프로정신을 가진 인재를 소중히 여기는 기업입니다.<br />
                                    내담씨앤씨와 미래를 함께 할 당신의 지원을 기다립니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>                
            </div><!-- // #contents -->
                <div class="layout_section_outer layout_employee" data-js="anchor-target">
                    <div class="inner_container">
                        <div class="employee_layout_body">
                    		<div class="layout_section_outer recruit2">
                    			<div class="talent_section">
		                    		<div class="talentbox">
			                    		<p class="main_title">인재상</p>
		    							<p class="talent_txt">내담씨앤씨는 진취적이고 프로정신을 가진 인재를 소중히 여기는 기업입니다.</p>                		
		                    		</div>
			                            <div class="culture_card_area">
			                                <ul class="culture_card_list common-layout_2 box-type02 is-vertical">
			                                   <li class="bg-type01 employee_li_items" onmouseover="over(1)" onmouseout="out(1)">
			                                    	<div class="employee_box">
				                                        <a href="#self" class="employee_image_box qualify_1">
				                                        	<div class="employee_box_contents">
					                                            <p class="culture_card_title">탁월함</p>
					                                            <p class="sub_txt">Excellence</p>
					                                            <p class="sub_txt2 overP1" id="p1">최고와 더불어 최선을 추구하는 인재</p>
					                                            <i class="icon culture-icon-01"></i>
					                                              <span class="icon card_ui-more employee_icon_white"></span>
					                                        </div>
				                                        </a>
			                                        </div>
			                                    </li>
			                                   <li class="bg-type02 employee_li_items" onmouseover="over(2)" onmouseout="out(2)">
			                                    	<div class="employee_box">
				                                        <a href="#self" class="employee_image_box qualify_2">
					                                       <div class="employee_box_contents" id="innovation">
					                                        	<p class="culture_card_title">혁신</p>
					                                            <p class="sub_txt">Innovation</p>
					                                            <p class="sub_txt2 overP2" id="p2">끊임없이 혁신을 추구하는 인재끊임없이 혁신을 추구하는 인재</p>
					                                            <i class="icon culture-icon-02"></i>
					                                            <span class="icon card_ui-more employee_icon_white"></span>
				                                            </div>
				                                        </a>
				                                    </div>
			                                    </li>                                                              
			                                    <li class="bg-type03 employee_li_items" onmouseover="over(3)" onmouseout="out(3)">
				                                    <div class="employee_box">
				                                        <a href="#self" class="employee_image_box qualify_3">
					                                        <div class="employee_box_contents" id="fixation">
					                                            <p class="culture_card_title">통찰력</p>
					                                            <p class="sub_txt">Customer Fixation</p>
					                                            <p class="sub_txt2 overP3" id="p3">고객의 기대와 요구에 앞서 고민하고 실천하는 인재</p>
					                                            <i class="icon culture-icon-03"></i>
					                                            <span class="icon card_ui-more employee_icon_white"></span>
				                                            </div>
				                                        </a>
			                                        </div>
			                                    </li>
			                                   <li class="bg-type04 employee_li_items" onmouseover="over(4)" onmouseout="out(4)">
				                                    <div class="employee_box">
				                                        <a href="#self" class="employee_image_box qualify_4">
					                                        <div class="employee_box_contents" id="teamwork">
					                                            <p class="culture_card_title">협동심</p>
					                                            <p class="sub_txt">Teamwork</p>
					                                            <p class="sub_txt2 overP4" id="p4">협력을 통해 더 큰 성과를 창출하는 인재</p>
					                                            <i class="icon culture-icon-04"></i>
					                                            <span class="icon card_ui-more employee_icon_white"></span>
				                                            </div>
				                                        </a>
			                                        </div>
			                                    </li>
			                                   <li class="bg-type05 employee_li_items" onmouseover="over(5)" onmouseout="out(5)">
				                                    <div class="employee_box">
				                                        <a href="#self" class="employee_image_box qualify_5">
					                                        <div class="employee_box_contents" id="community">
					                                            <p class="culture_card_title">책임감</p>
					                                            <p class="sub_txt">Community</p>
					                                            <p class="sub_txt2 overP5" id="p5">기업의 역할과 책임을 이해하고 실천하는 인재</p>
					                                            <i class="icon culture-icon-04"></i>
					                                            <span class="icon card_ui-more employee_icon_white"></span>
				                                            </div>
				                                        </a>
			                                        </div>
			                                    </li>
			                                    <li class="bg-type06 employee_li_items" onmouseover="over(6)" onmouseout="out(6)">
				                                    <div class="employee_box">
				                                        <a href="#self" class="employee_image_box qualify_6">
				                                        	<div class="employee_box_contents" id="flexible">
					                                            <p class="culture_card_title">유연함</p>
					                                            <p class="sub_txt">Flexible</p>
					                                            <p class="sub_txt2 overP6" id="p6">유머와 재능을 살려 즐겁게 일하는 일터를 만드는 인재</p>
					                                            <i class="icon culture-icon-04"></i>
					                                            <span class="icon card_ui-more employee_icon_white"></span>
				                                            </div>
				                                        </a>
			                                        </div>
			                                    </li>
			                                </ul>
			                                </div>
		                                </div>
		                                <section class="contents_section">
											<div class="main_title">
												<span>기업 문화</span>
											</div>
											<p class="culture_txt">내담은 기업과 근로자가 발 맞추어 성장하는 기업으로 상생을 추구합니다.<p>
											<div class="company_culture">
			                                	<div class="culture_section">
			                                		<div class="company_culture_imgbox_left_01">
			                                		</div>
			                                		<div class="company_culture_box_right">
														<p class="culture_sub_title">내담은 신뢰와 존중을 사랑합니다. </p>
														<span class="culture_txt">
															<strong>내담은</strong> 의견 하나 하나를 소중히 여깁니다.<br><br>
															더 나은 결과를 위해 자유롭게 자신의 의견을 표현하며, <br>
															서로의 견해가 다르다 하더라도 상대방의 의견에 귀를 기울입니다. <br>
															또한 전달하는 형식에 있어서 포장보다는 내용에 집중합니다. <br>
															화려한 PPT보다는 핵심적인 한문장을 전달하기 위해 노력합니다.
														</span>
			                                		</div>
			                               		</div>
		                               		</div>
											<div class="company_culture2">
			                                	<div class="culture_section">
			                                		<div class="company_culture_imgbox_right_02">
			                                		</div>
			                                		<div class="company_culture_box_left">
														<p class="culture_sub_title">내담은 인재육성에 있어서 투자를 아끼지 않습니다. </p>
														<span class="culture_txt">
															구성원의 성장과 기업의 성장은 대동소이합니다.<br>
															 그러기에 <strong>내담은</strong> 교육 사업에 지원을 아끼지 않습니다.<br><br>
															재직자 교육, 연수원 교육, 직무향상교육 및 자격증 취득 등<br> 구성원의 성장을 지원합니다. <br>
															업무 중  필요한 장비가 있을 시, 회사에서 지원합니다.
														</span>
			                                		</div>
			                               		</div>
			                               	</div>
											<div class="company_culture3">
			                                	<div class="culture_section end">
			                                		<div class="company_culture_imgbox_left_03">
			                                		</div>
			                                		<div class="company_culture_box_right">
														<p class="culture_sub_title">내담은 구성원들에게 명확한 Process를 제시합니다. </p>
														<span class="culture_txt">
															구성원들의 시간과 노력은  무엇보다 큰 자산이며, <br>
															모든 Process에 집중하기에는 크나큰 집중력이 필요로 합니다. <br><br>
															<strong>내담은</strong> 구성원들의 시간을 소중히 여기기 위해 <br>
															 구성원들이 모든 과정에 집중하기 보다는 <br>
															 효율적으로 일을 할 수 있도록 명확한 프로세스를 제시합니다.
														</span>
			                                		</div>
			                               		</div>
			                                </div>
		                                </section>
	                        </div>
                        </div>
                    </div>
                </div>
        </section><!-- // #container -->
	</div>
</body>
<jsp:include page="/WEB-INF/views/user/common/footer.jsp" />
</html>