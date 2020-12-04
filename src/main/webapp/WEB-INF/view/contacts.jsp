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
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <a class="navbar-brand" href="/">CRM Estate</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/dashboard/contacts">List of Contact<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row mt-5">
        <div class="col">
            <div class="col-6 mb-4">
            <h3>Contact list</h3>
            ${contacts}
            <br>
            <br>
            <table border="1" cellpadding="10">
                <tr>
                    <th>ID</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Address</th><th>ZipCode</th><th>City</th><th>Account Manager</th><th>Edit</th><th>Delete</th>
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
                        <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/show">Show</a></td>
                        <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/edit">Edit</a></td>
                        <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/delete">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <a class="btn btn-primary" href="admin/dashboard/contacts/new">New Contact</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>