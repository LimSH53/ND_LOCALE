<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	//addbusiness 실행 function
	function fncAddbusiness(){
		var businessTitle = $("input[name='businessTitle']").val();
		if(businessTitle == null || businessTitle == ''){
			alert("제목이 입력되지 않았습니다.");
			return;
		}
		alert("게시판이 등록 되었습니다.")
		$("form[name='addbusiness']").attr("method", "POST").attr("action", "/admin/business/businessProcess?${_csrf.parameterName}=${_csrf.token}").submit();
	}
	
	$(function(){
		$("button[name='addbusinessButton']").on("click" , function(){
			fncAddbusiness();
		})
	})
</script>

<div class="modal fade" id="modalRegister" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog" style="width:600px;">
        <div class="modal-content">
            <form name="addbusiness" method="post">
	            <input type="hidden" name="mode" id="mode" value="insert">
	            <input type="hidden" name="locale" value="${locale}"/>
	            <input type="hidden" name="business_code" id="business_code">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">게시판 생성</h4>
	            </div>
	            <div class="modal-body">
		            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i>서비스 정보</p></h4>
		            <table class="table table-bordered">
			            <tr>
			                <td class="menu">제목</td>
			                <td align="left" colspan="3">
			                	<input type="text" name="businessTitle" id="businessTitle" class="form-control input-sm">			                
			                </td>
			            </tr>
		            </table>
	            </div><!-- /.modal-body -->
	            <div class="modal-footer">
	            	<button type="button" name="addbusinessButton" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
	            </div><!-- /.modal-footer -->
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal fade -->