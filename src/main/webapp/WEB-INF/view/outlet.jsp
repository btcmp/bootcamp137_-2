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
<title>Form Outlet</title>

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
$(document).ready(function(){
	
	// CREATE NEW OUTLET
	$('#btn-create').click(function() {
		$('#modal-create').modal();
	});
	
	// EXECUTE = SAVE
	$('#btn-save').on('click', function(evt){
		evt.preventDefault();
		var form = $('#target');
			var outlet = {
					name : $('#input-outletName').val(),
					address : $('#input-address').val(),
					phone : $('#input-phone').val(),
					email : $('#input-email').val(),
					postalCode :  $('#input-postalCode').val(),
					province : {
							id : $('#input-province').val()
					},
					region : {
							id : $('#input-region').val()
					},
					district : {
							id : $('#input-district').val()
					}
			}
			console.log(outlet);     
	
		  $.ajax({
				url : '${pageContext.request.contextPath}/outlet/save',
				type :'POST',
				data : JSON.stringify(outlet),
				contentType : 'application/json',
				success: function(data){
				window.location='${pageContext.request.contextPath}/outlet';
				}, error : function(){
					alert('saving failed')	
				}
		}); 
	}); 
	
	
	// EDIT OUTLET
	$('.btn-edit').click(function() {
		var id = $(this).attr('id');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/outlet/get-one/'+id,
			type :'GET',
			success: function(outlet){
				setEditOutlet(outlet);
				$('#modal-edit').modal();
			},
			error : function(){
				alert('failed update')	
			},
			dataType :'json'
		});
	});
	
	// SET UP DATA EDIT
	function setEditOutlet(out){
		$('#edit-id').val(out.id);
		$('#edit-outletName').val(out.name);
		$('#edit-address').val(out.address);
		$('#edit-phone').val(out.phone);
		$('#edit-email').val(out.email);
		$('#edit-postalCode').val(out.postalCode);
		$('#edit-province').val(out.province.id);
		$('#edit-region').val(out.region.id);
		$('#edit-district').val(out.district.id);
	}
	
	// EXECUTE = SAVE-EDIT
	$('#btn-save-edit').click(function(){
		var outlet = {
				id : $('#edit-id').val(),
				name : $('#edit-outletName').val(),
				address : $('#edit-address').val(),
				phone : $('#edit-phone').val(),
				email : $('#edit-email').val(),
				postalCode :  $('#edit-postalCode').val(),
				province : {
						id : $('#edit-province').val()
				},
				region : {
						id : $('#edit-region').val()
				},
				district : {
						id : $('#edit-district').val()
				}
		}
		$.ajax({
			url : '${pageContext.request.contextPath}/outlet/update',
			type :'PUT',
			data : JSON.stringify(outlet),
			contentType :'application/json',
			success: function(data){
				window.location='${pageContext.request.contextPath}/outlet';
			},
			error : function(){
				alert('update failed');	
			}
		});
	});
	
	// SELECT PROVINCE
	// menampilkan region berdasarkan provinsi yang dipilih
	$('#input-region').attr('disabled', 'disabled');
	$('#input-district').attr('disabled', 'disabled');
	$('#input-province').change(function(){
		var id = $(this).val();
		console.log(id);
		if(!id==""){
			$.ajax({
				url : '${pageContext.request.contextPath}/province/get-region/'+id,
				type : 'GET',
				success : function(data){
					var listRegion = [];
					var choose = "<option value=''>-- Choose --</option>";
					listRegion.push(choose);
					$(data).each(function(index, value){
						var isi = "<option value='"+value.id+"'>"+value.name+"</option>";
						listRegion.push(isi);
					});
					$('#input-region').html(listRegion);
					$('#input-region').removeAttr('disabled');
				},
				error : function(){
					alert('failed to get data region');
				}
				
			});
		}
	});
	
	// SELECT REGION
	// menampilkan district berdasarkan region yang dipilih
	$('#input-region').change(function(){
		var id = $(this).val();
		console.log(id);
		if(!id==""){
			$.ajax({
				url : '${pageContext.request.contextPath}/province/get-district/'+id,
				type : 'GET',
				success : function(data){
					var listDistrict = [];
					var choose = "<option value=''>-- Choose --</option>";
					listDistrict.push(choose);
					$(data).each(function(index, value){
						var isi = "<option value='"+value.id+"'>"+value.name+"</option>";
						listDistrict.push(isi);
					});
					$('#input-district').html(listDistrict);
					$('#input-district').removeAttr('disabled');
				},
				error : function(){
					alert('failed to get data district');
				}
				
			});
		}
	});
	

 	// SEARCH
 	$('#btn-search').on('click', function(){
		var word =$('#search').val();
		window.location="${pageContext.request.contextPath}/outlet/search?search="+word;
 	});
 	
 	
});
		
</script>
</head>
<body>

<!-- ============================================================= ISIAN ======================================================================= -->
	<!--main content start-->
	<section id="main-content">
			<section class="wrapper">
				<div class="row">
						<div class="col-lg-12">
								<h3 class="page-header"><i class="fa fa-files-o"></i> Form Outlet</h3>
						</div>
				</div>
				<div class="row">
				<div class="col-lg-12">
						<section class="panel">
						<header class="panel-heading"> Outlets </header>
						<div class="panel-body">
						<div class="row">
						<div class="col-lg-3" style="margin-bottom: 10px;">
								<ul class="nav top-menu">
										<li>
											<form class="navbar-form">
													<input class="form-control" id="search" placeholder="Search" type="text">
											</form>
										</li>
								</ul>
						</div>
						<div class="col-lg-8" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary" id="btn-search"> Search</button>
						</div>
						<div class="col-lg-1" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary" id="btn-create">Create</button>
						</div>

						<!-- ============================= TABLE ================================= -->
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Name</th>
											<th>Address</th>
											<th>Phone</th>
											<th>Email</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items ="${outs}" var="out">
										<tr>
											<td>${out.name}</td>
											<td>${out.address}</td>
											<td>${out.phone}</td>
											<td>${out.email}</td>
											<td><a id="${out.id}" href="#" class="btn-edit" > Edit </a></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
						<!-- ============================== BATAS TABLE ============================= -->
								
								
						<div class="form">
								<form class="form-validate form-horizontal" id="feedback_form" method="get" action=""></form>
						</div>
						</div>
						</section>
				</div>
				</div>
			<!-- page end-->
		</section>
	</section>
	<!--main content end-->
	<!-- ======================================================= BATAS ISIAN ============================================================================ -->
	

									<!-- ======================================== Modal CREATE =================================================================-->
									<div class="modal fade" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"aria-hidden="true">
											<div class="modal-dialog" role="document">
											<div class="modal-content">
													<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h5 class="modal-title" id="exampleModalLabel">Input Outlet</h5>
													</div>
													<form id="target" action="${pageContext.request.contextPath }/outlet/save" method="POST">
													<div class="modal-body" style="height: 180px;">
															<div class="input">
																	<input type="hidden" id="input-id" name="input-id" />
																	<input class="col-lg-12" id="input-outletName" type="text"style="margin-bottom: 10px;" placeholder="Outlet Name">
																	<textarea class="col-lg-12" id="input-address" type="text" style="margin-bottom: 10px;" placeholder="Address"></textarea>
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<select class="form-control" id="input-province">
																	<c:forEach var="prov" items= "${provs}">
																			<option value="${prov.id}">${prov.name}</option>
																	</c:forEach>
																	</select>
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<select class="form-control" id="input-region">
																	<c:forEach var="reg" items= "${regs}">
																		<option value="${reg.id}">${reg.name}</option>
																	</c:forEach>
																	</select>
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<select class="form-control" id="input-district">
																	<c:forEach var="dis" items= "${diss}">
																			<option value="${dis.id}">${dis.name}</option>
																	</c:forEach>
																	</select>
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="input-postalCode" style="margin-bottom: 10px;" placeholder="Postal Code">
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="input-phone" style="margin-bottom: 10px;"placeholder="Phone">
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="input-email" style="margin-bottom: 10px;" placeholder="Email">
															</div>
													</div>
													<div class="modal-footer">
															<div class="col-lg-10">
																	<button type="reset" class="btn btn-primary">Cancel</button>
															</div>
															<div class="col-lg-2">
																	<button type="button" id="btn-save" class="btn btn-primary">Save</button>
															</div>
													</div>
													</form>
											</div>
										</div>

									</div>
									<!-- ================================================= MODAL CREATE END =============================================== -->
									
									<!-- =================================================== MODAL EDIT =====================================================-->
									<div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h5 class="modal-title" id="exampleModalLabel">Edit Outlet</h5>
											</div>
													<form>
													<div class="modal-body" style="height: 180px;">
													<div class="edit">
															<input type="hidden" name="edit-id" id="edit-id">
															<input class="col-lg-12" id="edit-outletName" type="text"style="margin-bottom: 10px;" placeholder="Outlet Name">
															<textarea class="col-lg-12" id="edit-address" type="text" style="margin-bottom: 10px;" placeholder="Address"></textarea>
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<select class="form-control" id="edit-province">
															<c:forEach var="prov" items= "${provs}">
																	<option value="${prov.id}">${prov.name}</option>
															</c:forEach>
															</select>
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<select class="form-control" id="edit-region">
															<c:forEach var="reg" items= "${regs}">
																<option value="${reg.id}">${reg.name}</option>
															</c:forEach>
															</select>
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<select class="form-control" id="edit-district">
															<c:forEach var="dis" items= "${diss}">
																	<option value="${dis.id}">${dis.name}</option>
															</c:forEach>
															</select>
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<input type="text" id="edit-postalCode" style="margin-bottom: 10px;" placeholder="Postal Code">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<input type="text" id="edit-phone" style="margin-bottom: 10px;"placeholder="Phone">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<input type="text" id="edit-email" style="margin-bottom: 10px;" placeholder="Email">
													</div>
													</div>
													<div class="modal-footer">
													<div class="col-lg-10">
															<button type="reset" class="btn btn-primary">Cancel</button>
													</div>
													<div class="col-lg-2">
															<button type="button" id="btn-save-edit" class="btn btn-primary">Save</button>
													</div>
													</div>
													</form>
											</div>
										</div>
									</div> 
									<!-- ================================================= MODAL EDIT END ============================================================ -->

</body>
</html>
