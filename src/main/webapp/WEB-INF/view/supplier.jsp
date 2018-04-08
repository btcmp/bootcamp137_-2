<%@ include file="topping/top.jsp"%>

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
						</tbody>
					</table>
				</section>
			</div>
		</div>
	</section>
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
					<!-- <div class="form-group">
					  <label class="control-label">Text</label>
					  <input type="text" class="form-control" placeholder="Enter text" required>
					</div>
					 -->
					
					<div class="form-group">
						<label for="input-supplier-name">Supplier Name</label> <input
							type="text" class="form-control" id="input-supplier-name"  data-smk-pattern="[a-zA-Z]" name="supplier-name"	aria-describedby="emailHelp" placeholder="Supplier Name" required />
						<span class="error">This field is required</span>
					</div>
					<div class="form-group ">
						<label for="input-address">Address</label>
						<textarea class="form-control " id="input-address" name="address" minlength="5" maxlength="255" required></textarea>
						<span class="error">This field is required</span>
							<!-- <span class="required">*</span> -->
					</div>
					<div style="width:67%; float:left; height:5px"><hr></div>
					<div class="form-group">
						<div class="form-group">
						<div class="col-lg-4">
							<label for="input-province">Province</label> <select
								class="form-control" id="input-province" name="province" required>
								<option value="" selected="selected">-- Choose--</option>
								<c:forEach items="${listProvince }" var="prov">
									<option value="${prov.id }">${prov.name }</option>
								</c:forEach> 
							</select>
							<span class="error">This field is required</span>
				 		</div>
				 		</div>
				 		<div class="form-group">
						<div class="col-lg-4">
							<label for="input-region">Region</label> <select
								class="form-control" id="input-region" name="region" required>
								<option value="" selected="selected">-- Choose--</option>
								<%-- <c:forEach items="${listRegion }" var="reg">
									<option value="${reg.id }">${reg.name }</option>
								</c:forEach> --%>
							</select>
							<span class="error">This field is required</span>
						</div>
						</div>
						<div class="form-group">
						<div class="col-lg-4">
							<label for="input-district">District</label> <select
								class="form-control" id="input-district" name="district" required>
								<option value="" selected="selected">-- Choose--</option>
								<%-- <c:forEach items="${listDistrict }" var="dis">
									<option value="${dis.id }">${dis.name }</option>
								</c:forEach> --%>
							</select>
							<span class="error">This field is required</span>
						</div>
						</div>
					</div>
					<div style="height: 100px;"></div>
					<div class="inline">
						<div class="form-group">
						<div class="col-lg-4">
							<label for="input-postal-code">Postal Code</label> 
							<input type="text" class="form-control" id="input-postal-code" name="postal-code"
								maxlength="5" placeholder="Input 5 digits postal code" data-smk-type="number" required>
								<span class="error">This field is required</span>
						</div>
						</div>
						<div class="form-group">
						<div class="col-lg-4">
							<label for="input-phone">Phone</label>
							<input type="tel" class="form-control" id="input-phone" name="phone"
										placeholder="ex. 081xxxxxxxxx" required>
										<span class="error">This
										field is required</span>
							</div>
						</div>
						<div class="form-group">
						<div class="col-lg-4">
							<label for="input-email">Email</label>
							<input type="email"
								class="form-control" id="input-email" name="email"
								aria-describedby="emailHelp" placeholder="Use valid email" required>
								<span class="error">This field is required</span>
						</div>
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
			<form id="edit-form">
				<div class="modal-body" style="height: 350px;">
					<input type="hidden" id="input-id">
					<div class="form-group">
						<label for="edit-supplier-name">Supplier Name</label> <input
							type="text" class="form-control" id="edit-supplier-name" name="supplier-name" required>
							<span class="error">This field is required</span>
					</div>
					<div class="form-group ">
						<label for="edit-address">Address</label>
						<textarea class="form-control " id="edit-address"
							name="address" required></textarea>
							<span class="error">This field is required</span>
					</div>
					<div class="form-group">
						<div class="col-lg-4">
							<label for="edit-province">Province</label>
							<select class="form-control" id="edit-province" name="province" required>
								<option value="" selected="selected">-- Choose
									--</option>
								<c:forEach items="${listProvince }" var="prov">
									<option value="${prov.id }">${prov.name }</option>
								</c:forEach>
							</select>
							<span class="error">This field is required</span>
						</div>
						<div class="col-lg-4">
							<label for="input-region">Region</label> 
							<select class="form-control" id="edit-region" name="region" required>
								<option value="" selected="selected">-- Choose
									--</option>
								<c:forEach items="${listRegion }" var="reg">
									<option value="${reg.id }">${reg.name }</option>
								</c:forEach>
							</select>
							<span class="error">This field is required</span>
						</div>
						<div class="col-lg-4">
							<label for="input-district">District</label> 
							<select class="form-control" id="edit-district" name="district" required>
								<option value="" selected="selected">-- Choose
									--</option>
								<c:forEach items="${listDistrict }" var="dis">
									<option value="${dis.id }">${dis.name }</option>
								</c:forEach>
							</select>
							<span class="error">This field is required</span>
						</div>
					</div>
					<div style="height: 70px;"></div>
					<div class="form-group">
						<div class="col-lg-4">
							<label for="input-postal-code">Postal Code</label> <input
								type="text" class="form-control" id="edit-postal-code" name="postal-code" maxlength="5" required>
							<span class="error">This field is required</span>
						</div>
						<div class="col-lg-4">
							<label for="input-phone">Phone</label> <input type="text"
								class="form-control" id="edit-phone" name="phone" required>
								<span class="error">This field is required</span>
						</div>
						<div class="col-lg-4">
							<label for="input-email">Email</label> <input type="text"
								class="form-control" id="edit-email" name="email" required>
								<span class="error">This field is required</span>
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

<script type="text/javascript">

$(document).ready(function(){
	$('#btn-add').click(function(){
		$('#modal-add-supplier').modal();
	});
	$('#btn-export').click(function(){
		window.open('${pageContext.request.contextPath}/generate/supplier');
	});
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
	//validasi edit
	$('#edit-supplier-name').on('input', function() {
		var input=$(this);
		var name = $(this).val();
		var id = $('#input-id').val();
		console.log("id edit : "+id);
		if(name != ""){
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/edit-name-valid/'+name+'/'+id,
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
	
	//validasi address
	$('#input-address', '#edit-address').on('input', function() {
		var input=$(this);
		var address = $(this).val();
		if(address != ""){
			if(address.toString().length <= 5 || address.toString().length >= 255){
				input.removeClass("valid").addClass("batas-karakter");
			}else{
				input.removeClass("invalid").addClass("valid");
			}
		}else{
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//validasi province
	$('#input-province', '#edit-province').on('input', function() {
		var input=$(this);
		var province = $(this).val();
		if(province != ""){
			input.removeClass("invalid").addClass("valid");
		}else{
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//validasi region
	$('#input-region', '#edit-region').on('input', function() {
		var input=$(this);
		var region = $(this).val();
		if(region != ""){
			input.removeClass("invalid").addClass("valid");
		}else{
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//validasi district
	$('#input-district', '#edit-district').on('input', function() {
		var input=$(this);
		var district = $(this).val();
		if(district != ""){
			input.removeClass("invalid").addClass("valid");
		}else{
			input.removeClass("valid").addClass("invalid");
		}
	});
	
	//validasi postalcode
	$('#input-postal-code', '#edit-postal-code').on('input', function() {
		var input=$(this);
		var postal = $(this).val();
		var re = /^(([0-9]*)|(([0-9]*)\.([0-9]*)))$/;
		var is_valid=re.test(postal);
		if(!is_valid){
			input.removeClass("valid").addClass("numbering");
		}else{
			if(postal.toString().length != 5){
				input.removeClass("valid").addClass("postal-code");
			}else{
				input.removeClass("invalid").addClass("valid");
			}
		}
	});
	
	//validasi phone
	$('#input-phone', '#edit-phone').on('input', function() {
		var input=$(this);
		var phone = $(this).val();
		var re = /^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g;
		//var re = /^\d{10}$/;
		var is_valid=re.test(phone);
		if(!is_valid){
			input.removeClass("valid").addClass("numbering");
		}else{
			if(phone.toString().length < 8 || phone.toString().length >= 15){
				input.removeClass("valid").addClass("phone-length");
			}else{
				input.removeClass("invalid").addClass("valid");
			}
		}
	});
	
	/***phone number format***/
	  $("#input-phone", "#edit-phone").keypress(function (e) {
	    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	      return false;
	    }
	    var curchr = this.value.length;
	    var curval = $(this).val();
	    if (curchr == 4 && curval.indexOf("(") <= -1) {
	      $(this).val(curval + "-");
	    } else if (curchr == 4 && curval.indexOf("(") > -1) {
	      $(this).val(curval + ")-");
	    } else if (curchr == 6 && curval.indexOf(")") > -1) {
	      $(this).val(curval + "-");
	    } else if (curchr == 9) {
	      $(this).val(curval + "-");
	      $(this).attr('maxlength', '14');
	    }
	  });
	
	  $("#input-postal-code","#edit-postal-code").keypress(function (e) {
		  if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		      return false;
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
	
	//validasi email edit
	$('#edit-email').on('input', function() {
		var input=$(this);
		var email = $(this).val().toString();
		var id = $('#input-id').val();
		//console.log("email : "+email);
		if(email != ""){
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/edit-email-valid/'+email+'/'+id,
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
			var panjangKarakter=element.hasClass("batas-karakter");
			var postalCode=element.hasClass("postal-code");
			var number=element.hasClass("numbering");
			var phone=element.hasClass("phone-length");
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
				}else if(panjangKarakter){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('This length must more than 4 and less than 255');
					error_free=false;
				}else if(postalCode){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('This length must 5 digits');
					error_free=false;
				}else if(number){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('Please input number postive only');
					error_free=false;
				}else if(phone){
					error_element.removeClass("error").addClass("error_show"); 
					error_element.text('This length must between 7 and 13 digits');
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
			var phoneStrip = $('#input-phone').val();
			var phone = phoneStrip.replace('-','');
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
		/* $("span", $('#edit-supplier-name')).addClass("error");
		$("span", $('#edit-address')).addClass("error");
		$("span", $('#edit-province')).addClass("error");
		$("span", $('#edit-region')).addClass("error");
		$("span", $('#edit-district')).addClass("error");
		$("span", $('#edit-postal-code')).addClass("error");
		$("span", $('#edit-phone')).addClass("error");
		$("span", $('#edit-email')).addClass("error"); */
	}
	
	//execute update
	$('#btn-update').click(function(){
		var name = $('#edit-supplier-name').val();
		var address = $('#edit-address').val(); 
		var province = $('#edit-province').val();
		var region = $('#edit-region').val();
		var district = $('#edit-district').val();
		var postal = $('#edit-postal-code').val();
		var phone = $('#edit-phone').val();
		var email = $('#edit-email').val();
		if(name != ""){$("span", $('#edit-supplier-name')).addClass("error");}
		if(address != ""){$("span", $('#edit-address')).removeClass("error_show").addClass("error");}
		if(province != ""){$("span", $('#edit-province')).removeClass("error_show").addClass("error");}
		if(region != ""){$("span", $('#edit-region')).removeClass("error_show").addClass("error");}
		if(district != ""){$("span", $('#edit-district')).removeClass("error_show").addClass("error");}
		if(postal != ""){$("span", $('#edit-postal-code')).removeClass("error_show").addClass("error");}
		if(phone != ""){$("span", $('#edit-phone')).removeClass("error_show").addClass("error");}
		if(email != ""){$("span", $('#edit-email')).removeClass("error_show").addClass("error");}
		//cobavalidasi
		var form_data=$("#edit-form").serializeArray();
		var error_free=true;
			for (var input in form_data){
				var element=$("#edit-"+form_data[input]['name']);
				var valid=element.hasClass("valid");
				var text=element.hasClass("textonly");
				var namaSama=element.hasClass("namaSama");
				var emailSama=element.hasClass("emailSama");
				var emailValid=element.hasClass("emailValid");
				var panjangKarakter=element.hasClass("batas-karakter");
				var postalCode=element.hasClass("postal-code");
				var number=element.hasClass("numbering");
				var phone=element.hasClass("phone-length");
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
					}else if(panjangKarakter){
						error_element.removeClass("error").addClass("error_show"); 
						error_element.text('This length must more than 4 and less than 255');
						error_free=false;
					}else if(postalCode){
						error_element.removeClass("error").addClass("error_show"); 
						error_element.text('This length must 5 digits');
						error_free=false;
					}else if(number){
						error_element.removeClass("error").addClass("error_show"); 
						error_element.text('Please input number postive only');
						error_free=false;
					}else if(phone){
						error_element.removeClass("error").addClass("error_show"); 
						error_element.text('This length must between 7 and 13 digits');
						error_free=false;
					}
				}
				else{error_element.removeClass("error_show").addClass("error");}
			}
		if (!error_free){
			event.preventDefault(); 
		}
		else{
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
		}
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

<%@ include file="topping/bottom.jsp"%>