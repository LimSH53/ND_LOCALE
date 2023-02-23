<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
$("button[name='getPostBotton']").on("click", function(){
	//버튼 우선 활성화
	document.getElementById('startDay_u').disabled = false;
	document.getElementById('endDay_u').disabled = false;
	
	// 게시글 번호 받기
	let postNo = $(this).val();
	$("#file_u").html("");
	$("#addContents_u").html("");
	
	$.ajax({
		url: "/admin/getRecruitData?postNo="+postNo,
		type : "GET",
		success: function(result){

			//채용 게시글
			let recruitData = result.recruitData;
			//게시글 번호
			$("#recruitNo_u").val(recruitData.recruitNo);
			console.log("recruitNo_u>>>>", recruitData.recruitNo);
			//제목
			$("#title_u").val(recruitData.recruitTitle);
			//경력(셀렉트)
			$("#career_u").val(recruitData.career).prop("selected",true);
			//직무명
			$("#jobTitle_u").val(recruitData.jobTitle);
			//근무형태
			$("#recruitType_u").val(recruitData.recruitType);
			//근무지
			$("#recruitPlace_u").val(recruitData.recruitPlace);
			//직무소개
			$("#jobIntro_u").val(recruitData.jobIntro);
			//지원자격
			$("#qualification_u").val(recruitData.qualification);
			//채용 담당자
			$("#recruitManager_u").val(recruitData.recruitManager);
			//상시채용 여부
			if(recruitData.contentsStatus == 'R'){
				//상시채용 체크박스 true
				$("input:checkbox[name='always_u']").prop("checked", true);
				//채용일자 비활성화
				document.getElementById('startDay_u').disabled = true;
				document.getElementById('endDay_u').disabled = true;
				
				//시작일(date)
				let startDay = $("#startDay_u").val("");
				//마감일(date)
				let endDay = $("#endDay_u").val("");
			}else{
				//채용일자 활성화
				
				//시작일(date)
				let startDay = $("#startDay_u").val(recruitData.recruitStart);
				//마감일(date)
				let endDay = $("#endDay_u").val(recruitData.recruitEnd);
			}
			
			
			//파일
			if(recruitData.fileName != null){
				//파일이 있을 때
				$("#file_u").append(`
						<!-- 파일값 하나 넣기 -->
						<td class="menu">파일 변경</td>
						<td align="left">
							<span class="form-control input-sm">현재 파일 :` + recruitData.orgFileName + `
								<input type="hidden" id="orgFileName_u" name="orgFileName_u" class="form-control input-sm" value =`+ recruitData.orgFileName + `>
								<button type="button" onclick="deleteFile()" class="btn btn-danger btn-xs">삭제</button>
							</span>
							<input type="file" id="fileName_u" name="fileName_u" class="form-control input-sm"> 
						</td>`);
			}else {
				//파일이 없을 때
				$("#file_u").append(`
						<!-- 파일값 하나 넣기 2222222-->
						<td class="menu">파일 추가</td>
						<td align="left">
							<input type="file" id="fileName_u" name="fileName_u" class="form-control input-sm">
						</td>`);
				
			}
			
			//반복되는 상세내용
			let contents = result.contents;

			if(contents.length > 0){
				for(let i = 0; i < contents.length; i++){
					$("#addContents_u").append(
							`<tr>
								<td class="menu">소제목</td>
								<td align="left"><input type="text" name="subTitle_u"
								id="subTitle_u`+ i +`" class="form-control input-sm"
								style="width: 50%;" placeholder="소제목을 입력해 주세요."></td>
							</tr>
							<tr>
								<td class="menu">내용</td>
								<td align="left">
									<textarea name="contents_u" id="contents_u`+ i +`"
										rows="10" cols="80" placeholder="내용을 입력해 주세요."></textarea>
								</td>
							</tr>
						<tr>`);
					
					$('#subTitle_u' + i).val(contents[i].recruitSubTitle);
					$('#contents_u' + i).val(contents[i].recruitContents);
					}
				
				}
			},
		error: function(result){
			alert("실패~~~ㅠ_ㅠ" + result);
		}
	})
})

function deleteFile(){
	if(confirm('정말 삭제하시겠습니까?')){
		console.log("$(this).parent() >>>>" , $("#orgFileName_u").parent());
		$("#orgFileName_u").parent().remove();
	}
	
}


function updateRecruit(){
	
	if(!confirm("채용 게시글을 수정하시겠습니까?")){
		alert("취소 되었습니다.");
		return;
	}else{
		
		if($("#title_u").val().length == 0 || $("#jobTitle_u").val().length == 0 || $("#recruitType_u").val().length == 0 || $("#career_u").val().length == 0
				|| $("#recruitPlace_u").val().length == 0 || $("#jobIntro_u").val().length == 0 || $("#recruitManager_u").val().length == 0 || $("#qualification_u").val().length == 0){
			alert("필수항목을 모두 입력해주세요.");
			return;
		}
		
		//반복작업 필요한 내용
		var subTitle = new Array();
		$("input[name='subTitle_u']").each(function(){
			console.log('subTitle_u', $("input[name='subTitle_u']").val());
			subTitle.push($(this).val());
		})
		var contents = new Array();
		$("textarea[name='contents_u']").each(function(){
			console.log('contents_u', $("textarea[name='contents_u']").val());
			contents.push($(this).val());
		})
		
		for(let i = 0; i < subTitle.length; i++){
			if(subTitle[i] != null && contents[i] == null){
				alert(1+ i + "번째 소제목의 내용을 입력해 주세요.");
				return;
			}
		}
		
		let contentsStatus;
		let recruitStart;
		let recruitEnd;
		
		if($("input:checkbox[name='always_u']").is(":checked")){
			contentsStatus = $("#always_u").val();
			recruitStart = null;
			recruitEnd = null;
		}else{
			contentsStatus = null;
			recruitStart = $("#startDay_u").val();
			recruitEnd = $("#endDay_u").val();
		}
		
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
		
		console.log("contentsStatus>>>>>>" ,contentsStatus);
		
		//FormData 새로운 객체 생성 
		var formData = new FormData();
		
		//넘길 데이터
		var data = {
				"recruitNo": $("#recruitNo_u").val(),
				"recruitTitle": $("#title_u").val(),
				"recruitStart": recruitStart,
				"recruitEnd": recruitEnd,
				"career": $("#career_u").val(),
				"jobTitle": $("#jobTitle_u").val(),
				"recruitType": $("#recruitType_u").val(),
				"recruitPlace": $("#recruitPlace_u").val(),
				"jobIntro": $("#jobIntro_u").val(),
				"qualification": $("#qualification_u").val(),
				"recruitManager": $("#recruitManager_u").val(),
				"orgFileName" : $("#orgFileName_u").val(),
				"contentsStatus": contentsStatus,
				"subTitle": subTitle,
				"contents": contents		
		}
		
		var fileinput = $("input[name='fileName_u']");
		console.log("fileinput >>>" + fileinput);
		
		// fileName_u : 새로 update 하려는 파일 orgFileName_u
		// org value 값이 있고 fileName_u == null 이면 유지
		if( $("orgFileName_u") != null && fileinput == null){
			formData.append('file', null);
		} else if($("orgFileName_u") == null && fileinput == null){
			formData.append('file', null);
		} else {
		}
		// fileName_u != null 이면 파일 변경
			for(var i = 0; i < fileinput.length; i++){
				if(fileinput[i].files.length > 0){
					for(var j = 0; j < fileinput[i].files.length; j++){
						console.log("update fileInput[i].files[j] :::"+ fileinput[i].files[j]);
		
						// formData에 'file'이라는 키값으로 fileInput 값을 append 시킨다.  
						formData.append('file', $("input[name='fileName_u']")[i].files[j]);
						
					}
				}
			}
		}
		
		formData.append("${_csrf.parameterName}", "${_csrf.token}");
		
		console.log(">>>>>" , $("input[name='fileName_u']").val());
		console.log("length >>> " , $("input[name='fileName_u']").length);

		//바뀐 ajax
		$.ajax({
			 	url : "/admin/updateRecruit?${_csrf.parameterName}=${_csrf.token}",
 		  	 	type : "POST",
		  	 	data : data,
		 	 	success : function(result){
			 		console.log("result >> ", result);
			 		//파일 변경사항이 있을 경우 실행
			 		if( $("orgFileName_u") != null){
			 			$.ajax({
			  			 	 url : "/admin/insertFile?$",
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
			    		 			msg = "게시글 등록에 성공했습니다.";
			    		 		} else {
			    		 			msg = "게시글 등록에 실패했습니다.";
			    		 		}
			    		 		alert(msg);
			   			  		location.href = "/admin/recruitList?locale="+ $("#locale").val();
			  		  	 	 }
				  		})
			 		} else {
			 			$.ajax({
			  			 	 url : "/admin/insertFile?$",
				  		  	 type : "POST",
			  		  	 	 data : formData,
			  		  	     processData: false,
			  		  	     contentType: false,
			  		  	     enctype: 'multipart/form-data',
			    		 	 success : function(result){
			    		 		console.log("result 333 >> ", result);
			    		 		let msg;
			    		 		if(result == 1){
			    		 			msg = "게시글 등록에 성공했습니다.";
			    		 		} else {
			    		 			msg = "게시글 등록에 실패했습니다.";
			    		 		}
			    		 		alert(msg);
			   			  		location.href = "/admin/recruitList";
			  		  	 	 }
				  		})
			 		}
			 		
		  	 	 }
 		});
	
	
	}
	
function addUpdateContents(){
	$("#addContents_u").append(
			`<tr>
				<td class="menu">소제목</td>
				<td align="left"><input type="text" name="subTitle_u"
				id="subTitle_u" class="form-control input-sm"
				style="width: 50%;" placeholder="소제목을 입력해 주세요."></td>
			</tr>
			<tr>
				<td class="menu">내용</td>
				<td align="left">
					<textarea name="contents_u" id="contents_u"
						rows="10" cols="80" placeholder="내용을 입력해 주세요."></textarea>
				</td>
			</tr>`);
}

$(document).ready(function() {
	
	$("input:checkbox[name='always_u']").on('click', function() {
		
		let chk = $(this).is(":checked");
		let startDay = $('#startDay_u').val();
		let endDay = $('#endDay_u').val();
		
		console.log("수정 버튼누름",chk);
		
		if(chk){
			/* $("input:checkbox[name='always']").prop('checked', true); */
			document.getElementById('startDay_u').disabled = true;
			document.getElementById('endDay_u').disabled = true;
			
		} else {
			console.log("채용일 활성화");
			$("input:checkbox[name='always_u']").prop('checked', false); 
			document.getElementById('startDay_u').disabled = false;
			document.getElementById('endDay_u').disabled = false;
			$('#startDay_u').val(startDay);
			$('#endDay_u').val(endDay);
			
		}
	})
})

</script>
<div class="modal fade" id="modalContent4" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<form name="addPostForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="recruitNo_u" id="recruitNo_u">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabelPortfolio">게시물 수정</h4>
				</div>
				<div class="modal-body">
					<h4>
						<p class="text-light-blue">
							<i class="fa fa-fw fa-info-circle"></i> 채용 글 <span
								id="board_sub_title">수정</span>
						</p>
					</h4>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="menu">제목<span style="color: red;">*</span></td>
								<td align="left"><input type="text" name="title_u"
									id="title_u" class="form-control input-sm"></td>
							</tr>
							<tr>
								<td class="menu">채용 시작일<span style="color: red;">*</span></td>
								<td align="left">
									<input type="date" name="startDay_u" id="startDay_u" class="form-control input-sm" style="width: 50%;">
								</td>
							</tr>
							<tr>
								<td class="menu">채용 마감일<span style="color: red;">*</span></td>
								<td align="left">
								<input type="date" name="endDay_u" id="endDay_u" class="form-control input-sm" style="width: 50%;">
								<input style="zoom:0.7;" type="checkbox" id="always_u" name='always_u' value="R">
									<label style="padding-top: 10px;" for="always_u">상시채용</label>	
								</td>
							</tr>
							<tr>
									<td class="menu">직무명</td>
									<td align="left"><input type="text" name="jobTitle_u"
										id="jobTitle_u" class="form-control input-sm"></td>
								</tr>
								<tr>
									<td class="menu">근무형태</td>
									<td align="left"><input type="text" name="recruitType_u"
										id="recruitType_u" class="form-control input-sm"></td>
								</tr>
							<tr>
								<td class="menu">경력</td>
								<td align="left"><select name="career_u" id="career_u"
									class="form-control input-sm" style="width: 50%;">
										<option value="경력무관" selected="selected">경력무관</option>
										<option value="신입">신입</option>
										<option value="경력">경력</option>
								</select></td>
							</tr>
								<tr>
									<td class="menu">근무지</td>
									<td align="left"><input type="text" name="recruitPlace_u"
										id="recruitPlace_u" class="form-control input-sm"></td>
								</tr>
								<tr>
									<td class="menu">담당자</td>
									<td align="left">
										<textarea name="recruitManager_u" id="recruitManager_u"
												rows="4" cols="80"></textarea>
									</td>
								</tr>
								<tr>
									<td class="menu">직무소개</td>
									<td align="left">
										<textarea name="jobIntro_u" id="jobIntro_u"
												rows="10" cols="80" placeholder="내용을 입력해 주세요."></textarea>
									</td>
								</tr>
								<tr>
									<td class="menu">지원자격</td>
									<td align="left">
										<textarea name="qualification_u" id="qualification_u"
												rows="10" cols="80" placeholder="내용을 입력해 주세요."></textarea>
									</td>
								</tr>
							<!-- 파일 -->
							<tr id="file_u">
							</tr>
						</tbody>
						<tbody id="addContents_u">
						</tbody>
					</table>
					<div>
						<span style="color: red;">*</span>는 필수 항목입니다.
					</div>
				</div>
				<!-- /.modal-body -->
				<div class="modal-footer">
					<button type="button" onclick="addUpdateContents()"
						class="btn btn-primary"
						style="background: rgb(118, 118, 118); border-color: rgb(118, 118, 118);">내용추가</button>
					<button type="button" onclick="updateRecruit()"
						class="btn btn-primary">확인</button>
					&nbsp;&nbsp;&nbsp;
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal fade -->