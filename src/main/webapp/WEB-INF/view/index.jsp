<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Hello ${name}!</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>
<h3>Welcome to Spring Boot MVC! I'm a .jsp file</h3>
<h2>Hey ${name}!</h2>
<form action="" method="get">
    Enter your name: <input type="text" name="name">
    <input type="submit">
</form>

okay :) bien joué! Go to page <a href="1">1</a>
</body>
</html>