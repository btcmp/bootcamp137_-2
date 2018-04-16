<%@ include file="topping/top2.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#container').attr('onload', window.print());
    	});
    </script>
  </head>
<body>
  <!-- container section start -->
  <section id="container" class="">
	  
		 <!-- ==================================================================  BATAS BUAT ISIAN ========================================================================= -->
	 <section id="main-content">
          <section class="wrapper">
			<div class="row">
				<div class="col-lg-1"></div>
                  <div class="col-lg-10">
                      <section class="panel">
					  <header class="panel-heading" style="height: 40px;">
                             <div class="col-sm-12"><center>
								Adjustment Detail</center>
							</div>
						   </header>
						  
						  <div class="col-lg-12" style="margin-bottom:30px;">
							<p></p>
							<p><label for="input-notes">Created By : ${employee.user.username }
							</label></p>
							<p><label for="input-notes">Adjustment Status : ${adjustment.status }</label></p>
							<label for="input-notes">Notes : </label>
							<p>${adjustment.notes }</p>
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
							<table class="table table-striped table-advance table-hover" style="border: 1px solid black;">
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
