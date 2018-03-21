<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<spring:url value="/resources/css/bootstrap.min.css" var="bootcss"></spring:url>
<spring:url value="/resources/dataTable.css" var="dT"></spring:url>
<spring:url value="/resources/bootstrap4.css" var="dTboot4"></spring:url>

<spring:url value="/resources/js/bootstrap.min.js" var="bootjs"></spring:url>
<spring:url value="/resources/jquery-3.3.1.min.js" var="jq"></spring:url>
<spring:url value="/resources/dataTable.min.js" var="dTjs"></spring:url>
<spring:url value="/resources/dataTable.bootstrap.min.js" var="dTB4"></spring:url>

<spring:url value="/resources/parsley.js" var="parsley"></spring:url>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ini file master jsp</title>

<link rel="stylesheet" href="${bootcss}" />
<link rel="stylesheet" href="${dT }"/>
<link rel="stylesheet" href="${dTboot4 }"/>


<script type="text/javascript" src="${jq }"></script>
<script type="text/javascript" src="${bootjs }"></script>
<script type="text/javascript" src="${dTjs }"></script>
<script type="text/javascript" src="${dTB4 }"></script>

</head>
<body>
ambil header htmlnya
</body>
</html>