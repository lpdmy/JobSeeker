<%-- 
    Document   : company
    Created on : 10 thg 3, 2024, 03:19:08
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/stylecompany.css">
    </head>
    <body>
        <jsp:include page="includes/header.html"></jsp:include>
            <!-- Page Content -->
             <!-- Page Content -->
            <header class="">
                <nav class="navbar navbar-expand-lg"  style="background-color: #0006">
                    <div class="container">
                        <a class="navbar-brand" href="index.jsp"><h2>Job Agency <em> Website</em></h2></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Home
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="company">Company</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="jobs">Jobs</a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="about.jsp">About Us</a>
                                        <a class="dropdown-item" href="team.jsp">Team</a>
                                        <a class="dropdown-item active" href="blog.jsp">Blog</a>
                                        <a class="dropdown-item" href="terms.jsp">Terms</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                                </li>
                                <li class="nav-item">
                                <c:if test="${empty sessionScope.account}">                                    
                                    <a class="nav-link" href="login.jsp">Sign in/ Sign up</a>
                                </c:if>
                                <c:if test="${not empty sessionScope.account}">
                                    <a class="nav-link" href="logout">Log out</a>
                                </c:if>
                            </li>
                            <c:if test="${not empty sessionScope.account}">
                                <li class="nav-item">
                                    <a class="nav-link" href="${sessionScope.account.role==2?'profile_1.jsp':'profile'}">Profile</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <div class="mb-5" style="background-color: beige;margin: 0 0;margin-top: 90px;">
            <div class="container d-flex">
                <div>
                    <ul class="nav mt-5">
                        <li class="nav-item">
                            <a href="company" class="nav-link active ">Company List</a>
                        </li>
                        <li class="nav-item">
                            <a href="" class="nav-link ">Top Company</a>
                        </li>
                    </ul>
                <jsp:useBean id="companyData" class="dao.CompanyDAO"></jsp:useBean>
                    <div class="caption mt-3">
                        <h3 class="title">Explore ${companyData.totalCompanies}+ featured companies</h3>
                        <p class="description">This is where you can look up company information and find the best workplace for you</p>
                    </div>
                    <nav class="navbar navbar-light bg-light p-0 mt-3">
                        <div class="container-fluid p-0">
                            <form action="searchCompany" method="post" class="d-flex" style="width: 100%;">
                                <input value="${textS}" name="textSearch" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success" type="submit">Search</button>
                            </form>
                        </div>
                    </nav>
                </div>
                <div class="box-img ml-auto">
                    <img src="assets/images/tuyen-dung-fpt.jpg" class="img-responsive" alt="Image" style="width: 400px !important; height: 270px">
                </div>
            </div>
        </div>



        <div class="container" style="margin-bottom: 20px">
            <h2 class="text-center pb-4">List of Company's Outstanding</h2>
            <div class="row">
                <c:forEach items="${companyList}" var="cl"> 
                    <!--<form action="company" method="get">-->
                        <div class="col-md-4 col-sm-6 p-4">
                            <div class="card1" style="height: 400px; padding-bottom: 20px">
                                <div class='background1' style="height: 50%">
                                    <img src="assets/images/${cl.img}" alt="${cl.companyName}" >
                                </div>
                                <div class='content1'>
                                    <div class="card-header1">
                                        <div class="card-type1" style="background-color: beige">
                                            ${cl.companyId}
                                        </div>
                                        <div class="latest-article1">${cl.companyName}
                                        </div>
                                    </div>

                                    <div class="blog-preview__bottom1">
                                        <div class="blog-author1" style="padding: 10px 20px">
                                            <div class="blog-author__name1">
                                                <a rel="author" href="mailto:david@atheros.ai" class="blog-author__alias1">
                                                    ${cl.companyUrl}
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-content1">
                                        <p>${cl.description}</p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    <!--</form>-->

                </c:forEach>
            </div>
        </div>

        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>