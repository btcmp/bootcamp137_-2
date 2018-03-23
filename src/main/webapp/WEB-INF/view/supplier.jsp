<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
$(function(){
	//tambah data supplier
	$('#btn-add').click(function() {
		$('#modal-add-supplier').modal();
	});
	
	$('#add').on('click', function(evt){
		evt.preventDefault(); //ini biar gak ngeload terus setelah di klik
		//nama var harus dama kayak entity nya yang di java
		var name = $('#input-supplier-name').val();
		var address = $('#input-address').val(); 
		var province = $('#input-province').val();
		var region = $('#input-region').val();
		var district = $('#input-district').val();
		var postal = $('#input-postal-code').val();
		var phone = $('#input-phone').val();
		var email = $('#input-email').val();
		var supplier = {
			name : name,
			address : address,
			provinceId : {
				id : province
			},
			regionId : {
				id : region
			},
			districtId : {
				id : district
			},
			postalCode : postal,
			phone : phone,
			email : email
		}
		console.log(supplier);
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/save',
				type : 'POST',
				data : JSON.stringify(supplier), //-> proses dari java object ke string
				contentType : 'application/json',
				success : function(data){
					window.location = '${pageContext.request.contextPath}/supplier';
					//alert('save '+name+' berhasil!!');
				}, 
				error : function(){
					alert('save failed!!');
				}
			});  
		
	});
	
	//end tambah data supplier
	$('#btn-edit').click(function() {
		$('#modal-edit-supplier').modal();
	});
	$('#input-region').chained('#input-province');
	$('#input-district').chained('#input-region'); 
	/* $('#input-province').change(function(){
		var id = $('#input-province').val();
		console.log(id);
		$.ajax({
			url : '${pageContext.request.contextPath}/province/get-region/'+id,
			type : 'GET',
			success : function(region){
				$('#input-region').html(region);
			},
			error : function(){
				alert('failed getting data region!!')
			},
			dataType : 'json'
		}); 
	});
	$('#input-region').change(function(){
		var id = $('#input-region').val();
	}); */ 
});
	
</script>
<!-- ==================================================================  BATAS BUAT ISIAN ========================================================================= -->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> SUPPLIER </header>

					<div class="col-sm-9">
						<div class="nav search-row" id="top_menu"
							style="margin-bottom: 30px;">
							<!--  search form start -->
							<ul class="nav top-menu">
								<li>
									<form class="navbar-form">
										<input class="form-control" placeholder="Search" type="text">
									</form>
								</li>
							</ul>
							<!--  search form end -->
						</div>
					</div>
					<div class="col-sm-1" style="float: left; margin-top: 15px;">
						<a class="btn btn-primary" id="btn-export"><span
							class="icon_folder_download"></span> Export</a>
					</div>
					<div class="col-sm-2" style="float: right; margin-top: 15px;">
						<a class="btn btn-primary" id="btn-add"><span
							class="icon_plus_alt"></span> Create</a>
					</div>
					<br>

					<table class="table table-striped table-advance table-hover">
						<tbody>
							<tr>
								<th><i class="icon_profile"></i> Name</th>
								<th><i class="icon_pin_alt"></i> Address</th>
								<th><i class="icon_mobile"></i> Phone</th>
								<th><i class="icon_email_alt"></i> Email</th>
								<th><i class="icon_cogs"></i>Action</th>
							</tr>
							<c:forEach items="${listSupplier }" var="supp">
								<tr>
									<td>${supp.name }</td>
									<td>${supp.address }</td>
									<td>${supp.phone }</td>
									<td>${supp.email }</td>
									<td>
										<div class="btn-group">
											<a class="update btn btn-primary" id="${supp.id }"><i
												class="icon_pencil-edit"></i></a>
										</div>
									</td>
								</tr>
							</c:forEach>
							</section>
							</div>
							</div>
							<!-- page end-->
							</section>
							</section>
							<!--main content end-->
							</section>

							<!-- ===================================================== MODAL INPUT =================================================================== -->
							<!-- Modal -->
							<div aria-hidden="true" aria-labelledby="myModalLabel"
								role="dialog" tabindex="-1" id="modal-add-supplier"
								class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal" class="close"
												type="button">X</button>
											<h4 class="modal-title">Supplier Detail</h4>
										</div>
										<form id="save-form" data-parsley-validation>
											<div class="modal-body" style="height: 350px;">

												<div class="form-group">
													<label for="input-supplier-name">Supplier Name</label> <input
														type="text" class="form-control" id="input-supplier-name"
														aria-describedby="emailHelp" placeholder="Supplier Name">
												</div>
												<div class="form-group ">
													<label for="input-address">Address</label>
													<textarea class="form-control " id="input-address"
														name="input-address" required></textarea>
												</div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="input-province">Province</label> <select
															class="form-control" id="input-province">
															<option value="" selected="selected">-- Choose--</option>
															<c:forEach items="${listProvince }" var="prov">
																<option value="${prov.id }">${prov.name }</option>
															</c:forEach>
														</select>
											 		</div>
													<div class="col-lg-4">
														<label for="input-region">Region</label> <select
															class="form-control" id="input-region">
															<option value="" selected="selected">-- Choose--</option>
															<c:forEach items="${listRegion }" var="reg">
																<option value="${reg.id }">${reg.name }</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-district">District</label> <select
															class="form-control" id="input-district">
															<option value="" selected="selected">-- Choose--</option>
															<c:forEach items="${listDistrict }" var="dis">
															<c:set var="region" value=""></c:set>
																<c:if test=""></c:if>
																<option value="${dis.id }">${dis.name }</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div style="height: 70px;"></div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="input-postal-code">Postal Code</label> <input
															type="text" class="form-control" id="input-postal-code"
															aria-describedby="emailHelp" placeholder="Supplier Name">
													</div>
													<div class="col-lg-4">
														<label for="input-phone">Phone</label> <input type="text"
															class="form-control" id="input-phone"
															aria-describedby="emailHelp" placeholder="Supplier Name">
													</div>
													<div class="col-lg-4">
														<label for="input-email">Email</label> <input type="text"
															class="form-control" id="input-email"
															aria-describedby="emailHelp" placeholder="Supplier Name">
													</div>
												</div>


											</div>
											<div class="modal-footer">
												<button type="reset" class="btn btn-primary">Cancel</button>
												<button type="button" id="add" class="btn btn-primary">Save</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<!-- ===================================================== MODAL =================================================================== -->

							<!-- ===================================================== MODAL EDIT =================================================================== -->
							<!-- Modal -->
							<div aria-hidden="true" aria-labelledby="myModalLabel"
								role="dialog" tabindex="-1" id="modal-edit-supplier"
								class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal" class="close"
												type="button">X</button>
											<h4 class="modal-title">Supplier Detail</h4>
										</div>
										<form id="save-form" data-parsley-validation>
											<div class="modal-body" style="height: 350px;">
												<input type="hidden" id="input-id">
												<div class="form-group">
													<label for="input-supplier-name">Supplier Name</label> <input
														type="text" class="form-control" id="edit-supplier-name"
														aria-describedby="emailHelp" placeholder="Supplier Name">
												</div>
												<div class="form-group ">
													<label for="input-address">Address</label>
													<textarea class="form-control " id="edit-address"
														name="input-address" required></textarea>
												</div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="input-province">Province</label> <select
															class="form-control" id="edit-province">
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-region">Region</label> <select
															class="form-control" id="edit-region">
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-district">District</label> <select
															class="form-control" id="edit-district">
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
												</div>
												<div style="height: 70px;"></div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="input-postal-code">Postal Code</label> <input
															type="text" class="form-control" id="edit-postal-code"
															aria-describedby="emailHelp" placeholder="Supplier Name">
													</div>
													<div class="col-lg-4">
														<label for="input-phone">Phone</label> <input type="text"
															class="form-control" id="edit-phone"
															aria-describedby="emailHelp" placeholder="Supplier Name">
													</div>
													<div class="col-lg-4">
														<label for="input-email">Email</label> <input type="text"
															class="form-control" id="edit-email"
															aria-describedby="emailHelp" placeholder="Supplier Name">
													</div>
												</div>


											</div>
											<div class="modal-footer">
												<button type="reset" class="btn btn-primary">Cancel</button>
												<button type="button" id="add" class="btn btn-primary">Save</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<!-- ===================================================== MODAL =================================================================== -->

<%@ include file="topping/bottom.jsp"%>