<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.fn.dataTable.ext.classes.sPageButton = 'btn btn-primary';
	$('#tbl-outlet').DataTable({
		searching : false, 
		bFilter: false, 
		iDisplayLength: 10, // display max 10
		oLanguage: {
		   sLengthMenu: "",
		}
	});
	
	// CREATE NEW OUTLET
	$('#btn-create').click(function() {
		$('#modal-create').modal();
	});
	
	// EXECUTE = SAVE
	$('#btn-save').on('click', function(evt){
		evt.preventDefault();
		var form = $('#target');
		var valid = form.parsley().validate();
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
		if (valid == true) {
				$.ajax({
				  	url : '${pageContext.request.contextPath}/outlet/get-all',
					type : 'GET',
					success : function(data) {
						var sameEmail = 0;
						var sameName = 0;
						
				$(data).each(function(index,data2) {
					if (outlet.email.toLowerCase() == data2.email.toLowerCase()) {
							sameEmail++;
					} else if (outlet.name.toLowerCase() == data2.name.toLowerCase()) {
							sameName++;
					}
				});
				if (sameEmail > 0) {
					alert('Email already exists');
				} else if (sameName > 0) {
					alert('Name already exists');
				} else {
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
				}
					},
					error : function() {
						alert('failed');
					}
				});
			} else {
				alert('Complete your form');
			}
	});
		
	
	// EDIT OUTLET
	$('.btn-edit').click(function(evt) {
		evt.preventDefault();
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
	$('#btn-save-edit').click(function(evt){
		evt.preventDefault();
		var form = $('#target2');
		var valid = form.parsley().validate();
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
		if (valid == true) {
			$.ajax({
			  	url : '${pageContext.request.contextPath}/outlet/get-all',
				type : 'GET',
				success : function(data) {
					var sameEmail = 0;
					var sameName = 0;
					
			$(data).each(function(index,data2) {
				if (parseInt(data2.id)!==parseInt(outlet.id)) {
						if (outlet.email.toLowerCase() == data2.email.toLowerCase()) {
								sameEmail++;
						} else if (outlet.name.toLowerCase() == data2.name.toLowerCase()) {
								sameName++;
						}
				}
			});
			if (sameEmail > 0) {
				alert('Email already exists');
			} else if (sameName > 0) {
				alert('Name already exists');
			} else {
				  $.ajax({
						url : '${pageContext.request.contextPath}/outlet/update',
						type :'PUT',
						data : JSON.stringify(outlet),
						contentType : 'application/json',
						success: function(data){
						window.location='${pageContext.request.contextPath}/outlet';
						}, error : function(){
							alert('saving failed')	
						}
				  });
			}
				},
				error : function() {
					alert('failed');
				}
			});
		} else {
			alert('Complete your form');
		}
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
					$('#input-region').html(listRegion); // untuk mengisi dropdown region
					$('#input-region').removeAttr('disabled'); // untuk membuka disabled
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
					$('#input-district').html(listDistrict); // untuk mengisi dropdown district
					$('#input-district').removeAttr('disabled'); // untuk membuka disabled
				},
				error : function(){
					alert('failed to get data district');
				}
				
			});
		}
	});
	
	// EDIT REGION DAN DISTRICT
	$('#edit-province').change(function(){
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
				
					$('#edit-region').html(listRegion);
				},
				error : function(){
					alert('failed to get data region');
				}
			});
		}
	});
	
	$('#edit-region').change(function(){
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
				
					$('#edit-district').html(listDistrict);
					
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
		console.log(word);
		window.location="${pageContext.request.contextPath}/outlet/search?search="+word;
 	});
 	
 	// EXPORT
 	$('#btn-export').click(function(){
		window.open('${pageContext.request.contextPath}/generate/outlet');
	});
});
		
</script>


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
						<div class="col-lg-7" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary" id="btn-search"> Search</button>
						</div>
						<div class="col-lg-1" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary" id="btn-export">Export</button>
						</div>
						<div class="col-lg-1" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary" id="btn-create">Create</button>
						</div>

						<!-- ============================= TABLE ================================= -->
								<table class="table table-bordered" id="tbl-outlet">
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
													<form id="target" data-parsley-validate >
													<div class="modal-body" style="height: 180px;">
															<div class="input">
																	<input type="hidden" id="input-id" name="input-id" />
																	<input class="col-lg-12" id="input-outletName" data-parsley-required="true"
																		type="text" style="margin-bottom: 10px;" placeholder="Outlet Name"
																		data-parsley-required
																		pattern="([A-z0-9\s]){2,20}$">
																	<textarea class="col-lg-12" id="input-address" data-parsley-required="true"
																		type="text" style="margin-bottom: 10px;" placeholder="Address"
																		pattern="^[0-9a-zA-Z. ]+$"></textarea>
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<select class="form-control" id="input-province" data-parsley-required="true">
																	<c:forEach var="prov" items= "${provs}" >
																			<option 
																					value="${prov.id}">${prov.name}		
																			</option>
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
																	<input type="text" id="input-postalCode" data-parsley-required="true"
																		style="margin-bottom: 10px;" placeholder="Max 5" 
																		placeholder="Postal Code" pattern="([0-9]){5}$">
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="input-phone" data-parsley-required="true"
																		style="margin-bottom: 10px;"placeholder="XXX-XXXXXXXX" 
																		pattern="^\d{3}-\d{8,10}$">
															</div>
															<div class="col-lg-4" style="margin-bottom: 10px;">
																	<input type="text" id="input-email" data-parsley-required="true"
																		style="margin-bottom: 10px;" placeholder="Email"
																		pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
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
													<form id="target2" data-parsley-validate>
													<div class="modal-body" style="height: 180px;">
													<div class="edit">
															<input type="hidden" name="edit-id" id="edit-id">
															<input data-parsley-required="true"
																class="col-lg-12" id="edit-outletName" type="text"style="margin-bottom: 10px;" 
																data-parsley-required="true" placeholder="Outlet Name"
																pattern="([A-z0-9\s]){2,20}$">
																	
															<textarea data-parsley-required="true"
																class="col-lg-12" id="edit-address" type="text" style="margin-bottom: 10px;" 
																data-parsley-required="true" placeholder="Address"
																pattern="^[0-9a-zA-Z. ]+$"></textarea>
																
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<select class="form-control" id="edit-province" data-parsley-required="true">
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
															<input type="text" id="edit-postalCode" style="margin-bottom: 10px;" 
																data-parsley-required="true"placeholder="Max 5"
																pattern="([0-9]){5}$">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<input type="text" id="edit-phone" style="margin-bottom: 10px;"
																data-parsley-required="true" placeholder="XXX-XXXXXXXX"
																pattern="^\d{3}-\d{8,10}$">		
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
															<input type="text" id="edit-email" style="margin-bottom: 10px;" 
																data-parsley-required="true" placeholder="Email"
																pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
															
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

<%@ include file="topping/bottom.jsp"%>
