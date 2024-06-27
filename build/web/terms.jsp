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
                                <li class="nav-item">
                                    <a class="nav-link" href="jobs">Jobs</a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="about.jsp">About Us</a>
                                        <a class="dropdown-item" href="team.jsp">Team</a>
                                        <a class="dropdown-item" href="blog.jsp">Blog</a>
                                        <a class="dropdown-item active" href="terms.jsp">Terms</a>
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
                        <h1>Terms</h1>
                        <span>Lorem ipsum dolor sit amet.</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info about-info">
            <div class="container">
                <div class="more-info-content">
                    <div class="right-content">
                        <span>A) Lorem ipsum dolor sit amet</span>
                        <h5>1. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum, iure.</h5>
                        <br>  
                        <p>Fusce nec ultrices lectus. Duis nec scelerisque risus. Ut id tempor turpis, ac dignissim ipsum. Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo sem. Pellentesque in sagittis lacus, vel auctor sem. Quisque eu quam eleifend, ullamcorper dui nec, luctus quam.</p>

                        <br>

                        <span>A) Lorem ipsum dolor sit amet</span>
                        <h5>1. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum, iure.</h5>
                        <br>  
                        <p>Fusce nec ultrices lectus. Duis nec scelerisque risus. Ut id tempor turpis, ac dignissim ipsum. Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo sem. Pellentesque in sagittis lacus, vel auctor sem. Quisque eu quam eleifend, ullamcorper dui nec, luctus quam.</p>

                        <br>

                        <span>A) Lorem ipsum dolor sit amet</span>
                        <h5>1. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum, iure.</h5>
                        <br>  
                        <p>Fusce nec ultrices lectus. Duis nec scelerisque risus. Ut id tempor turpis, ac dignissim ipsum. Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo sem. Pellentesque in sagittis lacus, vel auctor sem. Quisque eu quam eleifend, ullamcorper dui nec, luctus quam.</p>

                        <br>

                        <span>A) Lorem ipsum dolor sit amet</span>
                        <h5>1. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum, iure.</h5>
                        <br>  
                        <p>Fusce nec ultrices lectus. Duis nec scelerisque risus. Ut id tempor turpis, ac dignissim ipsum. Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo sem. Pellentesque in sagittis lacus, vel auctor sem. Quisque eu quam eleifend, ullamcorper dui nec, luctus quam.</p>

                        <br>  
                        <br>  
                        <br>  
                        <br>  
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
