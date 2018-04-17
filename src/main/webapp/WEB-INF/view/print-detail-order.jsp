<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="topping/top2.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#main-content').attr('onload', window.print());
	});
</script>

<!--------------------------------------------------------------------- ISI ------------------------------------------------------------->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-files-o"></i> PURCHASE </h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Index</a></li>
						<li><i class="icon_document_alt"></i>Purchase</li>
						<li><i class="fa fa-files-o"></i>Order</li>
                        <li><i class="fa fa-files-o"></i>Detail</li>
                        
					</ol>
				</div>
			</div>
              <!-- Form validations -->              
              <div class="row">
                  <div class="col-lg-12">
                      <!-- Start Table Employee -->
                      <section class="panel">
                          <header class="panel-heading">
                              Purchase Order Detail
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal" id="feedback_form" method="get" action="">
                                      <div class="form-group ">
                                          <div class="col-lg-12">
                                          			<h4>Supplier Name : ${po.supplier.name }</h4>
                                              <table class="table table-bordered">
                                                  <tbody>
                                                      <tr>
                                                          <td class="col-lg-4">${po.supplier.phone }</td>
                                                          <td colspan="2">${po.supplier.email }</td>
                                                      </tr>
                                                      <tr>
                                                          <td class="col-lg-4" colspan="3">${po.supplier.address }</td>
                                                      </tr>
                                                      <tr>
                                                          <td class="col-lg-4">${po.supplier.provinceId.name }</td>
                                                          <td class="col-lg-4">${po.supplier.regionId.name }</td>
                                                          <td class="col-lg-4">${po.supplier.postalCode }</td>
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </div>
                                      </div>
                                     <label for="pr-number" class="control-label">Notes : </label>
                                     <div class="form-group ">
                                          <div class="col-lg-12">
                                              <textarea class="form-control" readonly> ${po.notes } </textarea>
                                          </div>
                                     </div>

                                      <div class="form-group ">
                                          <div class="col-lg-12">
                                              Nama Supplier :  ${po.supplier.name }
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="po-number" class="control-label col-lg-2">PO Number : </label>
                                          <div class="col-lg-10">
                                               ${po.poNo }
                                          </div>
                                      </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2"> Created By : </label>
                                          <div class="col-lg-10">
                                               ${po.createdBy.username }
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2"> Email : </label>
                                          <div class="col-lg-10">
                                               ${po.outlet.email }
                                          </div>
                                      </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Outlet :  </label>
                                          <div class="col-lg-10">
                                               ${po.outlet.name }
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Phone : </label>
                                          <div class="col-lg-10">
                                               ${po.outlet.phone }
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Address : </label>
                                          <div class="col-lg-10">
                                               ${po.outlet.address }
                                          </div>
                                          
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">PR Status : </label>
                                          <div class="col-lg-10">
                                               ${po.pr.status }
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Status History : </label>
                                          <div class="divider"></div>
                                          <div class="col-lg-10">
                                          	<c:forEach items="${po.history}" var="hpo">
                                          			<p><label for="input-notes">${hpo.createdOn } - ${hpo.po.poNo } is ${hpo.status }</label></p> 
                                          	</c:forEach>
                                             
                                          </div>
                                     </div>

                                     <div class="form-group ">
                                         <blockquote>Purchase Item </blockquote> 
                                     </div>
                                     <div class="form-group ">
                                          <div class="col-lg-12">
                                             <table class="table table-striped table-bordered text-center" cellspacing="0" id="order-table">
                                                <thead >
                                                    <tr>
                                                        <th>Item</th>
                                                        <th>In Stok</th>
                                                        <th>Request Qty</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${pod }" var="pod">
                                                    <!-- //mengambil id barang -->
                                                        <tr id = "#">
                                                            <td>${pod.variant.item.name } - ${pod.variant.name }</td>
                                                            <td>${pod.variant.price }</td>
                                                            <td>${pod.requestQty}</td>
                                                            </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                          </div>
                                     </div>
                                  </form>
                                  <div>
                                      <a  type ="btn" class="form-control btn btn-primary" href="${pageContext.request.contextPath}/order/">Done</a>
                                  </div>
                              </div>
                          </div>
                          <!-- End Panel Body -->
                      </section>
                      <!-- End Section -->
                  </div>
                  <!-- div col 12 -->
                </div>
            </section>
        </section>
        <!-- ENd Main Content -->
               
<!--------------------------------------------------------------------- END ISI ------------------------------------------------------------->

<!-- JavaScript for Product Request -->



<%@ include file="topping/bottom.jsp"%>
