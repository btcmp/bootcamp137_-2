<%@ include file="topping/top.jsp"%>
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
			
			var add = "<tr><td>" + varname + "</td><td>" + uprice + "</td><td>" + sku + "</td><td>" + beginning + "</td><td>" + alert +
					  "</td><td><a class='btn-edit' href='#'> Edit</a><button type='button' id='btn-X' class='btn btn-danger'> X </button></td></tr>";
			$("#tbody-addvar").append(add);
			
		});
		
		/* $('#btn-save').on('click', function(evt){

		} */
		
		
		$('#btn-save').on('click', function(evt){
			evt.preventDefault();
			var form = $('#target').val();
			var variant = [];
			var inventory = [];
				var item = {
						name : $('#input-item-name').val(),
						category : {
								id : $('#input-category').val()
						}
				};
				var variant = {
						price : $('#input-uprice').val()
				};
				var inventory = {
						beginning : $('#input-beginning').val(),
						alertAtQty : $('#input-alertat').val()
				}
		
				
				console.log(item);
				
				$.ajax({
					url : '${pageContext.request.contextPath}/item/save',
					type :'POST',
					data : JSON.stringify(item),
					contentType : 'application/json',
					success: function(data){
					window.location='${pageContext.request.contextPath}/item';
					}, error : function(){
						alert('saving failed')	
					}
				});
		});
				
			
		// mengambil nilai untuk edit add variant
		/* $('.btn-edit').click(function(){
			var id = $(this).attr('id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/item/get-one/'+id,
				type :'GET',
				success: function(item){
					setEditOutlet(item);
					$('#modal-edit').modal();
				},
				error : function(){
					alert('failed update')	
				},
				dataType :'json'
			})
		});	
		
		// SET UP DATA EDIT
		function setEditItem(item){
			$('#edit-id').val(out.id);
			$('#edit-outletName').val(out.name);
			$('#edit-address').val(out.address);
		} */
		
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
										<c:forEach items ="${items}" var="item">
										<tr>
											<td>${item.name}</td>
											<td>${item.category.name}</td>
											<td></td>
											<td></td>
											<td></td>
											<td><a href="" data-toggle="modal"data-target="#modalEdit2"> Edit </a> 
												
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
										</c:forEach>
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


<%@ include file="topping/bottom.jsp"%>
