<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		// CREATE NEW CATEGORY
		$('#btn-create').click(function() {
			$('#modal-create').modal();
		});
		
		// EXECUTE = SAVE
		$('#btn-save').on('click', function(evt){
			evt.preventDefault();
			var form = $('#target');
				var cat = {
						name : $('#input-categoryName').val()
				}
				console.log(cat);    
			
			 $.ajax({
					url : '${pageContext.request.contextPath}/category/save',
					type :'POST',
					data : JSON.stringify(cat),
					contentType : 'application/json',
					success: function(data){
					window.location='${pageContext.request.contextPath}/category';
					}, error : function(){
						alert('saving failed')	
					}
			}); 
		});  
			
		// EDIT CATEGORY (BUTTON VIEW)
		$('.btn-view').click(function() {
			var id = $(this).attr('id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/category/get-one/'+id,
				type :'GET',
				success: function(cat){
					setEditCategory(cat);
					$('#modal-view').modal();
				},
				error : function(){
					alert('failed update')	
				},
				dataType :'json'
			});
		});
		
		// SET UP DATA EDIT
		function setEditCategory(cat){
			$('#edit-id').val(cat.id);
			$('#edit-categoryName').val(cat.name);
		}
		
		// EXECUTE = SAVE2
		$('#btn-save2').click(function(){
			var cat={
				id : $('#edit-id').val(),
				name : $('#edit-categoryName').val()
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/category/update',
				type :'PUT',
				data : JSON.stringify(cat),
				contentType :'application/json',
				success: function(data){
					window.location='${pageContext.request.contextPath}/category';
				},
				error : function(){
					alert('update failed');	
				}
			});
		});
		
	
	 	//DELETE = X
		$('#btn-X').click(function(){
			var cat={
				id : $('#edit-id').val(), 
				name : $('#edit-categoryName').val()
			}
			$.ajax({
					url : '${pageContext.request.contextPath}/category/updateStatus', 
					type : 'PUT', 
					data : JSON.stringify(cat), 
					contentType : 'application/json', 
					success : function(data){
						window.location = '${pageContext.request.contextPath}/category'; 
					}, error : function(){
						alert ('update failed'); 
					}
			});
		});  
	 	
	 	// SEARCH
	 	$('#btn-search').on('click', function(){
			var word =$('#search').val();
			console.log(word);
			window.location="${pageContext.request.contextPath}/category/search?search="+word;
	 	});
	 	
});
		
	
</script>

<!-- ===================================================================== ISIAN ======================================================================================= -->
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
				<div class="row">
						<div class="col-lg-12">
								<h3 class="page-header"><i class="fa fa-files-o"></i> Form Category</h3>
						</div>
				</div>
				<div class="row">
				<div class="col-lg-12">
					<section class="panel">
					<header class="panel-heading"> Category </header>
						<div class="panel-body">
						<div class="row">
								<div class="col-lg-3" style="margin-bottom: 10px;">
										<ul class="nav top-menu">
											<li>
												<form class="navbar-form">
													<input class="form-control" id="search" placeholder="Search" type="text">
												</form>
											</li>
										</ul>
								</div>
								<div class="col-lg-8" style="margin-bottom: 10px;">
										<button type="button" class="btn btn-primary" id="btn-search"> Search</button>
								</div>
								<div class="col-lg-1" style="margin-bottom: 10px;">
										<button type="button" class="btn btn-primary" id="btn-create">Create</button>
								</div>
								
								<!-- ================================================== TABLE =========================================== -->
								<table class="table table-bordered">
										<thead>
											<tr>
												<th>Category Name</th>
												<th>Items Stock</th>
												<th>#</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items ="${cats}" var="cat">
												<tr>
													<td>${cat.name}</td>
													<td>${cat.itemStock}</td>
													<td><a id="${cat.id}" href="#" class="btn-view"> View </a></td>
												</tr>
										 </c:forEach>
										</tbody>
								</table>
								<!-- ==================================================== TABLE END ============================================ -->
								
								<div class="form">
										<form class="form-validate form-horizontal" id="feedback_form" method="get" action=""></form>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
			<!-- page end-->
		</section>
	</section>
	<!--main content end-->


									<!--================================================ Modal CREATE ===============================================================-->
									<div class="modal fade" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
														<h5 class="modal-title" id="exampleModalLabel">Category</h5>
												</div>
												<form id="target" action="${pageContext.request.contextPath }/category/save" method="POST">
														<div class="modal-body">
																<input class="col-lg-12" id="input-categoryName" type="text" placeholder="Category Name">
														</div>
												<div class="modal-footer">
														<div class="col-lg-2">
															<button type="reset" class="btn btn-primary">Cancel</button>
														</div>
														<div class="col-lg-10">
																<button type="button" id="btn-save" class="btn btn-primary">Save</button>
														</div>
												</div>
											</div>
											</form>
										</div>
									</div>
									<!-- ===================================================== MODAL CREATE END ======================================================== -->
									

									<!-- ======================================================== MODAL VIEW =============================================================-->
									<div class="modal fade" id="modal-view" tabindex="-1" role="dialog" aria-labelledby="modalEditLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
														<h5 class="modal-title" id="exampleModalLabel">Category</h5>
												</div>
												<form>
												<div class="modal-body">
														<input type="hidden" name="edit-id" id="edit-id">
														<input id="edit-categoryName" class="col-lg-12"  type="text" placeholder="Category Name">
												</div>
												<div class="modal-footer">
														<div class="col-lg-1">
																<button type="button" id="btn-X" class="btn btn-danger">X</button>
														</div>
														<div class="col-lg-9">
																<button type="reset" class="btn btn-primary">Cancel</button>
														</div>
														<div class="col-lg-2">
																<button id="btn-save2" type="button" class="btn btn-primary">Save</button>
														</div>
												</div>
												</form>
											</div>
										</div>
									</div> 
									<!-- ====================================================== MODAL VIEW END ============================================================== -->
<%@ include file="topping/bottom.jsp"%>
