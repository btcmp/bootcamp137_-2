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
					<h3 class="page-header"><i class="fa fa-files-o"></i> PURCHASE </h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Index</a></li>
						<li><i class="icon_document_alt"></i>Purchase</li>
						<li><i class="fa fa-files-o"></i>Order</li>
					</ol>
				</div>
			</div>
              <!-- Form validations -->              
              <div class="row">
                  <div class="col-lg-12">
                      <!-- Start Table Employee -->
                      
                      <section class="panel">
                          <header class="panel-heading">
                              DATA PURCHASE ORDER
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
                                        <!-- <div class="col-lg-1">
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Create</button>
                                            
                                        </div> -->

                                </div>
                              <div >
                                <table class="table table-striped table-bordered text-center" cellspacing="0" id="order-table">
                                <thead >
                                    <tr>
                                        <th>Create Date</th>
                                        <th>Supplier</th>
                                        <th>PO No.</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                        <th>#</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pos }" var="pos">
                                    <!-- //mengambil id barang -->
                                        <tr id = "#">
                                            <td>${pos.createdOn }</td>
                                            <td>${pos.supplier.name }</td>
                                            <td>${pos.poNo }</td>
                                            <td>${pos.grandTotal }</td>
                                            <td>${pos.status }</td>
                                            
                                            <td>
                                            <script>
												if('${pos.status}' != 'Process'){
													document.write('<input type="button" class="btn-update btn btn-default" value="Edit" key-id="${pos.id }"> |');
												}else {
													document.write('<input type="button" class="btn-update btn btn-default" value="Edit" key-id="${pos.id }" disabled> |');
												}
											</script>
											<a href='${pageContext.request.contextPath}/order/detail/${pos.id}' class="btn-view-pr btn btn-info" key-id="${pos.id }">View</a> 
											</td>
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

  <!-- Start Modal -->
  <div class="modal fade" id="editPO" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">PURCHASE ORDER</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- modal body -->    
        <div class="form">
            <div class="form-validate form-horizontal" id="PR-form">
                <div class="form-group">
                    <label for="outlet-name" class="control-label"><span class="required">*</span> CREATE NEW PO : {isi nama outlet}</label>
                </div>

                 <label for="outlet-name" class="control-label"> Supplier : <span class="required">*</span></label>            
                <div class="form-group">
                    <div class="col-lg-12">
                        <select class="form-control" id="select-Supp">
                            <option>Supplier 1</option>
                            <option>Supplier 2</option>
                            <option>Supplier 3</option>
                            <option>Supplier 4</option>
                        </select>
                    </div>
                </div>

                <label for="outlet-name" class="control-label"> Notes: <span class="required">*</span></label>
                <div class="form-group">
                    
                    <div class="col-lg-12">
                        <textarea class="form-control" id="po-notes"></textarea>
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
                                        <th>Unit Cost</th>
                                        <th>Sub Total</th>
                                    </tr>
                                </thead>
                                <tbody align="center" id="isi-tabel-po">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="form-group">
                    
                    <div class="col-lg-12">
                        <div class="col-lg-9">
                            TOTAL
                        </div>
                        <div class="col-lg-3">
                            Rp : 
                        </div>
                    </div>
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
<!--------------------------------------------------------------------- MODAL ------------------------------------------------------------->

<!-- JavaScript for Product Request -->

<script type="text/javascript">
	$(document).ready(function() {
		 $('#ready-date').datepicker({
			 dateformat : 'yy-mm-dd',
			autoclose : true
		}); 
/*=======================================Search on modal add item Variant=================================================  */
		$('#search-item-variant').on('input', function() {
				var keyword = $(this).val();
				console.log(keyword);

				if (!keyword == "") {
					$.ajax({
						url : '${pageContext.request.contextPath}/request/search-item?search='+keyword,
						type : 'GET',
						success : function(data) {
							$('#hasil-search-itemVar').empty();
							$.each(data, function(index, val){
								$('#hasil-search-itemVar').append(
								'<tr id = "tr'+val.id+'"><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td>'
								+'<td id="inStock'+ val.id +'">'+ val.beginning +'</td>'
								+'<td id="td-qty'+ val.id +'"><input class="form-control" type="number" min="0" max="'+val.beginning+'" id="jumlah-request-'+ val.id +'" value="" /></td>'
								+'<td><button type="button" id="'+ val.id +'" class="tbl-add-brg btn btn-primary btn-add'+val.id
								+'" key-id="'+val.itemVariant.id+'">Add</button></td></tr>');
							});
						},
						error : function() {
							$('#hasil-search-itemVar').empty()
						}
					});
				}
			});
			

	/*------------------------------------------ modal set up -------------------------------------------------------------*/
		
	/*======================================= Set to Create Request Modal =================================================  */

	/*==================================================== DELETE ITEM IN DISPLAY ============================================ */
	
	/*=================================================== Save Request Modal =================================================  */
	
	/*=================================================== Update Request Modal =================================================  */
	$('#order-table').on('click', '.btn-update', function(){
		console.log('edit');
		$('#isi-tabel-po').empty();
		var idEdit = $(this).attr('key-id');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/order/get-one/'+idEdit,
			type : 'GET',
			dataType: 'json',
			success : function(data){
				console.log(data);
				$(data.detail).each(function(key, val){
					$('#isi-tabel-po').append(
						'<tr key-id="'+val.variant.id+'"><td>'+val.variant.item.name+'-'+val.variant.name+'</td>'
						+'<td>null</td>'
						+'<td>'+val.requestQty+'</td>'
						+'<td> <input type="text" value="'+val.unitCost+'" class = "form-control" /></td>'
						+ '<td>'+val.subTotal+'</td>'
					);
				});
				$('#editPO').modal('show');
			}, 
			error : function(){
				console.log('gagal');
			}
		});
	});
})
</script>

<%@ include file="topping/bottom.jsp"%>
