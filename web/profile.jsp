<%-- 
    Document   : profile
    Created on : Mar 10, 2024, 12:52:02 AM
    Author     : lpdie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style>

            .gradient-custom {
                /* fallback for old browsers */
                background: #f6d365;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
            }
        </style>
        <jsp:include page="includes/header.html"></jsp:include>
            <!-- Page Content -->
              <!-- Page Content -->
            <header class="">
                <nav class="navbar navbar-expand-lg" style="background-color: #0006">
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
                                <li class="nav-item">
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
                                <li class="nav-item active">
                                    <a class="nav-link" href="${sessionScope.account.role==2?'profile_1.jsp':'profile'}">Profile</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <section class="vh-100" style="background-color: #f4f5f7; ">
            <jsp:useBean id="data" class="dao.CompanyDAO"></jsp:useBean>
            <jsp:setProperty name="data" property="id" value="${sessionScope.account.accountId}"></jsp:setProperty>
                <div class="container py-5 h-100" >
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col col-lg-10 mb-4 mb-lg-0" >
                            <div class="card mb-3" style="border-radius: .5rem; height: 500px; padding: 20px; margin-top: 50px">
                                <div class="row g-0">
                                    <div class="col-md-4 gradient-custom text-center text-white"
                                         style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; height: 470px">
                                        <img src="${sessionScope.account.profile.img}"
                                         alt="Avatar" class="img-fluid my-4" style="width: 80px;" />
                                    <div class="text">
                                        <h5>${(String.valueOf(sessionScope.account.profile.gender) == 'F') ? 'Miss' : 'Mr'} ${sessionScope.account.profile.firstName} ${sessionScope.account.profile.lastName} </h5>
                                        <p>@${sessionScope.account.username}</p>
                                        <a href="listjob.jsp" style="color: green">View applied jobs</a>

                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">${sessionScope.account.email}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Phone</h6>
                                                <p class="text-muted">${sessionScope.account.profile.phone}</p>
                                            </div>
                                        </div>

                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Date of Birth</h6>
                                                <p class="text-muted">${sessionScope.account.profile.birthdate}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Year of Experiences</h6>
                                                <p class="text-muted">${sessionScope.account.profile.yearExp} years</p>
                                            </div>
                                        </div>
                                        <h6>Education</h6>
                                        <hr class="mt-0 mb-3">
                                        <a href="addedu">Add education</a>

                                        <div class="row pt-1">
                                            <jsp:useBean id="majorData" class="dao.MajorDAO"></jsp:useBean>
                                                <div class="col-5 mb-3">
                                                    <h6>Major</h6>
                                                <c:forEach items="${requestScope.listE}" var="c">
                                                    <jsp:setProperty name="majorData" property="mid" value="${c.majorId}"></jsp:setProperty>
                                                    <p class="text-muted">${majorData.majorById.major}</p>
                                                </c:forEach>
                                            </div>
                                            <div class="col-4 mb-3">
                                                <h6>University Name</h6>
                                                <c:forEach items="${requestScope.listE}" var="c">

                                                    <p class="text-muted">${c.uniName}</p>
                                                </c:forEach>

                                            </div>
                                            <div class="col-3 mb-3">
                                                <h6>Rank</h6>
                                                <c:forEach items="${requestScope.listE}" var="c">

                                                    <p class="text-muted">${c.rank}</p>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="includes/footer.html"></jsp:include>

    </body>
</html>
