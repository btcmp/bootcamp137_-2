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
					<header class="panel-heading"> SELAMAT DATANG  </header>
					<table>
						<tbody>
							<tr>
								<td>Nama Employee</td>
								<td>:</td>
								<td>${employee.firstName } ${employee.lastName }</td>
							</tr>
							<tr>
								<td>Assign Outlet</td>
								<td>:</td>
								<td>${outlet.name }</td>
							</tr>
							<tr>
								<td>username</td>
								<td>:</td>
								<td>${employee.user.username }</td>
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

<%@ include file="topping/bottom.jsp"%>
