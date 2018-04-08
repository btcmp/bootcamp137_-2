<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		// DATA TABLE
		$.fn.dataTable.ext.classes.sPageButton = 'btn btn-primary';
		$('#tbl-category').DataTable({
			searching : false, 
			bFilter: false, 
			iDisplayLength: 10, // display max 10
			oLanguage: {
			   sLengthMenu: "",
			}
		});
		
		// CREATE NEW CATEGORY
		$('#btn-create').click(function() {
			$('#modal-create').modal();
		});
		
		// EXECUTE = SAVE
		$('#btn-save').on('click', function(evt){
			evt.preventDefault();
			var form = $('#target');
			var valid = form.parsley().validate();
				var cat = {
						name : $('#input-categoryName').val()
				}
				console.log(cat);    
			if(valid==true){
				$.ajax({
					url : '${pageContext.request.contextPath}/category/get-all',
					type : 'GET',
					success : function(data) {
						var sameName = 0;
						$(data).each(function(index, data2) {
								 if (cat.name.toLowerCase() == data2.name.toLowerCase()) {
									sameName++;
								} 
						});  
						if (sameName > 0) {
							alert('This name has been used');
						} else {	
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
						}
					},
					error : function() {
						alert('failed');
					}
				}); 
			} else {
				alert('Complete your form ');
			}
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
			var form = $('#target2');
			var valid = form.parsley().validate();
			var cat={
				id : $('#edit-id').val(),
				name : $('#edit-categoryName').val()
			}
			if (valid == true) {
				$.ajax({
					url : '${pageContext.request.contextPath}/category/get-all',
					type : 'GET',
					success : function(data) {
						var sameName = 0;
						$(data).each(function(index, data3) {
								 if (cat.name.toLowerCase() == data3.name.toLowerCase()) {
									sameName++;
								} 
						});  
						if (sameName > 0) {
							alert('This name has been used');
						} else {	
								 $.ajax({
										url : '${pageContext.request.contextPath}/category/update',
										type :'PUT',
										data : JSON.stringify(cat),
										contentType : 'application/json',
										success: function(data){
										window.location='${pageContext.request.contextPath}/category';
										}, error : function(){
											alert('update failed')	
										}
								 }); 
						}
					},
					error : function() {
						alert('failed');
					}
				}); 
			} else {
				alert('Complete your form ');
			}
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
	 	
	 	// VALID NAME
	 	/* $('#input-categoryName').on('input', function() {
			var input=$(this);
			var name = $(this).val();
			if(name != ""){
				$.ajax({
					url : '${pageContext.request.contextPath}/category/search-name-valid/'+name,
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
	 	
	 	$('#btn-save').on('click', function(evt){
			evt.preventDefault(); 
			var form_data=$("#save-form-category").serializeArray();
			var error_free=true;
			for (var input in form_data){
				var element=$("#input-"+form_data[input]['name']);
				var valid=element.hasClass("valid");
				var text=element.hasClass("textonly");
				var namaSama=element.hasClass("namaSama");
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
					}
				}
				else{error_element.removeClass("error_show").addClass("error");}
			}
			if (!error_free){
				event.preventDefault(); 
			}
			else{
				// save category
				var name = $('#input-categoryName').val();
				var category = {
					name : name
				}
				console.log(category);
					$.ajax({
						url : '${pageContext.request.contextPath}/category/save',
						type : 'POST',
						data : JSON.stringify(category), //-> proses dari java object ke string
						contentType : 'application/json',
						success : function(data){
							window.location = '${pageContext.request.contextPath}/category';
							//alert('berhasil!!');
						}, 
						error : function(){
							alert('save failed!!');
						}
					});  
			}
			
			
		}); */
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
								<table class="table table-bordered" id="tbl-category">
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
												<form id="target" id="save-form-category" data-parsley-validate>
														<div class="modal-body">
																<input class="col-lg-12" id="input-categoryName" type="text" placeholder="Category Name"
																pattern="([A-z0-9\s]){2,20}$">
																<p style="color: red;">
																		<small>This field is required</small>
																</p>
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
												<form id="target2" data-parsley-validate>
												<div class="modal-body">
														<input type="hidden" name="edit-id" id="edit-id">
														<input id="edit-categoryName" class="col-lg-12"  type="text" placeholder="Category Name"
														pattern="([A-z0-9\s]){2,20}$">
																<p style="color: red;">
																		<small>This field is required</small>
																</p>
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
