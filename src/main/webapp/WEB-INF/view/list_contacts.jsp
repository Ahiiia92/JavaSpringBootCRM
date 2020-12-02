<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Contact List</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<h3>Contact list</h3>
${contacts}
${contacts.get(0).firstName}
<table border="1" cellpadding="10">
    <tr>
        <th>ID</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Address</th><th>ZipCode</th><th>City</th>
    </tr>
    <c:forEach var="contact" items="${contacts}">
        <tr>
            <td>${contact.id}</td>
            <td>${contact.firstName}</td>
            <td>${contact.lastName}</td>
            <td>${contact.email}</td>
            <td>${contact.address}</td>
            <td>${contact.zipCode}</td>
            <td>${contact.city}</td>
            <td><a href="#">Edit</a></td>
            <td><a href="#">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<a href="index">Home</a>
</body>
</html>