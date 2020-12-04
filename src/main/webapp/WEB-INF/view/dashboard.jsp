<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="dashboard">Dashboard
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="dashboard/contacts">List of Contact</a>
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
                <h3 class="mb-3">Contact list</h3>
                CONTACTS: ${contacts}
                <table border="1" cellpadding="10">
                    <tr>
                        <th>ID</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Address</th><th>ZipCode</th><th>City</th><th>Account Manager</th>
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
                            <td>${contact.user_id}</td>
                            <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/show">Show</a></td>
                            <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/edit">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/delete">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="col-6 mb-4">
                <h3 class="mb-3">User list</h3>
                <table border="1" cellpadding="10">
                    <tr>
                        <th>ID</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Username</th><th>Role</th>
                    </tr>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstname}</td>
                            <td>${user.lastname}</td>
                            <td>${user.email}</td>
                            <td>${user.username}</td>
                            <td>${user.role}</td>
                            <td><a href="${pageContext.request.contextPath}/users/${user.id}/show">Show</a></td>
                            <td><a href="${pageContext.request.contextPath}/users/${user.id}/edit">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/users/${user.id}/delete">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <br>
            <a href="dashboard/contacts/new" class="btn btn-primary">New Contact</a>
        </div>
    </div>
</div>
</body>
</html>