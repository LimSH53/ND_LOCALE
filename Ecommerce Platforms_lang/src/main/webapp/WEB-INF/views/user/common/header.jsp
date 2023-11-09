<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
window.onload=function(){
	$.ajax({
		url : "/user/comm/json/menuHeaderList?locale=${cookie.locale.value}" ,
		method : "GET" ,
		dataType : "JSON" , 
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		success : function(data, status){
			var menu = data.list;
			var menu2 = data.list2;
			var display = '';
			var sideDisplay = '';
			for(var i = 0; i < menu.length; i++){
				if(menu[i].status != 'n'){
					display = "<li class>"
							+ " <a href='"+menu[i].url+"'>"+menu[i].title+"</a>"
							+ "  <section class='sub sub-menu"+(i+1)+"'>"
							+ "   <div class='sub-wrap'>"
							+ "   <ul class='sub-2depth'>"							
							for(var j = 0; j < data.list2.length; j++){
								if(data.list[i].code == data.list2[j].originNo && menu2[j].status != 'n'){
									display	+= "<li><a href='"+menu2[j].url+"'>"+menu2[j].title+"</a></li>"
											
								}
							}
					display	+= '  </ul>'
						    + '   </div>'
						    + '  </section>'
						    + '</li>';
					sideDisplay = "<li>"
								+ "	<a href='"+menu[i].url+"' class='btn_submenu'>"+menu[i].title+"</a>"
								+ "		<div class='sub-wrap'>"
								+ "			<ul class='sub-2depth'>"
								for(var j = 0; j < data.list2.length; j++){
									if(data.list[i].code == data.list2[j].originNo && menu2[j].status != 'n'){
										sideDisplay	+= "<li><a href='"+menu2[j].url+"'>"+menu2[j].title+"</a></li>"				
									}
								}
					sideDisplay += '		</ul>'
								+ '		</div>'
								+ '</li>';
					$('#menuHeader').append(display);
					$('#sideMenu').append(sideDisplay);
				}
			}
		}
	})	
}

function newPage(lang){	
	var link =  document.location.href;
	var newLink = link.split('?locale');
	
	var arr = link.split('?');
	
	if(arr[1] == 'locale=en' || arr[1] == 'locale=ko' || arr.length == 1){
		location.href = newLink[0] +"?locale=" + lang;
	} else {
		newLink = link.split('&locale');
		location.href = newLink[0] +"&locale=" + lang;
	}
	//쿠키
	document.cookie = 'locale=' + lang;
	
}
</script>
      <!-- 공통 header -->
      <header id="header">
        <div class="inner">
          <h1 class="logo">
            <a href="${pageContext.request.contextPath}/user/dashBoard?locale=${cookie.locale.value}">
              <img src="${pageContext.request.contextPath}/resources/admin/imgs/imageBoard/neadam_logo.png" alt="logo" class="basic_neadam" />
            </a>
          </h1>
          <nav class="gnb-wrap">
		      <ul id="menuHeader">

			  </ul>
		  </nav>

        <div id="sitemap" aria-hidden="true">
            <div class="sitemap-body">
              <ul id="sideMenu">
                                                                                                                                    
              </ul>
            </div>
        </div>
		<div class="header_util">
			<div class="btn_util_wrap">
                <span class="util_lang">
                    <a href="javascript:void(0)" class="btn_language">
                        <span class="blind">다국어 보기</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="33" viewBox="0 0 32 33">
                            <g fill="none" fill-rule="evenodd">
                                <path d="M0 .322h32v32.356H0z"></path>
                                <path d="m9.5 15.992-3.5.002c.168-4.614 3.78-8.671 8-9.607-2.722 1.9-4.353 5.906-4.5 9.605zm0 1.016L6 17.006c.168 4.614 3.78 8.671 8 9.607-2.722-1.9-4.353-5.906-4.5-9.605zm13 0 3.5-.002c-.168 4.614-3.78 8.671-8 9.607 2.722-1.9 4.353-5.906 4.5-9.605zm0-1.016 3.5.002c-.168-4.614-3.78-8.671-8-9.607 2.722 1.9 4.353 5.906 4.5 9.605zm-6 .002V6.39c2.788 1.659 4.819 5.575 4.996 9.605H16.5zm0 10.617v-9.605h5c-.19 3.82-2.257 7.801-5 9.605zm-1.005-9.605v9.605c-2.74-1.803-4.804-5.785-4.995-9.605h4.995zm.001-10.617v9.605H10.5c.177-4.03 2.208-7.946 4.996-9.605zM5 16.499c0 6.134 4.935 11.123 11 11.123 6.066 0 11-4.99 11-11.122 0-6.133-4.934-11.122-11-11.122-6.065 0-11 4.99-11 11.122z" fill="#000"></path>
                            </g>
                        </svg>
                    </a>
                    <div class="language_list">
                        <ul>
                            <li>
                            	<a href="#" onclick="newPage('ko')" class="active lang_ko">KOR</a>
                            </li>
                            <li>
                            	<a href="#" onclick="newPage('en')" class="lang_en">ENG</a>
                            </li>
                        </ul>
                    </div>
                </span>
            </div>
            <a href="javascript:;" class="btn_menu">
                <span class="blind">전체메뉴 열기</span>
                <i class="hamburger-ico">
                    <span class="line line1"></span>
                    <span class="line line2"></span>
                    <span class="line line3"></span>
                </i>
            </a>
        </div>        
      </header>
      <!--  공통 search -->
