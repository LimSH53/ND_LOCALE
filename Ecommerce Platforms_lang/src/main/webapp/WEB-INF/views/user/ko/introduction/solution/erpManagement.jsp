<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>내담씨앤씨</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
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
                                <span class="top_txt1">경영과 관련 지표 제공 경영정보시스템 </span>
                                <p class="top_txt2">생산관리 ERP</p>
                                <p class="top_txt3">
                                    효율적인 경영의사를 내릴 수 있게 도와 주며,  아울러 회계관리, 재고관리 및 영업관리 업무를 효율적으로 수행하는 지표 제공
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
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_erp_1.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            생산수율관리
                                        </p>
                                        <p class="difference_desc">
                                            생산 공정 선진화를 위한 의사결정의 기초 지표로써, 지육의 중량에서 최종 생산물의 중량에 대한 비율을 제시 하여 작업 공정상의 Loss를 줄일 수 있는 획기적인 경영지표
                                        </p>
                                    </div>
                                </li>
                                <li class="is-right">
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_erp_2.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            품목별 생산원가관리 
                                        </p>
                                        <p class="difference_desc">
                                            지육 구매비용 및 경비 항목을 이중배분율법에 의한 원가배분방식으로 품목별원가를 산출관리로 기초 원가 제공
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="difference_img aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <img src="${pageContext.request.contextPath}/resources/user/images/introduction/introduction_erp_3.jpg" alt="">
                                    </div>
                                    <div class="difference_box aos-init" data-aos="fade-up" data-aos-offset="0" data-aos-duration="250" data-aos-easing="linear">
                                        <p class="difference_title">
                                            재고자산관리
                                        </p>
                                        <p class="difference_desc">
                                           매일 최종생산물의 시세를 반영하여 원가 및 판매예정가 등의 경영정보를 제공합니다. <br><br>
                                            이를 통해 시세의 변동에 따른 출하시기 조절을 통해 수익을 극대화 할 수 있고,
                                            회계 및 재무자료로 활용함으로써 주요 경영의사 결정의 지표로 활용할 수 있습니다

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

<div>

<div class="layer_wrapper" id="pop_customer">
    <div class="layer_outer">
        <div class="layer_inner">
            <div class="layer_head">
                <p class="layer_title">문의하기</p>
            </div>
            <div class="layer_body">
                <div class="form_fieldset">
                    <div class="form_head">
                        <label for="form01" class="form-label">문의 유형</label>
                    </div>
                    <div class="form_body">
                        <div class="common-select_box">
                            <select name="" id="category" onchange="categoryType(this.value)">
                                <option value="">문의 유형을 선택해 주세요.</option>
                                <option value="서비스/기술문의">서비스/기술문의</option>
                                <option value="제휴제안">제휴제안</option>

                                <option value="기타문의">기타문의</option>
                            </select>
                            <p class="messg categorymsg" style="display:none;">문의 유형을 선택해 주세요.</p>
                        </div>
                    </div>
                </div>

                <div class="form_fieldset">
                    <div class="form_head">
                        <label for="form02" class="form-label">사업 구분</label>
                    </div>
                    <div class="form_body form-layout_2 full1">
                        <div class="items">
                            <div class="common-select_box">
                                <select name="business" id="business" onchange="businessType(this.value)">
                                    <option value="">서비스 또는 기술을 선택해 주세요.</option>
                                    <option value="1">스마트 제조·물류</option>
                                    <option value="2">미디어 컨버전스</option>
                                    <option value="3">디지털 마케팅</option>
                                    <option value="4">이커머스&amp;리테일</option>
                                    <option value="5">스마트 비즈니스</option>
                                    <option value="6">클라우드&amp;인프라</option>
                                    <option value="7">정보 보호</option>
                                    <option value="8">기술 연구</option>
                                    <option value="9">AI 비전 연구</option>
                                    <option value="10">AI 자연어 연구</option>
                                    <option value="11">AI 오디오 연구</option>
                                    <option value="12">데이터 사이언스</option>
                                    <option value="13">블록체인</option>

                                </select>
                                <p class="messg businessmsg" style="display:none;">서비스 또는 기술을 선택해 주세요. </p>
                            </div>
                        </div>
                        <div class="items">
                            <div class="common-select_box">
                                <select name="businessDetail" id="businessDetail" onchange="businessDType(this.value)"><option value="15">매장 통합관리 솔루션 (OneOrder)</option><option value="16">티켓 통합 솔루션 (OneOrder Ticket)</option><option value="17">결제 솔루션 (One PG)</option></select>
                                <p class="messg businessDetailmsg" style="display:none;">상세항목을 선택해 주세요. </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form_fieldset form-layout_2 full2">
                    <div class="items">
                        <div class="form_head">
                            <label for="form03" class="form-label">이름</label>
                        </div>
                        <div class="form_body">
                            <div class="textfd_wrap">
                                <input type="text" placeholder="이름을 입력해주세요." id="name" maxlength="30">
                                <p class="messg namemsg" style="display:none;">이름을 입력해 주세요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="items">
                        <div class="form_head">
                            <label for="form04" class="form-label">이메일</label>
                        </div>
                        <div class="form_body">
                            <div class="textfd_wrap">
                                <input type="email" placeholder="이메일을 입력해 주세요." id="email" maxlength="30">
                                <p class="messg emailmsg1" style="display:none;">이메일을 입력해 주세요.</p>
                                <p class="messg emailmsg2" style="display:none;">이메일 형식이 올바르지 않습니다.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form_fieldset form-layout_2 full2">
                    <div class="items">
                        <div class="form_head">
                            <label for="form05" class="form-label">연락처</label>
                        </div>
                        <div class="form_body">
                            <div class="textfd_wrap">
                                <input type="tel" placeholder="연락처를 입력해 주세요." id="phone" maxlength="20" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                <p class="messg phonemsg" style="display:none;">연락처를 입력해 주세요. </p>
                            </div>
                        </div>
                    </div>
                    <div class="items">
                        <div class="form_head">
                            <label for="form06" class="form-label">회사(소속)</label>
                        </div>
                        <div class="form_body">
                            <div class="textfd_wrap">
                                <input type="text" placeholder="회사명 또는 소속기관을 입력해 주세요." id="company" maxlength="30">
                                <p class="messg companymsg" style="display:none;">회사명 또는 소속기관을 입력해 주세요.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form_fieldset">
                    <div class="form_head">
                        <label for="form07" class="form-label">문의 제목</label>
                    </div>
                    <div class="form_body">
                        <div class="textfd_wrap">
                            <input type="text" placeholder="제목을 입력해 주세요." id="title" maxlength="200">
                            <p class="messg titlemsg" style="display:none;">제목을 입력해 주세요.</p>
                        </div>
                    </div>
                </div>

                <div class="form_fieldset">
                    <div class="form_head">
                        <label for="form08" class="form-label">문의 내용</label>
                    </div>
                    <div class="form_body">
                        <div class="textarea_wrap">
                            <textarea id="content" placeholder="문의 내용을 입력해 주세요." maxlength="2000"></textarea>
                            <p class="messg contentmsg" style="display:none;">문의 내용을 입력해 주세요. </p>
                        </div>
                    </div>
                </div>

                <div class="form_fieldset">
                    <div class="form_head">
                        <label for="form08" class="form-label">첨부 파일(선택)</label>
                    </div>
                    <div class="form_body">
                        <div class="common-file-upload type01">
                            <input type="file" id="file" name="file" class="iText" title="첨부파일">
                            <label for="file" class="common-btn is-gray"><span>파일선택</span></label>
                            <div class="file_viewer-box">
                                <p class="file_viewer-txt">첨부된 파일이 없습니다.</p>
                                <button type="button" class="icon val-del"><span class="hidden">첨부파일 삭제</span></button>
                            </div>
                        </div>
                        <p class="guide-txt">* 첨부파일은 최대 10MB까지 등록 가능하며, 파일 형식은 zip, pdf, hwp, ppt, pptx, doc, docx, xls, xlsx, jpg, jpeg, png, gif 만 가능합니다.</p>
                    </div>
                </div>

                <div class="form_fieldset">
                    <div class="provision_area" id="agreeChk">
                        <div class="scroll-wrapper provision_box" style="position: relative;"><div class="provision_box scroll-content scroll-scrollx_visible scroll-scrolly_visible" style="height: auto; margin-bottom: 0px; margin-right: 0px;">
                            개인정보 수집 및 이용 동의 (필수)
                            <br><br>
                            1. 처리목적 : 고객 문의에 대한 답변 및 현황 관리<br>
                            2. 처리항목 : 이름, 연락처, 이메일, 회사(소속)<br>
                            3. 보유기간 : 개인정보 수집 및 이용에 관한 동의 후 36개월간 보유
                            <br><br>
                            귀하는 개인정보 수집·이용에 동의하지 않으실 수 있습니다.<br>
                            그러나 동의하지 않을 경우 고객문의 등록이 불가합니다.
                            <br><br>
                            ※ CJ올리브네트웍스는 이용자가 만 14세 미만일 경우 개인정보를 수집하지 않습니다.
                        </div><div class="scroll-element scroll-x scroll-scrollx_visible scroll-scrolly_visible"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="left: 0px;"></div></div></div><div class="scroll-element scroll-y scroll-scrollx_visible scroll-scrolly_visible"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="top: 0px;"></div></div></div></div>

                        <p class="messg agreemsg" style="display:none;">개인정보 수집 및 이용에 동의해 주세요.</p>
                    </div>
                </div>

                <div class="input_wrapper">
                    <input type="checkbox" id="formChkGlobal">
                    <label for="formChkGlobal">개인정보 수집 및 이용에 동의합니다. </label>
                </div>

                <div class="btn_area center">
                    <a href="#self" class="common-btn" id="sendBtn_pop"><span>등록하기</span></a>
                </div>
            </div>
            <button type="button" class="icon pop-close" onclick="modalPop.close(this);">닫기</button>
        </div><!-- // .layer_inner -->
    </div><!-- // .layer_outer -->
</div><!-- // .layer_wrapper -->

</div>

    <div class="layer_wrapper is-movie" id="pop_movie">
    <div class="layer_outer">
        <div class="layer_inner">
            <div class="layer_body">
                <div class="movie_iframe_wrap">
                    <iframe src="" title="" class="movie_iframe"></iframe>
                </div>
            </div>
            <button type="button" class="icon pop-close" onclick="moviePopClose(this);">닫기</button>
        </div><!-- // .layer_inner -->
    </div><!-- // .layer_outer -->
</div><!-- // .layer_wrapper -->



<div style="left: -1000px; overflow: scroll; position: absolute; top: -1000px; border: none; box-sizing: content-box; height: 200px; margin: 0px; padding: 0px; width: 200px;"><div style="border: none; box-sizing: content-box; height: 200px; margin: 0px; padding: 0px; width: 200px;"></div></div></body>
  <jsp:include page="/WEB-INF/views/user/common/footer.jsp" />	
  </body>
</html>