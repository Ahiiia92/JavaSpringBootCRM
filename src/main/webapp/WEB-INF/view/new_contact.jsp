<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
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
                    <label for="firstName">FirstName:</label>
                    <input type="text" name="firstName"/>
                    <label for="firstName">LastName:</label>
                    <input type="text" name="lastName"/>
                    <label for="firstName">Address:</label>
                    <input type="text" name="address"/>
                    <label for="firstName">ZipCode:</label>
                    <input type="text" name="zipCode"/>
                    <label for="firstName">City:</label>
                    <input type="text" name="city"/>
                    <label for="firstName">Email:</label>
                    <input type="text" name="email"/>
                    <input type="submit" value="Create new contact"/>
                </form>


                <a href="/admin/dashboard" class="btn btn-primary">Dashboard</a>
            <a href="/" class="btn btn-primary"">Home</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>