<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="contatiner">
	<form name="updateBoardForm" method="post">
		<div class="modal fade" id="updateBoardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" style="width:600px;">
		        <div class="modal-content">
		            <form name="form" method="post">
			            <input type="hidden" name="mode" id="mode" value="update">
			            <input type="hidden" name="boardNo" id="boardNo2">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">게시판 수정</h4>
			            </div>
			            <div class="modal-body">
			            	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 게시판 정보</p></h4>
			            	<table class="table table-bordered">
					            <tr>
					                <td class="menu">제목</td>
					                <td align="left" colspan="3"><input type="text" name="boardTitle" id="boardTitle2" class="form-control input-sm"></td>
					            </tr>
					            <tr>
					                <td class="menu">종류 <span class="text-light-blue"><i class="fa fa-check"></i></span></td>
					                <td colspan="3">
					                	<select name="boardType" id="boardType2" class="form-control input-sm" style="width:120px;">
					      					<option value="list">일반</option>	<option value="gallery">갤러리</option>      
					      					<option value="qna">FAQ</option>	<option value="webzine">웹진</option>      
					      					<option value="movie">동영상</option>	<option value="event">이벤트</option>      
					      					<option value="manual">메뉴얼</option>	<option value="brochure">브로슈어</option>                
					      				</select>
					                </td>
					            </tr>
					            <tr>
					                <td class="menu">카테고리</td>
					                <td align="left" colspan="3"><input type="text" name="boardCategory" id="boardCategory2" class="form-control input-sm" placeholder=",(콤마)로 구분해 주세요"></td>
					            </tr>
					            <tr>
					                <td class="menu">수신 메일 주소</td>
					                <td align="left" colspan="3"><input type="text" name="boardEmail" id="boardEmail2" placeholder=", 구분" class="form-control input-sm"></td>
					            </tr>
					            <tr>
					                <td class="menu">기타 옵션</td>
					                <td align="left" colspan="3">
						                <span class="option_tab"><input type="checkbox" name="optionNotice" id="optionNotice2" value="y">공지기능</span>
						                <span class="option_tab"><input type="checkbox" name="optionComment" id="optionComment2" value="y">댓글</span>
						                <span class="option_tab"><input type="checkbox" name="optionSecret" id="optionSecret2" value="y">비밀글</span>
						                <span class="option_tab"><input type="checkbox" name="optionAnswer" id="optionAnswer2" value="y">답변기능</span>
						                <span class="option_tab"><input type="checkbox" name="optionCaptcha" id="optionCaptcha2" value="y">도용방지문자</span>
						                <span class="option_tab"><input type="checkbox" name="optionMass" id="optionMass2" value="y">대용량 업로드</span>
						                <span class="option_tab"><input type="checkbox" name="optionOrder" id="optionOrder2" value="y">순서변경</span>
						                <span class="option_tab" style="width:263px;"><input type="checkbox" id="optionAddinfo2" name="optionAddinfo" value="y">추가정보(휴대전화,이메일)</span>
						                <span class="option_tab"><input type="checkbox" name="optionPopup" id="optionPopup2" value="y">상세보기(팝업)</span>
					                </td>
					            </tr>
				            </table>
			            </div><!-- /.modal-body -->
			            <div class="modal-footer">
			            	<button type="button" onclick="fncUpdateBoard()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
			            </div>
		            </form>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div><!-- /.modal fade -->
	</form>
</div><!-- /.contatiner -->
