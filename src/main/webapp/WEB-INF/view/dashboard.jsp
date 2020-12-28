<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <a class="nav-link active" href="/admin/dashboard">
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
                        <a class="nav-link" href="/admin/dashboard/properties">
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
                <h1 class="h2">Dashboard</h1>
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

            <h2>Contact list</h2>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>ZipCode</th>
                        <th>City</th>
                        <th>Account Manager</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="contact" items="${contacts}">
                        <tr>
                            <td>${contact.id}</td>
                            <td>${contact.firstName}</td>
                            <td>${contact.lastName}</td>
                            <td>${contact.email}</td>
                            <td>${contact.address}</td>
                            <td>${contact.zipCode}</td>
                            <td>${contact.city}</td>
                            <td>${contact.user.firstname} ${contact.user.lastname}</td>
                            <td>${contact.contact_status}</td>
                                <%--                            <td>${contact.user_id}</td>--%>
                            <td><a href="/admin/dashboard/contacts/${contact.id}/show">Show</a></td>
                            <td><a href="/admin/dashboard/contacts/${contact.id}/edit">Edit</a></td>
                            <td>
                                <form action="/admin/dashboard/contacts/deleteContact" method="post">
                                    <input type="hidden" name="id" value="${contact.id}"/>
                                    <input type="submit" value="Delete Contact"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="dashboard/contacts/new" class="btn btn-primary">New Contact</a>
            <br>
            <br>
            <h2>User list</h2>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Role</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.firstname}</td>
                            <td>${user.lastname}</td>
                            <td>${user.email}</td>
                            <td>${user.username}</td>
                            <td>${user.role}</td>
                            <td><a href="/login/users/${user.id}/show">Show</a></td>
                            <td><a href="${pageContext.request.contextPath}/users/${user.id}/edit">Edit</a></td>
                            <td>
                                <form action="/login/users/deleteUser" method="post">
                                    <input type="hidden" name="id" value="${user.id}"/>
                                    <input type="submit" value="Delete User"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <br>
            <br>
            <h2>Property list</h2>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Availability</th>
                        <th>Price</th>
                        <th>Rooms</th>
                        <th>Surface</th>
                        <th>Contact</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="property" items="${properties}">
                        <tr>
                            <td>${property.id}</td>
                            <td>${property.availability}</td>
                            <td>${property.price}</td>
                            <td>${property.rooms}</td>
                            <td>${property.surface}</td>
                            <td>${property.contact}</td>
                            <td>TO DO</td>
                            <td><a href="dashboard/properties/${property.id}/show">Show</a></td>
                            <td><a href="dashboard/properties/${property.id}/edit">Edit</a></td>
                            <td>
                                <form action="/admin/dashboard/properties/deleteProperty" method="post">
                                    <input type="hidden" name="id" value="${property.id}"/>
                                    <input type="submit" value="Delete Property"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="dashboard/properties" class="btn btn-primary">List of Properties</a>
        </main>
        </div>
    </div>
</div>
</body>
</html>