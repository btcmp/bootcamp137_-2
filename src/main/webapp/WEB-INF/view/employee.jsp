<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#btn-add').click(function() {
			$('#modal-add-supplier').modal();
		});
		$('#btn-edit').click(function() {
			$('#modal-edit-supplier').modal();
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
								<div><input class=" form-control" id="id" type="hidden" /></div>
								<div><input class=" form-control" id="active" type="hidden" /></div>
								<div class="form-group ">
									<label for="fullname" class="control-label col-lg-2">First
										name <span class="required">*</span>
									</label>
									
									<div class="col-lg-4">
										<input class=" form-control" id="first-name" name="fullname"
											type="text" />
									</div>
									<label for="fullname" class="control-label col-lg-2">Last
										name <span class="required">*</span>
									</label>
									<div class="col-lg-4">
										<input class=" form-control" id="last-name" name="fullname"
											type="text" />
									</div>
								</div>
								<div class="form-group ">
									<label for="email" class="control-label col-lg-2">Email
										<span class="required">*</span>
									</label>
									<div class="col-lg-10">
										<input class="form-control " id="email" name="email"
											type="email" />
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
											data-toggle="modal" data-target="#assign-modal">Assign
											Outlet</button>
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
										<button class=" btn btn-primary" type="button" id="btn-save">Save</button>
										
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
							<table class="table table-striped table-bordered" cellspacing="0"
								id="order-table">
								<thead>
								
									<tr>
										<th>Name</th>
										<th>Email</th>
										<th>Have Account</th>
										<th>Outlet Access</th>
										<th>Role</th>
										<th>#</th>
									</tr>
								
								</thead>
								<tbody>
									<c:forEach items="${showActive }" var="emp">
										<!-- //mengambil id barang -->
										<tr id="#">
											<td>${emp.firstName } ${emp.lastName }</td>
											<td>${emp.email }</td>
											<td>${emp.haveAccount }</td>
											<td>#</td>
											<td>${emp.user.role.roleName }</td>
											<td><a id="${emp.id }" class="btn-beli btn btn-warning"
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
				<c:forEach items = "${outlet }" var="out">
					<label>${out.name } <span>
					<input type="checkbox" class="form-control" value="${out.id }" id="outlet"/> </span></label>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


<!-- ===================================================== END CONTENT ============================================================= -->
<script type="text/javascript">

$(document).ready(function(){
		
	
		//event Listener
		
		$('#assign-outlet').on()
		//on click utk submit via ajax
		
		$('#btn-save').click(function(evt){
			
			evt.preventDefault();
			alert('testing');
			
			var akun = $("#create-account").is(':checked') ? true : false;
			var idRole = $('#role').val();
			var idEmployee = $(this).attr('id');
			
			var user = null;
			
			if(akun == true){
				user = {
						
						username : $('#username').val(),
						password : $('#password').val(),
						role : {
							id : idRole
						},
						active : true,
						
						
				}
			}
			var employee = {
					id : $('#id').val(idEmployee),
					firstName : $('#first-name').val(),
					lastName : $('#last-name').val(),
					email : $('#email').val(),
					title : $('#title').val(),
					haveAccount : akun,
					user : user
			
			};
			
				
			//console.log(employee);
				
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
						alert('save suckess');
					}, error : function(){
						alert('gagal bos');
					}
					
				}) 
		})	
		
		//set inactive
		$(".btn-set").on('click', function(){
			var id = $(this).attr('id');
			$('#inactive-id').val(id);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/get-one/'+id,
				type : 'GET',
				
				success : function(emp){
					setActive(emp);
					$('#setModal').modal();
				}, error : function(mhs){
					alert('update gagal');
				},
				dataType : 'json'
			});
			
			
		})
		
		function setActive(emp){
			console.log(emp);
			$('#id').val(emp.id),
			$('#first-name').val(emp.firstName),
			$('#last-name').val(emp.lastName),
			$('#email').val(emp.email),
			$('#title').val(emp.title)
			
		}
		//btn-inactive
		$('#btn-inactive-emp').click(function(){
			var deactive = {
					id : $('#id').val(),
					firstName : $('#first-name').val(),
					lastName : $('#last-name').val(),
					email : $('#email').val(),
					title : $('#title').val()
					
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/setInactive',
				type : 'POST',
				data : JSON.stringify(deactive),
				contentType : 'application/json',
				success : function(data){
					alert("update succeess");
				}, error : function(){
					alert("failed to upadte");
				}
				
			}) 
			
			console.log(deactive);
			
		})
	});
</script>

<%@ include file="topping/bottom.jsp"%>