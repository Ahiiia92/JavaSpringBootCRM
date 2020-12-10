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
                        <a class="nav-link active" href="dashboard">
                            <span data-feather="home"></span>
                            Dashboard<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard/contacts">
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
                <h1 class="h2">
                    <c:if test="${contact != null}">
                        Contact: ${contact.firstName} - ${contact.lastName}
                    </c:if>
                    <c:if test="${user != null}">
                        User: ${user.username} - ${user.lastname}
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
<%--                                        <td>${contact.user.username}</td>--%>
                                    </tr>
                                    </tbody>
                                </table>
                                <br>
                                <form action="#" th:action="/save" th:object="${contact}" method="post">
                                    <p>Firstname: <input type="text" th:field="*{firstName}"/></p>
                                    <p>Lastname: <input type="text" th:field="*{lastName}"/></p>
                                    <p>Address: <input type="text" th:field="*{address}"/></p>
                                    <p>Zip Code: <input type="text" th:field="*{zipCode}"/></p>
                                    <p>City: <input type="text" th:field="*{city}"/></p>
                                    <p>Email: <input type="text" th:field="*{email}"/></p>
                                    <p>Contact_Status:
                                        <select name="Status">
                                            <c:forEach var="status" items="${statusList}">
                                                <option value="${status}">${status}</option>
                                            </c:forEach>
                                        </select>
                                    </p>
<%--                                    <p>Account Manager:--%>
<%--                                        <select name="AC">--%>
<%--                                            <th:forEach var="ac" items="${accountManager}">--%>
<%--                                                <option value="${ac}">${ac}</option>--%>
<%--                                            </th:forEach>--%>
<%--                                        </select>--%>
<%--                                    </p>--%>
                                    <p><input type="submit" value="Save" class="btn btn-primary"/>
                                    </p>
                                </form>

                                <br>
                                <form action="edit" method="put">
                                    <label for="firstName">FirstName:</label>
                                    <input type="text" name="firstName"/>
                                    <label for="firstName">LastName:</label>
                                    <input type="text" name="lastName"/>
                                    <label for="firstName">Address:</label>
                                    <input type="text" name="address"/>
                                    <label for="firstName">ZipCode:</label>
                                    <input type="text" name="zipCode"/>
                                    <label for="firstName">City:</label>
                                    <input type="text" name="city"/>
                                    <label for="firstName">Email:</label>
                                    <input type="text" name="email"/>
                                    <label for="status">Status:</label>
                                    <select name="status" id="contact_status">
                                        <c:forEach var="contact_status" items="${statusList}">
                                            <option value="${contact_status}">${contact_status}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="submit" value="Update Contact"/>
                                </form>

                                <td>
                                    <form action="dashboard" method="delete">
                                        <input type="submit" name="delete_user" value="Delete" />
                                            <%--                                    <input type="hidden" name="user" value="${contact.id}" />--%>
                                    </form>
                                </td>
                                </c:if>

                            </div>
                            <c:if test="${user != null}">
                                <div align="center">
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
                                        <form action="#" th:action="/save" th:object="${user}" method="put">
                                            <p>Firstname: <input type="text" th:field="*{firstname}"/></p>
                                            <p>Lastname: <input type="text" th:field="*{lastname}"/></p>
                                            <p>Username: <input type="text" th:field="*{username}"/></p>
                                            <p>Email: <input type="text" th:field="*{email}"/></p>
                                            <p>Password: <input type="text" th:field="*{password}"/></p>
                                            <p><input type="submit" value="Save" class="btn btn-primary"/> <input
                                                    type="reset" value="Reset" class="btn btn-primary"/></p>
                                        </form>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div></main>

</body>
</html>