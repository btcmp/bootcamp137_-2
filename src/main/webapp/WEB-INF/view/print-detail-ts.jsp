<%@ include file="topping/top2.jsp"%>




<!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
			</div>
              <!-- Form-->              
			<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          
                          <div class="panel-body">
						  <div class="col-lg-10" style="maegin-bottom:10px;">
									<h5><b>Transfer Stock Detail</b></h5>
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
								   
								  </div>
							  </div>
							  
					  </section>
				  </div>	  
			</div>			  
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
   
      
 <script>
 window.print();
</script>
<%@ include file="topping/bottom.jsp"%>