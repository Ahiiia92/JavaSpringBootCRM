<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Hello ${name}!</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<h3>Welcome to Spring Boot MVC! I'm a .jsp file</h3>
<h2>Hey ${name}!</h2>
<form action="" method="get">
    Enter your name: <input type="text" name="name">
    <input type="submit">
</form>

okay :) bien jou�! Go to page
<a href="dashboard">Dashboard</a>
<a href="list_contacts">List of Contacts</a>
</body>
</html>