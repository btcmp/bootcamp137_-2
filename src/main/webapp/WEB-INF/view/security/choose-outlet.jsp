<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<spring:url value="/resources" var="resources"></spring:url>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Choose Outlet</title>

    <!-- Bootstrap CSS -->    
    <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="${resources}/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="${resources}/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="${resources}/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="${resources}/css/style.css" rel="stylesheet">
    <link href="${resources}/css/style-responsive.css" rel="stylesheet" />


	<script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/jquery-ui-1.10.4.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="resources/js/html5shiv.js"></script>
    <script src="resources/js/respond.min.js"></script>
    <![endif]-->
</head>

  <body class="login-img3-body">
  
   <div class="container">

      <form class="login-form" name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>        
        <div class="login-wrap">
         <div class="login-box-body">
		    <p class="login-box-msg">Choose your outlet</p>
			<select class="form-control col-sm-4" name="outlet-search"
				id="outlet-search">
				<option value="kosong">Search Outlet</option>
				<c:forEach var="outlet" items="${outlets }">
					<option value="${outlet.id }">${outlet.name }</option>
				</c:forEach>
			</select>
			<input type="button" class="btn btn-primary" id="choose-outlet" value="choose"/>
		</div>
        </div>
      </form>
    </div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	$('#choose-outlet').click(function(){
		var idOutlet = $('#outlet-search').val();
		if (idOutlet!=="kosong") {
			window.location = "${pageContext.request.contextPath}/authentication/starting-page?id="+idOutlet;
		}
	})
})
/* ini comment */
</script>

</html>
