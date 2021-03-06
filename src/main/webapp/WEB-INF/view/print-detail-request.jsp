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
				 <!-- <div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-files-o"></i> Form Validation</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Index</a></li>
						<li><i class="icon_document_alt"></i>Purchase</li>
						<li><i class="fa fa-files-o"></i>Request</li>
                        <li><i class="fa fa-files-o"></i>Detail</li>
                        
					</ol>
				</div> -->
			</div>
              <!-- Form validations -->              
              <div class="row">
                  <div class="col-lg-12">
                      <!-- Start Table Employee -->
                      <section class="panel">
                          <header class="panel-heading">
                              PURCHASE REQUEST
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                  <form class="form-validate form-horizontal" id="feedback_form" method="get" action="">
                                      <!-- <div class="form-group ">
                                          <label for="cname" class="control-label col-lg-3">Purchase Request Detail </label>
                                          <div class="col-lg-9">
                                          	<div class="col-lg-3">
                                              <script>
                                              if ('${pr.status}' == 'Rejected'){
													document.write('<select id="change-status" class="btn-primary form-control" style = "padding-left: 12px; margin-left: 450px;" key-id="${pr.id }">'
															+'<option value="Rejected">Rejected</option>'
												    		+'<option value="Printed">Printed</option>'
												    		+'<option value="" class="divider"></option>'
														+'</select>');
												} else {
													document.write('<select id="change-status" class="btn-primary form-control" style = "padding-left: 12px; margin-left: 450px;" key-id="${pr.id }">'
															+'<option value="All">More</option>'
												    		+'<option value="Approved">Approved</option>'
												    		+'<option value="Rejected">Rejected</option>'
												    		+'<option value="Printed">Printed</option>'
												    		+'<option value="" class="divider"></option>'
												    		+'<option value="CreatePo">Create PO</option>'
														+'</select>');
												}
											</script>
                                            
											
                                            </div>/btn-group
                                          </div>
                                      </div> -->
                                      <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">PR Number : </label>
                                          <div class="col-lg-10">
                                              ${pr.prNo}
                                          </div>
                                      </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2"> Created By : </label>
                                          <div class="col-lg-10">
                                              ${pr.createdBy.username}
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Target Waktu Item Ready : </label>
                                          <div class="col-lg-10">
                                              ${pr.readyTime }
                                          </div>
                                      </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">PR Status : </label>
                                          <div class="col-lg-10">
                                              ${pr.status}
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Notes : </label>
                                          <div class="col-lg-10">
                                              <textarea class="form-control" readonly> ${pr.notes } </textarea>
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Status History : </label>
                                          <div class="divider"></div>
                                          <div class="col-lg-10">
                                             <c:forEach items="${hpr }" var="hpr">
											<p><label for="input-notes">${hpr.createdOn } - ${hpr.pr.prNo } is ${hpr.status }</label></p>
											</c:forEach>
                                          </div>
                                     </div>

                                   
                                          <div class="col-lg-12">
                                             <table class="table table-striped table-bordered text-center" id="order-table">
                                                <thead >
                                                    <tr>
                                                        <th>Item</th>
                                                        <th>In Stok</th>
                                                        <th>Request Qty</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${rd }" var="rd">
                                                    <!-- //mengambil id barang -->
                                                        <tr id = "#">
                                                            <td>${rd.itemvar.item.name } - ${rd.itemvar.name }</td>
                                                            <td>${rd.itemvar }</td>
                                                            <td>${rd.requestQty }</td>
                                                            </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                          </div>
                                  </form>
                                  <%-- <div>
                                      <a  type ="btn" class="form-control btn btn-primary" href="${pageContext.request.contextPath}/request/">Done</a>
                                  </div> --%>
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
