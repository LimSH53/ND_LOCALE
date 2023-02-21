			<footer class="main-footer">
				<div class="pull-right hidden-xs">
				    <b>Version</b> 2.7.4
				</div>
				<strong>NDC&C<a href="/admin">  All Rights Reserved. 2023  </a> Phone 031-712-8315 | Fax 031-789-3545</strong>
			</footer>
		</div>
		<script src="${pageContext.request.contextPath }/resources/admin/js/script.js"></script>
		<!-- jQuery 3 -->
		<script src="${pageContext.request.contextPath}/resources/admin/js/jquery.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/adminlte.min.js"></script>
		<!-- Sparkline -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/jquery.sparkline.min.js"></script>
		<!-- jvectormap  -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/admin/js/jquery-jvectormap-world-mill-en.js"></script>
		<!-- SlimScroll -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/jquery.slimscroll.min.js"></script>
		<!-- ChartJS -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/Chart.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="${pageContext.request.contextPath }/resources/admin/js/demo.js"></script>
		<script src="${pageContext.request.contextPath }/resources/admin/js/jquery-ui.min.js"></script>
		<script src="${pageContext.request.contextPath }/resources/admin/js/common.js" type="text/javascript" charset="utf-8"></script>
		<!-- plupload -->
		<script src="${pageContext.request.contextPath}/resources/admin/plupload/js/plupload.full.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/plupload/js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/plupload/js/i18n/ko.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css">
	
		<script language='javascript' src='//www.gstatic.com/charts/loader.js'></script>
		
        <script type="text/javascript">
	        var objEditor = CKEDITOR.replace('editor', {
	        		filebrowserImageUploadUrl: '/admin/board/imageUpload?${_csrf.parameterName}=${_csrf.token}',
	          		filebrowserUploadUrl:'/admin/board/imageUpload?${_csrf.parameterName}=${_csrf.token}',
	        		fillEmptyBlocks : true}
			);             	
	        $.fn.modal.Constructor.prototype.enforceFocus = function () {
	        	modal_this = this
	        	$(document).on('focusin.modal', function (e) {
	        	if (modal_this.$element[0] !== e.target && !modal_this.$element.has(e.target).length && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_select') && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_text')) {
	                modal_this.$element.focus()
	            }
	         })
	        }		                 	
		</script>    		
	</body>
</html>