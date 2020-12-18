<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@include file="_navbar.jsp"%>
<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="sidebar-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard">
                            <span data-feather="home"></span>
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <span data-feather="file"></span>
                            Contacts
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="shopping-cart"></span>
                            Properties
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
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
                            <h1 class="h2">Edit Contact</h1>
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
                                    <th>Firstname</th>
                                    <th>Lastname</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>ZipCode</th>
                                    <th>City</th>
                                    <th>Status</th>
                                    <th>Account Manager</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${contact.id}</td>
                                        <td>${contact.firstName}</td>
                                        <td>${contact.lastName}</td>
                                        <td>${contact.email}</td>
                                        <td>${contact.address}</td>
                                        <td>${contact.zipCode}</td>
                                        <td>${contact.city}</td>
                                        <td>${contact.contact_status}</td>
                                        <td>TO DO</td>
                                            <%--                            <td>${contact.user_id}</td>--%>
                                        <td><a href="contacts/${contact.id}/show">Show</a></td>
                                        <td><a href="contacts/${contact.id}/edit">Edit</a></td>
                                        <td><a href="${pageContext.request.contextPath}/contacts/${contact.id}/delete">Delete</a></td>
                                        <td>
                                            <form action="" method="delete">
                                                <input type="submit" name="delete_user" value="Delete" />
                                                <input type="hidden" name="contact" value="${contact.id}" />
                                            </form>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <form action="edit" method="post">
                                <input type="hidden" name="id" value="${contact.id}">
                                    <label for="firstName">FirstName:</label>
                                    <input type="text" name="firstName" value="${contact.firstName}"/>

                                    <label for="firstName">LastName:</label>
                                    <input type="text" name="lastName" value="${contact.lastName}"/>

                                    <label for="firstName">Address:</label>
                                    <input type="text" name="address" value="${contact.address}"/>

                                    <label for="firstName">ZipCode:</label>
                                    <input type="text" name="zipCode" value="${contact.zipCode}"/>

                                    <label for="firstName">City:</label>
                                    <input type="text" name="city" value="${contact.city}"/>

                                    <label for="firstName">Email:</label>
                                    <input type="text" name="email" value="${contact.email}"/>

                                    <label for="contact_status">Status: </label>
                                        <select name="status" id="contact_status" value="${contact.contact_status}">
                                            <c:forEach var="contact_status" items="${contact.contact_status}">
                                                <option value="${contact_status}">${contact_status}</option>
                                            </c:forEach>
                                        </select>
                                <input type="submit" value="Update contact"/>
                            </form>
                        </div>
                        <br>
                        <br>
                    </main>
    </div>
</div>

</body>
</html>