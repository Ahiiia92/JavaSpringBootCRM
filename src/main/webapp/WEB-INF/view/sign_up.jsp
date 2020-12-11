<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Sign-Up</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.0.0/jquery.min.js" ></script>
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
            <h3>Sign-Up</h3>
            <form action="register" method="post">
                    <label>Firstname:</label>
                    <input type="text" name="firstname"/>

                    <label>Laststname:</label>
                    <input type="text" name="lastname"/>

                    <label>Username:</label>
                    <input type="text" name="username"/>

                    <label>Email:</label>
                    <input type="text" name="email"/>

                    <label>Password:</label>
                    <input type="text" name="password"/>

                    <select name="role" id="role">
                        <c:forEach var="role" items="${roleList}">
                            <option value="${role}">${role}</option>
                        </c:forEach>
                    </select>
                <p><input type="submit" value="Submit" class="btn btn-primary"/> <input type="reset" value="Reset" class="btn btn-primary"/></p>
            </form>

            <a href="index" class="btn btn-primary">Home</a>
        </div>
    </div>
</div>
</body>
</html>