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
    <div th:if="${not #lists.isEmpty(contacts)}">
        <tr th:each="contact : ${contacts}">
            <td th:text="${cnotact.id}"></td>
            <td th:text="${contact.firstName}"></td>
            <td th:text="${contact.lastName}"></td>
            <td th:text="${contact.address}"></td>
            <td th:text="${contact.zipCode}"></td>
            <td th:text="${contact.city}"></td>
            <td th:text="${contact.email}"></td>
        </tr>
    </div>
</table>

<a href="index">Home</a>
<a href="new">New Contact</a>
</body>
</html>