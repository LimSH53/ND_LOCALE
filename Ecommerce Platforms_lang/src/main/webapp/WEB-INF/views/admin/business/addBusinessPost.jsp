<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>

	function fncAddPost(){
		var businessPostTitle = $("input[id='businessPostTitle']").val();
		var businessPostSubTitle = $('[id=businessPostSubTitle]').val();
		var businessPostContents = $('[id=businessPostContents]').val();	
		var businessPostText1 = $('[id=businessPostText1]').val();
		var businessPostText2 = $('[id=businessPostText2]').val();
		var icon = $('[id=icon]').val();
		var img = $('[id=img]').val();

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
		if(icon == null || icon == ''){
			alert("아이콘을 첨부하셔야 합니다.");
			return;
		}
		if(img == null || img == ''){
			alert("이미지을 첨부하셔야 합니다.");
			return;
		}

		
		alert("게시글이 등록 되었습니다.")
		$("form[name='addBusinessPostForm']").attr("method", "POST").attr("action", "/admin/business/businessPostProcess?${_csrf.parameterName}=${_csrf.token}").submit();
	}
	
	function fucAddFile(){
		$("div[name='listFile']").append('<input type="file" name="businessPostName" id="businessPostName" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;">');
	}
</script>

<div class="modal fade" id="modalContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <form name="addBusinessPostForm" method="businessPost" enctype="multipart/form-data">
	            <input type="hidden" name="mode" id="mode" value="insert">
	            <input type="hidden" name="secNo" value="<sec:authentication property='principal.memberNo'/>">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
	            </div>
	            <div class="modal-body">
		            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 글 <span id="board_sub_title">등록</span></p></h4>
			        <table class="table table-bordered">
			            <tbody>
				            <tr>
				                <td class="menu">작성자</td>
				                <td align="left"><input type="text" name="name" id="name" class="form-control input-sm"></td>
				            </tr>
							<tr>
				                <td class="menu">사업제목</td>
				                <td align="left"><input type="text" name="businessPostTitle" id="businessPostTitle" class="form-control input-sm"></td>
				            </tr>
							<tr>
				                <td class="menu">부제목</td>
				                <td align="left"><input type="text" name="businessPostSubTitle" id="businessPostSubTitle" class="form-control input-sm"></td>
				            </tr>				            
				            <tr>
				            	<td class="menu">내용</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessPostContents" id="businessPostContents" rows="7" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
							<tr>
				            	<td class="menu">상세페이지 내용1</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessPostText1" id="businessPostText1" rows="7" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
				            <tr>
				            	<td class="menu">상세페이지 내용2</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessPostText2" id="businessPostText2" rows="7" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>			            
		            	    <tr>
				            	<td class="menu">아이콘파일</td>
				            	<td>
				            		<input type="file" name="icon" id="icon" class="form-control input-sm">
				            	</td>
				            </tr>
				            <tr>
				            	<td class="menu">이미지파일</td>
				            	<td>
				            		<input type="file" name="img" id="img" class="form-control input-sm">
				            	</td>
				            </tr>				            				            
			            </tbody>
		            </table>
	            </div><!-- /.modal-body -->
	            <div class="modal-footer">
	            	<button type="button" onclick="fncAddPost()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
	            </div>
	            <input type="hidden" value="${business.businessNo}" name="businessNo">
	        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal fade -->