<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	p {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	element.style {
	    heigth: 150px;
	    overflow-y: scroll;
	}	
</style>

<script>
	
	function fncUpdateBusinessPost(){
		var businessContentsTitle = $("[id=businessContentsTitle2]").val();
		var businessContentsContent = $('[id=businessContentsContent2]').val();

		if(businessContentsTitle == null || businessContentsTitle == ''){
			alert("제목을 입력하셔야 합니다.");
			return;
		}
		if(businessContentsContent == null || businessContentsContent == ''){
			alert("내용을 입력하셔야 합니다.");
			return;
		}
		alert("수정 되었습니다.");
		$("form[name='getBusinessPostForm']").attr("method", "POST").attr("action", "/admin/business/businessContentsProcess?${_csrf.parameterName}=${_csrf.token}").submit();
	}

	$(function(){
		$("button[name='x']").on("click", function(){
			$("span[name='board_sub_title']").text('수정');
			$("button[name='display_reply']").css("display", "")
			$("span[name='thumbnailSpan']").remove();
			$("span[name='getFile']").remove();
		})
		
		$("#modalContent4").on("hidden.bs.modal", function(){
			$("span[name='board_sub_title']").text('수정');
			$("button[name='display_reply']").css("display", "")
			$("span[name='thumbnailSpan']").remove();
			$("span[name='getFile']").remove();
		})
		
		$(".getBusinessContents").on("click", function(){
			var businessContentsNo = $(this).val();

			$.ajax({
				url : "/admin/business/json/getBusinessContents/"+businessContentsNo,
				method : "GET",
				dataType : "JSON",	
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					console.log(JSONData)
					$("[id=businessContentsTitle2]").val(JSONData.businessContentsTitle);
					$('[id=businessContentsContent2]').text(JSONData.businessContentsContent);
					$(".businessContentsNo").val(JSONData.businessContentsNo);
					
					if(JSONData.image != null){
						var image = "'${pageContext.request.contextPath}/resources/user/images/introduction/"+JSONData.image+"'"
						if(JSONData.image != null && JSONData.image != ''){
							var	display = '<span id="display_thumbnail" name="thumbnailSpan">'
										+ '<button type="button" onclick="window.open('+image+')" class="btn btn-success btn-xs">보기</button>'
										+ '<button type="button" onclick="fncDeleteThombnail()" name="deleteThombnail" value="'+JSONData.businessContentsNo+'" class="btn btn-danger btn-xs">삭제</button>'
										+ '</span>';
										
										
										//<input type="hidden" name="businessPostNo" id="getPostNo" >
						$("td[name='imageTd']").append(display);
						}else{
							var	display = '<span id="display_thumbnail" name="thumbnailSpan">'
								+ '</span>';	
						}
					}
					
					$("#getBusinessPostTitle").val(JSONData.BUSINESS_POST_TITLE);
					$("#getThombnailName").val(JSONData.BUSINESS_POST_THOMBNAIL);

				},
				error:function(request,status,error){
				  alert("에러")     
			    }
			})
			
			var memberNo = $('[name=secNo]').val();
			
			$.ajax({
				url : "/admin/board/json/getMemberData2/"+memberNo,
				method : "GET",
				dataType : "JSON",	
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					$('[name=name]').val(JSONData.lastName+JSONData.firstName);
				}
				
			})
					
		})
	})
</script>

<div class="modal fade" id="modalContent4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <form name="getBusinessPostForm" method="businessPost" enctype="multipart/form-data">
            	<input type="hidden" name="businessContentsNo" class="businessContentsNo">
	            <input type="hidden" name="businessPostNo" value="${businessPost.businessPostNo}">
	            <input type="hidden" name="mode" id="mode" value="update">
	            <input type="hidden" name="secNo" value="<sec:authentication property='principal.memberNo'/>">            
	            <div class="modal-header">
	                <button type="button" name="x" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
	            </div>
            	<div class="modal-body">
		            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 글 <span name="board_sub_title">수정</span></p></h4>
			        <table class="table table-bordered">
			            <tbody>
				            <tr>
				                <td class="menu">작성자</td>
				                <td align="left"><input type="text" name="name" id="name" class="form-control input-sm"></td>
				            </tr>
							<tr>
				                <td class="menu">제목</td>
				                <td align="left">
				                	<textarea name="businessContentsTitle" id="businessContentsTitle2" rows="3" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>				            
				            <tr>
				            	<td class="menu">내용</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessContentsContent" id="businessContentsContent2" rows="10" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
		            	    <tr>
				            	<td class="menu">이미지파일</td>
				            	<td name="imageTd" align="left">
				            		<input type="file" name="file" id="file2" class="form-control input-sm">
				            	</td>
				            </tr>				            				            
			            </tbody>
		            </table>
     
            	</div><!-- /.modal-body -->
	            <div class="modal-footer">
		            <button type="button" onclick="fncUpdateBusinessPost()" name="updateBusinessPost" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
		            
	            </div>
            	<input type="hidden" value="" name="boardNo">
        	</form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal fade -->