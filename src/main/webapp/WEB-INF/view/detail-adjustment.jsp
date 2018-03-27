<%@ include file="topping/top.jsp"%>
<script type="text/javascript">
	$(function(){
		
		$('#btn-done').click(function(){
			window.location="${pageContext.request.contextPath}/adjustment";
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
								<select class="btn btn-primary" id="input-province">
									<option value="" selected="selected">More --> </option>
									<option value="approve">Approve</option>
									<option value="reject">Reject</option>
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
							<p><label for="input-notes">${hisAdj.createOn } - ${hisAdj.status }</label></p>
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
								<tbody>
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
