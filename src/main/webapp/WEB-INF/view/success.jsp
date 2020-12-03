<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Login Successful</title>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>

<h1>Login Successful</h1>

<p c:text="'Welcome ' + ${user.name}!"></p>
<a href="/admin/dashboard">Dashboard</a>
<a href="/login">Submit another message</a>

</body>
</html>