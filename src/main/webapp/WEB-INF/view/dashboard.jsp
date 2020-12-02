<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Dashboard</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<h3>Contact list</h3>

<table border="1" cellpadding="10">
    <tr>
        <th>Name</th><th>Email</th><th>Country</th>
    </tr>
<%--    <c:forEach var="contact" items="${contacts}">--%>
<%--        <tr>--%>
<%--            <td>${contact.name}</td>--%>
<%--            <td>${contact.email}</td>--%>
<%--            <td>${contact.country}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
</table>

<a href="index">Home</a>
<a href="new">New Contact</a>
</body>
</html>