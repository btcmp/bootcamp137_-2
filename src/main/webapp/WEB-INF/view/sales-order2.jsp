<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#btn-search-customer').click(function() {
			$('#modal-search-customer').modal();
		});
		$('#btn-add-cust').click(function() {
			$('#modal-add-cust').modal();
		});
		$('#btn-charge').click(function() {
			$('#modal-payment-method').modal();
		});
		$('#btn-done').click(function() {
			$('#modal-done-payment').modal();
		});

		$("#input-cust-dob").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		
		//input region dan district
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

		//input customer
		$('#add-cust').click(function() {
			var name = $('#input-cust-name').val();
			var email = $('#input-cust-email').val();
			var phone = $('#input-cust-phone').val();
			var dob = $('#input-cust-dob').val();
			var address = $('#input-address').val();
			var province = $('#input-province').val();
			var region = $('#input-region').val();
			var district = $('#input-district').val();
			
			var customer = {
				name : name,
				email : email,
				phone : phone,
				dob : dob,
				address : address,
				provinceId :{
					id : province
				},
				regionId : {
					id : region
				},
				districtId : {
					id : district
				},
				modifiedOn : new Date(),
				createdOn : new Date(),
				active : 0
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/sales-order/save-customer',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(customer),
				success : function(data){
					//alert('success save new customer');
					$('#form-add-cust').trigger('reset');
					$('#modal-add-cust').modal('hide');
				},
				error : function(){
					alert('failed save new customer');
				}
			});
		});
		
		//search customer 
		$('#input-search-cust').on('input', function(){
			var word = $(this).val();
			console.log(word);
			$.ajax({
				url : '${pageContext.request.contextPath}/sales-order/search-customer/'+word,
				type : 'GET',
				success : function(data){
					$('#isi-customer').empty();
					$(data).each(function(index, value){
						var isi = "<tr id='"+value.id+"'>"+
						"<td>"+value.name+"</td>"+
						"<td>"+value.phone+"</td>"+
						"<td>"+value.email+"</td>"+
						"</tr>";
						$('#isi-customer').append(isi);
					});
					
				},
				error : function(){
					//alert('failed to search customer');
				}
			});
		});
		
		//click table
		$("#table-customer").on("click", "tr", function(e) {
			var id = $(this).attr('id');
			console.log(id);
			var name = 
		});
		
	});
</script>
<!-- ==================================================================  BATAS BUAT ISIAN ========================================================================= -->
<section id="main-content">
	<section class="wrapper">
		<div class="row" style="background-color: white;">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> SALES ORDER </header>

					<div class="col-sm-6">
						<div class="col-lg-12" style="width: 100%;">
							<P></P>
							<input class="form-control" placeholder="Search" type="text">

							<br>
							<P></P>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<td style="width: 60%">[item-variant]</td>
										<td style="width: 30%">Rp [price]</td>
										<td style="width: 10%">
											<div class="btn-group">
												<a class="btn btn-primary" id="btn-edit"><i
													class="icon_check"></i></a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-sm-6">
						<div
							style="width: 100%; outline: 2px dotted; padding-right: 10px; padding-left: 10px; padding-bottom: 20px;">
							<P></P>
							<br>
							<button type="button" id="btn-search-customer"
								class="btn btn-primary" style="width: 100%">Choose
								Customer</button>
							<br>
							<P></P>
							<table class="table table-striped table-advance table-hover">
								<thead>
									<tr>
										<th style="width: 40%;"><center>Item</center></th>
										<th style="width: 25%;"><center>Qty</center></th>
										<th style="width: 25%;"><center>Subtotal</center></th>
										<th style="width: 10%;"><center>#</center></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<div class="btn-group">
												<a class="btn btn-danger" id="btn-edit">X</a>
											</div>
										</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><b>Total</b></td>
										<td colspan="2">Rp</td>
									<tr>
								</tfoot>
							</table>
							<hr>
							<button type="button" id="btn-clear-sale" class="btn btn-primary">Clear
								Sale</button>
							<button type="button" id="btn-charge" class="btn btn-primary"
								style="float: right;">Charge Rp [0]</button>
							<br>
							<P></P>
						</div>
					</div>
					<br>

				</section>
			</div>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
</section>

<!-- ===================================================== MODAL SEARCH CUSTOMER =================================================================== -->
<!-- Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="modal-search-customer" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">X</button>
				<h4 class="modal-title">CUSTOMER</h4>
			</div>
			<form id="save-form" data-parsley-validation>
				<div class="modal-body">
					<div class="form-group">
						<div class="col-lg-9">
							<input class="form-control" placeholder="Search Customer..." id="input-search-cust"
								type="text">
						</div>
						<div class="col-lg-3">
							<button type="button" id="btn-add-cust" class="btn btn-primary">Add
								New</button>
						</div>
						<p></p>
						<br> <br>
						<p></p>
						<div class="col-lg-12">
							<table class="table table-striped table-advance table-hover" id="table-customer">
								<tbody id="isi-customer" style="cursor:pointer">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END SEARCH CUSTOMER =================================================================== -->

<!-- ===================================================== MODAL ADD CUSTOMER =================================================================== -->
<!-- Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="modal-add-cust" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">X</button>
				<h4 class="modal-title">NEW CUSTOMER</h4>
			</div>
			<form id="form-add-cust" data-parsley-validation>
				<div class="modal-body">
					<div class="form-group">
						<label for="input-supplier-name"><b>PROFILE </b></label> <input
							type="text" class="form-control" id="input-cust-name"
							aria-describedby="emailHelp" placeholder="Customer Name">
						<input type="text" class="form-control" id="input-cust-email"
							aria-describedby="emailHelp" placeholder="Email"> <input
							type="text" class="form-control" id="input-cust-phone"
							aria-describedby="emailHelp" placeholder="Phone">
					</div>
					<br>
					<div class="form-group">
						<label for="input-supplier-name"><b>DAY OF BIRTH </b></label> <input
							type="text" class="form-control" id="input-cust-dob"
							aria-describedby="emailHelp" placeholder="Day of birth">
					</div>
					<br>
					<div class="form-group ">
						<label for="input-address">ADDRESS</label>
						<textarea class="form-control " id="input-address"
							name="input-address" required></textarea>
						<select class="form-control" id="input-province" style="width:34%; float:left;">
							<option value="" selected="selected">-- Choose --</option>
							<c:forEach items="${listProvince }" var="prov">
								<option value="${prov.id }">${prov.name }</option>
							</c:forEach>
						</select> <select class="form-control" id="input-region" style="width:33%; float:left;">
							<option value="" selected="selected">-- Choose --</option>
						</select> <select class="form-control" id="input-district" style="width:33%; float:left;">
							<option value="" selected="selected">-- Choose --</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="add-cust" class="btn btn-primary">Done</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END ADD CUSTOMER =================================================================== -->

<!-- ===================================================== MODAL PAYMENT METHOD  =================================================================== -->
<!-- Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="modal-payment-method" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">X</button>
				<h4 class="modal-title">CUSTOMER</h4>
			</div>
			<form id="save-form" data-parsley-validation>
				<div class="modal-body">
					<div class="form-group">
						<div class="col-lg-1">
							<h5>
								<b>Cash</b>
							</h5>
						</div>
						<div class="col-lg-8">
							<input class="form-control" placeholder="Search Customer..."
								type="text">
						</div>
						<div class="col-lg-3">
							<button type="button" id="btn-done" class="btn btn-primary">Done</button>
						</div>
						<p></p>
						<br> <br>
						<p></p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END PAYMENT METHOD =================================================================== -->

<!-- ===================================================== MODAL DONE PAYMENT  =================================================================== -->
<!-- Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="modal-done-payment" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">X</button>
				<h4 class="modal-title">Receipt</h4>
			</div>
			<form id="save-form" data-parsley-validation>
				<div class="modal-body">
					<div class="form-group">
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
							<input class="form-control" value="Rp [return]" type="text"
								style="height: 50px;">
						</div>
						<div class="col-lg-2"></div>
					</div>
					<br> <br>
					<div class="form-group">
						<div class="col-lg-12">
							<center>
								<h5>Out of Rp.[0]</h5>
							</center>
							<hr style="line-height: 3px;">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-12">
							<center>
								<h5>
									<b>How do you want to receive your receipts?</b>
								</h5>
							</center>
							<input class="form-control" placeholder="Customer Email"
								type="text" style="width: 80%; float: left;">
							<button type="button" id="btn-done" class="btn btn-primary"
								style="width: 20%; float: left;">Send</button>
						</div>
					</div>
					<br> <br> <br>
					<div class="form-group">
						<div class="col-lg-12">
							<button type="button" id="btn-done" class="btn btn-primary"
								style="width: 100%;">Print Receipt</button>
							<button type="button" id="btn-done" class="btn btn-danger"
								style="width: 100%;">No,Thanks & Done</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END DONE PAYMENT  =================================================================== -->

<%@ include file="topping/bottom.jsp"%>
