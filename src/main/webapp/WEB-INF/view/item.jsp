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
<title>Form Items</title>

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
		
		// btn-add untuk menampilkan addvariant ke table variant
		$('#btn-add').click(function(){
			var varname  = $('#input-varname').val();
			var uprice  = $('#input-uprice').val();
			var sku  = $('#input-sku').val();
			var beginning = $('#input-beginning').val();
			
			var variant = {
				name : varname,
				price : uprice,
				sku : sku
			};
			var inventory = {
				beginning : $('#input-beginning').val()
			};
			
			var add = "<tr><td>" + varname + "</td><td>" + uprice + "</td><td>" + sku + "</td><td>" + beginning + 
					  "</td><td><a class='btn-edit' href='#'> Edit</a><button type='button' class='btn btn-danger'> X </button></td></tr>";
			$("#tbody-addvar").append(add);
		}); 
		
		// mengambil nilai untuk edit add variant
		$(document).on('click', '.btn-edit', function(){
			var element = $(this).parent().parent().find("td");
			var varname = element.eq(0);
			var uprice = element.eq(1);
			var sku = element.eq(2);
			var beginning = element.eq(3);
			
			var variant = {
				name : varname.text(),
				price : uprice.text(),
				sku : sku.text(),
				active : 0
			};
			console.log(variant);
			$('#modalEdit').modal();
				/* $('#edit-varname').val();
				$('#edit-uprice').val();
				$('#edit-sku').val(); */
				
				/* var varname  = $('#edit-varname').val();
				var uprice  = $('#edit-uprice').val();
				var sku  = $('#edit-sku').val(); */
				
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
					<h3 class="page-header"><i class="fa fa-files-o"></i> Form Items</h3>
				</div>
			</div>
			<!-- Form Items -->
			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> Items </header>
						<div class="panel-body">
							<div class="row">
							<!-- ========================== Search ================================= -->
								<div class="col-lg-10" style="margin-bottom: 10px;">
									<ul class="nav top-menu">
										<li>
											<form class="navbar-form">
												<input class="form-control" placeholder="Search" type="text">
											</form>
										</li>
									</ul>
								</div>
								
								<!-- ======================= Button Export ======================= -->
								<div class="col-lg-1" style="margin-bottom: 10px;">
									<button type="button" class="btn btn-primary">Export</button>
								</div>
								<!--  ======================= Create ============================= -->
								<div class="col-lg-1" style="margin-bottom: 10px;">
									<button type="button" class="btn btn-primary" id="btn-create" >Create</button>


									<!-- ================================ Modal CREATE ============================-->
									<div class="modal fade" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h5 class="modal-title" id="exampleModalLabel">Items</h5>
												</div>
															
											<form id="target" action="${pageContext.request.contextPath }/item/save" method="POST">									
												<div class="modal-body">
													<div id="input">
														<input class="col-lg-4" type="image" id="myimage"
															src="gambar-baju.jpg" style="width: 100px; height: 60px;" />
														<input class="col-lg-8" type="text" style="margin-bottom: 10px;" placeholder="Item Name">
														<select class="col-lg-8" type="text" path="category.id" class="form-control" id="input-category" >
															<c:forEach var="cat" items="${cats}">
																<option value="${cat.id}">${cat.name}</option>
															</c:forEach>
														</select>
													</div>
													<div style = "clear:both;"></div>

													<div class="col-lg-8" style="margin-bottom: 10px;">
														<h5>Variant</h5>
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#modalAddVariant">Add Variant</button>

													</div>
													
													<!-- ================ TABLE ===================== -->
													<table class="table table-bordered" id="tbl-addvar1">
														<thead>
															<tr>
																<th>Variant Name</th>
																<th>Unit Price</th>
																<th>SKU</th>
																<th>Beginning Stock</th>
																<th>#</th>
															</tr>
														</thead>
														<tbody id="tbody-addvar">
														</tbody>
													</table>
													<!-- ===================== table end =================== -->


												</div>

												<div class="modal-footer">
													<div class="col-lg-2">
														<button type="button" class="btn btn-primary">Back</button>
													</div>
													<div class="col-lg-5">
														<button type="button" class="btn btn-primary">Cancel</button>
													</div>
													<div class="col-lg-5">
														<button type="button" class="btn btn-primary">Save</button>
													</div>
												</div>
											 </form>
											</div>
										</div>
									</div>
									<!-- modal CREATE end -->

									<!-- ===================================== Modal Add Variant ==============================-->
									<div class="modal fade" id="modalAddVariant" tabindex="-1"
										role="dialog" aria-labelledby="modalEditLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h5 class="modal-title" id="exampleModalLabel">
														<center>Add Variant</center>
													</h5>

												</div>
												<div class="modal-body" style="height: 110px">
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<input type="text" id="input-varname" placeholder="Variant Name">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<input type="text" id="input-uprice" placeholder="Unit Price">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<input type="text" id="input-sku" placeholder="SKU">
													</div>
													<div class="hr" style="margin-left: 20px;">
														<hr>
														Set Beginning Stock
														</hr>
													</div>

													<div class="col-lg-6" style="margin-bottom: 10px;">
														<input type="text" id=input-beginning" placeholder="Beginning Stock">
													</div>
													<div class="col-lg-6" style="margin-bottom: 10px;">
														<input type="text" id="input-alertart" placeholder="Alert At">
													</div>


												</div>
												<div class="modal-footer">
													<div class="col-lg-10">
														<button type="button" class="btn btn-primary">Cancel</button>
													</div>
													<div class="col-lg-2">
														<button type="button" id="btn-add" class="btn btn-primary">Add</button>

													</div>
												</div>
											</div>

										</div>
										<!-- modal Add Variant end -->
									</div>



								</div>


								<!-- ============================ TABLE ============================= -->
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Name</th>
											<th>Category</th>
											<th>Unit Price</th>
											<th>In Stock</th>
											<th>Stock Alert</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><a href="" data-toggle="modal"data-target="#modalEdit2"> Edit </a> 
												
									<!-- ============================================= Modal EDIT =========================================-->
												<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="modalEditLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h5 class="modal-title" id="exampleModalLabel">
																	<center>Edit Variant</center>
																</h5>

															</div>
															<div class="modal-body" style="height: 110px">
																<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="edit-varname" placeholder="Variant Name">
																</div>
																<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="edit-uprice" placeholder="Unit Price">
																</div>
																<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="edit-sku"  placeholder="SKU">
																</div>
																<div class="hr" style="margin-left: 20px;">
																	<hr>
																	Set Beginning Stock
																	</hr>
																</div>

																<div class="col-lg-6" style="margin-bottom: 10px;">
																	<input type="text" id="edit-beginning" placeholder="Beginning Stock">
																</div>
																<div class="col-lg-6" style="margin-bottom: 10px;">
																	<input type="text" id="edit-alert" placeholder="Alert At">
																</div>

															</div>
															<div class="modal-footer">
																<div class="col-lg-10">
																	<button type="button" class="btn btn-primary">Cancel</button>
																</div>
																<div class="col-lg-2">
																	<button type="button" class="btn btn-primary">Add</button>

																</div>
															</div>

														</div>


													</div>
													<!-- modal EDIT end --></td>
										</tr>
									</tbody>
								</table>
								<!--  table end -->


								<!-- ================= Modal EDIT UTAMA =================== -->
								<div class="modal fade" id="modalEdit2" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h5 class="modal-title" id="exampleModalLabel">Items</h5>

											</div>
											<div class="modal-body">
												<div id="input">
													<input class="col-lg-4" type="image" id="myimage"
														src="gambar-baju.jpg" style="width: 100px; height: 60px;" />
													<input class="col-lg-8" type="text"
														style="margin-bottom: 10px;" placeholder="Item Name">
													<select class="col-lg-8" type="text"
														style="margin-bottom: 10px;">
														<option>Category 1</option>
														<option>Category 2</option>
														<option>Category 3</option>
													</select>
												</div>

												<div class="col-lg-8" style="margin-bottom: 10px;">
													<h5>VARIANT</h5>
												</div>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#modalAddVariant2">Add
														Variant</button>
												</div>

												<table class="table table-bordered">
													<thead>
														<tr>
															<th>Variant Name</th>
															<th>Unit Price</th>
															<th>SKU</th>
															<th>Beginning Stock</th>
															<th>#</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td><a href="" data-toggle="modal"
																data-target="#modalEdit3"> Edit </a>
																<button type="button" class="btn btn-danger">X
																</button></td>
														</tr>
													</tbody>
												</table>
												<!--  table end -->


											</div>

											<div class="col-lg-12">
												<button type="button" class="btn btn-danger">Del</button>
											</div>

											<div class="modal-footer">
												<div class="col-lg-2">
													<button type="button" class="btn btn-primary">Back</button>
												</div>
												<div class="col-lg-5">
													<button type="button" class="btn btn-primary">Cancel</button>
												</div>
												<div class="col-lg-5">
													<button type="button" class="btn btn-primary">Save</button>
												</div>
											</div>

										</div>
									</div>

								</div>
								<!-- modal CREATE end -->




								<!-- Modal EDIT didalam edit utama-->
								<div class="modal fade" id="modalEdit3" tabindex="-1"
									role="dialog" aria-labelledby="modalEditLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h5 class="modal-title" id="exampleModalLabel">
													<center>Edit Variant</center>
												</h5>

											</div>

											<div class="modal-body" style="height: 110px">
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<input type="text" placeholder="Variant Name">
												</div>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<input type="text" placeholder="Unit Price">
												</div>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<input type="text" placeholder="SKU">
												</div>
												<div class="hr" style="margin-left: 20px;">
													<hr>
													Set Beginning Stock
													</hr>
												</div>

												<div class="col-lg-6" style="margin-bottom: 10px;">
													<input type="text" placeholder="Beginning Stock">
												</div>
												<div class="col-lg-6" style="margin-bottom: 10px;">
													<input type="text" placeholder="Alert At">
												</div>

											</div>
											<div class="modal-footer">
												<div class="col-lg-10">
													<button type="button" class="btn btn-primary">Cancel</button>
												</div>
												<div class="col-lg-2">
													<button type="button" class="btn btn-primary">Add</button>

												</div>
											</div>


										</div>

									</div>
									<!-- modal EDIT end -->




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



</body>
</html>
