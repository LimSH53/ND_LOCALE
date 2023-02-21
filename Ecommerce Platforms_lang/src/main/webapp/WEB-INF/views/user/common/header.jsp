<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
window.onload=function(){
	$.ajax({
		url : "/user/comm/json/menuHeaderList" ,
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
</script>
      <!-- 공통 header -->
      <header id="header">
        <div class="inner">
          <h1 class="logo">
            <a href="${pageContext.request.contextPath}/user/dashBoard">
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
