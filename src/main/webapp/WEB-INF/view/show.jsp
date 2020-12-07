<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8" />
    <title>Edit Contact</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<%@include file="_navbar.jsp"%>

<div class="container">
    <div class="row mt-5">
        <div class="col">
            <div align="center">
                <h1>Show Contact: ${contact.firstName} - ${contact.lastName}</h1>
                <br />
                <td>${contact.id}</td>
                <td>${contact.firstName}</td>
                <td>${contact.lastName}</td>
                <td>${contact.email}</td>
                <td>${contact.address}</td>
                <td>${contact.zipCode}</td>
                <td>${contact.city}</td>
            </div>
            <div align="center">
                <h1>Show User: ${user.firstName} - ${user.lastName}</h1>
                <br />
                <td>${user.id}</td>
                <td>${user.firstname}</td>
                <td>${user.lastname}</td>
                <td>${user.password}</td>
                <td>${user.role}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
            </div>
        </div>
    </div>
</div>
</body>
</html>