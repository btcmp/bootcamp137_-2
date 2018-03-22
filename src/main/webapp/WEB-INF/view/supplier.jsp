<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
$(function(){
	$('#btn-add').click(function() {
		$('#modal-add-supplier').modal();
	});
	$('#btn-edit').click(function() {
		$('#modal-edit-supplier').modal();
	});
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
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<div class="btn-group">
										<a class="btn btn-primary" id="btn-edit"><i
											class="icon_pencil-edit"></i></a>
									</div>
								</td>
							</tr>
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
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-region">Region</label> <select
															class="form-control" id="input-region">
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-district">District</label> <select
															class="form-control" id="input-district">
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
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-region">Region</label> <select
															class="form-control" id="input-region">
															<option value="" selected="selected">-- Choose
																--</option>
															<option value="">DIISI</option>
														</select>
													</div>
													<div class="col-lg-4">
														<label for="input-district">District</label> <select
															class="form-control" id="input-district">
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

							<%@ include file="topping/bottom.jsp"%>