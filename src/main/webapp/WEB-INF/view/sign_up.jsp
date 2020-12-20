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
<%@include file="_navbar.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col">
            <h3>Sign-Up</h3>
            <form action="register" method="post" class="col-6 mx-auto m-4">
                <div class="form-group">
                    <label>Firstname:</label>
                    <input class="form-control" placeholder="Firstname" type="text" name="firstname"/>
                </div>

                <div class="form-group">
                    <label>Lastsname:</label>
                    <input class="form-control" placeholder="Lastname" type="text" name="lastname"/>
                </div>

                <div class="form-group">
                    <label>Username:</label>
                    <input class="form-control" placeholder="Username" type="text" name="username"/>
                </div>

                <div class="form-group">
                    <label>Email:</label>
                    <input class="form-control" placeholder="Email" type="text" name="email"/>
                </div>

                <div class="form-group">
                    <label>Password:</label>
                    <input class="form-control" placeholder="Password" type="password" name="password"/>
                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select class="form-control" placeholder="Role" name="role" id="role">
                        <c:forEach var="role" items="${roleList}">
                            <option value="${role}">${role}</option>
                        </c:forEach>
                    </select>
                </div>
                <p><input type="submit" value="Submit" class="btn btn-primary"/> <input type="reset" value="Reset" class="btn btn-primary"/></p>
            </form>

            <a href="index" class="btn btn-primary">Home</a>
        </div>
    </div>
</div>
</body>
</html>