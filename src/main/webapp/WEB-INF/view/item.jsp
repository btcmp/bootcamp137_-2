<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function() {
		index = 0;
		
		// menampilkan pop up create
		$('#btn-create').click(function() {
			$('#modal-create').modal();
		});

	/* -------------------------------------------------------------- ADD VARIANT (CREATE) -------------------------------------------------------------------- */
		// ADD NEW VARIANT DARI ADD VARIANT 
		$('#btn-add').click(function(){
			var varname  = $('#input-varname').val();
			var uprice  = $('#input-uprice').val();
			var sku  = $('#input-sku').val();
			var beginning = $('#input-beginning').val();
			var alert = $('#input-alertat').val();
			
			var variant = {
				name : varname,
				price : uprice,
				sku : sku
			};
			var inventory = {
				beginning : $('#input-beginning').val(),
				alertAtQty : $('#input-alertat').val()
			};
			
			var add = "<tr id=tr-var "+ index + " ><td>" + varname + "</td><td>" + uprice + "</td><td>" + sku + "</td><td>" + beginning + "</td><td style='display:none;'>" + alert +
					  "</td><td><a class='btn-edit' href='#' data-toggle='modal' data-target='#modal-edit'> Edit</a><button type='button' id='btn-X' class='btn btn-danger'> X </button></td></tr>";
			$("#tbody-addvar").append(add);
			index++;
			console.log(index);
		});	

	
	/* ------------------------------------------------------------------ SAVE (CREATE) -------------------------------------------------------------------- */
		// SAVE ITEM + VARIANT
		$('#btn-save').on('click', function(evt){
			evt.preventDefault();
			var itemVariants =[];
			var itemInventories = [];
			$('#tbl-addvar > #tbody-addvar > tr').each(function(index, data){
					var inventory = {
							beginning : $(data).find('td').eq(3).text(),
							alertAtQty : $(data).find('td').eq(4).text()
					}
					var variant = {
							name : $(data).find('td').eq(0).text(),
							price : $(data).find('td').eq(1).text(),
							sku : $(data).find('td').eq(2).text(),
							itemInventories : [inventory]
					}
					itemVariants.push(variant);
			});
			
			var item = {
					name : $('#input-item-name').val(),
					category : {
							id : $('#input-category').val(),
					},
					itemVariants : itemVariants
			};
			console.log(item);
			
			   $.ajax({
				url : '${pageContext.request.contextPath}/item/save',
				type :'POST',
				contentType : 'application/json',
				data : JSON.stringify(item),
				success: function(data){
					alert('save')
					window.location='${pageContext.request.contextPath}/item';
				}, error : function(){
					alert('saving failed')	
				}
			});  
		});  
		 
	
 	/* ------------------------------------------------------------------ EDIT VARIANT (CREATE) ---------------------------------------------------------------- */	
		// EDIT VARIANT
	 	$('#tbody-addvar').on('click', '.btn-edit', function(evt){
			evt.preventDefault();
			var element = $(this).parent().parent();
				$('#modal-edit').modal();
				$('#edit-varname').val(element.find('td').eq(0).text());	
				$('#edit-uprice').val(element.find('td').eq(1).text());
				$('#edit-sku').val(element.find('td').eq(2).text());
				$('#edit-beginning').val(element.find('td').eq(3).text());
				$('#edit-alert').val(element.find('td').eq(4).text());
				$('#id-hidden-variant').val(element.find('td').eq(0).attr('id'));
				//console.log(element.find('td').eq(0).attr('id'));
				
				console.log(element.attr('id'));
				console.log(element)
	 	});
	 	
 	
	/* -------------------------------------------------------------- DELETE VARIANT (CREATE) ------------------------------------------------------------------- */
 		//DELETE
		$('#tbody-addvar').on('click', '#btn-X', function(){
	 			$(this).parent().parent().remove();
	 		});

	
	/* -------------------------------------------------------------- ADD DARI EDIT VARIANT (CREATE) -------------------------------------------------------------------- */
		// ADD dari modal edit pada CREATE
		 $('#btn-add-from-edit').click(function(evt){
			evt.preventDefault;
			var index =$('#id-hidden-variant').val();
			console.log(index)
			
			$('#tr-var' + index).remove();
			$('#tbody-addvar').append("<tr id=tr-var2 " + index + "><p style='display:none;'>" + $('#id-hidden-variant').val() + "</p><td>" + $('#edit-varname').val() + "</td><td>" + $('#edit-uprice').val() + "</td><td>" 
					+ $('#edit-sku').val() + "</td><td>" + $('#edit-beginning').val() + "</td><td style='display:none;'>" + $('#edit-alert').val() +
					"</td><td><a class='btn-edit' href='#' data-toggle='modal' data-target='#modal-edit'> Edit</a><button type='button' id='btn-X' class='btn btn-danger'> X </button></td></tr>");
		 	index++;
		 	
		 	alert('save ok');
 			}); 
	

	
	
	
	
	
	
	/*---------------------------------------------------- EDIT DATA UTAMA -----------------------------------------------*/
	  	 // EDIT PADATABLE UTAMA
		 $('.btn-edit-utama').on('click', function(evt) {  
		 // $('body').on('click', '.btn-edit-utama', function(evt){
			evt.preventDefault();
	    	var id=$(this).attr('id');	
			
	    	console.log(id)
    		$.ajax({
				url :'${pageContext.request.contextPath}/item/get-one/'+id,
				type :'GET',
				dataType:'json',
				success : function(dt){	
					$('#modal-edit-utama').modal();
					$('#edit-id-utama').val(parseInt(id));
				 	var index = 0;
					$.each(dt,function(key,invent){
						$('#edit-name-utama').val(invent.itemVariant.item.name);
						$('#edit-category-utama').val(invent.itemVariant.item.category.id);
						$('#tbody-edit-utama').empty();
						$('#tbody-edit-utama').append('<tr id=tr-var3'+index+'><td id='+index+'>' + invent.itemVariant.name +'</td><td>'+
								invent.itemVariant.price +'</td><td>'+invent.itemVariant.sku
								+'</td><td>'+invent.beginning+'</td><td style="display:none">'+invent.alertAtQty+'</td>'
								+'<td style="display:none">'+invent.itemVariant.id+'</td>'
								+'<td style="display:none">'+invent.id+'</td>'
							//	+'<td>'+invent.outlet.name+'</td>'
								+'<td> <a href="#" class="btn-edit-variant-utama" data-toggle="modal" data-target="#modalEdit3"> Edit </a> <a href="#" id="btn-X-utama" class="btn btn-danger"> X </a>'
								+'</tr>');
						index++;
					})
				}, 				
				error:function() {
					alert('failed getting data')
				}
			});
		}); 
	
	
	/* ----------------------------------------------------- EDIT VARIANT (UTAMA) ----------------------------------------*/
		 $("#tbody-edit-utama").on('click','.btn-edit-variant-utama',function(evt){
		 evt.preventDefault();
	        var element = $(this).parent().parent();
	        $('#modalEdit3').modal();
	        $('#edit-varname-utama').val(element.find('td').eq(0).text());
	        $('#edit-uprice-utama').val(element.find('td').eq(1).text());
	        $('#edit-sku-utama').val(element.find('td').eq(2).text());
	        $('#edit-beginning-utama').val(element.find('td').eq(3).text());
	   	   	$('#edit-alert-utama').val(element.find('td').eq(4).text());
	   		$('#id-variant-utama').val(element.find('td').eq(5).text());
	   		$('#id-inventory-utama').val(element.find('td').eq(6).text());
	   		$('#id-item-hidden-utama').val(element.find('td').eq(0).attr('id'));
	    });
	
			
	/* -------------------------------------------------------------- ADD DARI EDIT VARIANT (UTAMA) -------------------------------------------------------------------- */
		// ADD dari modal edit pada CREATE
		  $('#btn-add-from-edit-utama').click(function(evt){
			evt.preventDefault;
			 $('#modalEdit3').modal();
			var index =$('#id-hidden-variant-utama').val();
			console.log(index)
			
			$('#tr-var' + index).remove();
			$('#tbody-edit-utama').empty();
			$('#tbody-edit-utama').append("<tr id=tr-var3 " + index + "><p style='display:none;'>" + $('#id-hidden-variant-utama').val() + "</p><td>" + $('#edit-varname-utama').val() + "</td><td>" + $('#edit-uprice-utama').val() + "</td><td>" 
					+ $('#edit-sku-utama').val() + "</td><td>" + $('#edit-beginning-utama').val() + "</td><td style='display:none;'>" + $('#edit-alert-utama').val() +
					"</td><td><a 'btn-edit-variant-utama' href='#' data-toggle='modal' data-target='#modalEdit3'> Edit</a><button type='button' id='btn-X-utama' class='btn btn-danger'> X </button></td></tr>");
		 	index++;
		 
		 	alert('save ok');
 			});  
	
	
  /* -------------------------------------------------------------- ADD VARIANT (UTAMA) -------------------------------------------------------------------- */
		// ADD NEW VARIANT DARI ADD VARIANT 
		 $('#btn-addvar-utama').click(function(evt){
			 evt.preventDefault;
			 
			var varname  = $('#input-varname-utama').val();
			var uprice  = $('#input-uprice-utama').val();
			var sku  = $('#input-sku-utama').val();
			var beginning = $('#input-beginning-utama').val();
			var alert = $('#input-alertat-utama').val();
			
			var variant = {
				name : varname,
				price : uprice,
				sku : sku
			};
			var inventory = {
				beginning : $('#input-beginning-utama').val(),
				alertAtQty : $('#input-alertat-utama').val()
			};
			
			var add = "<tr id=tr-var4 "+ index + " ><td>" + varname + "</td><td>" + uprice + "</td><td>" + sku + "</td><td>" + beginning + "</td><td style='display:none;'>" + alert +
					  "</td><td><a class='btn-edit-variant-utama' href='#' data-toggle='modal' data-target='#modalEdit3'> Edit</a><button type='button' id='btn-X' class='btn btn-danger'> X </button></td></tr>";
			$("#tbody-edit-utama").append(add);
			index++;
			console.log(index);
			
			$('#modal-edit-utama').modal('hide');
			 $('#modalAddVariant3').modal('show');
		});	 

	
	/* ------------------------------------------------------------------ SAVE (UTAMA) -------------------------------------------------------------------- */
		// SAVE ITEM + VARIANT UTAMA
		  $('#btn-save-utama').on('click',function(evt){
			evt.preventDefault();
			
			var itemVariants =[];
			var itemInventories = [];
			
		  $('#tbl-edit-utama > #tbody-edit-utama > tr').each(function(index,data){
		    	var inventory = {
		    			id : $(data).find('td').eq(6).text(),
						beginning :$(data).find('td').eq(3).text(),
					    alertAtQty :$(data).find('td').eq(4).text(),
					    itemVariant : {
					    	 id : $(data).find('td').eq(5).text()
					    }
				 }
		    	
		    	var variant = {
		    			id : $(data).find('td').eq(5).text(),
						name : $(data).find('td').eq(0).text(),
						price : $(data).find('td').eq(1).text(),
						sku : $(data).find('td').eq(2).text(),
						active : 0,
						itemInventories : [inventory],
						item : {
					    	id : $(data).find('td').eq(5).text()
					     }
		    	}
		    	
		    	itemVariants.push(variant)
		  });
		  console.log(itemVariants)
		  
		  
		  var item = {
		    	id : $('#edit-id-utama').val(),
		    	name : $('#edit-name-utama').val(),
		    	active : 0,
		    	category:{
		    		id :  $('#edit-category-utama').val()
		    	},
		    	itemVariants : itemVariants
		    }
		  console.log(item);
		  if(item.name!==""){
		    	console.log(item.name)
		    	 $.ajax({
				    	url:'${pageContext.request.contextPath}/item/update',
				    	type : 'PUT',
				    	data : JSON.stringify(item),
				    	contentType : 'application/JSON',
				    	success : function(){
				    		alert('save success')
				    		window.location = '${pageContext.request.contextPath}/item';
				    	},
				    	error : function(){
				    		alert('save failed')
				    	}
				    });
		    } 	
 
		  });
	
	/* -------------------------------------------------------------- DELETE VARIANT (UTAMA) ------------------------------------------------------------------- */
		//DELETE
		$('#tbody-edit-utama').on('click', '#btn-X-utama', function(){
				$(this).parent().parent().remove();
			});

	
	
	
	
	
	
	});	
	
</script>


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
															src="resources/gambar-item/gambar-hp.jpg" style="width: 100px; height: 60px;">
														<input class="col-lg-8" type="text" style="margin-bottom: 10px;" id="input-item-name" placeholder="Item Name">
														<select class="col-lg-8" type="text" path="category.id" class="form-control" id="input-category" >
															<c:forEach var="cat" items="${cats}">
																<option value="${cat.id}">${cat.name}</option>
															</c:forEach>
														</select>
													</div>
													<div style = "clear:both;"></div>

													<div class="col-lg-8" style="margin-bottom: 10px;">
														<h5><b>Variant</b></h5>
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#modalAddVariant">Add Variant</button>

													</div>
													
													<!-- ================ TABLE ===================== -->
													<table class="table table-bordered" id="tbl-addvar">
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
														<button type="button" id="btn-save" class="btn btn-primary">Save</button>
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
												<form>
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
														<b>Set Beginning Stock</b>
														</hr>
													</div>

													<div class="col-lg-6" style="margin-bottom: 10px;">
														<input type="text" id="input-beginning" placeholder="Beginning Stock">
													</div>
													<div class="col-lg-6" style="margin-bottom: 10px;">
														<input type="text" id="input-alertat" placeholder="Alert At">
													</div>
												</div>
												<div class="modal-footer">
													<div class="col-lg-10">
														<button type="reset"  class="btn btn-primary">Cancel</button>
													</div>
													<div class="col-lg-2">
														<button type="button" id="btn-add" class="btn btn-primary">Add</button>
													</div>
												</div>
												</form>
											</div>

										</div>
										<!-- modal Add Variant end -->
									</div>



								</div>


								<!-- ============================ TABLE ============================= -->
								<table id="tbl-item" class="table table-bordered">
								
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
										<c:forEach items ="${inventories}" var="inv">
										<tr>
											<td>${inv.itemVariant.item.name}-${inv.itemVariant.name}</td>
											<td>${inv.itemVariant.item.category.name}</td>
											<td>${inv.itemVariant.price}</td>
											<td>${inv.beginning}</td>
											<td>${inv.alertAtQty}</td>
											<td>
												<a id="${inv.itemVariant.item.id}" href="#" class="btn-edit-utama" data-toggle="modal"data-target="#modal-edit-utama"> Edit </a> 
											
											
									<!-- ============================================= Modal EDIT =========================================-->
												<div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="modalEditLabel" aria-hidden="true">
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
															<form>
															<div class="modal-body" style="height: 110px">
																<input type="hidden" name="edit-id" id="edit-id">
																<p id="id-hidden-variant"></p>
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
																	<input type="hidden" id="id-variant">
																</div>

															</div>
															<div class="modal-footer">
																<div class="col-lg-10">
																	<button type="reset" class="btn btn-primary">Cancel</button>
																</div>
																<div class="col-lg-2">
																	<button type="button" id="btn-add-from-edit"class="btn btn-primary">Add</button>

																</div>
															</div>
															</form>
														</div>


													</div>
													<!-- modal EDIT end --></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<!--  table end -->


								<!-- ================= Modal EDIT UTAMA =================== -->
								<div class="modal fade" id="modal-edit-utama" tabindex="-1"
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
												<input type="hidden" id="edit-id-utama" class="form-control">	
													<input class="col-lg-4" type="image" id="myimage"
															src="resources/gambar-item/gambar-hp.jpg" style="width: 100px; height: 60px;">
													<input class="col-lg-8" type="text"
														style="margin-bottom: 10px;" id="edit-name-utama" placeholder="Item Name">
													<select class="col-lg-8" type="text" path="category.id" class="form-control" id="edit-category-utama" >
															<c:forEach var="cat" items="${cats}">
																<option value="${cat.id}">${cat.name}</option>
															</c:forEach>
														</select>
													</div>
													<div style = "clear:both;"></div>

												<div class="col-lg-8" style="margin-bottom: 10px;">
													<h5>VARIANT</h5>
												</div>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<button type="button" class="btn btn-primary" id="btn-addvar-utama"
														>Add
														Variant</button>
												</div>

												<table class="table table-bordered" id="tbl-edit-utama">
													<thead>
														<tr>
															<th>Variant Name</th>
															<th>Unit Price</th>
															<th>SKU</th>
															<th>Beginning Stock</th>
															<th style="display:none">Alert At</th>
															<th style="display:none">ID Variant</th>
															<th style="display:none">ID Inventory</th>
															<th>#</th>
														</tr>
													</thead>
													<tbody id="tbody-edit-utama">
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
													<button type="button" id="btn-save-utama" class="btn btn-primary">Save</button>
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
											<form>
											<div class="modal-body" style="height: 110px">
												<input type="hidden" name="edit-id-utama2" id="edit-id-utama2">
													<p id="id-hidden-variant-utama"></p>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<input type="text" id="edit-varname-utama" placeholder="Variant Name">
												</div>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<input type="text" id="edit-uprice-utama"placeholder="Unit Price">
												</div>
												<div class="col-lg-4" style="margin-bottom: 10px;">
													<input type="text" id="edit-sku-utama" placeholder="SKU">
												</div>
												<div class="hr" style="margin-left: 20px;">
													<hr>
													Set Beginning Stock
													</hr>
												</div>

												<div class="col-lg-6" style="margin-bottom: 10px;">
													<input type="text" id="edit-beginning-utama" placeholder="Beginning Stock">
												</div>
												<div class="col-lg-6" style="margin-bottom: 10px;">
													<input type="text" id="edit-alert-utama" placeholder="Alert At">
									
												</div>

											</div>
											<div class="modal-footer">
												<div class="col-lg-10">
													<button type="reset" class="btn btn-primary">Cancel</button>
												</div>
												<div class="col-lg-2">
													<button type="button" id="btn-add-from-edit-utama"class="btn btn-primary">Add</button>
												</div>
											</div>
											</form>
										</div>

									</div>
									<!-- modal EDIT end -->



	<!-- ===================================== Modal Add Variant UTAMA==============================-->
									<div class="modal fade" id="modalAddVariant3" tabindex="-1"
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
												<form>
												<div class="modal-body" style="height: 110px">
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<input type="text" id="input-varname-utama" placeholder="Variant Name">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<input type="text" id="input-uprice-utama" placeholder="Unit Price">
													</div>
													<div class="col-lg-4" style="margin-bottom: 10px;">
														<input type="text" id="input-sku-utama" placeholder="SKU">
													</div>
													<div class="hr" style="margin-left: 20px;">
														<hr>
														<b>Set Beginning Stock</b>
														</hr>
													</div>

													<div class="col-lg-6" style="margin-bottom: 10px;">
														<input type="text" id="input-beginning-utama" placeholder="Beginning Stock">
													</div>
													<div class="col-lg-6" style="margin-bottom: 10px;">
														<input type="text" id="input-alertat-utama" placeholder="Alert At">
													</div>
												</div>
												<div class="modal-footer">
													<div class="col-lg-10">
														<button type="reset"  class="btn btn-primary">Cancel</button>
													</div>
													<div class="col-lg-2">
														<button type="button" id="btn-add-utama" class="btn btn-primary">Add</button>
													</div>
												</div>
												</form>
											</div>

										</div>
										<!-- modal Add Variant end -->


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


<%@ include file="topping/bottom.jsp"%>
