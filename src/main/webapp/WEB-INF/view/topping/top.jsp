<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value="/j_spring_security_logout" var="logoutUrl" />


<spring:url value="/resources/" var="resources"></spring:url>
<!DOCTYPE html>
<html style="overflow: hidden;" lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Creative - Bootstrap 3 Responsive Admin Template">
<meta name="author" content="GeeksLabs">
<meta name="keyword"
	content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
<link rel="shortcut icon" href="${resources}img/favicon.png">

<title>Point of Sale</title>

<!-- Bootstrap CSS -->
<link href="${resources}/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="${resources}/css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="${resources}/css/elegant-icons-style.css" rel="stylesheet">
<link href="${resources}/css/font-awesome.min.css" rel="stylesheet">
<!-- full calendar css-->
<link
	href="${resources}/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet">
<link
	href="${resources}/assets/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<!-- easy pie chart-->
<link
	href="${resources}/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen">
<!-- owl carousel -->
<link rel="stylesheet" href="${resources}/css/owl.carousel.css"
	type="text/css">
<link href="${resources}/css/jquery-jvectormap-1.2.2.css"
	rel="stylesheet">
<!-- Custom styles -->
<link rel="stylesheet" href="${resources}/css/fullcalendar.css">
<link href="${resources}/css/widgets.css" rel="stylesheet">
<link href="${resources}/css/style.css" rel="stylesheet">
<link href="${resources}/css/style-responsive.css" rel="stylesheet">
<link href="${resources}/css/xcharts.min.css" rel=" stylesheet">
<link href="${resources}/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link href="${resources}/css/BuroRaDer.DateRangePicker.css" rel="stylesheet">
<link href="${resources}/lama/dataTable.css" rel="stylesheet">



<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
    
    
 <style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	padding: 5px 5px 8px 5px;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	padding: 5px 5px 8px 5px;
	font: 10px arial, san serif;
	text-align: left;
}

.error{
	color : red;
	display : none;
}		

.error_show{
	color: red;
	margin-left: 10px;
}


/* parsley */
input.parsley-success,
select.parsley-success,
textarea.parsley-success {
  color: #468847;
  background-color: #DFF0D8;
  border: 1px solid #D6E9C6;
}

input.parsley-error,
select.parsley-error,
textarea.parsley-error {
  color: #B94A48;
  background-color: #F2DEDE;
  border: 1px solid #EED3D7;
}

.parsley-errors-list {
  margin: 2px 0 3px;
  padding: 0;
  list-style-type: none;
  font-size: 0.9em;
  line-height: 0.9em;
  opacity: 0;

  transition: all .3s ease-in;
  -o-transition: all .3s ease-in;
  -moz-transition: all .3s ease-in;
  -webkit-transition: all .3s ease-in;
}

.parsley-errors-list.filled {
  opacity: 1;
}

/* error notifikasi */
/* Side notes for calling out things
-------------------------------------------------- */

/* Base styles (regardless of theme) */
.bs-callout {
  margin: 20px 0;
  padding: 15px 30px 15px 15px;
  border-left: 5px solid #eee;
}
.bs-callout h4 {
  margin-top: 0;
}
.bs-callout p:last-child {
  margin-bottom: 0;
}
.bs-callout code,
.bs-callout .highlight {
  background-color: #fff;
}

/* Themes for different contexts */
.bs-callout-danger {
  background-color: #fcf2f2;
  border-color: #dFb5b4;
}
.bs-callout-warning {
  background-color: #fefbed;
  border-color: #f1e7bc;
}
.bs-callout-info {
  background-color: #f0f7fd;
  border-color: #d0e3f0;
}

</style>
</head> 

<!-- javascripts -->
<script src="${resources}/js/jquery.js"></script>
<script src="${resources}/js/jquery-ui-1.10.4.min.js"></script>
<!--  <script src="${resources}/js/jquery-1.8.3.min.js"></script> -->
<!--  <script type="text/javascript" src="${resources}/js/jquery-ui-1.9.2.custom.min.js"></script> -->
<!-- bootstrap -->
<script src="${resources}/js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="${resources}/js/jquery.scrollTo.min.js"></script>
<script src="${resources}/js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- charts scripts -->
<script src="${resources}/assets/jquery-knob/js/jquery.knob.js"></script>
<script src="${resources}/js/jquery.sparkline.js" type="text/javascript"></script>
<script
	src="${resources}/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
<script src="${resources}/js/owl.carousel.js"></script>
<!-- jQuery full calendar -->
<script src="${resources}/js/fullcalendar.min.js"></script>

<script src="${resources}/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
<!--script for this page only-->
<script src="${resources}/js/calendar-custom.js"></script>
<script src="${resources}/js/jquery.rateit.min.js"></script>
<!-- custom select -->
<script src="${resources}/js/jquery.customSelect.min.js"></script>
<script src="${resources}/assets/chart-master/Chart.js"></script>

<!--custome script for all page-->
<script src="${resources}/js/scripts.js"></script>

<!-- custom script for this page-->
<script src="${resources}/js/sparkline-chart.js"></script>
<script src="${resources}/js/easy-pie-chart.js"></script>
<script src="${resources}/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${resources}/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="${resources}/js/xcharts.min.js"></script>
<script src="${resources}/js/jquery.autosize.min.js"></script>
<script src="${resources}/js/jquery.placeholder.min.js"></script>
<script src="${resources}/js/gdp-data.js"></script>
<script src="${resources}/js/morris.min.js"></script>
<script src="${resources}/js/sparklines.js"></script>
<script src="${resources}/js/charts.js"></script>
<script src="${resources}/js/jquery.slimscroll.min.js"></script>
<script src="${resources}/js/jquery.chained.min.js"></script>
<script src="${resources}/js/BuroRaDer.DateRangePicker.js"></script>
<script src="${resources}/js/autoNumeric.js"></script>
<script src="${resources}/lama/dataTable.min.js"></script>

<script src="${resources}/parsley.min.js"></script>

<script>

	//knob
	$(function() {
		$(".knob").knob({
			'draw' : function() {
				$(this.i).val(this.cv + '%')
			}
		})
	});

	//carousel
	$(document).ready(function() {
		$("#owl-slider").owlCarousel({
			navigation : true,
			slideSpeed : 300,
			paginationSpeed : 400,
			singleItem : true

		});
	});

	//custom select box

	$(function() {
		$('select.styled').customSelect();
	});

	/* ---------- Map ---------- */
	$(function() {
		$('#map').vectorMap({
			map : 'world_mill_en',
			series : {
				regions : [ {
					values : gdpData,
					scale : [ '#000', '#000' ],
					normalizeFunction : 'polynomial'
				} ]
			},
			backgroundColor : '#eef3f7',
			onLabelShow : function(e, el, code) {
				el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
			}
		});
	});
</script>
<!--   <script type="text/javascript">
	
</script> -->
<body>
	<!-- container section start -->
	<section id="container" class="">


		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>

			<!--logo start-->
			<a href="index.html" class="logo">Nice <span class="lite">POS</span></a>
			<!--logo end-->

			<%-- <div class="nav search-row" id="top_menu">
				<!--  search form start -->
				<ul class="nav top-menu">
					<li>
						<form class="navbar-form">
							<input class="form-control" placeholder="Search" type="text">
						</form>
					</li>
				</ul>
				<!--  search form end -->
			</div> --%>

			<div class="top-nav notification-row">
				<!-- notificatoin dropdown start-->
				<ul class="nav pull-right top-menu">
					<!-- user login dropdown start-->
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <span class="profile-ava">
								<img alt="" src="${resources}/img/avatar1_small.jpg">
						</span> <span class="username">MiniProjectCeria</span> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>
							<li>
								<!-- csrt for log out-->
								<form action="${logoutUrl}" method="post" id="logoutForm">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="submit" value="logout"
										class="form-control" name="logout" />
								</form>
							</li>

						</ul></li>
					<!-- user login dropdown end -->
				</ul>
				<!-- notificatoin dropdown end-->
			</div>
		</header>
		<!--header end-->

		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse " style="overflow: hidden;"
				tabindex="5000">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu">
					<li class="active"><a class="" href="index.html"> <i
							class="icon_house_alt"></i> <span>Dashboard</span>
					</a></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_document_alt"></i> <span>Master Tabel</span> <span
							class="menu-arrow arrow_carrot-down"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="${pageContext.request.contextPath}/employee">Employee</a></li>
							<li><a class="" href="${pageContext.request.contextPath}/category">Category</a></li>
							<li><a class="" href="${pageContext.request.contextPath}/supplier">Supplier</a></li>
							<li><a class="" href="${pageContext.request.contextPath}/outlet">Outlet</a></li>
							<li><a class="" href="${pageContext.request.contextPath}/item">Item</a>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_desktop"></i> <span>Purchase</span> <span
							class="menu-arrow arrow_carrot-down"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="${pageContext.request.contextPath}/request">Request</a></li>
							
							<li><a class="" href="${pageContext.request.contextPath}/order">Order</a></li>
							

						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_desktop"></i> <span>Adjusment</span> <span
							class="menu-arrow arrow_carrot-down"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="${pageContext.request.contextPath}/adjustment">Adjusment</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_desktop"></i> <span>Transfer Stok</span> <span
							class="menu-arrow arrow_carrot-down"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="${pageContext.request.contextPath}/transfer-stock">transfer
									Stok</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_desktop"></i> <span>Sales Order</span> <span
							class="menu-arrow arrow_carrot-down"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="${pageContext.request.contextPath}/sales-order">Sales Order</a></li>
						</ul></li>

				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->


		<!-- Setelah ini isi kontennya -->