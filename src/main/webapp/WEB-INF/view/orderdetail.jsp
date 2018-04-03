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
                                          <label for="cname" class="control-label col-lg-3">Purchase Order Detail </label>
                                          <div class="col-lg-6"></div>
                                          <div class="col-lg-3">
                                              <td>
                                            <div class="btn-group">
                                                  <a class="btn btn-primary" href="">More</a>
                                                  <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="" ><span class="caret"></span></a>
                                                  <ul class="dropdown-menu">
                                                    <li><a href="" >Reject</a></li>
                                                    <li><a href="" >Approved</a></li>
                                                    <li><a href="" >Print</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="" >create PO</a></li>
                                                  </ul>
                                            </div><!-- /btn-group -->
                                        </td>
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <div class="col-lg-12">
                                              <table class="table table-bordered">
                                                  <tbody>
                                                      <tr>
                                                          <td class="col-lg-4">NO-Telepon</td>
                                                          <td colspan="2">Email</td>
                                                      </tr>
                                                      <tr>
                                                          <td class="col-lg-4" colspan="3">Alamat</td>
                                                      </tr>
                                                      <tr>
                                                          <td class="col-lg-4">Propinsi</td>
                                                          <td class="col-lg-4">Kota</td>
                                                          <td class="col-lg-4">Kode Pos</td>
                                                      </tr>
                                                  </tbody>
                                              </table>
                                          </div>
                                      </div>
                                     <label for="pr-number" class="control-label">Notes : </label>
                                     <div class="form-group ">
                                          <div class="col-lg-12">
                                              <textarea class="form-control" readonly=""> {value dari sono} </textarea>
                                          </div>
                                     </div>

                                      <div class="form-group ">
                                          <div class="col-lg-12">
                                              {Nama Supplier : isi dari table}
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="po-number" class="control-label col-lg-2">PO Number : </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                      </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2"> Created By : </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                      </div>
                                      <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2"> Email : </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                      </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Outlet :  </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Phone : </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Address : </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                          
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">PR Status : </label>
                                          <div class="col-lg-10">
                                              {isi dari table}
                                          </div>
                                     </div>
                                     <div class="form-group ">
                                          <label for="pr-number" class="control-label col-lg-2">Status History : </label>
                                          <div class="divider"></div>
                                          <div class="col-lg-10">
                                             {isi dari table}
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
                                                    <c:forEach items="#" var="#">
                                                    <!-- //mengambil id barang -->
                                                        <tr id = "#">
                                                            <td>#</td>
                                                            <td>#</td>
                                                            <td>#</td>
                                                            </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                          </div>
                                     </div>
                                  </form>
                                  <div>
                                      <button class="form-control btn btn-primary">Done</button>
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
		$('#btn-create').on('click', function(){
		$('#addModal').modal('show');
	})
	
	$('#item-add-modal').on('click', function(){
			$('#addModal').modal('hide');
			$('#item-modal').modal('show');
	})
	
	
	
		
	/*======================================= Set to Create Request Modal =================================================  */
	var itemKe = [];
	$('#add-to-modal-request').on('click', function(){
		
	})
	$('#hasil-search-itemVar').on('click', '.tbl-add-brg',  function(){
		var element = $(this).parent().parent();
		var id = $(this).attr('id');
		var idVariant = $(this).attr('key-id');
		var ItemVarName = element.find('td').eq(0).text();
		var InStok	= element.find('td').eq(1).text();
		var reqQty = $('#jumlah-request-'+id).val();
		
		if(itemKe.indexOf(id.toString()) == -1){
			$('#isi-tabel-request').append(
					'<tr id="'+id+'" key-id="'+idVariant+'">'
						+'<td>'+ ItemVarName + '</td>'
						+'<td>'+ InStok + '</td>'
						+'<td>'+ reqQty + '</td>'
						+'<td>'+ '<button type="button" class="btn btn-danger btn-delete" id="btn-del'+id+'" key-id="'+id+'">&times;</button>' + '</td>'
						+'</tr>'
					);
			itemKe.push(id);
		} else {
			//edit
			var target = $('#isi-tabel-request > #'+id+'');
				var oldReq = target.find('td').eq(2).text();
				var newReq = parseInt(oldReq)+parseInt(reqQty);
				target.find('td').eq(2).text(newReq);
		}
		
		$('#item-modal').modal('hide');
		$('#addModal').modal('show');
		
	});
	/*==================================================== DELETE ITEM IN DISPLAY ============================================ */
	$('#table-result-add-item').on('click', '.btn-delete', function(){

		var id = $(this).attr('key-id');
		$(this).parent().parent().remove();
		var index = itemKe.indexOf(id.toString());
		if(index > -1 ){
			itemKe.splice(index, 1);
		}
	});
	/*=================================================== Save Request Modal =================================================  */
	$('#btn-save').on('click', function(evt){
		evt.preventDefault();
		var listDetailRequest = [];
		var listHistoryRequest = [];
		$('#table-result-add-item > tbody > tr ').each(function(index, data){
			var detailRequest = {
				itemvar : {
					id : $(data).attr('key-id')
				},
				requestQty : $(data).find('td').eq(2).text(),
			};
			
			listDetailRequest.push(detailRequest);
			var history = {
					status : "waiting"
			};
			listHistoryRequest.push(history);
		});
		
		//sementara menggunakan random code
		function makeid() {
			  var kode = "";
			  var possible = "0123456789";

			  for (var i = 0; i < 3; i++)
			    kode += possible.charAt(Math.floor(Math.random() * possible.length));
			   
			  return kode;
		}
		
		
		console.log(makeid());
		//set date format fot suitable in oracle database
		var date = $('#ready-date').val().split('/');
		var inputDate = date[2]+'-'+date[0]+'-'+date[1];
		
		
		
		var request = {
				id : $('#id-request').val(),
				status : "Created",
				notes : $('#request-notes').val(),
				readyTime : inputDate,
				prNo : $('#prNo').val(),
				requestDetail : listDetailRequest,
				historyPr : listHistoryRequest
		};
		
		console.log(request);
		/* ajax to save */
		 $.ajax({
			url : '${pageContext.request.contextPath}/request/save',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(request),
			success : function(data){
				alert('save success');
				window.location='${pageContext.request.contextPath}/request';
			}, error : function(){
				alert('save request failed');
			}
		});
	})
	
	
	/*=================================================== Update Request Modal =================================================  */
	$('#request-table').on('click', '.btn-update', function(){
		console.log('edit');
		$('#isi-tabel-request').empty();
		var idEdit = $(this).attr('key-id');
		$.ajax({
			url : '${pageContext.request.contextPath}/request/get-one/'+idEdit,
			type : 'GET',
			dataType: 'json',
			success : function(data){
				console.log(data);
				$('#id-request').val(data.id);
				$('#request-notes').val(data.notes);
				$('#prNo').val(data.prNo);
				var date = data.readyTime.split('-');
				var tanggal = date[1]+'/'+date[2]+'/'+date[0];
				$('#ready-date').val(tanggal);
				$(data.requestDetail).each(function(key, val){
					$('#isi-tabel-request').append(
						'<tr key-id="'+val.itemvar.id+'"><td>'+val.itemvar.item.name+'-'+val.itemvar.name+'</td>'
						+'<td>null</td>'
						+'<td>'+val.requestQty+'</td>'
						+'<td><button type="button" class="btn btn-danger btn-delete" id="btn-del'+idEdit+'" key-id="'+idEdit+'">&times;</button>'
					);
				});
				$('#addModal').modal('show');
			}, 
			error : function(){
				console.log('gagal');
			}
		});
	});
})
</script>

<%@ include file="topping/bottom.jsp"%>
