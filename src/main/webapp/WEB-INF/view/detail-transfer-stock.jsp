<%@ include file="topping/top.jsp"%>
<script>
 $(function(){
	
	$('#change-status').change(function(){
		var status = $(this).val();
		var modifiedOn = new Date();
		var idUser = "${employee.user.id}";
		
		/* var option = [];
		if (data.status=="Submitted") {
			option.push("<option value=\"Kosong\">Action</option>");
			option.push("<option value=\"Approved\">Approve</option>");
			option.push("<option value=\"Rejected\">Reject</option>");
			option.push("<option value=\"Print\">Print</option>");
		} else {
			option.push("<option value=\"Kosong\">Action</option>");
			option.push("<option value=\"Print\">Print</option>");
		}  */
		  if(status != ""){
			var history = {
				transferStock : {
					id : "${transferStock.id}"
				},
				createdOn : new Date(),
				status : status,
				createdBy : {
					id :  idUser
				}
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/transfer-stock/detail/save-history',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(history),
				success : function(data){
					//alert('save history success');
					window.location = '${pageContext.request.contextPath}/transfer-stock/get-detail/'+"${transferStock.id}";
				},
				error : function(){
					alert ('failed save history');
				}
			});
		  if(status=="Approved"){
			var idtransferStock = "${transferStock.id}";
			console.log(idtransferStock);
			$.ajax({
				url : '${pageContext.request.contextPath }/transfer-stock/update-status-and-stock/'+idtransferStock,
				type : 'PUT',
				data : JSON.stringify(status),
				contentType : 'application/json',
				success : function(){
					alert('update status successfully');
					window.location='${pageContext.request.contextPath}/transfer-stock/get-detail/'+"${transferStock.id}";
				}, error : function(){
					alert('update status failed');
				}
			});
		} else if(status=="Rejected"){
			var idtransferStock = "${transferStock.id}";
			console.log(idtransferStock);
			$.ajax({
				url : '${pageContext.request.contextPath }/transfer-stock/update-status/'+idtransferStock,
				type : 'PUT',
				data : JSON.stringify(status),
				contentType : 'application/json',
				success : function(){
					alert('update status successfully');
					window.location='${pageContext.request.contextPath}/transfer-stock/get-detail/'+"${transferStock.id}";
				}, error : function(){
					alert('update status failed');
				}
			});
		} else if(status =="Print"){
			var idtransferStock = "${transferStock.id}";
			window.open('${pageContext.request.contextPath}/transfer-stock/print-ts/'+idtransferStock);
		}
	}
		
	}); 

	$('#btn-done').click(function(){
		var idtransferStock = "${transferStock.id}";
		
		$.ajax({
			url : '${pageContext.request.contextPath}/transfer-stock/detail/done/'+idtransferStock,
			type : 'GET',
			success : function(data){
				window.location="${pageContext.request.contextPath}/transfer-stock";
			},
			error : function(){
				alert('failed');
			}
		});
	});

}); 
</script>


<!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-files-o"></i> Transfer Detail</h3>
				</div>
			</div>
              <!-- Form-->              
			<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              Transfer Detail
                          </header>
                          <div class="panel-body">
						  <div class="col-lg-10" style="maegin-bottom:10px;">
									<h5><b>Transfer Stock Detail</b></h5>
					   		  </div>
							<div class="col-sm-2">
							<script>
							if('${transferStock.status}'=='Submitted'){
								document.write('<select class="btn btn-primary" id="change-status">'
									+'<option value="" selected="selected">More</option>'
									+'<option value="Approved">Approve</option>'
									+'<option value="Rejected">Reject</option>'
									+'<option value="Print">Print</option></select>');
							} else if('${transferStock.status}'=='Approved'){
								document.write('<select class="btn btn-primary" id="change-status">'
										+'<option value="" selected="selected">More</option>'
										+'<option value="Approved" disabled>Approve</option>'
										+'<option value="Rejected" disabled>Reject</option>'
										+'<option value="Print">Print</option></select>');
							} else if('${transferStock.status}'=='Rejected'){
								document.write('<select class="btn btn-primary" id="change-status">'
										+'<option value="" selected="selected">More</option>'
										+'<option value="Approved" disabled>Approve</option>'
										+'<option value="Rejected" disabled>Reject</option>'
										+'<option value="Print">Print</option></select>');
							}
							</script>
							
							</div>
							<div style = "clear:both;"></div>
							<div class="col-lg-12"> 
							<p><label for="input-notes">Created By :${transferStock.createdBy.username}<label></p>
							<p><label for="input-notes">Transfer Stock Status : ${transferStock.status}</label></p>
							<label for="input-notes">Notes</label>
							  <textarea class="col-lg-12" type="text"  id="notes" style="margin-bottom:10px;" name="input-notes">  ${transferStock.notes} </textarea>
							 <div class="form-group">
							 <p><label for="history"> Status History</label></p>
							 <c:forEach var="hts" items="${htStocks}">
									<p><label>On ${hts.createdOn} - ${hts.status}</label></p>
							</c:forEach>
							 </div>  
							    <h5> Transfer Stock Items </h5>
								
								<table class="table table-bordered">
                              <thead>
                              <tr>
                                  <th>Item</th>
                                  <th>In Stock</th>
								  <th>Transfer Qty.</th>
                              </tr>
                              </thead>
                              <tbody>
                              <c:forEach items="${tsDetails}" var="tsd">
                              <tr>
                                  <td>${tsd.itemVariant.item.name} - ${tsd.itemVariant.name}</td>
                                  <td>${tsd.inStock}</td>
                                  <td>${tsd.transferQty}</td>
                              </tr>
                              </c:forEach>
                              </tbody>
                          </table> <!--  table end --> 
							
								  <div class="footer">
								  <div class="col-lg-10">
									
								 </div>
								   <div class="col-lg-2">
									<button type="button" id="btn-done" class="btn btn-primary"> Done </button>
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
<%@ include file="topping/bottom.jsp"%>