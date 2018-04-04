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
                                            <td>${pos.modifiedOn }</td>
                                            <td>${pos.supplier.name }</td>
                                            <td>${pos.poNo }</td>
                                            <td>Rp. ${pos.grandTotal }</td>
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
					<input type="hidden" name='input-id' class="form-control" id="id-po"/>
					<input type="hidden" name='input-poNo' class="form-control" id="po-no" value="123"/>
					<input type="hidden" name='input-status' class="form-control" id="po-status"/>
					 
                 <label for="outlet-name" class="control-label"> Supplier : <span class="required">*</span></label>            
                <div class="form-group">
                    <div class="col-lg-12">
                    <select class="form-control" id="select-Supp">
                    <c:forEach items = "${supp }" var="sup">
                    	
                            <option value="${sup.id }">${sup.name }</option>
                        
                    </c:forEach>
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
                        <div class="col-lg-7">
                            TOTAL
                        </div>
                        <div class="col-lg-5">
                          		Rp : <input type="text" name='input-total' class="form-control updatable-content" id="po-total" style="width : 150px;" readonly/> 
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
        <button type="button" class="btn btn-primary" id="btn-save">Save</button>
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
	
	/* =================================== Editabel input ========================================================================*/
	var total;
	
	$('#isi-tabel-po').delegate('.edit-unitcost', 'input', function(){
		var qty =  $(this).closest('tr').find('td').eq(2).text();
		var unitCost = $(this).val();
		var subTotal = parseInt(qty * unitCost);
		
		$(this).closest('tr').find('.edit-subtotal').val(subTotal);
		
		var Grandtotal = 0;
		$("#isi-tabel-po").find('.edit-subtotal').each(function(){
			Grandtotal += parseInt($(this).val());
		});
		
		$('#po-total').val(parseInt(Grandtotal));
		
		total = $('#po-total').val();
		
	});
	/*------------------------------------------ modal set up -------------------------------------------------------------*/
	$('#order-table').on('click', '.btn-update', function(){
	console.log('edit');
	$('#isi-tabel-po').empty();
	var idEdit = $(this).attr('key-id');
	$.ajax({
		url : '${pageContext.request.contextPath}/order/get-one/'+idEdit,
		type : 'GET',
		dataType: 'json',
		success : function(data){
			//console.log(data);
			$('#id-po').val(data.id);
			$('#po-No').val(data.poNo);
			$('#po-status').val(data.status);
			$(data.detail).each(function(key, val){
				$('#isi-tabel-po').append(
					'<tr key-id="'+val.variant.id+'"><td>'+val.variant.item.name+'-'+val.variant.name+'</td>'
					+'<td>null</td>'
					+'<td>'+val.requestQty+'</td>'
					+'<td> <input type="text" value="'+val.unitCost+'" class = "form-control edit-unitcost" id="unitCost"/></td>'
					+ '<td> <input type="text" value="'+val.subTotal+'" class = "form-control edit-subtotal" id="subtotal"readonly/></td>'
				);
			});
			$('#po-total').val(total);
			$('#editPO').modal('show');
		}, 
		error : function(){
			console.log('gagal');
		}
	});
});
	
	/*=================================================== Update Request Modal =================================================  */
	$('#btn-save').on('click', function(evt){
		evt.preventDefault();
		//alert('testing');
		var listDetail = [];
		console.log(total);
	
		
		var po = {
				id : $('#id-po').val(),
				supplier : {
					id : $('#select-Supp').val()
				},
				notes : $('#po-notes').val(),
				poNo : $('#po-no').val(),
				grandTotal : total
				
		};
		console.log(po);
		
		//ajax
		$.ajax({
			url : '${pageContext.request.contextPath}/order/update',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(po),
			
			success : function(){
				//console.log(po);
				alert('save sucsess');
				//window.location = '${pageContext.request.contextPath}/order';
			}, error : function(){
				alert('gagal bos');
			}
			
		});  
	});
	
	
	
	
	

})
</script>

<%@ include file="topping/bottom.jsp"%>
