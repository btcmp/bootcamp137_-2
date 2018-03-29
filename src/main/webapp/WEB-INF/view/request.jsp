<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
	
 <!--------------------------------------------------------------------- ISI ------------------------------------------------------------->    
 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-files-o"></i> Form Validation</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Index</a></li>
						<li><i class="icon_document_alt"></i>Purchase</li>
						<li><i class="fa fa-files-o"></i>Request</li>
					</ol>
				</div>
			</div>
              <!-- Form validations -->              
              <div class="row">
                  <div class="col-lg-12">
                      <!-- Start Table Employee -->
                      
                      <section class="panel">
                          <header class="panel-heading">
                              DATA PURCHASE REQUEST
                          </header>  
                          <section class="panel-body">
                            
                                 <div class="row" style="padding-bottom: 15px;">
                                    
                                        <div class="col-lg-3">
                                              <input class=" form-control" id="firsts-name" name="daterange" type="text" placeholder="input daterange" />
                                          </div>
                                          <div class="col-lg-2">
                                              <select class="form-control">
                                                    <option>Status</option>
                                                  <option>Role Administrator</option>
                                                  <option>Role Bak Office</option>
                                                  <option>Role Cashier</option>
                                                  
                                              </select>
                                          </div>
                                          <div class="col-lg-3">
                                              <input class=" form-control" id="last-name" name="fullname" type="text" placeholder="search"/>
                                          </div>
                                          <div class="col-lg-2">
                                              
                                          </div>
                                    
                                          
                                        <!-- button -->                                          
                                        <div class="col-lg-1">
                                            <button class="btn btn-primary">Export</button>
                                            
                                        </div>
                                        <div class="col-lg-1">
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Create</button>
                                            
                                        </div>

                                </div>
                              <div >
                                <table class="table table-striped table-bordered text-center" cellspacing="0" id="order-table">
                                <thead >
                                    <tr>
                                        <th>Create Date</th>
                                        <th>Pr. No</th>
                                        <th>Note</th>
                                        <th>status</th>
                                        <th>#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="#" var="#">
                                    <!-- //mengambil id barang -->
                                        <tr id = "#">
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td><a id="" class="btn-beli btn btn-warning" style = "color : white;"> Edit </a>|<a id="" class="btn-beli btn btn-danger" style = "color : white;"> Delete </a></td>
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
      </section>
      <!--main content end-->
  </section>
  <!-- container section end -->
 <!--------------------------------------------------------------------- ISI -------------------------------------------------------------> 
	
	<!--------------------------------------------------------------------- MODAL -------------------------------------------------------------> 
  <!-- Start Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">PURCHASE REQUEST</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- modal body -->    
        <div class="form">
            <div class="form-validate form-horizontal" id="PR-form">
                <div class="form-group">
                    <label for="outlet-name" class="control-label"><span class="required">*</span> CREATE NEW PR : {isi nama outlet}</label>
                </div>

                 <label for="outlet-name" class="control-label"> Target Waktu Item Ready : <span class="required">*</span></label>            
                <div class="form-group">
                    <div class="col-lg-12">
                        <input class="form-control" type="date" name="" />
                    </div>
                </div>

                <label for="outlet-name" class="control-label"> Notes: <span class="required">*</span></label>
                <div class="form-group">
                    
                    <div class="col-lg-12">
                        <textarea class="form-control"></textarea>
                    </div>
                </div>

                <label for="outlet-name" class="control-label"> Purchase Request : <span class="required">*</span></label>
                <div class="form-group">
                    <div class="col-lg-12">
                            <table class="table basic-table" cellspacing="0" id="order-table">
                                <thead>
                                    <tr >
                                        <th>Item</th>
                                        <th>In Stok</th>
                                        <th>Request. Qty</th>
                                    </tr>
                                </thead>
                                <tbody align="center">
                                    <c:forEach items="#" var="#">
                                    <!-- //mengambil id barang -->
                                        <tr id = "#">
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td><a id="" class="btn-beli btn btn-danger" style = "color : white;"> X </a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="col-lg-12">
                        <button class="form-control btn btn-primary"  data-toggle="modal" data-target="#item-modal">Add Item</button>
                    </div>
            </div>

                    
        </div>
      </div>
      <div class="modal-footer">
        <div>
            <button type="button" class="btn btn-success col-lg-2" >Submit</button> 
        </div>
       
        
        <button type="button" class="btn btn-info" data-dismiss="modal" >Cancel</button>
        <button type="button" class="btn btn-primary">Save</button>
      </div>
    </div>
  </div>
</div>
  <!-- End Modal -->

  <!-- Start Modal add item -->
  <div class="modal fade" id="item-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ADD PURCHASE ITEMS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- modal body -->    
        <div class="form">
            <div class="form-validate form-horizontal" id="PR-form">
                <div class="form-group">
                    <div class="col-lg-1"></div>
                    <!-- search item -->
                    <div class="col-lg-10">
                        <input class="form-control" type="text" name="search-item" id="seacrh-tem"/>
                    </div>
                    <div class="col-lg-1"></div>
                </div>

                <div class="form-group">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                            <table class="table table-striped" cellspacing="0" id="order-table">
                                <thead>
                                    <tr align="center">
                                        <th>Item</th>
                                        <th>In Stok</th>
                                        <th>Request. Qty</th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${items }" var="item">
                                    <!-- //mengambil id barang -->
                                        <tr id = "#">
                                            <td>${item.itemVariant.item.name } - ${item.itemVariant.name }</td>
                                            <td>${item.beginning }</td>
                                            <td>
                                            <% int jumlah = 0; %>
                                            	<select class="jumlah-request" id="jumlah-request${item.id }">
                                            		<c:forEach begin = "0" end = "${item.beginning - 1}">
                                            			<option value="<%=jumlah %>"><%=jumlah=jumlah+1 %></option>
                                            		</c:forEach>
                                            	</select>
                                            
                                           
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-1"></div>
                    </div>  
             </div>
        </div>
    </div>
      <div class="modal-footer">
        <div class="col-lg-3">
            <button type="button" class="btn btn-info" data-dismiss="modal" >Cancel</button>
        </div>
        <div class="col-lg-8">
            <button type="button" class="btn btn-primary">Add</button>
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- End Modal add item -->
  <!--------------------------------------------------------------------- MODAL ------------------------------------------------------------->
  
  <%@ include file="topping/bottom.jsp"%> 