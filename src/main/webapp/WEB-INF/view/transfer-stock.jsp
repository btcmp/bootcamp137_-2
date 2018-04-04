<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	/* ------------------------------------------------- SEARCH ITEM (ADD)-------------------------------------------- */
	$('#search-item-variant').on('input', function(){
		var word = $(this).val();
		console.log(word);
	 	
		if(!word==""){
			$.ajax({
				url : '${pageContext.request.contextPath}/transfer-stock/search-item/'+word,
				type : 'GET',
				success : function(data){
					console.log(data);
					$('#tbody-item').empty();
					$(data).each(function(index, value){
						//console.log(value.beginning);
						var add = "<tr id='"+value[2]+"'>"+
								  "<td>"+value[3]+" - "+value[1]+"</td>"+
								  "<td>"+value[0]+"</td>"+
								  "<td><div contenteditable='true'><input type='text' id='input-trans-qty"+value[2]+"'></div></td>"+
								  "</tr>";
						$('#tbody-item').append(add);
					});
				},
				error : function(){}
			}); 
		}
	});
	
	/* ---------------------------------------- ADD ITEM KE FORM -------------------------------------------------------- */
	$('#btn-add').click(function(){
			$('#tbl-add-item > tbody > tr').each(function(index, data){
				var idVar = $(data).attr('id');
				var itemVariant = $(data).find('td').eq(0).text();
				var inStock = $(data).find('td').eq(1).text();
				var transferQty = $('#input-trans-qty'+idVar+'').val();
				if(!transferQty == ""){
					var add = "<tr id='"+idVar+"'>"+
							  "<td>"+itemVariant+"</td>"+
							  "<td>"+inStock+"</td>"+
							  "<td>"+transferQty+"</td>"+
						  	  "<td>"+ "<a href='#' class='cancel btn btn-danger' id='btn-X'>X</a>"+ "</td>"+
							  "</tr>";
					$('#tbody-transfer-stock').append(add);
				} else if (transferQty>inStock) {
						alert("Stock Kurang");
				} else if (transferQty<1) {
						alert("Sisa 1");
				}else {
					var add = "<tr id='"+idVar+"'>"+
							  "<td>"+itemVariant+"</td>"+
							  "<td>"+inStock+"</td>"+
							  "<td>"+transferQty+"</td>"+
						  	  "<td>"+ "<a href='#' class='cancel btn btn-danger' id='btn-X'>X</a>"+ "</td>"+
							  "</tr>";
					$('#tbody-transfer-stock').append(add);
				
				}
			});
			$('#list-item').removeAttr('hidden');
	});
	
	/* ----------------------------------------------- BTN-X -------------------------------------------------------- */
	$('#tbody-transfer-stock').on('click', '#btn-X', function(){
			$(this).parent().parent().remove();
		});

	/* ---------------------------------------- SAVE TRANSFER STOCK ITEM -------------------------------------------- */
	$('#btn-save').click(function(){
		if ($('#input-from-outlet').val()==$('#input-to-outlet').val()) {
			alert("outlet sama")
		} else {	
			var tsDetails = []; 	// list ts detail
			var htStocks = []; 		// list history ts
			
			 $('#tbl-item-ts > tbody > tr').each(function(index, data){
				var tsDetail = {
						itemVariant : {
								id : $(data).attr('id')
						},
						inStock : $(data).find('td').eq(1).text() - $(data).find('td').eq(2).text(),
						transferQty :  $(data).find('td').eq(2).text()
				};
				tsDetails.push(tsDetail);
				
				var htStock = {
						status : "Submitted",
						createdOn : new Date()
				};
				htStocks.push(htStock);
			});
			
			var transferStock = {
				status : "Submitted",
				fromOutlet : {
					id :$('#input-from-outlet').val()
				},
				toOutlet : {
					id : $('#input-to-outlet').val()
				},
				notes : $('#input-notes').val(),
				historyTransferStock : htStocks,
				tsDetails : tsDetails
			};
			
			console.log(transferStock);
			
			$.ajax({
				url : '${pageContext.request.contextPath }/transfer-stock/save',
				type : 'POST',
				data : JSON.stringify(transferStock),
				contentType : 'application/json',
				success : function(){
					alert('save successfully');
					window.location='${pageContext.request.contextPath}/transfer-stock';
				}, error : function(){
					alert('save failed');
				}
			})
		}

	}); 
	 
	
	// $('#btn-save').on('click', function(){
		/* if ($('#input-from-outlet').val()==$('#input-to-outlet').val()) {
			alert("Failed")
		} else { */
/* 		 		var tsDetails = [];
				$('#tbl-item-ts> tbody > tr').each(function(index, data){
					var tsd = {
							itemVariant : {
									id : $(data).attr('id')
							},
							inStock :  $(data).find('td').eq(1).text(),
							transferQty :  $(data).find('td').eq(2).text()
					}
					tsDetails.push(tsd);
					console.log(tsDetails);
				});
				
				var transferStock = {
						fromOutlet : {
							id : $('#input-from-outlet').val()
						},
						toOutlet : {
							id : $('#input-to-outlet').val()
						},
						tsDetails : tsDetails,
						notes : $('#input-notes').val(),
						status : "Submitted",
						
				};
				console.log(transferStock);
				$.ajax({
					url : '${pageContext.request.contextPath}/transfer-stock/save',
					type : 'POST',
					data : JSON.stringify(transferStock),
					contentType : 'application/json',
					success : function(){
					//	alert('save successfully');
						window.location='${pageContext.request.contextPath}/transfer-stock';
					}, error : function(){
						alert('save failed');
					}
				})
			
	});  
 */  
 
 // Reset pada Add Item
 	$('#btn-reset').click(function(){
			$('#tbody-item').empty();
	});
 
 // Reset Transfer Stock
 	$('#cancel-transfer-stock').click(function(){
		$('#tbody-transfer-stock').empty();
		$('#list-item').attr('hidden', 'hidden');
	});
 
 // view
 	$('.view').click(function() {
		var id = $(this).attr('id');
		window.location= "${pageContext.request.contextPath}/transfer-stock/get-detail/"+id;
	});
 
 // search outlet
	 $('#search-outlet').change(function(){
			var word = $(this).val();
			if (word=="all") {
				window.location = "${pageContext.request.contextPath}/transfer-stock";
			} else if (word!=="empty") {
				window.location = "${pageContext.request.contextPath}/transfer-stock/search-outlet?search="+word;
			}
		})
});
	




</script>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-files-o"></i> Form Tranfer Stock
				</h3>
			</div>
		</div>
		<!-- Form Category -->
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> TRANSFER STOCK </header>
					<div class="panel-body">
						<div class="row">
							<select class="col-lg-10" id="search-outlet" type="text" class="form-control" style="margin-bottom: 10px;">
									<option value="empty"> Search Outlet </option>
									<c:forEach var="out" items="${outs}">
										<option value="${out.id}">${out.name}</option>
									</c:forEach>
									<option value="all">All Outlet</option>
							</select>			
							<div class="col-lg-1" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary">Export</button>
							</div>
							<div class="col-lg-1" style="margin-bottom: 10px;">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal">Create</button>
							</div>
							<table id="tbl-transfer-stock" class="table table-bordered">
								<thead>
									<tr>
										<th>Transfer Date</th>
										<th>From Outlet</th>
										<th>To Outlet</th>
										<th>Status</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody id="tbody-transfer-stock-list">
								<c:forEach items="${tStocks}" var="ts">
									<tr>
										<td>${ts.modifiedOn}</td>
										<td>${ts.fromOutlet.name}</td>
										<td>${ts.toOutlet.name}</td>
										<td>${ts.status}</td>
										<td><a href="#" id="${ts.id }" class="view" data-toggle="modal"
											data-target="#modalEdit"> View </a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!--  table end -->
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

	<!------------------------------------------------ MODAL CREATE ------------------------------------------------------------------>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">

												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h5 class="modal-title" id="exampleModalLabel">
													TRANSFER STOCK</h5>
											</div>
											<form id="target" action="${pageContext.request.contextPath }/transfer-stock/save" method="POST">	
											<div class="modal-body">
												<h5>CREATE NEW TRANSFER STOCK FROM : [Diisi Outlet
													Login]</h5>
												</br>
												<h5>From</h5> 
												<select class="col-lg-12" id="input-from-outlet" type="text" class="form-control" style="margin-bottom: 10px;">
													<c:forEach var="out" items="${outs}">
														<option value="${out.id}">${out.name}</option>
													</c:forEach>
												</select>
												<h5>To</h5> 
												<select class="col-lg-12" id="input-to-outlet" type="text" class="form-control" style="margin-bottom: 10px;">
													<c:forEach var="out" items="${outs}">
														<option value="${out.id}">${out.name}</option>
													</c:forEach>
												</select>
												<h5>Notes</h5>
												<textarea id="input-notes" class="col-lg-12" type="text"
													style="margin-bottom: 10px;"></textarea>
												<h5>Transfer Item</h5>
												
											<div class="col-lg-12"  id="list-item">
											<table class="table table-bordered" id="tbl-item-ts">
												<thead>
													<tr>
														<th>Item</th>
														<th>In Stock</th>
														<th>Trans. Qty.</th>
														<th>#</th>
													</tr>
												</thead>
												<tbody id="tbody-transfer-stock">
												</tbody>
											</table>
											</div>
											<button type="button" id="btn-add-item" class="btn btn-primary col-lg-12"
													data-toggle="modal" data-target="#modal-add">
													Add Transfer Item</button>
											</div>
											<div class="modal-footer">
												<div class="col-lg-9">
													<button type="button" id="cancel-transfer-stock" class="btn btn-primary">Cancel</button>
												</div>
												<div class="col-lg-3">
													<button type="button" id="btn-save" class="btn btn-primary">Save & Submit</button>
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>
		<!---------------------------------------------- MODAL CREATE END------------------------------------------------------------------>
								
								
		<!-------------------------------------------------- MODAL ADD -------------------------------------------------------------------->
							<div class="modal fade" id="modal-add" tabindex="-1" role="dialog"
								aria-labelledby="modalEditLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h5 class="modal-title" id="exampleModalLabel">Add
												Transfer Item</h5>
										</div>
										<div class="modal-body">
											<input class="col-lg-12" type="text" id="search-item-variant"
												style="margin-bottom: 10px;"
												placeholder="Item Name-Varian Name">
												
						<!--------------------------------------- TABLE ---------------------------------->
											<table id="tbl-add-item" class="table table-bordered">
												<thead>
													<tr>
														<th>Item</th>
														<th>In Stock</th>
														<th>Trans. Qty.</th>
													</tr>
												</thead>
												<tbody id="tbody-item">
												</tbody>
											</table>
						<!------------------------------------- TABLE END ---------------------------------->

										</div>
										<div class="modal-footer">
											<div class="col-lg-2">
												<button type="button" id="btn-reset" class="btn btn-primary">Cancel</button>
											</div>
											<div class="col-lg-10">
												<button type="button" class="btn btn-primary" id="btn-add"
													data-toggle="modal" data-target="#modalAddItem">Add</button>
											</div>
										</div>
									</div>
								</div>

							</div>
			<!---------------------------------------------- MODAL ADD END ------------------------------------------------------------------>

<%@ include file="topping/bottom.jsp"%>