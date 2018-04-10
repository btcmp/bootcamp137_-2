<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#form-add-cust').parsley().on('field:validated', function() {
		    /* var ok = $('.parsley-error').length === 0;
		    $('.bs-callout-info').toggleClass('hidden', !ok);
		    $('.bs-callout-warning').toggleClass('hidden', ok); */
		  })
		  .on('form:submit', function() {
		    return false; // Don't submit form for this demo
		  });
		
		$('#input-cust-name').on('input', function() {
			var input=$(this);
			var name = $(this).val();
			if(name != ""){
				$.ajax({
					url : '${pageContext.request.contextPath}/sales-order/search-name-valid/'+name,
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
		$('#input-cust-email').on('input', function() {
			var input=$(this);
			var email = $(this).val().toString();
			console.log("email : "+email);
			if(email != ""){
				$.ajax({
					url : '${pageContext.request.contextPath}/sales-order/search-email-valid/'+email,
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
		
		//validasi phone
		$('#input-cust-phone').on('input', function() {
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
		
		$("#input-cust-phone").keypress(function (e) {
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
		
		$('#btn-search-customer').click(function() {
			$('#modal-search-customer').modal();
		});
		$('#btn-add-cust').click(function() {
			$('#modal-add-cust').modal();
		});
		$('#btn-charge').attr('disabled', 'disabled');
		$('#btn-charge').click(function() {
			$('#modal-payment-method').modal();
		});
		/* $('#btn-done').click(function() {
			$('#modal-done-payment').modal();
		}); */

		$("#input-cust-dob").datepicker({
			dateFormat : 'yy-mm-dd',
			maxDate : 0
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
			//cobavalidasi
			var form_data=$("#form-add-cust").serializeArray();
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
			if ($("#form-add-cust").parsley().isValid()) {
				var name = $('#input-cust-name').val();
				var email = $('#input-cust-email').val();
				var phoneStrip = $('#input-cust-phone').val();
				var phone = phoneStrip.replace('-','');
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
			}
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
			var name = $(this).find('td').eq(0).text();
			$('#btn-search-customer').html(name);
			$('#btn-search-customer').attr('name', id);
			$('#input-search-cust').val("");
			$('#isi-customer').empty();
			$('#modal-search-customer').modal('hide');
			$('#btn-charge').removeAttr('disabled');
		});
		
		//search item variant
		$('#search-item-variant').on('input', function(){
			var word = $(this).val();
			if(word != ""){
				$.ajax({
					url : '${pageContext.request.contextPath}/sales-order/search-item-variant/'+word,
					type : 'GET',
					success : function(data){
						$('#isi-item-variant').empty();
						$(data).each(function(index, value){
							var angka = value[3];
							var rupiah = '';
							var angkarev = angka.toString().split('').reverse().join('');
							for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.'; 
							var price = 'Rp  '+rupiah.split('',rupiah.length-1).reverse().join('')+',00';
							
							var isi = "<tr id='"+value[1]+"'>"+
							"<td style='width: 60%'>"+value[0]+" - "+value[2]+"</td>"+
							"<td style='width: 30%'>"+price+"</td>"+
							"<td style='width: 10%'><div class='btn-group'>"+
							"<a class='btn btn-primary' id='btn-choose-item' name='"+value[4]+"'>"+
							"<i class='icon_check'></i></a>"+
							"</div></td>"+
							"</tr>";
							$('#isi-item-variant').append(isi);
						});
					},
					error : function(){
						
					}
				});
			}else{
				$('#isi-item-variant').empty();
			}
		});
		
		//move item variant to totalan
		$(document).on('click', '#btn-choose-item', function() {
			var element = $(this).parent().parent().parent();
			var id = element.attr('id');
			var item  = element.find('td').eq(0).text();
			var price  = element.find('td').eq(1).text();
			var jmlStock = $(this).attr('name');
			//console.log("id diklik : "+id);
			var jmlStruk = $('#table-struk > tbody > tr').length;
			if(jmlStruk != 0){
				for(i = 0; i<jmlStruk ; i++){
					var idTable = $('#table-struk > tbody > tr').eq(i).attr('id');
					if(idTable !== id){
						var qty = 1;
						//console.log("id bawah : "+id);
						var isi = "<tr id='"+id+"' class='"+jmlStock+"'>"+
							"<td style='width: 40%'>"+item+"</td>"+
							"<td style='width: 20%'><button id='btn-minus' class='icon_minus-06' style='height:25px;' /><input type='text' value='"+qty+"' id='quantity' style='width:30px; height:26px;'/><button id='btn-plus' class='icon_plus' style='height:25px;'/></td>"+
							"<td style='width: 30%' class='price'>"+price+"</td>"+
							"<td><div class='btn-group'>"+
							"<a class='btn btn-danger' id='btn-delete-receipt'>X</a>"+
							"</div></td>"+
							"</tr>";
						$('#isi-struk').append(isi);
						//$(this).attr('disabled', 'disabled');
					}else{
						alert('The selected item is already available on the receipt. Please set the quantity as you want');
						$('#table-struk > tbody > tr').eq(i).remove();
					}
				}
			}else{
				var qty = 1;
				var isi = "<tr id='"+id+"' class='"+jmlStock+"'>"+
				"<td style='width: 40%'>"+item+"</td>"+
				"<td style='width: 20%'><button id='btn-minus' class='icon_minus-06' style='height:25px;' /><input type='text' value='"+qty+"' style='width:30px; height:26px;'/><button id='btn-plus' class='icon_plus' style='height:25px;'/></td>"+
				"<td style='width: 30%' class='price'>"+price+"</td>"+
				"<td><div class='btn-group'>"+
				"<a class='btn btn-danger' id='btn-delete-receipt'>X</a>"+
				"</div></td>"+
				"</tr>";
				$('#isi-struk').append(isi);
				//$(this).attr('disabled', 'disabled');
			}
			
			//setting grand total receipt
			hitung();
		});
		
		//minus quantity in receipt
		$(document).on('click', '#btn-minus', function() {
			var element = $(this).parent();
			var input = parseInt(element.find('input').val());
			var rup = element.parent().find('td').eq(2).text();
			var price = parseInt(rup.replace(/,.*|[^0-9]/g, ''), 10)/input;
	    	//console.log(input);
	    	if (!isNaN(input) && input > 1) {
	    		var jml = input-1;
	    		element.find('input').val(jml);
	    		
	    		var angka = jml*price;
	    		var rupiah = '';
				var angkarev = angka.toString().split('').reverse().join('');
				for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.'; 
				var subTotal = 'Rp  '+rupiah.split('',rupiah.length-1).reverse().join('')+',00';
				
	    		element.parent().find('td').eq(2).html(subTotal);
	        } else {
	        	element.find('input').val(1);
	        }
	    	
	    	//setting grand total receipt
	    	hitung();
		});
		
		//plus quantity in receipt
		$(document).on('click', '#btn-plus', function() {
			var element = $(this).parent();
			var input = parseInt(element.find('input').val());
			var stock = parseInt(element.parent().attr('class'));
			console.log("stok : "+stock);
			var rup = element.parent().find('td').eq(2).text();
			var price = parseInt(rup.replace(/,.*|[^0-9]/g, ''), 10)/input;
	    	//console.log(price);
	    	if (!isNaN(input) && input > 0) {
	    		if(input < stock){
		    		var jml = input+1;
		    		element.find('input').val(jml);
		    		
		    		var angka = jml*price;
		    		var rupiah = '';
					var angkarev = angka.toString().split('').reverse().join('');
					for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.'; 
					var subTotal = 'Rp  '+rupiah.split('',rupiah.length-1).reverse().join('')+',00';
					
		    		element.parent().find('td').eq(2).html(subTotal);
	    		}else if(input >= stock){
	    			alert('The quantity is maximum');
	    		}
	        } else {
	        	element.find('input').val(1);
	        }
	    	
	    	//setting grand total receipt
	    	hitung();
		});
		
		//delete list receipt
		$(document).on('click', '#btn-delete-receipt', function() {
			var element = $(this).parent().parent().parent();
			console.log(element);
			element.remove();
			//setting grand total receipt
			hitung();
		});
		
		//button clear sale
		$('#btn-clear-sale').click(function(){
			$('#search-item-variant').val("");
			$('#isi-item-variant').empty();
			$('#btn-search-customer').html('Choose Customer');
			$('#isi-struk').empty();
			$('#btn-charge').html("Charge Rp 0,00");
			$('#total-bayar').html("Rp 0,00");
		});
		
		//button cash done 
		$(document).on('click', '#btn-done', function(){
			var rup = $('#total-bayar').text();
			var total = parseInt(rup.replace(/,.*|[^0-9]/g, ''), 10);
			var bayar = $('#input-cash').val();
			var bayar1 = parseInt(bayar.replace(/,.*|[^0-9]/g, ''), 10);
			var kembalian = bayar1 - total;
			
			var rupiah = '';
		    var angkarev = kembalian.toString().split('').reverse().join('');
			for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.'; 
			var sisa = 'Rp  '+rupiah.split('',rupiah.length-1).reverse().join('')+',00';
			
			if(kembalian < 0){
				alert('Sorry, your cash not enough');
			}else{
				$('#field-return').val(sisa);
				$('#out-off').html('Out of '+bayar);
				$('#modal-done-payment').modal();
			}
			
			
			//save sales order
			var listDetailSO = [];
			$('#table-struk > tbody > tr').each(function(index, data){
				var jml = parseInt($(data).find('td').eq(1).find('input').val().replace(/,.*|[^0-9]/g, ''), 10);
				var total = parseInt($(data).find('td').eq(2).text().replace(/,.*|[^0-9]/g, ''), 10);
				var price = total/jml;
				var detailSO = {
					variantId : {
						id : $(this).attr('id')
					},
					qty : jml,
					subTotal : total,
					unitPrice : price,
					createdOn : new Date(),
					modifiedOn : new Date()
				}
				listDetailSO.push(detailSO);
			});
			var idCust = $('#btn-search-customer').attr('name');
			//console.log("id cust : "+idCust);
			var salesOrder = {
				customer : {
					id : idCust
				},
				grandTotal : bayar1,
				createdOn : new Date(),
				modifiedOn : new Date(),
				sods : listDetailSO
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/sales-order/save',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(salesOrder),
				success : function(data){
					//alert('save sales order success');
				},
				error : function(){
					alert('failed save sales order');
				}
			});
			
			//tutup modal
			$('#input-cash').val('');
			$('#modal-payment-method').modal('hide');
		});
		
		function hitung(){
			var angka = 0;
			// iterate through each td based on class and add the values
			if($('#table-struk > tbody > tr').length == 0){
				$('#total-bayar').html("Rp 0,00");
			}else{
				$(".price").each(function() {
				    var rup = $(this).text();
				    var price = parseInt(rup.replace(/,.*|[^0-9]/g, ''), 10);
				    
				    if(!isNaN(price) && price.length != 0) {
				        angka += parseFloat(price);
				    }
				    
				    var rupiah = '';
				    var angkarev = angka.toString().split('').reverse().join('');
					for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.'; 
					var grandTotal = 'Rp  '+rupiah.split('',rupiah.length-1).reverse().join('')+',00';
				    console.log("grandTotal : "+grandTotal);
				    $('#total-bayar').html(grandTotal);
				    $('#btn-charge').html("Charge "+grandTotal);
				});
			}
		};
		
		$(document).on('click', '#btn-nothanks', function(){
			window.location = "${pageContext.request.contextPath}/sales-order";
		});
		
		$(document).on('click', '#btn-send-email', function(){
			alert('success your email');
		});
		
		$(document).on('click', '#btn-print-receipt', function(){
			//buat controller untuk print struk
			var idCust = $('#btn-search-customer').attr('name');
			console.log("idCustomer : "+idCust);
			$.ajax({
				url : '${pageContext.request.contextPath}/generate/receipt/'+idCust,
				type : 'GET',
				success : function(data){},
				error : function(){}
			});
			//window.location = "${pageContext.request.contextPath}/generate/receipt/"+idCust;
		});
	});
	
	$(document).ready(function(){
		const autoNumericRupiah = {
			    digitGroupSeparator        : '.',
			    decimalCharacter           : ',',
			    decimalPlaces			   : 2,
			    currencySymbol             : 'Rp ',
			    currencySymbolPlacement    : AutoNumeric.options.currencySymbolPlacement.prefix,
			    roundingMethod             : 'U',
			    minimumValue			   : 0,
			    formatOnPageLoad		   : true
			};

			// Initialization
		new AutoNumeric('#input-cash', autoNumericRupiah);
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
							<input class="form-control" placeholder="Search" type="text" id="search-item-variant">

							<br>
							<P></P>
							<table class="table table-striped table-advance table-hover" id="table-item">
								<tbody id="isi-item-variant">
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
							<table class="table table-striped table-advance table-hover" id="table-struk">
								<thead>
									<tr>
										<th style="width: 40%;"><center>Item</center></th>
										<th style="width: 20%;"><center>Qty</center></th>
										<th style="width: 30%;"><center>Subtotal</center></th>
										<th style="width: 10%;"><center>#</center></th>
									</tr>
								</thead>
								<tbody id="isi-struk">
									
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><b>Total</b></td>
										<td colspan="2" id="total-bayar">Rp 0,00</td>
									<tr>
								</tfoot>
							</table>
							<hr>
							<button type="button" id="btn-clear-sale" class="btn btn-primary">Clear
								Sale</button>
							<button type="button" id="btn-charge" class="btn btn-primary"
								style="float: right;">Charge Rp 0,00</button>
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
					<div class="form">
						<div class="form-group">
							<div class="col-lg-9">
								<input class="form-control" placeholder="Search Customer..."
									id="input-search-cust" type="text">
							</div>
							<div class="col-lg-3">
								<button type="button" id="btn-add-cust" class="btn btn-primary">Add
									New</button>
							</div>
							<p></p>
							<br> <br>
							<p></p>
							<div class="col-lg-12">
								<table class="table table-striped table-advance table-hover"
									id="table-customer">
									<tbody id="isi-customer" style="cursor: pointer">
									</tbody>
								</table>
							</div>
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
			<form id="form-add-cust" data-parsley-validate="true">
				<div class="modal-body" style="height:480px;">
				<div class="form">
					<div class="form-group">
						<label for="input-supplier-name"><b>PROFILE </b></label> <input
							type="text" class="form-control" id="input-cust-name" data-parsley-pattern="/[a-zA-Z]/" name="cust-name"
							required="" placeholder="Customer Name">
							<span class="error">This field is required</span>
					</div>
					<div class="form-group">
						<input data-parsley-trigger="change" required="" type="email" name="cust-email"
						class="form-control" id="input-cust-email"
							placeholder="Email"> 
							<span class="error">This field is required</span>
					</div>
					<div class="form-group">
							<input type="text" class="form-control" id="input-cust-phone" name="cust-phone"
							aria-describedby="emailHelp" placeholder="Phone" data-parsley-pattern="/^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g" required="">
						<span class="error">This field is required</span>
					</div>
					<br>
					<div class="form-group">
						<label for="input-supplier-name"><b>DAY OF BIRTH </b></label> <input
							type="text" class="form-control" id="input-cust-dob" name="cust-dob" placeholder="Day of birth" required="">
					</div>
					<br>
					<div class="gabungan ">
						<div class="form-group">
						<label for="input-address">ADDRESS</label>
						<textarea class="form-control " id="input-address" name="address" data-parsley-trigger="keyup" data-parsley-minlength="5" data-parsley-maxlength="250"
							name="input-address" required=""></textarea>
						</div>
						<div class="form-group" style="width:34%; float:left;">
						<select class="form-control" id="input-province" name="province" required="">
							<option value="" selected="selected">-- Choose --</option>
							<c:forEach items="${listProvince }" var="prov">
								<option value="${prov.id }">${prov.name }</option>
							</c:forEach>
						</select> 
						</div>
						<div class="form-group" style="width:33%; float:left;">
						<select class="form-control" id="input-region" name="region" required="">
							<option value="" selected="selected">-- Choose --</option>
						</select> 
						</div>
						<div class="form-group" style="width:33%; float:left;">
						<select class="form-control" id="input-district" name="district" required="">
							<option value="" selected="selected">-- Choose --</option>
						</select>
						</div>
					</div>
				</div>
				</div>
				<div class="modal-footer" style="width:100%;">
					<button type="submit" id="add-cust" class="btn btn-primary">Done</button>
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
							<input class="form-control" id="input-cash" type="text" >
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
							<input class="form-control" value="" type="text" id="field-return"
								style="height: 50px;" readonly>
						</div>
						<div class="col-lg-2"></div>
					</div>
					<br> <br>
					<div class="form-group">
						<div class="col-lg-12">
							<center><b>
								<h4 id="out-off">Out of Rp.[0]</h4></b>
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
							<button type="button" id="btn-send-email" class="btn btn-primary"
								style="width: 20%; float: left;">Send</button>
						</div>
					</div>
					<br> <br> <br>
					<div class="form-group">
						<div class="col-lg-12">
							<button type="button" id="btn-print-receipt" class="btn btn-primary"
								style="width: 100%;">Print Receipt</button>
							<button type="button" id="btn-nothanks" class="btn btn-danger"
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
