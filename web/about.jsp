<%-- 
    Document   : contact
    Created on : Mar 9, 2024, 4:44:18 PM
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
        <jsp:useBean id="jobData" class="dao.JobDAO"></jsp:useBean>
        <jsp:useBean id="userData" class="dao.UserDAO"></jsp:useBean>
        <jsp:useBean id="companyDAO" class="dao.CompanyDAO"></jsp:useBean>
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
                                <li class="nav-item ">
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

                                <li class="nav-item dropdown active">
                                    <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item active" href="about.jsp">About Us</a>
                                        <a class="dropdown-item" href="team.jsp">Team</a>
                                        <a class="dropdown-item" href="blog.jsp">Blog</a>
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

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>About Us</h1>
                        <span>We have over ${jobData.days} days of experience</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info about-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="more-info-content">
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <div class="right-content">
                                        <span>Welcome to the world of jobs</span>
                                        <h2>Get to know about <em>our company</em></h2>
                                        <p>Hello my friend. We are very proud to introduce our company. It is top 1 job seeker web in <i style="color: orange">FPT</i>.
                                            <br><br>At our company, we pride ourselves on being the premier destination for individuals seeking employment opportunities within the <i style="color: orange">FPT</i> ecosystem. Our platform is meticulously designed to cater to the diverse needs and aspirations of job seekers, offering a seamless and intuitive experience from start to finish.</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="left-image">
                                        <img src="assets/images/about-1-570x350.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="fun-facts">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="left-content">
                            <span>Our Achievements</span>
                            <h2>Look at these <em>numbers</em></h2>
                            <p>Welcome to our Achievements section, where we take pride in celebrating the successes of our valued users.  
                                <br><br>Ready to showcase your achievements and inspire others? Update your profile, share your success stories, and join the conversation in our vibrant community of job seekers. </p>
                        </div>
                    </div>



                    <div class="col-md-6 align-self-center">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${jobData.totalJobs}</div>
                                    <div class="count-title">Jobs</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${userData.totalUser}</div>
                                    <div class="count-title">Happy clients</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${jobData.totalLocations}</div>
                                    <div class="count-title">Countries</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="count-area-content">
                                    <div class="count-digit">${companyDAO.totalCompanies}</div>
                                    <div class="count-title">Offices</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
