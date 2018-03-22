<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="img/favicon.png">
<spring:url value="/resources/jquery-3.3.1.min.js" var="jq"></spring:url>
<spring:url value="/resources/js1/parsley.min.js" var="parsley"></spring:url>
<title>Form Category</title>

<!-- Bootstrap CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/css/elegant-icons-style.css" rel="stylesheet" />
<link href="resources/css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet" />

<!-- javascripts -->
<script type="resources/text/javascript" src="${jq }"></script>
<script type="resources/text/javascript" src="${parsley }"></script>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="resources/js/jquery.scrollTo.min.js"></script>
<script src="resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- jquery validate js -->
<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>

<!-- custom form validation script for this page-->
<script src="resources/js/form-validation-script.js"></script>
<!--custome script for all page-->
<script src="resources/js/scripts.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->

<script type="text/javascript">
	$(function() {
		// menampilkan pop up create
		$('#btn-create').click(function() {
			$('#modal-create').modal();
		});
		// save1 = pada create
		$('#btn-save').on('click', function(evt){
			evt.preventDefault();
			var form = $('#target');
			//var valid =form.parsley().validate();
				var cat = {
						name : $('#input-categoryName').val()
				}
				console.log(cat);
				//if(valid==true){     
		
			 // ajax save
			 $.ajax({
					url : '${pageContext.request.contextPath}/category/save',
					type :'POST',
					data : JSON.stringify(cat),
					contentType : 'application/json',
					success: function(data){
					window.location='${pageContext.request.contextPath}/category';
					}, error : function(){
						alert('saving failed')	
					}
			}); 
 			//}
		});  
			
			
		// menampilkan pop up view/edit
		$('.btn-view').click(function() {
			var id = $(this).attr('id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/category/get-one/'+id,
				type :'GET',
				success: function(cat){
					setEditCategory(cat);
					$('#modal-view').modal();
				},
				error : function(){
					alert('failed update')	
				},
				dataType :'json'
			});
		});
		function setEditCategory(cat){
			$('#edit-id').val(cat.id);
			$('#edit-categoryName').val(cat.name);
		}
		// eksekusi edit
		$('#btn-save2').click(function(){
			var cat={
				id : $('#edit-id').val(),
				name : $('#edit-categoryName').val()
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/category/update',
				type :'PUT',
				data : JSON.stringify(cat),
				contentType :'application/json',
				success: function(data){
					window.location='${pageContext.request.contextPath}/category';
				},
				error : function(){
					alert('update failed');	
				}
			});
	});
		
		
		
		
	});
</script>
</head>

<body>

	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">
						<i class="fa fa-files-o"></i> Form Category
					</h3>
				</div>
			</div>

			<!-- ========================== Form Category================================== -->

			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> Category </header>
						<div class="panel-body">
							<div class="row">
								<!-- =============== Search ====================== -->
								<div class="col-lg-10" style="margin-bottom: 10px;">
									<ul class="nav top-menu">
										<li>
											<form class="navbar-form">
												<input class="form-control" placeholder="Search" type="text">
											</form>
										</li>
									</ul>

								</div>
								<!-- =============== Button Create ====================== -->
								<div class="col-lg-2" style="margin-bottom: 10px;">
									<button type="button" class="btn btn-primary" id="btn-create">Create</button>



									<!--======================= Modal CREATE=====================================-->
									<div class="modal fade" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h5 class="modal-title" id="exampleModalLabel">Category</h5>
												</div>
												
												
												<form id="target" action="${pageContext.request.contextPath }/category/save" method="POST">
													<div class="modal-body">
													<input class="col-lg-12" id="input-categoryName" type="text" placeholder="Category Name">
												
												</div>
												<div class="modal-footer">
													<div class="col-lg-2">
														<button type="reset" class="btn btn-primary">Cancel</button>
													</div>
													<div class="col-lg-10">
														<button type="button" id="btn-save" class="btn btn-primary">Save</button>
													</div>
												</div>
												</div>
												</form>
											</div>
										</div>

									</div>
									<!-- modal CREATE end -->
									
									
								</div>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Category Name</th>
											<th>Items Stock</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items ="${cats}" var="cat">
										<tr>
											<td>${cat.name}</td>
											<td></td>
											<td><a id="${cat.id}" href="#" class="btn-view"> View </a> 
											
											
												<!-- ============================ Modal VIEW ===========================-->
												<div class="modal fade" id="modal-view" tabindex="-1"
													role="dialog" aria-labelledby="modalEditLabel"
													aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h5 class="modal-title" id="exampleModalLabel">Category</h5>
															</div>
															<form>
															<div class="modal-body">
																<input type="hidden" name="edit-id" id="edit-id">
																<input id="edit-categoryName" class="col-lg-12"  type="text" placeholder="Category Name">
															</div>
															<div class="modal-footer">
																<div class="col-lg-1">
																	<button type="button" class="btn btn-danger">X</button>
																</div>
																<div class="col-lg-9">
																	<button type="reset" class="btn btn-primary">Cancel</button>
																</div>
																<div class="col-lg-2">
																	<button id="btn-save2" type="button" class="btn btn-primary">Save</button>

																</div>
															</div>
															</form>
														</div>
													</div>

												</div> <!-- modal VIEW end --></td>
										</tr>
									 </c:forEach>
									</tbody>
								</table>
								<!--  table end -->
								<div class="form">
									<form class="form-validate form-horizontal" id="feedback_form"
										method="get" action=""></form>
								</div>

							</div>
					</section>
				</div>
			</div>

			<!-- page end-->
		</section>
	</section>
	<!--main content end-->
	</section>
	<!-- container section end -->



</body>
</html>
