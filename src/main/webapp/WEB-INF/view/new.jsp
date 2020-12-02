<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Contact</title>
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="webjars/jquery/3.0.0/jquery.min.js" ></script>
</head>
<body>
<h3>Add new Contact</h3>

<form action="#" th:action="@{/contact}" th:object="${contact}" method="post">
    <p>Firstname: <input type="text" th:field="*{firstName}"/></p>
    <p>Lastname: <input type="text" th:field="*{lastName}"/></p>
    <p>Address: <input type="text" th:field="*{address}"/></p>
    <p>Zip Code: <input type="text" th:field="*{zipCode}"/></p>
    <p>City: <input type="text" th:field="*{city}"/></p>
    <p>Email: <input type="text" th:field="*{email}"/></p>
    <p><input type="submit" value="Submit"/> <input type="reset" value="Reset"/></p>
</form>

<a href="dashboard">Dashboard</a>
<a href="/">Home</a>
</body>
</html>