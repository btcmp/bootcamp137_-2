<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
$(function(){
	$.validate();
	$('#input-supplier-name').on('input', function() {
		var input=$(this);
		var name = $(this).val();
		if(name != ""){
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/search-name-valid/'+name,
				type : 'GET',
				success : function(data){
					if(data.length != 0){
						input.removeClass("valid").addClass("namaSama");
						console.log(data.length);
					}else{
						var re = /[a-zA-Z]/;
						var is_valid=re.test(name);
						if(is_valid){
							input.removeClass("invalid").addClass("valid");
						}
						else{
							input.removeClass("valid").addClass("textonly");
						}
					}
					
				},
				error : function(){}
			});
		}else{
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//validasi email
	$('#input-email').on('input', function() {
		var input=$(this);
		var email = $(this).val().toString();
		console.log("email : "+email);
		if(email != ""){
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/search-email-valid/'+email,
				type : 'GET',
				success : function(data){
					if(data == "ada"){
						input.removeClass("valid").addClass("emailSama");
						console.log(data);
					}else{
						var re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
						var is_valid=re.test(email);
						if(is_valid){
							input.removeClass("invalid").addClass("valid");
						}
						else{
							input.removeClass("valid").addClass("emailValid");
						}
					}
					
				},
				error : function(){}
			});
		}else{
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//==================batas akhir validasi=========================//
	$.fn.dataTable.ext.classes.sPageButton = 'btn btn-primary';
	$('#table-master-supplier').DataTable({
		searching : false,
		bFilter: false,
		iDisplayLength: 10,
		oLanguage: {
		   sLengthMenu: "",
		}
	});
	//tambah data supplier
	$('#btn-add').click(function() {
		$('#modal-add-supplier').modal();
	});
	
	$('#add').on('click', function(evt){
		evt.preventDefault(); //ini biar gak ngeload terus setelah di klik
		//nama var harus dama kayak entity nya yang di java
		/* var form = $('#save-form-supplier').parsley();
		var valid = form.validate(); */
		
		//cobavalidasi
		var form_data=$("#save-form-supplier").serializeArray();
		var error_free=true;
		for (var input in form_data){
			var element=$("#input-"+form_data[input]['name']);
			var valid=element.hasClass("valid");
			var text=element.hasClass("textonly");
			var namaSama=element.hasClass("namaSama");
			var emailSama=element.hasClass("emailSama");
			var emailValid=element.hasClass("emailValid");
			var error_element=$("span", element.parent());
			if (!valid){
				error_element.removeClass("error").addClass("error_show"); error_free=false;
				if(text){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('Please input character only');
					error_free=false;
				}else if(namaSama){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('Name already used');
					error_free=false;
				}else if(emailSama){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('Email already used');
					error_free=false;
				}else if(emailValid){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('This is not email format');
					error_free=false;
				}
			}
			else{error_element.removeClass("error_show").addClass("error");}
		}
		if (!error_free){
			event.preventDefault(); 
		}
		else{
			//alert('No errors: Form will be submitted');
			// save supplier
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
			//if(valid == true){
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
			//}
		}
		
		
	});
	
	//end tambah data supplier
	$('.update').on('click', function(){
		var id = $(this).attr('id');
		//console.log(id);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/supplier/get-one/'+id,
			type : 'GET',
			success : function(supplier){
				setEditSupplier(supplier);
				$('#modal-edit-supplier').modal();
				
				//atur daftar district
				var idr = supplier.regionId.id;
				console.log(idr);
					$.ajax({
						url : '${pageContext.request.contextPath}/province/get-district/'+idr,
						type : 'GET',
						success : function(data){
							var listDistrict = [];
							var choose = "<option value=''>-- Choose --</option>";
							listDistrict.push(choose);
							$(data).each(function(index, value){
								var isi = "<option value='"+value.id+"'>"+value.name+"</option>";
								listDistrict.push(isi);
							});
							$('#edit-district').prop('options').length = 0;
							$('#edit-district').html(listDistrict);
							$('#edit-district').val(supplier.districtId.id).change();
						},
						error : function(){
							alert('failed to get data district');
						}
						
					});
				
				//atur daftar region
				var idp = supplier.provinceId.id;
				console.log(idp);
					$.ajax({
						url : '${pageContext.request.contextPath}/province/get-region/'+idp,
						type : 'GET',
						success : function(data){
							var listRegion = [];
							var choose = "<option value=''>-- Choose --</option>";
							listRegion.push(choose);
							$(data).each(function(index, value){
								var isi = "<option value='"+value.id+"'>"+value.name+"</option>";
								listRegion.push(isi);
							});
							$('#edit-region').prop('options').length = 0;
							$('#edit-region').html(listRegion);
							$("#edit-region").val(supplier.regionId.id);
						},
						error : function(){
							alert('failed to get data region');
						}
						
					});
					
					
			},
			error : function(){
				alert('failed getting data update!!')
			},
			dataType : 'json'
		}); 
	});
	
	//setup data update
	function setEditSupplier(supplier){
		//console.log(room);
		$('#input-id').val(supplier.id)
		$('#edit-supplier-name').val(supplier.name);
		$('#edit-address').val(supplier.address); 
		$('#edit-province').val(supplier.provinceId.id);
		$('#edit-region').val(supplier.regionId.id);
		$('#edit-district').val(supplier.districtId.id);
		$('#edit-postal-code').val(supplier.postalCode);
		$('#edit-phone').val(supplier.phone);
		$('#edit-email').val(supplier.email);
	}
	
	//execute update
	$('#btn-update').click(function(){
		var supplier = {
				id : $('#input-id').val(),
				name : $('#edit-supplier-name').val(),
				address : $('#edit-address').val(),
				provinceId : {
					id : $('#edit-province').val()
				},
				regionId : {
					id : $('#edit-region').val()
				},
				districtId : {
					id : $('#edit-district').val()
				},
				postalCode : $('#edit-postal-code').val(),
				phone : $('#edit-phone').val(),
				email : $('#edit-email').val()
			}
		console.log(supplier);
		$.ajax({
			url : '${pageContext.request.contextPath}/supplier/update',
			type : 'PUT',
			data : JSON.stringify(supplier),
			contentType : 'application/json',
			success : function(supplier){
				//alert('success');
				window.location = '${pageContext.request.contextPath}/supplier';
			},
			error : function(){
				alert('failed update!!');
			}
		});
	});
	
	$('#field-search').on('input', function(){
		var word = $(this).val();
		console.log(word);
		if(word != ""){
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/search/'+word,
				type : 'GET',
				success : function(data){
					$('#table-search').empty();
					$(data).each(function(index, value){
						var isi = "<tr>"+
						"<td>"+value.name+"</td>"+
						"<td>"+value.address+"</td>"+
						"<td>"+value.phone+"</td>"+
						"<td>"+value.email+"</td>"+
						"<td><div class='"+"btn-group"+"'>"+
						"<a class='"+"update btn btn-primary"+"' id="+value.id+">"+
						"<i class='"+"icon_pencil-edit"+"'></i></a>"+
						"</div></td>"+
						"</tr>";
						
						$('#table-search').append(isi);
					});
					
				},
				error : function(){}
			}); 
		}else{
			window.location='${pageContext.request.contextPath}/supplier';
		}
	});
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
	
	//edit region dan district
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
	
	
	/* $('#input-supplier-name').parsley({
		required : true,
		requiredMessage : ' Code cannot be empty !!',
		minlengthMessage: ' must more than 4 character',
		typeMessage: ' must be text character',
		minlength: 4,
		type:"text"
	});

	Parsley.on('form:submit', function() {
	    alert("The form would be submitted at this point. " +
	      "For this demo, we interrupt the processing.");
	    return false; // Don't submit for this demo
	  });

	  $('#save-form-supplier').parsley({
		    inputs: Parsley.options.inputs + ',[data-parsley-check-children]'
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
										<input class="form-control" placeholder="Search" id="field-search" type="text">
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

					<table class="table table-striped table-advance table-hover" id="table-master-supplier">
						<thead>
							<tr>
								<th><i class="icon_profile"></i> Name</th>
								<th><i class="icon_pin_alt"></i> Address</th>
								<th><i class="icon_mobile"></i> Phone</th>
								<th><i class="icon_email_alt"></i> Email</th>
								<th><i class="icon_cogs"></i>Action</th>
							</tr>
							</thead>
							<tbody id="table-search">
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
										<form action="#" method="post" id="save-form-supplier">
											<div class="modal-body" style="height: 400px;">

												<div class="form-group">
													<label for="input-supplier-name">Supplier Name</label> <input
														type="text" class="form-control" id="input-supplier-name"  name="supplier-name"
														 data-parsley-required="true"
														aria-describedby="emailHelp" placeholder="Supplier Name" data-parsley-id="5043">
													<span class="error">This field is required</span>
												</div>
												<div class="form-group ">
													<label for="input-address">Address</label>
													<textarea class="form-control " id="input-address" name="address"
														name="input-address" data-validation="length" data-validation-length="5-200"></textarea>
														<!-- <span class="error">This field is required</span> -->
														<span class="required">*</span>
												</div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="input-province">Province</label> <select
															class="form-control" id="input-province" name="province">
															<option value="" selected="selected">-- Choose--</option>
															<c:forEach items="${listProvince }" var="prov">
																<option value="${prov.id }">${prov.name }</option>
															</c:forEach> 
														</select>
														<span class="error">This field is required</span>
											 		</div>
													<div class="col-lg-4">
														<label for="input-region">Region</label> <select
															class="form-control" id="input-region" name="region">
															<option value="" selected="selected">-- Choose--</option>
															<%-- <c:forEach items="${listRegion }" var="reg">
																<option value="${reg.id }">${reg.name }</option>
															</c:forEach> --%>
														</select>
														<span class="error">This field is required</span>
													</div>
													<div class="col-lg-4">
														<label for="input-district">District</label> <select
															class="form-control" id="input-district" name="district">
															<option value="" selected="selected">-- Choose--</option>
															<%-- <c:forEach items="${listDistrict }" var="dis">
																<option value="${dis.id }">${dis.name }</option>
															</c:forEach> --%>
														</select>
														<span class="error">This field is required</span>
													</div>
												</div>
												<div style="height: 100px;"></div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="input-postal-code">Postal Code</label> <input
															type="text" class="form-control" id="input-postal-code" name="postal-code"
															aria-describedby="emailHelp" placeholder="Supplier Name" data-parsley-required="true">
															<span class="error">This field is required</span>
													</div>
													<div class="col-lg-4">
														<label for="input-phone">Phone</label> <input type="text"
															class="form-control" id="input-phone" name="phone"
															aria-describedby="emailHelp" placeholder="Supplier Name" data-parsley-required="true">
															<span class="error">This field is required</span>
													</div>
													<div class="col-lg-4">
														<label for="input-email">Email</label> <input type="text"
															class="form-control" id="input-email" data-parsley-type="email"  name="email"
															aria-describedby="emailHelp" placeholder="Supplier Name" data-parsley-required="true">
															<span class="error">This field is required</span>
													</div>
												</div>


											</div>
											<div class="modal-footer">
												<button type="reset" class="btn btn-primary">Cancel</button>
												<button type="submit" id="add" class="btn btn-primary">Save</button>
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
										<form id="edit-form" data-parsley-validation>
											<div class="modal-body" style="height: 350px;">
												<input type="hidden" id="input-id">
												<div class="form-group">
													<label for="edit-supplier-name">Supplier Name</label> <input
														type="text" class="form-control" id="edit-supplier-name"
														aria-describedby="emailHelp" placeholder="Supplier Name">
												</div>
												<div class="form-group ">
													<label for="edit-address">Address</label>
													<textarea class="form-control " id="edit-address"
														name="input-address" required></textarea>
												</div>
												<div class="form-group">
													<div class="col-lg-4">
														<label for="edit-province">Province</label>
														<select class="form-control" id="edit-province">
															<option value="" selected="selected">-- Choose
																--</option>
															<c:forEach items="${listProvince }" var="prov">
																<option value="${prov.id }">${prov.name }</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-region">Region</label> 
														<select class="form-control" id="edit-region">
															<option value="" selected="selected">-- Choose
																--</option>
															<c:forEach items="${listRegion }" var="reg">
																<option value="${reg.id }">${reg.name }</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-district">District</label> 
														<select class="form-control" id="edit-district">
															<option value="" selected="selected">-- Choose
																--</option>
															<c:forEach items="${listDistrict }" var="dis">
																<option value="${dis.id }">${dis.name }</option>
															</c:forEach>
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
												<button type="button" id="btn-update" class="btn btn-primary">Save</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<!-- ===================================================== MODAL =================================================================== -->

<%@ include file="topping/bottom.jsp"%>