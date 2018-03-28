<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function(){
		
		$('#btn-done').click(function(){
			var idAdjustment = "${adjustment.id}";
			
			$.ajax({
				url : '${pageContext.request.contextPath}/adjustment/detail/done/'+idAdjustment,
				type : 'GET',
				success : function(data){
					window.location="${pageContext.request.contextPath}/adjustment";
				},
				error : function(){
					alert('failed update adjustment');
				}
			});
			
		});
		
		$('#change-status').change(function(){
			var status = $(this).val();
			var createdOn = new Date();
			
			if(status != ""){
				var history = {
					adjustmentId : {
						id : "${adjustment.id}"
					},
					createdOn : new Date(),
					status : status
				}
				
				$.ajax({
					url : '${pageContext.request.contextPath}/adjustment/detail/save-history',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(history),
					success : function(data){
						//alert('save history success');
						window.location = '${pageContext.request.contextPath}/adjustment/get-detail/'+"${adjustment.id}";
					},
					error : function(){
						alert ('failed save history');
					}
				});
			}
		});
	});
</script>
	  
	 <!-- ==================================================================  BATAS BUAT ISIAN ========================================================================= -->
	 <section id="main-content">
          <section class="wrapper">
			<div class="row">
				<div class="col-lg-1"></div>
                  <div class="col-lg-10">
                      <section class="panel">
					  <header class="panel-heading" style="height: 40px;">
                             <div class="col-sm-10" style="float:left;">
								Adjustment Detail
							</div>
							<div class="col-sm-2" style="float:right;">
								<select class="btn btn-primary" id="change-status">
									<option value="" selected="selected">More --> </option>
									<option value="Approved">Approve</option>
									<option value="Rejected">Reject</option>
									<option value="print">Print</option>
								</select>
							</div>
						   </header>
						  
						  <div class="col-lg-12" style="margin-bottom:30px;">
							<p></p>
							<p><label for="input-notes">Created By : [User]</label></p>
							<p><label for="input-notes">Adjustment Status : ${adjustment.status }</label></p>
							<label for="input-notes">Notes</label>
							<textarea class="form-control " id="notes" name="input-notes" disabled>${adjustment.notes }</textarea>
						  </div>
						  
						  <header class="panel-heading" style="height: 40px;">
								Status History
						   </header>
						   <div class="col-lg-12" style="margin-bottom:30px;">
							<p></p>
							<c:forEach items="${listHistory }" var="hisAdj">
							<p><label for="input-notes">${hisAdj.createdOn } - ${hisAdj.status }</label></p>
							</c:forEach>
						  </div>
						  
						  <header class="panel-heading" style="height: 40px;">
								Adjustments Items
						   </header>
						   <div class="col-lg-12" style="margin-bottom:30px;">
							<table class="table table-striped table-advance table-hover">
							   <thead>
								  <tr>
									 <th><center>Item</center></th>
									 <th><center>In Stock</center></th>
									 <th><center>Adjustment Qty.</center></th>
								  </tr>
								</thead>
								<tbody style="text-align : center;">
								<c:forEach items="${listDetailAdjustment }" var="detAdj">
								  <tr>
									 <td>${detAdj.variantId.item.name } - ${detAdj.variantId.name }</td>
									 <td>${detAdj.inStock }</td>
									 <td>${detAdj.actualStock }</td>
								  </tr>
								  </c:forEach>
								</tbody>
							</table>
						  </div>
						  
							<hr>
							<header class="panel-heading" style="height: 40px;">
								<div class="col-lg-12" style="float:left; padding-right:40px;">
									<p align="right"><button type="button" id="btn-done" class="btn btn-primary">Done</button></p>
								</div>
						   </header>
                      </section>
                  </div>
				  <div class="col-lg-1"></div>
              </div>
			  <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
			  
<%@ include file="topping/bottom.jsp"%>
