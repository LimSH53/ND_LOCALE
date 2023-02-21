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
		
		var businessPostTitle = $("input[id='businessPostTitle2']").val();
		var businessPostSubTitle = $('[id=businessPostSubTitle2]').val();
		var businessPostContents = $('[id=businessPostContents2]').val();	
		var businessPostText1 = $('[id=businessPostText1_1]').val();
		var businessPostText2 = $('[id=businessPostText2_2]').val();
		var icon = $('[id=icon]').val();

		if(businessPostTitle == null || businessPostTitle == ''){
			alert("사업제목을 입력하셔야 합니다.");
			return;
		}
		if(businessPostSubTitle == null || businessPostSubTitle == ''){
			alert("부제목을 입력하셔야 합니다.");
			return;
		}
		if(businessPostContents == null || businessPostContents == ''){
			alert("내용을 입력하셔야 합니다.");
			return;
		}
		if(businessPostText1 == null || businessPostText1 == ''){
			alert("상세페이지 내용1을 입력하셔야 합니다.");
			return;
		}
		if(businessPostText2 == null || businessPostText2 == ''){
			alert("상세페이지 내용1을 입력하셔야 합니다.");
			return;
		}
		
		alert("수정 되었습니다.");
		$("form[name='getBusinessPostForm']").attr("method", "POST").attr("action", "/admin/business/businessPostProcess?${_csrf.parameterName}=${_csrf.token}").submit();
	}
	

	
	function fncDeleteFile(fileNo){
		
		if(!confirm("정말 삭제 하시겠습니까?")){
			alert("취소 되었습니다.");
			return;
			
		}else{
		$.ajax({
			url : "/admin/board/json/deleteFile/"+fileNo,
			method : "GET",
			dataType : "JSON",	
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"	 						
			} ,
			success : function(JSONData, status){
				
			}
		})
		alert("파일이 삭제 되었습니다.")
  		$("span[id='"+fileNo+"']").remove();
		}
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
		
		$(".getBusinessPost").on("click", function(){
			var businessPostNo = $(this).val();
			$.ajax({
				url : "/admin/business/json/getBusinessPost/"+businessPostNo,
				method : "GET",
				dataType : "JSON",	
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					console.log(JSONData)
					$("input[id='businessPostNo2']").val(JSONData.businessPostNo);
					$("input[id='businessPostTitle2']").val(JSONData.businessPostTitle);
					$("input[id='businessPostSubTitle2']").val(JSONData.businessPostSubTitle);
					$('[id=businessPostContents2]').text(JSONData.businessPostContents);
					$('[id=businessPostText1_1]').text(JSONData.businessPostText1);
					$('[id=businessPostText2_2]').text(JSONData.businessPostText2);

					if(JSONData.businessPostIcon != null){
						var icon = "'${pageContext.request.contextPath}/resources/user/images/introduction/icon/"+JSONData.businessPostIcon+"'"
						if(JSONData.businessPostIcon != null && JSONData.businessPostIcon != ''){
							var	display = '<span id="display_thumbnail" name="thumbnailSpan">'
										+ '<button type="button" onclick="window.open('+icon+')" class="btn btn-success btn-xs">보기</button>'
										+ '</span>';
						$("td[name='iconTd']").append(display);
						}
					}
					if(JSONData.businessPostImg != null){
						var img = "'${pageContext.request.contextPath}/resources/user/images/main/"+JSONData.businessPostImg+"'"
						if(JSONData.businessPostImg != null && JSONData.businessPostImg != ''){
							var	display = '<span id="display_thumbnail" name="thumbnailSpan">'
										+ '<button type="button" onclick="window.open('+img+')" class="btn btn-success btn-xs">보기</button>'
										+ '</span>';
						$("td[name='imgTd']").append(display);
						}
					}
					
					$("#getBusinessPostTitle").val(JSONData.BUSINESS_POST_TITLE);
					$("#getThombnailName").val(JSONData.BUSINESS_POST_THOMBNAIL);

				},
				error:function(request,status,error){
				  alert("에러")     
			    }
			})
			
			var memberNo = $(this).find('input').val();
			
			$.ajax({
				url : "/admin/board/json/getMemberData2/"+memberNo,
				method : "GET",
				dataType : "JSON",	
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"	 						
				} ,
				success : function(JSONData, status){
					$("#businessPostGetName").val(JSONData.lastName+JSONData.firstName);
					$("#businessPostGetPhone").val(JSONData.phone);
					$("#businessPostGetEmail").val(JSONData.email);
				}
				
			})
					
		})
	})
</script>

<div class="modal fade" id="modalContent4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <form name="getBusinessPostForm" method="businessPost" enctype="multipart/form-data">
	            <input type="hidden" name="businessPostNo" id="businessPostNo2" >
	            <input type="hidden" name="businessNo" value="${business.businessNo}">
	            <input type="hidden" name="businessPostAsc" id="getPostAsc" >
	            <input type="hidden" name="businessPostOriginNo" id="getPostOriginNo" >
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
				                <td class="menu">사업제목</td>
				                <td align="left"><input type="text" name="businessPostTitle" id="businessPostTitle2" class="form-control input-sm"></td>
				            </tr>
				            <tr>
				                <td class="menu">부제목</td>
				                <td align="left"><input type="text" name="businessPostSubTitle" id="businessPostSubTitle2" class="form-control input-sm"></td>
				            </tr>
				            <tr>
				            	<td class="menu">내용</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessPostContents" id="businessPostContents2" rows="7" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
				            <tr>
				            	<td class="menu">상세페이지 내용1</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessPostText1" id="businessPostText1_1" rows="7" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
				            <tr>
				            	<td class="menu">상세페이지 내용2</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessPostText2" id="businessPostText2_2" rows="7" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
		            	    <tr>
				            	<td class="menu">아이콘파일</td>
				            	<td align="left" name="iconTd">
				            		<input type="file" name="icon" id="icon" class="form-control input-sm">
				            	</td>
				            </tr>
				            <tr>
				            	<td class="menu">이미지파일</td>
				            	<td align="left" name="imgTd">
				            		<input type="file" name="img" id="img" class="form-control input-sm">
				            	</td>
				            </tr>			            				            
			            </tbody>
		            </table>
            		<c:if test="${board2.option.optionComment eq 'y'}">
						<div id="displayMemo" style="">
			            	<h4>
	            				<p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 댓글 관리
	            					<button type="button" onclick="fncAddComment()" name="comment" class="btn btn-info" data-toggle="modal" data-target="#modalContent5">댓글 작성</button>
	            				</p>
	            			</h4>
			            	<span id="memo_list">
			            		<table class="table table-bordered">
			            			<tbody id="commentList">
				            			<tr>  
				            				<td class="menu" style="width:80px;">글쓴이</td>  
				            				<td class="menu">내용</td>  
				            				<td class="menu" style="width:60px;">등록일</td>  
				            				<td class="menu" style="width:50px;">명령</td>
				            			</tr>
			            			</tbody>
			            		</table>
			            	</span>
	            		</div>
            		</c:if>
            	</div><!-- /.modal-body -->
	            <div class="modal-footer">
		            <button type="button" onclick="fncUpdateBusinessPost()" name="updateBusinessPost" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
		            <c:if test="${board2.option.optionAnswer eq 'y'}">
		            	<button type="button" onclick="funReply()" name="display_reply" style="" class="btn btn-danger">답변 페이지로 전환</button>
		            </c:if>
	            </div>
            	<input type="hidden" value="${boardNo}" name="boardNo">
        	</form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal fade -->