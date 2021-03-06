<%@ include file="topping/top.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#btn-add').click(function() {
			$('#modal-add-supplier').modal();
		});
		$('#btn-edit').click(function() {
			$('#modal-edit-supplier').modal();
		});
		$('#order-table').DataTable({
			searching : false
		});
		
	});
</script>
<!-- ==================================================================  MAIN CONTENT ============================================= -->

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
					<li><i class="icon_document_alt"></i>Employee</li>
					<li><i class="fa fa-files-o"></i>Add Employee</li>
				</ol>
			</div>
		</div>
		<!-- Form validations -->
		<div class="row">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> ADD EMPLOYEE </header>
					<div class="panel-body">
						
						<div class="form">
							
							<form class="form-validate form-horizontal " id="form-employee" action="${pageContext.request.contextPath }/employee/save-emp"  method="post" action="">
								<div class="bs-callout bs-callout-warning hidden">
								  <h4>Isian form masih salah,</h4>
								  <p>Mohon perbaiki isian form sesuai arahan ... </p>
								</div>
								
								<div class="bs-callout bs-callout-info hidden">
								  <h4>Form Sudah benar,</h4>
								  <p>Lanjut ke langkah selanjutnya ..</p>
								</div>
								
								<div><input class=" form-control" id="id-emp" type="hidden" /></div>
								
								<div class="form-group ">
									<label for="fullname" class="control-label col-lg-2">First
										name <span class="required">*</span>
									</label>
									
									<div class="col-lg-4">
										<input class=" form-control" id="first-name" name="fullname"
											type="text" data-parsley-minlength="4" required=""/>
									</div>
									<label for="fullname" class="control-label col-lg-2">Last
										name <span class="required">*</span>
									</label>
									<div class="col-lg-4">
										<input class=" form-control" id="last-name" name="fullname"
											type="text" data-parsley-minlength="4" required=""/>
									</div>
								</div>
								<div class="form-group ">
									<label for="email" class="control-label col-lg-2">Email
										<span class="required">*</span>
									</label>
									<div class="col-lg-10">
										<input class="form-control " id="email" name="email"
											type="email" data-parsley-type-message="must be a valid email address please" required="" />
									</div>
								</div>
								<div class="form-group ">
									<label for="role" class="control-label col-lg-2">Title
										<span class="required">*</span>
									</label>
									<div class="col-lg-4">
										<select class="form-control" id="title">
											<option value="Mr.">Mr.</option>
											<option value="Mrs.">Mrs.</option>
										</select>
									</div>

									<label for="create-account" class="control-label col-lg-2">Create
										Account ? <span class="required">*</span>
									</label>
									<div class="col-lg-2">
										<input style="padding-left: 0px; width: 20px;"
											class="checkbox form-control " id="create-account" name="create-account"
											type="checkbox" data-toggle="collapse"
											data-target=".multi-collapse" aria-expanded="false"
											aria-controls="multiCollapseExample1 multiCollapseExample2 multiCollapseExample3" />
									</div>

									<div class="col-lg-2">
										<button class="btn btn-success" type="button"
											data-toggle="modal" data-target="#assign-modal" required="">Assign
											Outlet</button> <span class="required"><p style="font-size:12px; color:red;"> *must click this option</p></span>
									</div>
								</div>


								<!-- for collapse -->
								<div class="form-group collapse multi-collapse "
									id="multiCollapseExample3">
									<label for="role" class="control-label col-lg-2">Role <span
										class="required">*</span></label>
									<div class="col-lg-4">
										<select class="form-control" id="role">
										<c:forEach items="${roles }" var="roles">
											<option value="${roles.id }">${roles.roleName }</option>
										</c:forEach>
										</select>
									</div>
								</div>
								<input class="form-control " id="user-id" name="user-id"
											type="hidden" />
								<div class="form-group collapse multi-collapse "
									id="multiCollapseExample1">
									<label for="username" class="control-label col-lg-2">Username
										<span class="required">*</span>
									</label>
									<div class="col-lg-10">
										<input class="form-control " id="username" name="username"
											type="text" />
									</div>
								</div>
								<div class="form-group collapse multi-collapse "
									id="multiCollapseExample2">
									<label for="password" class="control-label col-lg-2">Password
										<span class="required">*</span>
									</label>
									<div class="col-lg-10">
										<input class="form-control " id="password" name="password"
											type="password" />
									</div>
								</div>
								<!--   <div class="form-group ">
                                          <label for="confirm_password" class="control-label col-lg-2">Confirm Password <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <input class="form-control " id="confirm_password" name="confirm_password" type="password" />
                                          </div>
                                      </div>
                                     -->

								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class=" btn btn-primary" type="button" id="btn-save" style="display:none;">Save</button>
										<button class=" btn btn-success" type="submit" id="btn-validasi">Save</button>
										
										<button class="btn btn-default" type="reset" id="reset-btn" data-toggle="collapse"
											data-target=".multi-collapse" aria-expanded="true"
											aria-controls="multiCollapseExample1 multiCollapseExample2 multiCollapseExample3">Cancel</button>
									
									</div>
									
								</div>
							</form>
							<!-- End Form -->
						</div>
					</div>
				</section>
				<!-- Start Table Employee -->
				<section class="panel">
					<header class="panel-heading"> DATA EMPLOYEE </header>
					<section class="panel-body">
						<div>
							<table class="table hover table-striped" cellspacing="0"
								id="order-table">
								<thead>
								
									<tr>
										<th><center> Name</center></th>
										<th><center> Email</center></th>
										<th><center> Have Account </center></th>
										<th><center> Assign Outlet</center></th>
										<th><center> Role</center></th>
										<th><center> Action</center></th>
									</tr>
								
								</thead>
								<tbody>
									<c:forEach items="${showActive }" var="emp">
										<!-- //mengambil id barang -->
										<tr id="#">
											<td>${emp.firstName } ${emp.lastName }</td>
											<td>${emp.email }</td>
											<td align="center"> <input type="checkbox" <c:if test="${emp.haveAccount == true}">checked</c:if> disabled />   </td>
											<td>
												<c:forEach items="${emp.outlet }" var="out">
													<c:out value="${out.name }, "></c:out> 
												</c:forEach>
											</td>
											<td>${emp.user.role.roleName }</td>
											<td><a id="${emp.id }" class="btn-edit btn btn-warning"
												style="color: white;"> Edit </a>|<a id="${emp.id }"
												class="btn-set btn btn-danger" style="color: white;">
													Set As Inactive </a></td>
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
	<!--main content end-->
</section>
<!-- container section end -->

<!-- Start Modal -->
<div class="modal fade" id="setModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">SET TO INACTIVE USER</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<input type="hidden" id="inactive-id">
			Are You Sure Change this Employee ? 
			</div>
			<div><input type="hidden" id="input-id"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="btn-inactive-emp">Set Inactive</button>
			</div>
		</div>
	</div>
</div>
<!-- End Modal -->


<!-- Modal for Assign Outlet  -->
<div class="modal fade" id="assign-modal" tabindex="-1" role="dialog"
	aria-labelledby="assignModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Assign Outlet</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="table">
					<h4 align="center"> List Outlet </h4>
					<table class="table table-striped">
					<tbody id="list-outlet">
					<c:forEach items = "${outlet }" var="out">
							<tr>
								<td>
								<input type="checkbox" class="form-control" name="outlet" id="${out.id }"/>
								</td>
								<td>
								<label for="nameOutlet" class="control-label col-lg-2">${out.name }</label>
								</td>
							</tr>					
					</c:forEach>
					</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="select-outlet">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal for Edit Employee  -->
<div class="modal fade" id="edit-modal" tabindex="-1" role="dialog"	aria-labelledby="editModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="false">&times;</span>
					</button>
					<h5 class="modal-title" id="exampleModalLabel">Assign Outlet</h5>
					
				</div>
				<div class="modal-body">
				
				<div class="form">
								
								<form class="form-validate form-horizontal " id="update-form-employee" action="${pageContext.request.contextPath }/employee/save-emp"  method="post" action="">
									<div class="bs-callout bs-callout-warning hidden">
									  <h4>Oh snap!</h4>
									  <p>This form seems to be invalid :(</p>
									</div>
									
									<div class="bs-callout bs-callout-info hidden">
									  <h4>Yay!</h4>
									  <p>Everything seems to be ok :)</p>
									</div>
									
									<div><input class="form-control" id="update-id" type="hidden" /></div>
									
									<div class="form-group ">
										<label for="update-first-name" class="control-label col-lg-2">First
											name <span class="required">*</span>
										</label>
										
										<div class="col-lg-4">
											<input class=" form-control reset" id="update-first-name" name="update-last-name"
												type="text" data-parsley-minlength="4" required=""/>
										</div>
										<label for="update-last-name" class="control-label col-lg-2">Last
											name <span class="required">*</span>
										</label>
										<div class="col-lg-4">
											<input class=" form-control reset" id="update-last-name" name="update-last-name"
												type="text" data-parsley-minlength="4" required=""/>
										</div>
									</div>
									<div class="form-group ">
										<label for="update-email" class="control-label col-lg-2">Email
											<span class="required">*</span>
										</label>
										<div class="col-lg-10">
											<input class="form-control reset" id="update-email" name="update-email"
												type="email" required=""/>
										</div>
									</div>
									<div class="form-group ">
										<label for="update-title" class="control-label col-lg-2">Title
											<span class="required">*</span>
										</label>
										<div class="col-lg-3">
											<select class="form-control" id="update-title">
												<option value="Mr.">Mr.</option>
												<option value="Mrs.">Mrs.</option>
											</select>
										</div>
	
										<label for="update-create-account" class="control-label col-lg-2">Have
											Account ? <span class="required">*</span>
										</label>
										<div class="col-lg-2">
											<input style="padding-left: 0px; width: 20px;"
												class="checkbox form-control " id="update-create-account" name="update-create-account"
												type="checkbox" data-toggle="collapse"
												data-target=".multi-collapse" aria-expanded="false"
												aria-controls="multiCollapseExample1 multiCollapseExample2 multiCollapseExample3" />
										</div>
	
										<div class="col-lg-2">
											<button class="btn btn-success" type="button"
												data-toggle="modal" data-target="#update-assign-modal">Assign
												Outlet</button>
										</div>
									</div>
	
	
									<!-- for collapse -->
									<div class="form-group collapse multi-collapse "
										id="multiCollapseExample3">
										<label for="update-role" class="control-label col-lg-2">Role <span
											class="required">*</span></label>
										<div class="col-lg-4">
											<select class="form-control" id="update-role">
											<c:forEach items="${roles }" var="roles">
												<option value="${roles.id }">${roles.roleName }</option>
											</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group collapse multi-collapse "
										id="multiCollapseExample1">
										<label for="update-username" class="control-label col-lg-2">Username
											<span class="required">*</span>
										</label>
										<div class="col-lg-10">
											<input class="form-control reset " id="update-username" name="update-username"
												type="text" /> 
										</div>
									</div>
									<div class="form-group collapse multi-collapse "
										id="multiCollapseExample2">
										<label for="update-password" class="control-label col-lg-2">Password
											<span class="required">*</span>
										</label>
										<div class="col-lg-10">
											<input class="form-control reset" id="update-password" name="update-password"
												type="text" />
										</div>
									</div>
								</form>
								<!-- End Form -->
						</div>
					
				</div>
				<div class="modal-footer">
					<div class="col-lg-offset-2 col-lg-10">
						<button class=" btn btn-primary" type="button" id="btn-validasi-update">update</button>
						<button class=" btn btn-primary" type="button" id="btn-update" style="display:none;">update</button>
						
						<button class="btn btn-default" type="reset" id="update-reset-btn" data-toggle="collapse"
							data-target=".multi-collapse" aria-expanded="true"
							aria-controls="multiCollapseExample1 multiCollapseExample2 multiCollapseExample3">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Modal Edit Employee -->
<!-- Modal for Edit Assign Outlet  -->
<div class="modal fade" id="update-assign-modal" tabindex="-1" role="dialog"
	aria-labelledby="assignModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Assign Outlet</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<div class="table" >
				<h4 align="center"> List Outlet </h4>
				<table class="table table-striped">
				<tbody id="update-list-outlet">
				<c:forEach items = "${outlet }" var="out">
						<tr>
							<td>
							<input type="checkbox" class="form-control" name="update-outlet" id="${out.id }"/>
							</td>
							<td>
							<label for="nameOutlet" class="control-label col-lg-2">${out.name }</label>
							</td>
						</tr>					</c:forEach>
				</tbody>
				</table>
			</div>	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="update-select-outlet">Save changes</button>
			</div>
		</div>
	</div>
</div>
<!-- ===================================================== END CONTENT ============================================================= -->
<script type="text/javascript">

$(document).ready(function(){
		
		//event Listener
		//on click utk submit via ajax
		
		$('#form-employee').parsley().on('field:validated', function() {
		    var ok = $('.parsley-error').length === 0;
		   /*  $('.bs-callout-info').toggleClass('hidden', !ok);
		    $('.bs-callout-warning').toggleClass('hidden', ok);
		     */
		    setTimeout(function(){
				$('.bs-callout-warning').toggleClass('hidden', ok);
				$('.bs-callout-info').toggleClass('hidden', !ok);
			}, 1000);
		  })
		  .on('form:submit', function() {
			  $('#btn-save').click();
		    return false; // Don't submit form for this demo
		  });
		
		/* $('#btn-validasi').click(function(){
			var ok = $('#form-employee').parsley().validate();
			if(ok){
				$('.bs-callout-info').toggleClass('hidden', !ok);
				$('#btn-save').click();
			}
		}); */
		
		$('#btn-validasi-update').click(function(){
			var jalan = $('#update-form-employee').parsley().validate();
			var ok = $('.parsley-error').length === 0;
		    $('.bs-callout-info').toggleClass('hidden', !ok);
		    $('.bs-callout-warning').toggleClass('hidden', ok);
		    
			if(jalan){
				$('#btn-update').click();
			}
		}); 
		
		$('#select-outlet').on('click', function(){
    	var listOutlet=[];
	    	$('#list-outlet').find('input[type="checkbox"]:checked').each(function(){
	    		var eo = {
	    			id : $(this).attr('id')
	    			};
	    		listOutlet.push(eo);
	    	});
	    	
	    	
	    	console.log(JSON.stringify(listOutlet));
	    	$('#btn-save').attr('listOutlet',JSON.stringify(listOutlet));
	    	$('#assign-modal').modal('hide');
	    });
		
		
		
		$('#btn-save').click(function(evt){
			evt.preventDefault();
			alert('testing');
			
			var akun = $("#create-account").is(':checked') ? true : false;
			var idRole = $('#role').val();
			
			var user = null;	
			
			try{
	    		var listOutlet = JSON.parse($(this).attr('listOutlet'));
	    	} catch (ex){
	    		console.error(ex);
	    	}
			
	    	
	    	var eo = [];
			$('#outlet:checked').each(function(){
				var empOut = {
						outlet : {
							id : $(this).attr('id')
						}
				}
				eo.push(empOut);
			})
			
			
			if(akun == true){
				user = {
						"id" : $("#user-id").val(),
						"active" : true,
						"username" : $('#username').val(),
						"password" : $('#password').val(),
						"role" : {
							"id" : idRole
						}
				}
			}
			var employee = {
					id : $('#id-emp').val(),
					firstName : $('#first-name').val(),
					lastName : $('#last-name').val(),
					email : $('#email').val(),
					title : $('#title').val(),
					haveAccount : akun,
					active : true,
					user : user,
					/* empOutlets : eo,
					 */
					 outlet : listOutlet
					
			
			};
			
				
			console.log(employee);
				
			//ajax
				$.ajax({
					url : '${pageContext.request.contextPath}/employee/save-emp',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(employee),
					beforeSend : function(){
						console.log("connecting to server");
					},
					success : function(){
						console.log(employee);
						alert('save sucsess');
						window.location = '${pageContext.request.contextPath}/employee';
					}, error : function(){
						alert('gagal bos');
					}
					
				}); 
		});
		/*  end save function */
		
		
		/* inactive function */
			//show modal
		$(".btn-set").click(function(evt){
			evt.preventDefault();
			var id = $(this).attr('id');
			$('#input-id').val(id);
			$('#setModal').modal('show');
			console.log(id);
		});
		
		/* set to inactive */
		$("#btn-inactive-emp").on('click', function(){
			var inactive = {
					id : $('#input-id').val(),
					
					active : false
			};
			
			console.log(inactive);
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/setInactive',
				type : 'POST',
				data : JSON.stringify(inactive),
				contentType : 'application/json',
				
				success : function(data){
					alert('sukses deactive');
				}, error : function(data){
					alert('failed deactivated employee');
				}
				
			});
		});
		/* end deactivate employee */
		
		
		/* start edit employee */
		$('.btn-edit').on('click', function(evt){
			evt.preventDefault();
			var id = $(this).attr('id');
			$('#update-id').val(id);
		
			console.log(id);
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/get-one/'+id,
				type : 'GET',
				contentType : 'application/json',
				
				success : function(OneEmp){
					setDataEditEmp(OneEmp);
					$('#edit-modal').modal('show');
				}, error : function(){
					alert('failed');
				}
				
			})
			
			
		})
		
		
		function setDataEditEmp(OneEmp){
			console.log(OneEmp);
			resetForm();
			$('#update-id').val(OneEmp.id);
			$('#update-first-name').val(OneEmp.firstName);
			$('#update-last-name').val(OneEmp.lastName);
			$('#update-email').val(OneEmp.email);
			$('#update-title').val(OneEmp.title);
			$('#update-create-account').val(OneEmp.haveAccount);
			
			if(OneEmp.user != null ){
				//alert("Employee Doesn`t have account")
				
				$('#update-username').val(OneEmp.user.username);
				$('#update-password').val(OneEmp.user.password);
				$('#update-role').val(OneEmp.user.role.id);
				
			};
			
			if (OneEmp.haveAccount == true){
				$('#update-create-account').prop('checked', true);
				$('.multi-collapse').collapse("show")
			}
			
			//masih belum paham saya
			$.each(OneEmp.outlet, function(index, isiOutlet){
				$.each($('#update-list-outlet > tr > td input[type="checkbox"]'), function(){
					if($(this).attr('id') == isiOutlet.id){
						$(this).prop('checked', true);
					}
					});
				});		

		}
	
		
		function resetForm(){
			$(".reset").val(" ");
		}
		
		/* update */
		
		$('#update-select-outlet').on('click', function(){
	    	var listOutlet=[];
		    	$('#update-list-outlet').find('input[type="checkbox"]:checked').each(function(){
		    		var eo = {
		    			id : $(this).attr('id')
		    			};
		    		listOutlet.push(eo);
		    	});
		    	
		    	
		    	console.log(JSON.stringify(listOutlet));
		    	$('#btn-update').attr('listOutlet',JSON.stringify(listOutlet));
		    	$('#update-assign-modal').modal('hide');
		    });
		
		
		$("#btn-update").on('click', function(evt){
			evt.preventDefault();
			
			var akun = $("#update-create-account").is(':checked') ? true : false;
			var idRole = $('#update-role').val();
			
			var user = null;
			
			var listOutlet=[];
	    	$('#update-list-outlet').find('input[type="checkbox"]:checked').each(function(){
	    		var eo = {
	    			id : $(this).attr('id')
	    			};
	    		listOutlet.push(eo);
	    	});
	    	
			
			if(akun == true){
				user = {
						/* "id" : $("#update-user-id").val(), */
						"active" : true,
						"username" : $('#update-username').val(),
						"password" : $('#update-password').val(),
						"role" : {
							"id" : idRole
						}
				}
			} else {
				user = {
						'role' : {
							"id" : 14
						}
				}
			}
				
			var employee = {
					id : $('#update-id').val(),
					firstName : $('#update-first-name').val(),
					lastName : $('#update-last-name').val(),
					email : $('#update-email').val(),
					title : $('#update-title').val(),
					haveAccount : akun,
					active : true,
					user : user,
					outlet : listOutlet
			};
			
			
			//ajax
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/update',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(employee),
				beforeSend : function(){
					console.log("connecting to server");
				},
				success : function(){
					console.log(employee);
					//alert('update sucsess');
					window.location = '${pageContext.request.contextPath}/employee';
				}, error : function(){
					alert('gagal bos');
				}
			}); 
		})
	});
</script>

<%@ include file="topping/bottom.jsp"%>