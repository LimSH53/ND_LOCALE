<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param value="게시판 관리" name="title"/>
</jsp:include>

<style>
	.table {
	    margin-bottom : 0px;
	}
	body.modal-open {
	    overflow: hidden;
	}
	.modal-body {
	    overflow: open;
	}
</style>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>
<div class="content-wrapper" style="min-height: 868px;">
	<section class="content-header">
	    <h1>
		    메뉴 관리
		    <small>menu list</small>
	    </h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="#">메뉴 관리</a></li>
	        <li class="active">메뉴 관리</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
            	    <div class="btn-group" style="margin: 12px 5px 5px 12px;">
    					<button type="button" id="locale_ko" onclick="location.href='${pageContext.request.contextPath}/admin/menu/menu?locale=ko'" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>   
    					<button type="button" id="locale_en" onclick="location.href='${pageContext.request.contextPath}/admin/menu/menu?locale=en'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>                    
    				</div>	
	                <div class="box-body">
		                <div class="col-xs-3" style="padding:0 5px 0 0;">
		                	<iframe name="tree" id="iframe_tree" src="${pageContext.request.contextPath}/admin/menu/tree?locale=${locale}" width="100%" scrolling="auto" frameborder="1" height="769"></iframe>
		                </div>
		                <div class="col-xs-9" style="padding:0 5px 0 0;">
		                	<iframe name="list" id="iframe_list" src="${pageContext.request.contextPath}/admin/menu/menuList?locale=${locale}" width="100%" scrolling="auto" frameborder="1" height="769"></iframe>
		                </div>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section><!-- /.content -->
	
	<!-- 리비젼 보기 부터 -->
	<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    	<div class="modal-dialog" style="width:90%;">
        	<div class="modal-content">
            	<form name="form_register" method="post" onsubmit="return false;" action="/admin/menu/menuProcess?${_csrf.parameterName}=${_csrf.token}">
		            <input type="hidden" name="mode" value="insert">
		            <input type="hidden" name="part" value="menu">
		            <input type="hidden" name="originNo" id="originCode">
		            <input type="hidden" name="ord" id="ordCode">
		            <input type="hidden" name="locale" value="${locale}">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">메뉴 등록</h4>
            		</div>
            		<div class="modal-body">
            			<div class="row" style="margin:0">
                			<div class="col-xs-4">
                				<span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메뉴 등록</p></h4></span>
                				<span style="float:left; padding:5px 0 0 10px;"><button type="button" onclick="onclickManual();" class="btn btn-warning btn-xs"><i class="fa fa-fw fa-question-circle"></i> 프로그램 연동 방법</button></span>
                			</div>
                			<div class="col-xs-8" style="padding:0">
                				<div class="btn-group pull-right">
      								<button type="button" id="locale_ko" onclick="setLocale('ko')" class="btn btn-primary">
      									<i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>      
      								<button type="button" id="locale_en" onclick="setLocale('en')" class="btn btn-default">
      									<i class="fa fa-globe" aria-hidden="true"></i> ENG</button>      
      								<button type="button" id="locale_zh" onclick="setLocale('zh')" class="btn btn-default">
      									<i class="fa fa-globe" aria-hidden="true"></i> 中国</button>      
      								<button type="button" id="locale_vn" onclick="setLocale('vn')" class="btn btn-default">
      									<i class="fa fa-globe" aria-hidden="true"></i> Tiếng việt</button>   									                
      							</div>
                			</div>
            			</div>
						<table class="table table-bordered">
				            <tbody>
					            <tr>
					                <td class="menu">메뉴명</td>
					                <td align="left" style="width:100px;"><input type="text" name="title" class="form-control input-sm"></td>
					                <td class="menu">url &nbsp;&nbsp;<input type="checkbox" name="is_outer_link" onclick="checkOuterLink()" value="y"> <small>외부링크</small></td>
					                <td align="left">
					                	<select id="displayOuterLink" name="target" class="form-control input-sm" style="width: 25%; padding: 0px; margin-right: 5px; float: left; display: none;">
					                		<option value="_blank">새창</option>
					                		<option value="_self">현재창</option>
					                	</select>
					                	<input type="text" name="url" class="form-control input-sm" style="width:70%; float:left;">
					                </td>
					                <td class="menu">상태</td>
									<td>
					                	<select name="status" class="form-control input-sm" style="width:100px;">
					      					<option value="y">보임</option>      
					      					<option value="n">숨김</option>                
					      				</select>
					                </td>			                
					                <td class="menu">메타 태그</td>
					                <td align="left"><input type="checkbox" name="is_meta" onclick="checkMeta()" value="y"> 사용</td>
					            </tr>
					            <tr id="displayMeta" style="display: none;">
					                <td class="menu">메타 태그</td>
					                <td align="left" colspan="9">
					                	<span style="float:left; padding:5px 5px 0 0;">title </span>
					                	<span style="float:left;"><input type="text" name="meta_title" class="form-control input-sm" style="width:500px;"></span>
					                	<span style="float:left; padding:5px 5px 0 10px;">description </span>
					                	<span style="float:left;"><input type="text" name="meta_description" class="form-control input-sm" style="width:500px;"></span>
					                </td>
					            </tr>
					            <tr>
					                <td align="left" colspan="10" style="padding:0">
					                	<textarea name="content" id="content-editor" onfocus="javascript:this.value=''" rows="10" cols="80"  style="visibility: hidden; display: none; "></textarea>
					                </td>
					            </tr>
				            </tbody>
						</table>
					</div><!-- /.modal-body -->
		            <div class="modal-footer">
		            	<button type="button" id="displayButton" onclick="register();" class="btn btn-primary">저장하기</button>
		            </div><!-- /.modal-footer -->
            	</form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade -->

    <!-- update모달 -->
	<div class="modal fade" id="modalContent2" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="display: none;">
	    <div class="modal-dialog" style="width:90%;">
	        <div class="modal-content">
	            <form name="form_register2" method="post" onsubmit="return false;" action="/admin/menu/menuProcess?${_csrf.parameterName}=${_csrf.token}">
		            <input type="hidden" name="mode" value="update">
		            <input type="hidden" name="part" value="menu">
		            <input type="hidden" name="code" id="getCode">
		            <input type="hidden" name="locale" value="${locale}">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">메뉴 등록</h4>
		            </div>
		            <div class="modal-body">
			            <div class="row" style="margin:0">
			                <div class="col-xs-4">
			                	<span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메뉴 등록</p></h4></span>
			                	<span style="float:left; padding:5px 0 0 10px;"><button type="button" onclick="onclickManual();" class="btn btn-warning btn-xs"><i class="fa fa-fw fa-question-circle"></i> 프로그램 연동 방법</button></span>
			                </div>
			                <div class="col-xs-8" style="padding:0">
				                <div class="btn-group pull-right">
				      				<button type="button" id="locale_ko" onclick="setLocale('ko')" class="btn btn-primary">
				      					<i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>      
				      				<button type="button" id="locale_en" onclick="setLocale('en')" class="btn btn-default">
				      					<i class="fa fa-globe" aria-hidden="true"></i> ENG</button>      
				      				<button type="button" id="locale_zh" onclick="setLocale('zh')" class="btn btn-default">
				      					<i class="fa fa-globe" aria-hidden="true"></i> 中国</button>      
				      				<button type="button" id="locale_vn" onclick="setLocale('vn')" class="btn btn-default">
				      					<i class="fa fa-globe" aria-hidden="true"></i> Tiếng việt</button>
									<select class="form-select" name="outerMapping" aria-label="Default select example">
									  <option selected>게시판 맵핑</option>
									  <c:forEach var="board" items="${board}">
										  <option value="${board.boardNo}">${board.boardTitle}</option>
									  </c:forEach>
									</select> 				      					                
				      			</div>
				            </div>
			            </div>
			            <table class="table table-bordered">
				            <tbody>
				            	<tr>
					                <td class="menu">메뉴명</td>
					                <td align="left"><input type="text" name="title" id="getTitle" class="form-control input-sm"></td>
					                <td class="menu">url &nbsp;&nbsp;<input type="checkbox" name="is_outer_link" id="getIs_outer_link" onclick="checkOuterLink2()"> <small>외부링크</small></td>
					                <td align="left">
						                <select id="displayOuterLink2" name="target" class="form-control input-sm" style="width: 25%; padding: 0px; margin-right: 5px; float: left; display: none;">
							                <option value="_blank">새창</option>
							                <option value="_self">현재창</option>
						                </select>
					                	<input type="text" name="url" id="getUrl" class="form-control input-sm" style="width:70%; float:left;">
					                </td>
					                <td class="menu">상태</td>
									<td>
						                <select name="status" id="getStatus" class="form-control input-sm" style="width:100px;">
						      				<option value="y">보임</option>      
						      				<option value="n">숨김</option>                
						      			</select>
					                </td>
					                <td class="menu">메타 태그</td>
					                <td align="left"><input type="checkbox" name="is_meta" id="getIs_meta" onclick="checkMeta()" value="y"> 사용</td>
					            </tr>
					            <tr id="displayMeta" style="display: none;">
					                <td class="menu">메타 태그</td>
					                <td align="left" colspan="9">
					                	<span style="float:left; padding:5px 5px 0 0;">title </span>
					                	<span style="float:left;"><input type="text" name="meta_title" id="getMeta_title" class="form-control input-sm" style="width:500px;"></span>
					                	<span style="float:left; padding:5px 5px 0 10px;">description </span>
					                	<span style="float:left;"><input type="text" name="meta_description" id="getMeta_description" class="form-control input-sm" style="width:500px;"></span>
					                </td>
					            </tr>
					            <tr>
					                <td align="left" colspan="10" style="padding:0">
					                	<textarea name="content" id="content-editor2" onfocus="javascript:this.value=''" rows="10" cols="80" style="visibility: hidden; display: none; "></textarea>
					                </td>
					            </tr>
				            </tbody>
			            </table>
		            </div><!-- /.modal-body -->
		            <div class="modal-footer">
		            	<button type="button" id="displayButton2" onclick="register2();" class="btn btn-primary">저장하기</button>
		            	<button type="button" class="btn btn-success">미리보기</button>
		            </div><!-- /.modal-footer -->
	            </form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade --> 
    
	
	<div class="modal fade" id="modalRevision" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="display: none;">
	    <div class="modal-dialog" style="width:500px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title">리비젼 내역</h4>
	            </div>
	            <div class="modal-body">
	            	<span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 
	            	<span id="revisionTitle" style="padding-top:10px;">메인페이지</span></p></h4></span>
	            	<span id="htmlTag">
		            	<table class="table table-bordered">
		            		<tbody></tbody>
		            	</table>
	            	</span>
	            </div>
	            <div class="modal-footer">
	            	<button type="button" onclick="closeRevision();" class="btn btn-primary">닫기</button>&nbsp;&nbsp;&nbsp;
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade -->
	
	<div class="modal fade" id="modalCopyMenu" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:400px;">
	        <div class="modal-content">
	            <form name="formCopyMenu" method="post" action="?tpf=admin/menu/process">
		            <input type="hidden" name="mode" id="mode" value="copyMenu">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabelPortfolio">메뉴 복사</h4>
		            </div>
		            <div class="modal-body">
			            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메뉴 <span id="board_sub_title">복사</span></p></h4>
			            <table class="table table-bordered">
				            <tbody>
					            <tr>
					                <td class="menu">언어</td>
					                <td align="left">
						                <select name="menu_locale" id="menu_locale" class="form-control input-sm">
						                    <option value="">선택</option>
						      				<option value="en">ENG</option>      
						      				<option value="zh">中国</option>      
						      				<option value="vn">Tiếng việt</option>                
						      			</select>
					                </td>
					            </tr>
				            </tbody>
			            </table>
	            	</div><!-- /.modal-body -->
	            	<div class="modal-footer">
	            		<button type="button" onclick="registerCopyMenu()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
	            	</div><!-- /.modal-footer -->
	            </form>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal fade -->
</div><!-- /.content-wrapper -->

<script>
       var is_revision = false;
       var revision_code;
       
       if (window.CKEDITOR) {  // CKEDITOR loading 여부 체크 (Web 버젼에서만 사용)
           var objEditor = CKEDITOR.replace('content-editor', {
               height: 800,
               extraPlugins : 'tableresize',
               extraPlugins: 'codemirror',
               removeButtons: 'Source',
               filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
               filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
               contentsCss : ['/html/css/common.css','/html/css/style.css']
           });
       
           CKEDITOR.on('dialogDefinition', function (ev) {
               var dialogName = ev.data.name;
               var dialog = ev.data.definition.dialog;
               var dialogDefinition = ev.data.definition;

               if (dialogName == 'image') {
                   dialog.on('show', function (obj) {
                       this.selectPage('Upload'); //업로드텝으로 시작
                   });
                   dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                   dialogDefinition.removeContents('Link'); // 링크탭 제거
               }
           });
           
           CKEDITOR.config.allowedContent = true;
           CKEDITOR.config.startupMode = 'source';
           CKEDITOR.config.codemirror = {
               // Set this to the theme you wish to use (codemirror themes)
               theme: '3024-night',
               // Whether or not to automatically format code should be done when the editor is loaded
               autoFormatOnStart: false
           };
       }
       
       if (window.CKEDITOR) {  // CKEDITOR loading 여부 체크 (Web 버젼에서만 사용)
           var objEditor2 = CKEDITOR.replace('content-editor2', {
               height: 800,
               extraPlugins : 'tableresize',
               extraPlugins: 'codemirror',
               removeButtons: 'Source',
               filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
               filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
               contentsCss : ['/html/css/common.css','/html/css/style.css']
           });
       
           CKEDITOR.on('dialogDefinition', function (ev) {
               var dialogName = ev.data.name;
               var dialog = ev.data.definition.dialog;
               var dialogDefinition = ev.data.definition;

               if (dialogName == 'image') {
                   dialog.on('show', function (obj) {
                       this.selectPage('Upload'); //업로드텝으로 시작
                   });
                   dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                   dialogDefinition.removeContents('Link'); // 링크탭 제거
               }
           });
           
           CKEDITOR.config.allowedContent = true;
           CKEDITOR.config.startupMode = 'source';
           CKEDITOR.config.codemirror = {
               // Set this to the theme you wish to use (codemirror themes)
               theme: '3024-night',
               // Whether or not to automatically format code should be done when the editor is loaded
               autoFormatOnStart: false
           };
       } 
       
       function checkOuterLink() {
           if($('[name=is_outer_link]').is(':checked')) $('#displayOuterLink').show();
           else $('#displayOuterLink').hide();
       }
       
       function checkOuterLink2() {
           if($('[id=getIs_outer_link]').is(':checked')) $('#displayOuterLink2').show();
           else $('#displayOuterLink2').hide();
       } 
       
       function checkMeta() {
           if($('[name=is_meta]').is(':checked')) $('#displayMeta').show();
           else $('#displayMeta').hide();
       }
       
       function setLocale(locale) {
           $('button[id^=locale_]').attr('class', 'btn btn-default');
           $('#locale_'+locale).attr('class', 'btn btn-primary');
           $('[name=locale]').val(locale);
           if(is_revision == false) setData($('[name=code]').val());
           else infoRevision(revision_code);

           console.log(':'+is_revision);
           console.log(':'+$('[name=code]').val()+':'+revision_code);
       }
       
       function register() {
           if(form_register.title.value == '') { 
           	alert('메뉴명이 입력되지 않았습니다.');
           	return;
           }else if(form_register.url.value == ''){
           	alert('url이 입력되지 않았습니다.');
           	return;
           }
           form_register.target = 'iframe_process';
           form_register.submit();
           alert("등록 완료")
           //$('#iframe_tree').attr('src', '${pageContext.request.contextPath}/admin/menu/tree');
		//$('#iframe_list').attr('src', '${pageContext.request.contextPath}/admin/menu/menuList');
           //location.reload();
       }
       
       function register2() {
           if(form_register2.title.value == '') { 
           	alert('메뉴명이 입력되지 않았습니다.');
           	return;
           }else if(form_register2.url.value == ''){
           	alert('url이 입력되지 않았습니다.');
           	return;
           }
           form_register2.target = 'iframe_process';
           form_register2.submit();
           alert("메뉴가 수정되었습니다.")
		$('#iframe_tree').attr('src', '${pageContext.request.contextPath}/admin/menu/tree');
		$('#iframe_list').attr('src', '${pageContext.request.contextPath}/admin/menu/menuList');            
           //location.reload();
       }  
       
       function onclickManual() {
           $('#modalManual').modal({backdrop:'static', show:true});
       }
       
       function closeManual() {
           $('#modalManual').modal('hide');
       }
       
       function printData(json_data) {
       	/*
           if (json_data.action_type != undefined && json_data.action_type == 'delete') {  // 삭제 -> 복구
               parent.$('[name=mode]').val('repairMenu');
               parent.form_register.mode.value = 'repairMenu';
               parent.$('[name=code]').val(revision_code);
               $('#displayButton').html('복구하기');
           }
           else {                                                                          // 수정 or 리비젼 보기
               parent.form_register.mode.value = 'updateMenu';
               parent.$('[name=code]').val(json_data.code);
               $('#displayButton').html('저장하기');
           }*/
           parent.$('[name=title]').val(json_data.title);
           parent.$('[id=getCode]').val(json_data.code);
           parent.$('[name=url]').val(json_data.url);
           
           if (json_data.code == 1) parent.$('[name=url]').prop('readonly', true); // 메인 페이지는 url 변경 불가
           else  parent.$('[name=url]').prop('readonly', false);
           if(json_data.is_outer_link == 'y') {
           	parent.$('[id=getIs_outer_link]').prop('checked', true);
               parent.$('#displayOuterLink2').show();
               
           }
           else {
           	parent.$('[id=getIs_outer_link]').prop('checked', false);
               parent.$('#displayOuterLink2').hide();
           }
           if (json_data.is_outer_link == 'n') parent.$('[name=is_outer_link]').prop('checked', false);
           else parent.$('[name=is_outer_link]').prop('checked', false);
           parent.$('[name=target]').val(json_data.target);
           parent.$('[name=meta_title]').val(json_data.meta_title);
           parent.$('[name=meta_description]').val(json_data.meta_description);
           if(json_data.is_meta == 'y') {
               parent.$('[name=is_meta]').prop('checked', true);
               parent.$('#displayMeta').show();
           }
           else {
               parent.$('[name=is_meta]').prop('checked', false);
               parent.$('#displayMeta').hide();
           }
           parent.$('[name=status]').val(json_data.status);
           
           if (json_data.content == null) json_data.content = '';
           // 미리보기 링크 수정
           parent.$('#previewLink').attr('href',json_data.full_url);

           setTimeout(function(){
               parent.objEditor.setData('\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n');
               parent.objEditor2.setData('\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n');
           }, 200);
           setTimeout(function(){
               parent.objEditor.setData(json_data.content);
               parent.objEditor2.setData(json_data.content);
           }, 200);
       }
       
       function setData(code) {
           // 정보
           $.ajax({
               url:'/admin/menu/json/getMenu?${_csrf.parameterName}=${_csrf.token}',
               type:'post',
               dataType:'json',
               data:{
                   method : 'menu.getMenu',
                   locale : parent.$('[name=locale]').val(),
                   code : code
               },
               success:function(data, textStatus, jqXHR){
                   var json_data = data;
                   printData(json_data);
                   console.log(json_data);
               },
               error:function(jqXHR, textStatus, errorThrown){
                   console.log(textStatus);
                   // $('#content').val(errorThrown);
               }
           });
       }
       
       function closeRevision() {
           $('#modalRevision').modal('hide');
       }
       
       function infoRevision(code, revisionCode) {
           $('#modalRevision').modal('hide');
           if(revisionCode == 2){
           	$('#displayButton2').html('복구하기');
           	$('#displayButton2').attr("onclick", "fncRestore("+code+")");
           	$('#displayButton2').attr("id", "restoreButton");
           }
           parent.$('#modalContent2').modal({backdrop:'static', show:true});
           // 리비젼 정보 보여주기
           $.ajax({
           	url:'/admin/menu/json/getMenu?${_csrf.parameterName}=${_csrf.token}',
               type:'post',
               dataType:'json',
               data:{
                   method : 'menu.getMenu',
                   locale : parent.$('[name=locale]').val(),
                   code : code
               },
               success:function(data, textStatus, jqXHR){
                   var json_data = data;
                   console.log('--------------------------');
                   console.log(json_data);
                   json_data.code = json_data.menu_code;
                   is_revision = true;
                   revision_code = code;
                   printData(json_data);
               },
               error:function(jqXHR, textStatus, errorThrown){
                   console.log(textStatus);
                   // $('#content').val(errorThrown);
               }
           });
       }
       
       function deleteRevision(code) {
       	
       	var menuArr = new Array();
       	var mode = "delete";
       	var part = "revision";
       	menuArr.push(code);
       	
   		if(!confirm("해당 리비젼 정보를 정말 삭제하시겠습니까?")){
   			alert("취소 되었습니다.");
   			return;
   		}else{
       		$.ajax({
    			 	 url : "/admin/menu/json/menuProcess?${_csrf.parameterName}=${_csrf.token}",
   	  		  	 type : "POST",
     		  	 	 data : { 
     		  	 		menuArr : menuArr,
     		  	 		mode,
     		  	 		part
     		  	 	 },
       			 success : function(result){
       				alert("해당 메뉴가 삭제 되었습니다.")
       				$("tr[id='revisionDelete"+code+"']").remove();
       			 }
       			
       		})
       		}
           
       }
       
       function fncRestore(code){
       	var menuArr = new Array();
       	var mode = "update";
       	var part = "revision";
       	menuArr.push(code);
       	
   		$.ajax({
		 	 url : "/admin/menu/json/menuProcess?${_csrf.parameterName}=${_csrf.token}",
  		  	 type : "POST",
		  	 	 data : { 
		  	 		menuArr : menuArr,
		  	 		mode,
		  	 		part
		  	 	 },
   			success : function(result){
   				alert("메뉴가 복구 되었습니다.")
   				$('#modalContent2').modal('hide');
   				$('#restoreButton').attr("id", "displayButton2");
   				$('#displayButton2').html('저장하기');
           		$('#displayButton2').attr("onclick", "register2()");
   				$('#iframe_tree').attr('src', '${pageContext.request.contextPath}/admin/menu/tree');
   				$('#iframe_list').attr('src', '${pageContext.request.contextPath}/admin/menu/menuList');
   			}
   			
   		})
       }
       
       function checkHeight() {
           var height = $(window).height() - 200;
           document.getElementById('iframe_tree').height = height;
           document.getElementById('iframe_list').height = height;
       }
       
       checkHeight();
       
       function registerCopyMenu() {
           if(formCopyMenu.menu_locale.value == '') { alert('언어가 선택되지 않았습니다.'); formCopyMenu.menu_locale.focus(); return false;}
           formCopyMenu.target = 'iframe_process';
           formCopyMenu.submit();
       }
</script>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"></jsp:include>

</body></html>
