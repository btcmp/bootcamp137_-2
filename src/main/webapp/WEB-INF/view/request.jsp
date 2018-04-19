<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#btn-add').click(function() {
			$('#modal-add-adjustment').modal();
		});
		$('#btn-add-item').click(function() {
			$('#modal-add-item').modal();
		});
		$('#btn-edit').click(function() {
			$('#modal-edit-adjustment').modal();
		});

		$("#pickup").datepicker({
			dateFormat : 'mm-dd-yy',
			minDate : '-12M',
			maxDate : 0
		});
	});
</script>

<!--------------------------------------------------------------------- ISI ------------------------------------------------------------->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-files-o"></i> Form Validation
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="index.html">Index</a></li>
					<li><i class="icon_document_alt"></i>Purchase</li>
					<li><i class="fa fa-files-o"></i>Request</li>
				</ol>
			</div>
		</div>
		<!-- Form validations -->
		<div class="row">
			<div class="col-lg-12">
				<!-- Start Table Employee -->

				<section class="panel">
					<header class="panel-heading"> DATA PURCHASE REQUEST </header>
					<section class="panel-body">

						<div class="row" style="padding-bottom: 15px;">

							<div class="col-lg-3">
								<input class=" form-control" id="search-date-range"
									name="daterange" type="text" placeholder="input daterange" />
							</div>
							<div class="col-lg-2">
								<select class="form-control" id="search-by-status">
									<option value="">All</option>
						    		<option value="Created">Created</option>
						    		<option value="Submitted">Submitted</option>
						    		<option value="Approved">Approved</option>
						    		<option value="Rejected">Rejected</option>
						    		

								</select>
							</div>
							<div class="col-lg-3">
								<input class=" form-control" id="string-name" name="fullname"
									type="text" placeholder="string search" />
							</div>
							<div class="col-lg-2"></div>


							<!-- button -->
							<div class="col-lg-1">
								<button class="btn btn-primary" id="btn-export">Export</button>

							</div>
							<div class="col-lg-1">
								<button class="btn btn-primary" id="btn-create">Create</button>

							</div>

						</div>
						<div>
							<table class="table table-striped table-bordered text-center"
								cellspacing="0" id="request-table">
								<thead>
									<tr>
										<th>Create Date</th>
										<th>Pr. No</th>
										<th>Note</th>
										<th>status</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody id="isi-pr">
									<c:forEach items="${allPrByOut }" var="pr">
										<!-- //mengambil id barang -->
										<tr id="#">
											<td>${pr.createdOn }</td>
											<td>${pr.prNo }</td>
											<td>${pr.notes }</td>
											<td>${pr.status }</td>
											<td><script>
												if('${pr.status}' == 'Approved'){
													document.write('<input type="button" class="btn-update btn btn-default" value="Edit" key-id="${pr.id } disabled"> |');
												}else if('${pr.status}' == 'Rejected'){
													document.write('<input type="button" class="btn-update btn btn-default" value="Edit" key-id="${pr.id } disabled"> |');
												}else if('${pr.status}' == 'Submitted'){
													document.write('<input type="button" class="btn-update btn btn-default" value="Edit" key-id="${pr.id } disabled"> |');
												}else {
													document.write('<input type="button" class="btn-update btn btn-default" value="Edit" key-id="${pr.id }" > |');
												}
											</script> 
											<a href='${pageContext.request.contextPath}/request/detail/${pr.id}' class="btn-view-pr btn btn-info" key-id="${pr.id }">View</a>
																		
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</section>
				</section>
				<!-- End Table -->
			</div>
		</div>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
</section>
<!-- container section end -->
<!--------------------------------------------------------------------- ISI ------------------------------------------------------------->

<!--------------------------------------------------------------------- MODAL ------------------------------------------------------------->
<!-- Start Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
	aria-labelledby="addModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">PURCHASE REQUEST</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- modal body -->
				<div class="form">
					<form class="form-validate form-horizontal" id="PR-form">
					<div class="bs-callout bs-callout-warning hidden">
					  <h4>Tabel Request Masih Kosong,</h4>
					  <p> Harap mengisi request tabel </p>
					</div>
						<div class="form-group">
							<label for="outlet-name" class="control-label"><span
								class="required">*</span> CREATE NEW PR : ${outlet.name }, ${employee.user.username }</label><span>
								<input type="hidden" name="outlet" id="outlet-select" value="${outlet.id }" style="border:none;"  readonly/></span>
								
						</div>

						<label for="outlet-name" class="control-label"> Target
							Waktu Item Ready : <span class="required">*</span>
						</label>
						<div class="form-group">
							<div class="col-lg-12">
							<input class="form-control reset" type="hidden" name="" id="id-request"/>
							
								<input class="form-control reset" type="date" name="" id="ready-date" required=""/>
							</div>
						</div>

						<label for="outlet-name" class="control-label"> Notes: <span
							class="required">*</span></label>
						<div class="form-group">

							<div class="col-lg-12">
								<textarea class="form-control reset" id="prNo" style="display:none;"></textarea>
								<textarea class="form-control reset" id="request-notes" required=""></textarea>
							</div>
						</div>

						<label for="outlet-name" class="control-label"> Purchase
							Request : <span class="required">*</span>
						</label>
						<div class="form-group">
							<div class="col-lg-12">
								<table class="table basic-table" cellspacing="0"
									id="table-result-add-item">
									<thead>
										<tr>
											<th><center>Item</center></th>
											<th><center>In Stock</center></th>
											<th><center>Request Qty</center></th>
											<th><center>cancel</center></th>
										</tr>
									</thead>
									<tbody align="center" id="isi-tabel-request">
									</tbody>
								</table>
							</div>
						</div>


						<div class="col-lg-12">
							<button class="form-control btn btn-primary" id="item-add-modal">Add Item</button>
						</div>
					</form>


				</div>
			</div>
			<div class="modal-footer">
				<div>
					<button type="button" class="btn btn-success col-lg-2" id="btn-submit" >Submit</button>
				</div>


				<button type="button" type="reset" class="btn btn-info" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-primary" id="btn-save">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal -->


<!------------------------------------------------ Start Modal add item ------------------------------------------------------------>
<div class="modal fade" id="item-modal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">ADD PURCHASE
					ITEMS</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!-- modal body -->
				<div class="form">
					<div class="form-validate form-horizontal" id="form">
						<div class="form-group">
							<div class="col-lg-1"></div>
							<!-- search item -->
							<div class="col-lg-10">
								<input class="form-control" type="text" name="search-item"
									id="search-item-variant" />
							</div>
							<div class="col-lg-1"></div>
						</div>

						<div class="form-group">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<table class="table table-striped" cellspacing="0"
									id="table-result-search">
									<thead>
										<tr align="center">
											<th>Item</th>
											<th>In Stock</th>
											<th>Request Qty.</th>
										</tr>
									</thead>
									<tbody id="hasil-search-itemVar"></tbody>
								</table>
							</div>
							<div class="col-lg-1"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="col-lg-3">
					<button type="reset" class="reset btn btn-info" data-dismiss="modal" id="btn-reset" >Cancel</button>
				</div>
				<!-- <div class="col-lg-8">
					<button type="button" class="btn btn-primary"
						id="add-to-modal-request">Add</button>
				</div> -->
			</div>
		</div>
	</div>
</div>
<!-- End Modal add item -->
<!--------------------------------------------------------------------- MODAL ------------------------------------------------------------->

<!-- JavaScript for Product Request -->

<script type="text/javascript">
	$(document).ready(function() {
		 $('#ready-date1').datepicker({
			autoclose : true
		}); 
		 
		 
		
		 /*====================================== make Aplhanumeric currency ===========================================*/
		 /* const currencyRupiah = {
				 digitGroupSeparator	: '.',
				 decimalCharacter		: ',',
				 decimalplaces			: 2,
				 currencySymbol			: 'Rp ',
				 currencySymbolPlacement	: AutoNumeric.options.currencySymbolPlacement.prefix,
				 roundingMethod			: 'U',
				 minimumValue			: 0,
				 formatOnPageLoad		: true
		 };
		 
		 new AutoNumeric('#input-cash', currencyRupiah); */
		 
		 
/*====================================== Search By Status ===========================================*/
 	$('#search-by-status').on('change', function(){
 		var id = $(this).val();
 		
 		if(id != ""){
	 		$.ajax({
	 			url : '${pageContext.request.contextPath}/request/search-status/'+id,
	 			type : 'GET',
	 			success : function(data){
	 				console.log(data);
	 				$('#isi-pr').empty();
	 				$(data).each(function(index, value){
	 					var tanggal = $.datepicker.formatDate('yy-mm-dd', new Date(value.createdOn));
	 					var isi = "<tr id='"+value.id+"'>"+
						"<td>"+tanggal+"</td>"+
						"<td>"+value.prNo+"</td>"+
						"<td>"+value.notes+"</td>"+
						"<td>"+value.status+"</td>"+
						"<td><script>"+
							"if("+value.status+" == 'Approved'){"+
								"document.write('<input type='button' class='btn-update btn btn-default' value='Edit' key-id='"+value.id+" disabled'> |');"+
							"}else if("+value.status+" == 'Rejected'){"+
								"document.write('<input type='button' class='btn-update btn btn-default' value='Edit' key-id='"+value.id+" disabled'> |');"+
							"}else {"+
								"document.write('<input type='button' class='btn-update btn btn-default' value='Edit' key-id='"+value.id+"' > |');"+
							"}"+
						"<\/script>"+
						"<a href='${pageContext.request.contextPath}/request/detail/${pr.id}' class='btn-view-pr btn btn-info' key-id='"+value.id+"'>View</a>"+
						"</td></tr>";
						
						$("#isi-pr").append(isi);
	 				});
	 			},
	 			error : function(){
	 				alert('gagal get data');
	 			},
	 			dataType : 'json'
	 		});
 		}else{
 			window.location = "${pageContext.request.contextPath}/request";
 		}
 	});
 	
/*======================================= Search By All ===============================================*/
 	$('#string-name').on('input', function(){
		var id = $(this).val();
 		
 		if(id != ""){
	 		$.ajax({
	 			url : '${pageContext.request.contextPath}/request/search-all/'+id,
	 			type : 'GET',
	 			success : function(data){
	 				$('#isi-pr').empty();
	 				$(data).each(function(index, value){
	 					var tanggal = $.datepicker.formatDate('yy-mm-dd', new Date(value.createdOn));
	 					var isi = "<tr id='"+value.id+"'>"+
						"<td>"+tanggal+"</td>"+
						"<td>"+value.prNo+"</td>"+
						"<td>"+value.notes+"</td>"+
						"<td>"+value.status+"</td>"+
						"<td><script>"+
							"if("+value.status+" == 'Approved'){"+
								"document.write('<input type='button' class='btn-update btn btn-default' value='Edit' key-id='"+value.id+" disabled'> |');"+
							"}else if("+value.status+" == 'Rejected'){"+
								"document.write('<input type='button' class='btn-update btn btn-default' value='Edit' key-id='"+value.id+" disabled'> |');"+
							"}else {"+
								"document.write('<input type='button' class='btn-update btn btn-default' value='Edit' key-id='"+value.id+"' > |');"+
							"}"+
						"<\/script>"+
						"<a href='${pageContext.request.contextPath}/request/detail/${pr.id}' class='btn-view-pr btn btn-info' key-id='"+value.id+"'>View</a>"+
						"</td></tr>";
						
						$("#isi-pr").append(isi);
	 				});
	 			},
	 			error : function(){}
	 		});
 		}else{
 			window.location = "${pageContext.request.contextPath}/request";
 		}
 	});
		 
/*=======================================Search on modal add item Variant=================================================  */
		$('#search-item-variant').on('input', function() {
				var keyword = $(this).val();
				console.log(keyword);

				if (!keyword == "") {
					$.ajax({
						url : '${pageContext.request.contextPath}/request/search-item?search='+keyword,
						type : 'GET',
						success : function(data) {
							$('#hasil-search-itemVar').empty();
							$.each(data, function(index, val){
								$('#hasil-search-itemVar').append(
								'<tr id = "tr'+val.id+'"><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td>'
								+'<td id="inStock'+ val.id +'">'+ val.beginning +'</td>'
								+'<td id="td-qty'+ val.id +'"><input class="form-control" type="number" min="0" max="'+val.beginning+'" id="jumlah-request-'+ val.id +'" value="" /></td>'
								+'<td><button type="button" id="'+ val.id +'" class="tbl-add-brg btn btn-primary btn-add'+val.id
								+'" key-id="'+val.itemVariant.id+'">Add</button></td></tr>');
							});
						},
						error : function() {
							$('#hasil-search-itemVar').empty()
						}
					});
				}
			});
			

	/*------------------------------------------ modal set up -------------------------------------------------------------*/
	$('#btn-create').on('click', function(){
		$(".reset").val(" ");
		$('#isi-tabel-request').empty();
		$('#addModal').modal('show');
	})
	
	$('#item-add-modal').on('click', function(){
			$('#addModal').modal('hide');
			$('#item-modal').modal('show');
	})
	
	
	
		
	/*======================================= Set to Create Request Modal =================================================  */
	var itemKe = [];
	$('#add-to-modal-request').on('click', function(){
		
	})
	$('#hasil-search-itemVar').on('click', '.tbl-add-brg',  function(){
		var element = $(this).parent().parent();
		var id = $(this).attr('id');
		var idVariant = $(this).attr('key-id');
		var ItemVarName = element.find('td').eq(0).text();
		var InStok	= element.find('td').eq(1).text();
		var reqQty = $('#jumlah-request-'+id).val();
		
		if(itemKe.indexOf(id.toString()) == -1){
			$('#isi-tabel-request').append(
					'<tr id="'+id+'" key-id="'+idVariant+'">'
						+'<td>'+ ItemVarName + '</td>'
						+'<td>'+ InStok + '</td>'
						+'<td>'+ reqQty + '</td>'
						+'<td>'+ '<button type="button" class="btn btn-danger btn-delete" id="btn-del'+id+'" key-id="'+id+'">&times;</button>' + '</td>'
						+'</tr>'
					);
			itemKe.push(id);
		} else {
			//edit
			var target = $('#isi-tabel-request > #'+id+'');
				var oldReq = target.find('td').eq(2).text();
				var newReq = parseInt(oldReq)+parseInt(reqQty);
				target.find('td').eq(2).text(newReq);
		}
		
		$('#item-modal').modal('hide');
		$('#addModal').modal('show');
		
	});
	/*==================================================== DELETE ITEM IN DISPLAY ============================================ */
	$('#table-result-add-item').on('click', '.btn-delete', function(){

		var id = $(this).attr('key-id');
		$(this).parent().parent().remove();
		var index = itemKe.indexOf(id.toString());
		if(index > -1 ){
			itemKe.splice(index, 1);
		}
	});
	/*=================================================== Save Request Modal =================================================  */
	  
	$('#btn-save').on('click', function(evt){
		evt.preventDefault();
		
		var listDetailRequest = [];
		var listHistoryRequest = [];
		var idUser = "${employee.user.id}";
		
		var createdBy = {
				id : idUser
		}
		
		var isiTable = $('#table-result-add-item > tbody > tr').length;
		console.log('isi tabel : '+isiTable);
		$('#request-notes').parsley().validate();
		$('#ready-date').parsley().validate();
		
		if(isiTable != 0){
		$('#table-result-add-item > tbody > tr ').each(function(index, data){
			var detailRequest = {
				itemvar : {
					id : $(data).attr('key-id')
				},
				requestQty : $(data).find('td').eq(2).text(),
				createdOn : new Date(),
				createdBy : createdBy,
				modifiedBy : createdBy,
				modifiedOn : new Date(),
			};
			
			listDetailRequest.push(detailRequest);
			var history = {
					status : "waiting",
					createdBy : createdBy
			};
			listHistoryRequest.push(history);
		});
		
		var outlet = {
				id : $('#outlet-select').val()
		}
		
		
		
		var request = {
				id : $('#id-request').val(),
				status : "Created",
				notes : $('#request-notes').val(),
				readyTime : $('#ready-date').val(),
				prNo : $('#prNo').val(),
				outlet : outlet,
				createdBy : createdBy,
				requestDetail : listDetailRequest,
				historyPr : listHistoryRequest
		};
		
		console.log(request);
		console.log(createdBy);
		/* ajax to save */
		 $.ajax({
			url : '${pageContext.request.contextPath}/request/save',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(request),
			success : function(data){
				//alert('save success');
				window.location='${pageContext.request.contextPath}/request';
			}, error : function(){
				alert('save request failed');
			}
		});
		/* end if */
		} else {
			var validate = 0;
			$('.bs-callout-warning').toggleClass('hidden', validate);
			setTimeout(function(){
				$('.bs-callout-warning').toggleClass('hidden', validate);
			}, 5000);
		}
		
	})
	
	
	/* 	 
	$('#PR-form').parsley().on('field:validated', function() {
		    var ok = $('.parsley-error').length === 0;
		    $('.bs-callout-info').toggleClass('hidden', !ok);
		    $('.bs-callout-warning').toggleClass('hidden', ok);
		  })
		  .on('form:input ', function() {
			  $('#btn-save').click();
			  
		    return false; // Don't submit form for this demo
		  });
	 */	 
		
	
	/*=================================================== Update Request Modal =================================================  */
	$('#request-table').on('click', '.btn-update', function(){
		console.log('edit');
		$('#isi-tabel-request').empty();
		var idEdit = $(this).attr('key-id');
		$.ajax({
			url : '${pageContext.request.contextPath}/request/get-one/'+idEdit,
			type : 'GET',
			dataType: 'json',
			success : function(data){
				console.log(data);
				$('#id-request').val(data.id);
				$('#request-notes').val(data.notes);
				$('#prNo').val(data.prNo);
				/* var date = data.readyTime.split('-');
				var tanggal = date[1]+'/'+date[2]+'/'+date[0]; */
				$('#ready-date').val(data.readyTime);
				$(data.requestDetail).each(function(key, val){
					$('#isi-tabel-request').append(
						'<tr key-id="'+val.itemvar.id+'"><td>'+val.itemvar.item.name+'-'+val.itemvar.name+'</td>'
						+'<td>null</td>'
						+'<td>'+val.requestQty+'</td>'
						+'<td><button type="button" class="btn btn-danger btn-delete" id="btn-del'+idEdit+'" key-id="'+idEdit+'">&times;</button>'
					);
				});
				$('#addModal').modal('show');
			}, 
			error : function(){
				console.log('gagal');
			}
		});
	});
	
	/*=================================================== Set SUBMIT =================================================  */
	$('#btn-submit').on('click', function(evt){
		var id = $('#id-request').val();

		var newDateForStatus = new Date();
		console.log(id);
		
		var history = {
				pr : {
					id : '${pr.id}'
				},
				createdOn : newDateForStatus,
				status : 'Submitted'
			}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/request/Submitted/"+id,
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(history),
			
			success : function(data){
				window.location = '${pageContext.request.contextPath}/request/';
			}, error : function(){
				alert ('failed change status');
			}
		});
	});
	
	/* ============================================== EXPORT ======================= */
	$('#btn-export').on('click', function(){
		window.open('${pageContext.request.contextPath}/generate/request');
	})
})
</script>

<%@ include file="topping/bottom.jsp"%>
