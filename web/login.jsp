<%-- 
    Document   : login
    Created on : Mar 9, 2024, 5:22:36 PM
    Author     : lpdie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/login.css"/>
        <!-- Icons font CSS-->

    </head>
    <body>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <jsp:include page="includes/header.html"></jsp:include>
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

            <div class="container-fluid register" style="margin: 0 auto; margin-top: 91px">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="https://downloadlogomienphi.com/sites/default/files/logos/download-logo-vector-dai-hoc-fpt-mien-phi.jpg" alt="" style="border-radius: 5px"/>
                        <h3>Welcome</h3>
                        <p class="text-white">You are 30 seconds away from earning your own money!</p>
                        <a href="register.jsp"><input type="submit" name="" value="Register"/><br/></a>
                    </div>
                    <div class="col-md-9 register-right">

                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Welcome Back! LOG IN</h3>
                                <p class="register-heading" style="color: red">${requestScope.error5}</p>


                                <form action="login" method="post">
                                    <div class="row register-form">
                                    <c:set var="cookie" value="${pageContext.request.cookies}"/>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Email or Username" value="${cookie.cuser.value}" require name="user"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control"  placeholder="Password" value="${cookie.cpass.value}" require name="pass"/>
                                        </div>
                                    </div>


                                    <div class="col-md-8">
                                        Remember me &ensp;&ensp; <input ${(cookie.crem!=null?'checked':'')} type="checkbox" value="OK" name="rem">
                                        <input type="submit" class="btnRegister"  value="Log in"/>
                                    </div>
                                    <p style="color: red">${requestScope.error1}</p>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
