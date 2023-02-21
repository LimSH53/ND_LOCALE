<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	function fncAddPost(){
		var businessContentsTitle = $("input[id='businessContentsTitle']").val();
		var businessContentsContent = $('[id=businessContentsContent]').val();
		var file = $('[id=file]').val();	

		if(businessContentsTitle == null || businessContentsTitle == ''){
			alert("제목을 입력하셔야 합니다.");
			return;
		}
		if(businessContentsContent == null || businessContentsContent == ''){
			alert("내용을 입력하셔야 합니다.");
			return;
		}
		if(file == null || file == ''){
			alert("이미지를 첨부하셔야 합니다.");
			return;
		}
		alert("게시글이 등록 되었습니다.")
		$("form[name='addBusinessPostForm']").attr("method", "POST").attr("action", "/admin/business/businessContentsProcess?${_csrf.parameterName}=${_csrf.token}").submit();
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
				                <td class="menu">제목</td>
				                <td align="left">
					                <textarea name="businessContentsTitle" id="businessContentsTitle" rows="3" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>				            
				            <tr>
				            	<td class="menu">내용</td>
				                <td colspan="2" style="text-align:left">
				                	<textarea name="businessContentsContent" id="businessContentsContent" rows="10" cols="80" style="width:650px; writing-mode: horizontal-tb;"></textarea>
				                </td>
				            </tr>
		            	    <tr>
				            	<td class="menu">이미지파일</td>
				            	<td>
				            		<input type="file" name="file" id="file" class="form-control input-sm">
				            	</td>
				            </tr>				            				            
			            </tbody>
		            </table>
	            </div><!-- /.modal-body -->
	            <div class="modal-footer">
	            	<button type="button" onclick="fncAddPost()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
	            </div>
	            <input type="hidden" value="${businessPostNo}" name="businessPostNo">
	        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal fade -->