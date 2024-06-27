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

                                <li class="nav-item dropdown">
                                    <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="about.jsp">About Us</a>
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
                                <li class="nav-item active">
                                    <a class="nav-link" href="${sessionScope.account.role==2?'profile_1.jsp':'profile'}">Profile</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <div class="callback-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Add <em>educations</em></h2>
                            <span>Flexing your certificate</span>
                            <p style="color: red">${requestScope.error8}</p>
                            <p style="color: green">${requestScope.valid}</p>
                            <p style="color: red">${requestScope.error4}</p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="contact-form">
                            <form id="contact" action="addedu" method="post">
                                <div class="row">
                                    <jsp:useBean id="data" class="dao.CompanyDAO"></jsp:useBean>
                                    <jsp:setProperty name="data" property="id" value="${sessionScope.account.accountId}"></jsp:setProperty>
                                    <jsp:useBean id="majorData" class="dao.MajorDAO"></jsp:useBean>

                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <fieldset>
                                                <input name="uniName" type="text" class="form-control" id="subject" placeholder="University Name" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-2 col-md-12 col-sm-12">
                                            <fieldset>
                                                <input name="rank" type="text" class="form-control" id="subject" placeholder="Rank" required="">

                                            </fieldset>
                                        </div>
                                        <div class="col-lg-3 col-md-12 col-sm-12">
                                            <fieldset>
                                                <select name="majorId" class="form-control" id="name" placeholder="Major" required="">
                                                <c:forEach items="${majorData.all}" var="m">
                                                    <<option value="${m.id}">${m.major}</option>
                                                </c:forEach>
                                            </select>
                                        </fieldset>
                                    </div>
                                    <input name="accountId" hidden value="${sessionScope.account.accountId}">
                                    <br>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="border-button">Add Education</button>
                                        </fieldset>
                                    </div>

                                </div>
                            </form>
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
