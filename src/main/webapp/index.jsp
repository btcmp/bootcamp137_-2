<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    


<spring:url value="/resources/" var="resources"></spring:url>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <link rel="stylesheet" href="${resources}/assets-index/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${resources}/assets-index/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${resources}/assets-index/css/user.css">
</head>

<body class="login-img3-body">
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header"><a class="navbar-brand navbar-link" href="#"><i class="glyphicon glyphicon-phone"></i>Wellcome To NICEPOS</a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1"></div>
        </div>
    </nav>
    <div class="jumbotron hero">
        <div class="container">
            <div class="row">
                <div class="col-md-6 get-it">
                    <h1>KELOMPOK 2</h1>
                    <p>Fikky Wirita </br>
                    	Popi Krisdiani </br>
                    	Resa Cahya Saputra </br>
                    </p>
                    <p><a class="btn btn-success btn-lg" role="button" href="${pageContext.request.contextPath}/login">LOGIN </a></p>
                </div>
                <div class="col-md-5"><img src="${resources}/img/iconPOS.png" class="img-responsive" /></div>
            </div>
        </div>
    </div>
    <!-- <footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h5>Bootcamp137 © 2018</h5></div>
                <div class="col-sm-6 social-icons"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
            </div>
        </div>
    </footer> -->
    <script src="${resources}/assets-index/js/jquery.min.js"></script>
    <script src="${resources}/assets-index/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>