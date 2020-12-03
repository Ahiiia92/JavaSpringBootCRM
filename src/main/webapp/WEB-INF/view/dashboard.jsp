<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <a class="navbar-brand" href="/">HomePage - CRM Estate - Website Here</a>
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
                    <a class="nav-link" href="list_contacts">List of Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row mt-5">
        <div class="col">
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
        </div>
    </div>
</div>
<a href="index">Home</a>
<a href="new">New Contact</a>
</body>
</html>