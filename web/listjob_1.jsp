<%-- 
    Document   : jobs
    Created on : Mar 9, 2024, 5:00:45 PM
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
        <c:if test="${sessionScope.account.role==2}">
            <div style="position: fixed; bottom: 20px; right: 20px; z-index: 100;"><a href="insertjob.jsp" class="filled-button" style="border: 1px solid #1e7e34">Add jobs</a></div>
        </c:if>   
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
                                <a class="nav-link" href="company.jsp">Company</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="jobs.jsp">Jobs</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>

                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="about.jsp">About Us</a>
                                    <a class="dropdown-item" href="teams.jsp">Team</a>
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
                                <li class="nav-item active">
                                    <a class="nav-link" href="profile.jsp">Profile</a>
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
                        <h1>List of posted jobs</h1>
                        <span>...</span>
                    </div>
                </div>
            </div>
        </div>
        <!--CHECK BOX SEARCH-->
        <div class="services">
            <div class="container">
                <div class="row">               

                    <div class="col-lg-12">
                        <div class="row">
                            <jsp:useBean id="jobData" class="dao.JobDAO"></jsp:useBean>
                            <jsp:setProperty property="posterId" name="jobData" value="${sessionScope.account.accountId}"></jsp:setProperty>

                            <c:forEach items="${jobData.jobByPosterId}" var="j">
                                <jsp:setProperty property="jobId" name="jobData" value="${j.id}"></jsp:setProperty>

                                    <div class="col-md-4">
                                        <div class="service-item">
                                            <img src="assets/images/${jobData.companyByJobId.img}" alt="" height="250px">
                                        <div class="down-content">
                                            <a href="job-details?id=${j.id}">
                                                <h4 >${jobData.companyByJobId.companyName}</h4></a>
                                            <div style="margin-bottom:10px;">
                                                <span><sup>$</sup>${j.salary} </span>
                                            </div>

                                            <p>${j.jobType}</p>

                                            <a href="#" onclick="doDelete(${j.id})" class="filled-button">Delete</a>
                                            <a href="editpost?jid=${j.id}&aid=${sessionScope.account.accountId}" class="filled-button">Edit</a>
                                            <a href="listapply?id=${j.id}" class="filled-button">List</a>

                                        </div>
                                    </div>

                                    <br>
                                </div>
                            </c:forEach>


                        </div>
                    </div>
                </div>



                <br>
                <br>

                <nav>
                    <ul class="pagination pagination-lg justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">»</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <br>
                <br>
                <br>
                <br>
            </div>
        </div>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to detele this JOB with id = " + id + "?"))
                    window.location = "postdelete?id=" + id;
            }
        </script>
        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
