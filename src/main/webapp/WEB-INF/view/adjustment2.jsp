<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#btn-add').click(function() {
			$('#modal-add-adjustment').modal();
		});
		$('#btn-add-item').click(function() {
			$('#modal-add-item').modal();
		});
		$('.update').click(function() {
			var id = $(this).attr('id');
			
			window.location= "${pageContext.request.contextPath}/adjustment/get-detail/"+id;
			
		});

		$("#pickup").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate : '-12M',
			maxDate : 0
		});
		//seacrh date range
		function search(){
			if($('#return').val() != "" && $('#pickup').val() != ""){
				var tglFrom = $('#pickup').val();
				var tglTo = $('#return').val();
				
				$.ajax({
					url : '${pageContext.request.contextPath}/adjustment/search/'+tglFrom+'/'+tglTo,
					type : 'GET',
					success : function(data){
						$('#data-adjustment').empty();
						$(data).each(function(index, value){
							console.log(value.id);
							var dataAdj = "<tr id='"+value.createdOn+"'>"+
							"<td>"+value.notes+"</td>"+
							"<td>"+value.status+"</td>"+
							"<td><div class='btn-group'>"+
							"<a class='update btn btn-primary' id='"+value.id+"'>"+
							"<i class='icon_pencil-edit'></i></a>"+
							"</div></td>"+
							"</tr>";
							
							$('#data-adjustment').append(dataAdj);
						});
					},
					error : function(){
						alert('failed search data adjustment');
					}
				});
			}
		}
		
		
		$('#list-adjustment').attr('hidden', 'hidden');
		$('#list-item').attr('hidden', 'hidden');
		
		//search item in add item
		$('#search-item').on('input', function(){
			var word = $(this).val();
			console.log(word);
			
			if(!word==""){
				$.ajax({
					url : '${pageContext.request.contextPath}/adjustment/search-item/'+word,
					type : 'GET',
					success : function(data){
						$('#isi-item').empty();
						$(data).each(function(index, value){
							//console.log(value.beginning);
							var isi = "<tr id='"+value[2]+"'>"+
							"<td>"+value[3]+" - "+value[1]+"</td>"+
							"<td>"+value[0]+"</td>"+
							"<td><div contenteditable='true'><input type='text' id='input-adj-qty-"+value[2]+"'></div></td>"+
							"</tr>";
							
							$('#isi-item').append(isi);
						});
						
					},
					error : function(){}
				}); 
			}
		});
		
		//add item pindah ke list adjustment
		$('#add-item').click(function(){
			$('#table-add-item > tbody > tr').each(function(index, data){
				var idVar = $(data).attr('id');
				var itemVariant = $(data).find('td').eq(0).text();
				var inStock = $(data).find('td').eq(1).text();
				var adjQty = $('#input-adj-qty-'+idVar+'').val();
				if(!adjQty == ""){
					var isi = "<tr id='"+idVar+"'>"+
					"<td>"+itemVariant+"</td>"+
					"<td>"+inStock+"</td>"+
					"<td>"+adjQty+"</td>"+
					"<td>"+
						"<a href='#' class='cancel btn btn-danger' id='cancel'>X</a>"+
						"</td>"+
					"</tr>";
					
					$('#isi-adjustment').append(isi);
					
				}
			});
			$('#list-item').removeAttr('hidden');
		});
		
		//cancel list adjustment
		$('#cancel').on('click', function(){
			alert('hallo cancel');
		});
		
		//save adjustment
		$('#save-adjustment').click(function(){
			var listDetAdjustment = [];
			var listHistory = [];
			$('#table-adjustment > tbody > tr').each(function(index, data){
				var detAdjustment = {
					variantId :{
						id : $(data).attr('id')
					},
					inStock : $(data).find('td').eq(1).text() - $(data).find('td').eq(2).text(),
					actualStock : $(data).find('td').eq(2).text()
				};
				listDetAdjustment.push(detAdjustment);
				var history = {
					status : "waiting"
				};
				listHistory.push(history);
			});
			
			var adjustment = {
				status : "Submitted",
				notes : $('#input-notes').val(),
				hisAdjustments : listHistory,
				detAdjustments : listDetAdjustment
			};
			
			console.log(adjustment);
			$.ajax({
				url : '${pageContext.request.contextPath}/adjustment/save',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(adjustment),
				success : function(data){
					console.log(data);
					window.location="${pageContext.request.contextPath}/adjustment";
					//alert('save success!!');
					//window.location = '${pageContext.request.contextPath}/adjustment';
				},
				error : function(){
					alert('save adjustment failed');
				}
			});
		});
		
		//reset
		$('#btn-reset').click(function(){
			$('#isi-item').empty();
		});
		$('#cancel-adjustment').click(function(){
			$('#isi-adjustment').empty();
			$('#list-item').attr('hidden', 'hidden');
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
											data-date-range-start="#pickup" oninput="search()">
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
						<tbody id="data-adjustment">
						<c:forEach items="${listAdjustment }" var="adj">
							<tr>
								<td>${adj.createdOn }</td>
								<td>${adj.notes }</td>
								<td>${adj.status }</td>
								<td>
									<div class="btn-group">
										<a class="update btn btn-primary" id="${adj.id }"><i
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
						<textarea class="form-control " id="input-notes"
							name="input-notes" required></textarea>
					</div>
					<div class="form-group">
						<label for="input-adjustment" style="line-height: 5px;"><u><b>ADJUSTMENT
									STOCK</b></u></label>
						<hr style="line-height: 4px;">
					</div>
					<div class="col-lg-12" id="list-item">
						<table class="table table-striped table-advance table-hover" id="table-adjustment">
							<thead>
								<tr>
									<th style="width: 40%;"><center>Item</center></th>
									<th style="width: 25%;"><center>In Stock</center></th>
									<th style="width: 25%;"><center>Adj. Qty</center></th>
									<th style="width: 10%;"><center>#</center></th>
								</tr>
							</thead>
							<tbody id="isi-adjustment">
							</tbody>
						</table>
					</div>
					<div class="form-group">
						<button type="button" id="btn-add-item" class="btn btn-primary"
							style="width: 100%">Add Item</button>
					</div>


				</div>
				<div class="modal-footer">
					<button type="reset" class="btn btn-primary" id="cancel-adjustment">Cancel</button>
					<button type="button" id="save-adjustment" class="btn btn-primary">Save
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
								placeholder="Item Name - Variant Name" type="text" id="search-item">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-12">
							<table class="table table-striped table-advance table-hover" id="table-add-item">
								<thead>
									<tr>
										<th style="width: 40%;"><center>Item</center></th>
										<th style="width: 25%;"><center>In Stock</center></th>
										<th style="width: 25%;"><center>Adj. Qty</center></th>
									</tr>
								</thead>
								<tbody id="isi-item">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-lg-10" style="float: right;">
						<button type="button" id="add-item" class="btn btn-primary">Add</button>
					</div>
					<div class="col-lg-2">
						<button type="reset" class="btn btn-primary" id="btn-reset">Cancel</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ===================================================== END MODAL ADD ITEM =================================================================== -->

<%@ include file="topping/bottom.jsp"%>
