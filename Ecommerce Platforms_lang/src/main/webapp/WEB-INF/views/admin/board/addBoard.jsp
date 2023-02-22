<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	//addBoard 실행 function
	function fncAddBoard(){
		var boardTitle = $("input[name='boardTitle']").val();
		var boardSubTitle = $("input[name='boardSubTitle']").val();
		var boardContents = $("[name=boardContents]").val();
		if(boardTitle == null || boardTitle == ''){
			alert("제목이 입력되지 않았습니다.");
			return;
		}else if(boardSubTitle == null || boardSubTitle == ''){
			alert("부제목이 입력되지 않았습니다.");
			return;
		}else if(boardContents == null || boardContents == ''){
			alert("내용이 입력되지 않았습니다.");
			return;
		}
		alert("게시판이 등록 되었습니다.")
		$("form[name='addBoard']").attr("method", "POST").attr("action", "/admin/board/boardProcess?${_csrf.parameterName}=${_csrf.token}").submit();
	}
	
	$(function(){
		$("button[name='addBoardButton']").on("click" , function(){
			fncAddBoard();
		})
	})
</script>

<div class="modal fade" id="modalRegister" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog" style="width:600px;">
        <div class="modal-content">
            <form name="addBoard" method="post">
	            <input type="hidden" name="mode" id="mode" value="insert">
	            <input type="hidden" name="locale" value="${locale}"/>
	            <input type="hidden" name="board_code" id="board_code">
	            <input type="hidden" name="cPage" id="cPage">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">게시판 생성</h4>
	            </div>
	            <div class="modal-body">
		            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i>게시판 정보</p></h4>
		            <table class="table table-bordered">
			            <tr>
			                <td class="menu">제목</td>
			                <td align="left" colspan="3"><input type="text" name="boardTitle" id="boardTitle" class="form-control input-sm" placeholder="제목을 입력해주세요"></td>
			            </tr>
			            <tr>
			                <td class="menu">부제목</td>
			                <td align="left" colspan="3"><input type="text" name="boardSubTitle" id="boardSubTitle" class="form-control input-sm" placeholder="부제목을 입력해주세요"></td>
			            </tr>
			            <tr>
			                <td class="menu">내용</td>
			                <td colspan="2" style="text-align:left">
			                	<textarea name="boardContents" id="boardContents" rows="10" cols="80" style="width:450px; writing-mode: horizontal-tb;"placeholder="내용을 입력해주세요"></textarea>
			                </td>
			            </tr>
		            </table>
	            </div><!-- /.modal-body -->
	            <div class="modal-footer">
	            	<button type="button" name="addBoardButton" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
	            </div><!-- /.modal-footer -->
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal fade -->