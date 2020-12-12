<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Contact</title>
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
                    <a class="nav-link" href="admin/dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin/dashboard/contacts">List of Contact</a>
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
                <h3>Add new Contact</h3>

                <form action="save" method="post">
                    <label for="firstName">Availability:</label>
                    <input type="text" name="availability"/>
                    <label for="firstName">Price:</label>
                    <input type="number" name="price"/>
                    <label for="firstName">Surface:</label>
                    <input type="number" name="surface"/>
                    <label for="firstName">Rooms:</label>
                    <input type="number" name="rooms"/>
                    <label for="contact_id">Client:</label>
                    <select name="contact" id="contact">
                        <c:forEach var="contact" items="${contactList}">
                            <option value="${contact}">${contact.lastname}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Create new Property"/>
                </form>


                <a href="/admin/dashboard" class="btn btn-primary">Dashboard</a>
                <a href="/" class="btn btn-primary"">Home</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>