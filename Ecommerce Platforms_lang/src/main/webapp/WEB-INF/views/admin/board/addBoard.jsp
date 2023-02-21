<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	//addBoard 실행 function
	function fncAddBoard(){
		var boardTitle = $("input[name='boardTitle']").val();
		var boardType = $("select[name='boardType']").val();
		var boardCategory = $("input[name='boardCategory']").val();
		var	boardEmail = $("input[name='boardEmail']").val();
		if(boardTitle == null || boardTitle == ''){
			alert("제목이 입력되지 않았습니다.");
			return;
		}else if(boardCategory == null || boardCategory == ''){
			alert("카테고리가 입력되지 않았습니다.");
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
			                <td align="left" colspan="3"><input type="text" name="boardTitle" id="boardTitle" class="form-control input-sm"></td>
			            </tr>
			            <tr>
			                <td class="menu">종류 <span class="text-light-blue"><i class="fa fa-check"></i></span></td>
			                <td colspan="3">
			                	<select name="boardType" id="boardType" class="form-control input-sm" style="width:120px;">
			      					<option value="list">일반</option>      
			      					<option value="gallery">갤러리</option>      
			      					<option value="qna">FAQ</option>      
			      					<option value="webzine">웹진</option>      
			      					<option value="movie">동영상</option>      
			      					<option value="event">이벤트</option>      
			      					<option value="manual">메뉴얼</option>      
			      					<option value="brochure">브로슈어</option>                
			      				</select>
			                </td>
			            </tr>
			            <tr>
			                <td class="menu">카테고리</td>
			                <td align="left" colspan="3"><input type="text" name="boardCategory" id="boardCategory" class="form-control input-sm" placeholder=",(콤마)로 구분해 주세요"></td>
			            </tr>
			            <tr>
			                <td class="menu">수신 메일 주소</td>
			                <td align="left" colspan="3"><input type="text" name="boardEmail" placeholder=", 구분" class="form-control input-sm"></td>
			            </tr>
			            <tr>
			                <td class="menu">기타 옵션</td>
			                <td align="left" colspan="3">
				                <span class="option_tab"><input type="checkbox" name="optionNotice" value="y">공지기능</span>
				                <span class="option_tab"><input type="checkbox" name="optionComment" value="y">댓글</span>
				                <span class="option_tab"><input type="checkbox" name="optionSecret" value="y">비밀글</span>
				                <span class="option_tab"><input type="checkbox" name="optionAnswer" value="y">답변기능</span>
				                <span class="option_tab"><input type="checkbox" name="optionCaptcha" value="y">도용방지문자</span>
				                <span class="option_tab"><input type="checkbox" name="optionMass" value="y">대용량 업로드</span>
				                <span class="option_tab"><input type="checkbox" name="optionOrder" value="y">순서변경</span>
				                <span class="option_tab" style="width:263px;"><input type="checkbox" name="optionAddinfo" value="y">추가정보(휴대전화,이메일)</span>
				                <span class="option_tab"><input type="checkbox" name="optionPopup" value="y">상세보기(팝업)</span>
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