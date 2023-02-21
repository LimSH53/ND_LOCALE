<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	
	function addContents(){
		$("#addContents").append(
				`<tr>
					<td class="menu">소제목</td>
					<td align="left"><input type="text" name="subTitle"
					id="subTitle" class="form-control input-sm"
					style="width: 50%;" placeholder="소제목을 입력해 주세요. 예)우대사항"></td>
				</tr>
				<tr>
					<td class="menu">내용</td>
					<td align="left">
						<textarea name="contents" id="contents"
							rows="10" cols="80" placeholder="내용을 입력해 주세요. 예)정보처리기사 자격증"></textarea>
					</td>
				</tr>`);
	}
	
	function addRecruit(){

			if($("#title").val().length == 0 || $("#jobTitle").val().length == 0 || $("#recruitType").val().length == 0 || $("#career").val().length == 0
					|| $("#recruitPlace").val().length == 0 || $("#jobIntro").val().length == 0 || $("#recruitManager").val().length == 0 || $("#qualification").val().length == 0){
				alert("필수항목을 모두 입력해주세요.");
				return;
			}
			
			//반복작업 필요한 내용
			var subTitle = new Array();
			$("input[name='subTitle']").each(function(){
				subTitle.push($(this).val());
			})
			var contents = new Array();
			$("textarea[name='contents']").each(function(){
				contents.push($(this).val());
			})

			console.log("subTitle >>" + subTitle);
			console.log("contents >>" + contents);
			
			let contentsStatus;
			let recruitStart;
			let recruitEnd;
			
			if($("input:checkbox[name='always']").is(":checked")){
				contentsStatus = $("#always").val();
				recruitStart = null;
				recruitEnd = null;
			}else{
				contentsStatus = null;
				recruitStart = $("#startDay").val();
				recruitEnd = $("#endDay").val();
			}
			
			console.log("contentsStatus >> ", contentsStatus);
			console.log("recruitStart >> ", recruitStart);
			
			if(recruitStart == null || recruitStart == ''){
				if(contentsStatus == null || contentsStatus ==''){
					alert("시작일은 필수 항목입니다.");
					return;
				}
			}
			if(recruitEnd == null || recruitEnd == ''){
				if(contentsStatus == null || contentsStatus ==''){
					alert("마감일은 필수 항목입니다.");
					return;
				}
			}
			if($("#startDay").val() > $("#endDay").val()){
				alert("시작일은 마감일보다 뒤일 수 없습니다.");
				return;
			}
			
			//FormData 새로운 객체 생성 
			var formData = new FormData();

			//넘길 데이터
			var data = {
					"recruitTitle": $("#title").val(),
					"recruitStart": recruitStart,
					"recruitEnd": recruitEnd,
					"career": $("#career").val(),
					"jobTitle": $("#jobTitle").val(),
					"recruitType": $("#recruitType").val(),
					"recruitPlace": $("#recruitPlace").val(),
					"jobIntro": $("#jobIntro").val(),
					"qualification": $("#qualification").val(),
					"recruitManager": $("#recruitManager").val(),
					"contentsStatus": contentsStatus,
					"subTitle": subTitle,
					"contents": contents
			}
			
			var fileinput = $("input[name='fileName']");
			console.log("fileinput >>>" + fileinput);
			
			for(var i = 0; i < fileinput.length; i++){
				if(fileinput[i].files.length > 0){
					for(var j = 0; j < fileinput[i].files.length; j++){
						console.log(" fileInput[i].files[j] :::"+ fileinput[i].files[j]);
						// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
						formData.append('file', $("input[name='fileName']")[i].files[j]); 
					 } 
				}
			}
		
			formData.append("${_csrf.parameterName}", "${_csrf.token}");
			console.log("formData:" + formData.get(0));
			
			if(!confirm("채용 게시글을 등록하시겠습니까?")){
				alert("취소 되었습니다.");
				return;
			}else{

		  		$.ajax({
	  			 	 url : "/admin/insertRecruit?${_csrf.parameterName}=${_csrf.token}",
		  		  	 type : "POST",
	  		  	 	 data : data,
	    		 	 success : function(result){
	    		 		console.log("result >> ", result);
	    		 		$.ajax({
	   	  			 	 url : "/admin/insertFile?",
	   		  		  	 type : "POST",
	   	  		  	 	 data : formData,
	   	  		  	     processData: false,
	   	  		  	     contentType: false,
	   	  		  	     enctype: 'multipart/form-data',
	   	    		 	 success : function(result){
	   	    		 		console.log("result222 >> ", result);
	   	    		 		let msg;
	   	    		 		if(result == 1){
	   	    		 			msg = "게시글 등록에 성공했습니다.";
	   	    		 		} else if(result == 2){
	   	    		 			msg = "게시글 등록에 성공했습니다.(파일없음)";
	   	    		 		} else {
	   	    		 			msg = "게시글 등록에 실패했습니다.";
	   	    		 		}
	   	    		 		alert(msg);
	   	   			  		location.href = "/admin/recruitList";
	   	  		  	 	 }
	   		  		})
	  		  	 	 }
		  		});		
			}
		}
	$(document).ready(function() {
		
		$("input:checkbox[name='always']").on('click', function() {
			
			let chk = $(this).is(":checked");
			
			console.log("버튼누름",chk);
			
			if(chk){
				/* $("input:checkbox[name='always']").prop('checked', true); */
				document.getElementById('startDay').disabled = true;
				document.getElementById('endDay').disabled = true;
				
				$('#startDay').val('');
				$('#endDay').val('');
				
				console.log("startDay vla ==" , $('#startDay').val());
				console.log("endDay vla ==" , $('#endDay').val());
				console.log("always vla ==" , $('#always').val());	
			} else {
				console.log("실패");
				$("input:checkbox[name='always']").prop('checked', false); 
				document.getElementById('startDay').disabled = false;
				document.getElementById('endDay').disabled = false;
			}
		})
	})
	
	function removeFile(){
		$('#fileName').val("");		
	}
	</script>
	<div class="modal fade" id="modalContent" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="addPostForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="mode" id="mode" value="insert">
					<input type="hidden" name="secNo"
						value="<sec:authentication property='principal.memberNo'/>">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
					</div>
					<div class="modal-body">
						<h4>
							<p class="text-light-blue">
								<i class="fa fa-fw fa-info-circle"></i> 채용 글 <span
									id="board_sub_title">등록</span>
							</p>
						</h4>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="menu">제목<span style="color: red;">*</span></td>
									<td align="left"><input type="text" name="title"
										id="title" class="form-control input-sm"></td>
								</tr>
								<tr>
									<td class="menu">채용 시작일<span style="color: red;">*</span></td>
									<td align="left"><input type="date" name="startDay"
										id="startDay" class="form-control input-sm"
										style="width: 50%;"></td>
								</tr>
								<tr>
									<td class="menu">채용 마감일<span style="color: red;">*</span></td>
									<td align="left">
									<input type="date" name="endDay" id="endDay" class="form-control input-sm" style="width: 50%;">
									<input style="zoom:0.7;" type="checkbox" id="always" name='always' value="R">
										<label style="padding-top: 10px;" for="always">상시채용</label>
									</td>
								</tr>
								<tr>
									<td class="menu">직무명<span style="color: red;">*</span></td>
									<td align="left"><input type="text" name="jobTitle"
										id="jobTitle" class="form-control input-sm"></td>
								</tr>
								<tr>
									<td class="menu">근무형태<span style="color: red;">*</span></td>
									<td align="left"><input type="text" name="recruitType"
										id="recruitType" class="form-control input-sm"></td>
								</tr>
								<tr>
									<td class="menu">경력<span style="color: red;">*</span></td>
									<td align="left"><select name="career" id="career"
										class="form-control input-sm" style="width: 50%;">
											<option value="경력무관" selected="selected">경력무관</option>
											<option value="신입">신입</option>
											<option value="경력">경력</option>
									</select></td>
								</tr>
								<tr>
									<td class="menu">근무지<span style="color: red;">*</span></td>
									<td align="left"><input type="text" name="recruitPlace"
										id="recruitPlace" class="form-control input-sm"></td>
								</tr>
								<tr>
									<td class="menu">담당자<span style="color: red;">*</span></td>
									<td align="left">
										<textarea name="recruitManager" id="recruitManager"
												rows="4" cols="80"></textarea>
									</td>
								</tr>
								<tr>
									<td class="menu">직무소개<span style="color: red;">*</span></td>
									<td align="left">
										<textarea name="jobIntro" id="jobIntro"
												rows="10" cols="80" placeholder="내용을 입력해 주세요."></textarea>
									</td>
								</tr>
								<tr>
									<td class="menu">지원자격<span style="color: red;">*</span></td>
									<td align="left">
										<textarea name="qualification" id="qualification"
												rows="10" cols="80" placeholder="내용을 입력해 주세요."></textarea>
									</td>
								</tr>
								<tr>
									<td class="menu">파일</td>
									<td align="left">
										<input type="file" name="fileName" id="fileName" class="form-control input-sm" style="width: 80%; display: inline;"> 
										<span id="display_file" >
											<button type="button" onclick="removeFile();" class="btn btn-danger btn-xs">삭제</button>
										</span>
									</td>
								</tr>
							</tbody>
							<tbody id="addContents">
							</tbody>
						</table>
						<div>
							■ <span style="color: red;">*</span>는 필수 항목입니다.
						</div>
						<div>
							■ 내용추가 버튼을 누르시면 추가내용 기재가 가능합니다.
						</div>
					</div>
					<!-- /.modal-body -->
					<div class="modal-footer">
						<button type="button" onclick="addContents()"
							class="btn btn-primary"
							style="background: rgb(118, 118, 118); border-color: rgb(118, 118, 118);">내용추가</button>
						<button type="button" onclick="addRecruit()" class="btn btn-primary">확인</button>
						&nbsp;&nbsp;&nbsp;
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal fade -->
</body>
</html>