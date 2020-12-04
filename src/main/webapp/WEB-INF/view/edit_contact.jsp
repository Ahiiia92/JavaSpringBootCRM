<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8" />
    <title>Edit Contact</title>
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
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
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
        <div align="center">
    <h1>Edit Contact</h1>
    <br />
    <form action="#" th:action="@{/save}" th:object="${contact}" method="post">

        <table border="0" cellpadding="10">
            <tr>
                <td>Contact ID:</td>
                <td>
                    <input type="text" th:field="*{id}" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td>Contact Name:</td>
                <td>
                    <input type="text" th:field="*{firstName}" />
                </td>
                <td>
                    <input type="text" th:field="*{lasttName}" />
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" th:field="*{address}" /></td>
            </tr>
            <tr>
                <td>ZipCode:</td>
                <td><input type="text" th:field="*{zipCode}" /></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><input type="text" th:field="*{city}" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" th:field="*{email}" /></td>
            </tr>
            <tr>
                <td colspan="2"><button type="submit">Save</button> </td>
            </tr>
        </table>
    </form>
</div>
        </div>
    </div>
</div>
</body>
</html>