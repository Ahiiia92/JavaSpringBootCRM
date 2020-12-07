<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>CRM Real Estate</title>
    <link rel="shortcut icon" type="image/jpg" href="https://s1.qwant.com/thumbr/0x380/b/7/0137125dfbc48df83d7c9eddac9fed2356b09ca6c795ff3c222e5b1d01eddb/home-icon2.png?u=https%3A%2F%2Fsharepointmaven.com%2Fwp-content%2Fuploads%2F2016%2F06%2Fhome-icon2.png&q=0&b=1&p=0&a=1"/>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.0.0/jquery.min.js" ></script>

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
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h3 class="masthead-brand">CRM Estate</h3>
            <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard/contacts">List of Contact</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
            </nav>
        </div>
    </header>

    <main role="main" class="inner cover">
        <h1 class="cover-heading">Cover your page.</h1>
        <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
        <p class="lead">
            <a class="btn btn-lg btn-secondary" href="admin/dashboard/contacts/new">New Contact</a>
            <a class="btn btn-lg btn-secondary" href="login/new">New User</a>
        </p>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>. Credit Photos:
                <a href="https://unsplash.com/photos/q4Gmk6X_z7o">Hans M</a></p>
        </div>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>