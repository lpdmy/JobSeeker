<%-- 
    Document   : job-details
    Created on : Mar 9, 2024, 4:58:31 PM
    Author     : lpdie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="includes/header.html"></jsp:include>

              <!-- Page Content -->
            <header class="">
                <nav class="navbar navbar-expand-lg">
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
                                <li class="nav-item active">
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

        <!-- Page Content -->
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <jsp:useBean id="jobData" class="dao.JobDAO"></jsp:useBean>
                        <jsp:setProperty property="jobId" name="jobData" value="${requestScope.job.id}"></jsp:setProperty>
                        <jsp:useBean id="majorData" class="dao.MajorDAO"></jsp:useBean>
                        <jsp:setProperty property="mid" name="majorData" value="${requestScope.job.majorId}"></jsp:setProperty>

                            <h1>${requestScope.job.jobType}</h1>

                        <span>${jobData.companyByJobId.companyName}</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="tabs-content" style="display: block;">
                            <h4>Description</h4>

                            <p>${requestScope.job.description}</p>
                            <br>
                            <p style="color: #1e7e34">Salary: $${requestScope.job.salary}</p>
                            <br>
                            <p style="color: #117a8b">Requirements: ${requestScope.job.yearExp} years of experiences</p>
                            <br>
                            <p style="color: #d39e00">Major: ${majorData.majorById.major}</p>

                        </div>

                        <br>
                    </div>

                    <div class="col-md-4">
                        <br>
                        <div>
                            <img src="assets/images/${jobData.companyByJobId.img}" alt="" class="wc-image" height="370px" width="370px" style="border-radius: 50%; object-fit: cover;">
                        </div>
                        <br>

                        <a href="apply?jobId=${requestScope.job.id}" class="filled-button text-center" style="display: block">Apply for this Job</a>
                        <br>
                    </div>
                </div>

                <br>

                <div class="row">
                    <div class="col-lg-9">
                        <div class="tabs-content" style="display: block;">
                            <h4>About Company</h4>

                            <p>${jobData.companyByJobId.description}</p>

                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="tabs-content">
                            <h4>Contact Details</h4>

                            <p>
                                <span>Name</span>

                                <br>

                                <strong>${jobData.posterByJobId.profile.firstName} ${jobData.posterByJobId.profile.lastName}</strong>
                            </p>

                            <p>
                                <span>Phone</span>

                                <br>

                                <strong>
                                    <a href="tel:123-456-789">${jobData.posterByJobId.profile.phone}</a>
                                </strong>
                            </p>

                            <p>
                                <span>Address</span>

                                <br>

                                <strong>
                                    <a href="tel:456789123">${requestScope.job.location}</a>
                                </strong>
                            </p>

                            <p>
                                <span>Email</span>

                                <br>

                                <strong>
                                    <a href="mailto:john@carsales.com">${jobData.posterByJobId.email}</a>
                                </strong>
                            </p>
                        </div>
                    </div>
                </div>

                <br>



                <br>
                <br>
                <br>
            </div>
        </div>
        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
