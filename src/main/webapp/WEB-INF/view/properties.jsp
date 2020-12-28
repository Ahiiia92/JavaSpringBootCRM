<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Property List</title>
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
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
                        <a class="nav-link" href="/admin/dashboard/">
                            <span data-feather="home"></span>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/dashboard/contacts">
                            <span data-feather="file"></span>
                            Contacts
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin/dashboard/properties">
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
                <h1 class="h2">Property List</h1>
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
                            <td><a href="/admin/dashboard/properties/${property.id}/show">Show</a></td>
                            <td><a href="/admin/dashboard/properties/${property.id}/edit">Edit</a></td>
                            <td>
                                <form action="/admin/dashbaord/properties/deleteProperty" method="post">
                                    <input type="submit" name="delete" value="Delete" />
                                    <input type="hidden" name="property" value="${property.id}" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <br>
            <h2>Add a Property</h2>
            <br>
            <form action="/{id}" method="put" class="col-6 mx-auto m-4">
                <div class="form-group">
                    <label>Availability:</label>
                    <input class="form-control" placeholder="Availability" type="text" name="availability" value="${property.availability}"/>
                </div>

                <div class="form-group">
                    <label>Price:</label>
                    <input class="form-control" placeholder="Price" type="number" name="price"/>
                </div>

                <div class="form-group">
                    <label>Rooms:</label>
                    <input class="form-control" placeholder="Rooms" type="number" name="rooms"/>
                </div>

                <div class="form-group">
                    <label>Surface:</label>
                    <input class="form-control" placeholder="Surface" type="number" name="surface"/>
                </div>

                ${contact}
                ${contact.get(0).lastName}
                ${contactList}

                <div class="form-group">
                    <label>Client:</label>
                    <select class="form-control" placeholder="Client" type="text" name="contact" id="contact">
                    <c:forEach var="contact" items="${contactList}">
                        <option value="${contact}">${contact.id} - ${contact.lastName}</option>
                    </c:forEach>
                    </select>
                </div>

                <p><input type="submit" value="Submit" class="btn btn-primary"/> <input type="reset" value="Reset" class="btn btn-primary"/></p>
            </form>
            <br>
            <br>
            <br>
        </main>
    </div>
</div>
</body>
</html>