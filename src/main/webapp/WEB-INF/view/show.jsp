<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <c:if test="${contact != null}">
                        Contact: ${contact.firstName} - ${contact.lastName}
                    </c:if>
                    <c:if test="${user != null}">
                        User: ${user.username} - ${user.lastname}
                    </c:if>
                    <c:if test="${property != null}">
                        Property: #${property.id} - ${property.surface}sqm
                    </c:if>
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
                        <div align="center">
                            <c:if test="${contact != null}">
                                <div align="center">
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
                                        <th>Action</th>
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
                                        <td>${contact.user.firstname} ${contact.user.lastname}</td>
                                        <td>
                                            <form action="dashboard" method="delete">
                                                <input type="submit" name="delete_user" value="Delete" />
                                                <input type="hidden" name="user" value="${contact.id}" />
                                            </form>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <br>
                                <br>
                                <h1>Edit Contact</h1>
                                    <form action="edit" method="put" class="col-6 mx-auto m-4">
                                            <div class="form-group">
                                                <input type="hidden" name="id" value="${contact.id}">
                                                <label for="firstName">FirstName:</label>
                                                <input  class="form-control" placeholder="Firstname" type="text" name="firstName" value="${contact.firstName}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="LastName">LastName:</label>
                                                <input class="form-control" placeholder="Lastname" type="text" name="lastName" value="${contact.lastName}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="address">Address:</label>
                                                <input class="form-control" placeholder="Address" type="text" name="address" value="${contact.address}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="zipCode">ZipCode:</label>
                                                <input class="form-control" placeholder="ZipCode" type="text" name="zipCode" value="${contact.zipCode}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="city">City:</label>
                                                <input class="form-control" placeholder="City" type="text" name="city" value="${contact.city}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="email">Email:</label>
                                                <input class="form-control" placeholder="Email" type="text" name="email" value="${contact.email}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="status">Status:</label>
                                                <select class="form-control" placeholder="Status" name="status" id="contact_status" value="${contact.contact_status}">
                                                    <c:forEach var="contact_status" items="${statusList}">
                                                        <option value="${contact_status}">${contact_status}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <input type="submit" class="btn btn-primary" value="Update contact"/>
                                        </form>
                            </div>
                                </div>
                            </c:if>
                            <c:if test="${user != null}">
                                <div align="center">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-sm">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Firstname</th>
                                                <th>Lastname</th>
                                                <th>Password</th>
                                                <th>Role</th>
                                                <th>Username</th>
                                                <th>Email</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>${user.id}</td>
                                                <td>${user.firstname}</td>
                                                <td>${user.lastname}</td>
                                                <td>${user.password}</td>
                                                <td>${user.role}</td>
                                                <td>${user.username}</td>
                                                <td>${user.email}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <br>
                                        <h1>Edit User:</h1>
                                        <form action="show" method="put" class="col-6 mx-auto m-4">
                                            <div class="form-group">
                                                <input type="hidden" name="id" value="${user.id}">
                                                <label>Firstname:</label>
                                                <input class="form-control" placeholder="Firstname" type="text" name="firstname" value="${user.firstname}"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Laststname:</label>
                                                <input class="form-control" placeholder="Lastname" type="text" name="lastname" value="${user.lastname}"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Username:</label>
                                                <input class="form-control" placeholder="Username" type="text" name="username" value="${user.username}"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Email:</label>
                                                <input class="form-control" placeholder="Email" type="text" name="email" value="${user.email}"/>
                                            </div>

                                            <div class="form-group">
                                                <label>Password:</label>
                                                <input class="form-control" placeholder="Password" type="password" name="password" value="${user.password}"/>
                                            </div>

                                            <div class="form-group">
                                                <label for="role">Role:</label>
                                                <select class="form-control" placeholder="Role" name="role" id="role" value="${user.role}">
                                                    <c:forEach var="role" items="${roleList}">
                                                        <option value="${role}">${role}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <p><input type="submit" value="Submit" class="btn btn-primary"/> <input type="reset" value="Reset" class="btn btn-primary"/></p>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${property != null}">
                                    <div align="center">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-sm">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Availability</th>
                                                    <th>Price</th>
                                                    <th>Surface</th>
                                                    <th>Rooms</th>
                                                    <th>Client</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>${property.id}</td>
                                                    <td>${property.availability}</td>
                                                    <td>${property.price}</td>
                                                    <td>${property.surface}</td>
                                                    <td>${property.rooms}</td>
<%--                                                    <td>${property.contact_id.lastName}</td>--%>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <br>
                                            <h2>Edit Property</h2>
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

                                                <div class="form-group">
                                                    <label>Client:</label>
                                                    <input class="form-control" placeholder="Client" type="text" name="contact_id"/>
                                                </div>

                                                <p><input type="submit" value="Submit" class="btn btn-primary"/> <input type="reset" value="Reset" class="btn btn-primary"/></p>
                                            </form>
                                        </div>
                                    </div>
                            </c:if>
                        </div>
                    </div>
                </div></main>

</body>
</html>