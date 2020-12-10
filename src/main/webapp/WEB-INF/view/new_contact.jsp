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

            <form action="save" th:action="admin/dashboard" th:object="${contact}" method="post">
                <p>Firstname: <input type="text" th:field="*{firstName}"/></p>
                <p>Lastname: <input type="text" th:field="*{lastName}"/></p>
                <p>Address: <input type="text" th:field="*{address}"/></p>
                <p>Zip Code: <input type="text" th:field="*{zipCode}"/></p>
                <p>City: <input type="text" th:field="*{city}"/></p>
                <p>Email: <input type="text" th:field="*{email}"/></p>
                <p><input type="submit" value="Save" class="btn btn-primary"/> <input type="reset" value="Reset" class="btn btn-primary"/></p>
            </form>

                <form action="/save" method="post">
                    <input type="text" name="firstName"/>
                    <input type="text" name="lastName"/>
                    <input type="text" name="address"/>
                    <input type="text" name="zipCode"/>
                    <input type="text" name="city"/>
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