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
					                <td align="left" colspan="3"><input type="text" name="boardTitle" id="boardTitle2" class="form-control input-sm" placeholder="제목을 입력해주세요"></td>
					            </tr>
					            <tr>
					                <td class="menu">부제목</td>
					                <td align="left" colspan="3"><input type="text" name="boardSubTitle" id="boardSubTitle2" class="form-control input-sm" placeholder="부제목을 입력해주세요"></td>
					            </tr>
					            <tr>
					                <td class="menu">내용</td>
					                <td colspan="2" style="text-align:left">
					                	<textarea name="boardContents" id="boardContents2" rows="10" cols="80" style="width:450px; writing-mode: horizontal-tb;"placeholder="내용을 입력해주세요"></textarea>
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
