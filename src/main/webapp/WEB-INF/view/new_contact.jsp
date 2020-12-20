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
<%@include file="_navbar.jsp"%>

<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/dashboard">
                            <span data-feather="home"></span>
                            Dashboard<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/dashboard/contacts">
                            <span data-feather="file"></span>
                            Contacts
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href=/admin/dashboard/properties#">
                            <span data-feather="shopping-cart"></span>
                            Properties
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login/users">
                            <span data-feather="users"></span>
                            Users
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="bar-chart-2"></span>
                            Reports
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="layers"></span>
                            Integrations
                        </a>
                    </li>
                </ul>
                <br>
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Saved reports</span>
                    <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Current month
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Last quarter
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Social engagement
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Year-end sale
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">
                    New Contact:
                </h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                        <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                    </div>
                    <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                        <span data-feather="calendar"></span>
                        This week
                    </button>
                </div>
            </div>
            <div class="container">
                <div class="row mt-5">
                    <div class="col">
                        <form action="save" method="post" class="col-6 mx-auto m-4">
                                <div class="form-group">
                                    <label>Firstname:</label>
                                    <input class="form-control" placeholder="Firstname" type="text" name="firstName"/>
                                </div>

                                <div class="form-group">
                                    <label>Lastsname:</label>
                                    <input class="form-control" placeholder="Lastname" type="text" name="lastName"/>
                                </div>

                                <div class="form-group">
                                    <label for="Address">Address:</label>
                                    <input class="form-control" placeholder="Address" type="text" name="address"/>
                                </div>

                                <div class="form-group">
                                    <label for="ZipCode">ZipCode:</label>
                                    <input class="form-control" placeholder="ZipCode" type="text" name="zipCode"/>
                                </div>

                                <div class="form-group">
                                    <label for="city">City:</label>
                                    <input class="form-control" placeholder="City" type="text" name="city"/>
                                </div>

                                <div class="form-group">
                                    <label for="Email">Email:</label>
                                    <input class="form-control" placeholder="Email" type="text" name="email"/>
                                </div>

                                <div class="form-group">
                                    <label for="status">Status:</label>
                                    <select class="form-control" placeholder="Status" name="contact_status" id="contact_status">
                                        <c:forEach var="contact_status" items="${statusList}">
                                            <option value="${contact_status}">${contact_status}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <input type="submit" value="Create Contact"/>
                            </form>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>