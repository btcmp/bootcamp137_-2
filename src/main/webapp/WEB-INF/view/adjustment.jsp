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
<!-- ==================================================================  BATAS BUAT ISIAN ========================================================================= -->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> ADJUSTMENT </header>

					<div class="col-sm-9">
						<div class="nav search-row" id="top_menu"
							style="margin-bottom: 30px;">
							<!--  search form start -->
							<ul class="nav top-menu">
								<li>
									<form class="navbar-form">
										<label for="pickup">Search date:</label> <input type="text"
											id="pickup" data-date-range-end="#return"> <label
											for="return">-</label> <input type="text" id="return"
											data-date-range-start="#pickup">
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
						<thead>
							<tr>
								<th><i class="icon_calendar"></i> Adjustment Date</th>
								<th><i class="icon_document"></i> Notes</th>
								<th>Status</th>
								<th><i class="icon_cogs"></i>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
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
						</tbody>
					</table>
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
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="modal-add-adjustment" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">X</button>
				<h4 class="modal-title">ADJUSTMENT</h4>
			</div>
			<form id="save-form" data-parsley-validation>
				<div class="modal-body">

					<div class="form-group">
						<label for="input-adjustment" style="line-height: 4px;"><u><b>CREATE
									NEW ADJUSTMENT : </b></u></label>
						<hr style="line-height: 4px;">
					</div>
					<div class="form-group ">
						<label for="input-notes">Notes</label>
						<textarea class="form-control " id="input-address"
							name="input-notes" required></textarea>
					</div>
					<div class="form-group">
						<label for="input-adjustment" style="line-height: 5px;"><u><b>ADJUSTMENT
									STOCK</b></u></label>
						<hr style="line-height: 4px;">
					</div>
					<div class="col-lg-12" id="list-item" hidden="hidden">
						<table class="table table-striped table-advance table-hover">
							<thead>
								<tr>
									<th style="width: 40%;"><center>Item</center></th>
									<th style="width: 25%;"><center>In Stock</center></th>
									<th style="width: 25%;"><center>Adj. Qty</center></th>
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
						</table>
					</div>
					<div class="form-group">
						<button type="button" id="btn-add-item" class="btn btn-primary"
							style="width: 100%">Add Item</button>
					</div>


				</div>
				<div class="modal-footer">
					<button type="reset" class="btn btn-primary">Cancel</button>
					<button type="button" id="add" class="btn btn-primary">Save
						& Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END MODAL INPUT =================================================================== -->
<!-- ===================================================== MODAL INPUT ADD ITEM =================================================================== -->
<!-- Modal -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
	tabindex="-1" id="modal-add-item" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button aria-hidden="true" data-dismiss="modal" class="close"
					type="button">X</button>
				<h4 class="modal-title">Add Item</h4>
			</div>
			<form id="save-form" data-parsley-validation>
				<div class="modal-body">
					<div class="form-group">
						<div class="col-lg-12">
							<input class="form-control"
								placeholder="Item Name - Variant Name" type="text">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-12">
							<table class="table table-striped table-advance table-hover">
								<thead>
									<tr>
										<th style="width: 40%;"><center>Item</center></th>
										<th style="width: 25%;"><center>In Stock</center></th>
										<th style="width: 25%;"><center>Adj. Qty</center></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>contoh</td>
										<td readonly="readonly">contoh</td>
										<td><div contenteditable>contoh edit</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-lg-10" style="float: right;">
						<button type="button" id="add" class="btn btn-primary">Add</button>
					</div>
					<div class="col-lg-2">
						<button type="reset" class="btn btn-primary">Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END MODAL ADD ITEM =================================================================== -->

<%@ include file="topping/bottom.jsp"%>
