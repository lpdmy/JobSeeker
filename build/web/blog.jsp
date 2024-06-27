<%-- 
    Document   : blog.jsp
    Created on : Mar 9, 2024, 4:53:20 PM
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
                        <h1>Read our Blog</h1>
                        <span>Lorem ipsum dolor sit amet consectetur</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="single-services">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <section class='tabs-content'>
                            <article id='tabs-1'>
                                <img src="assets/images/blog-image-1-940x460.jpg" alt="">
                                <h4><a href="blog-details.html">Lorem ipsum dolor sit amet, consectetur adipisicing.</a></h4>
                                <div style="margin-bottom:10px;">
                                    <span>John Doe &nbsp;|&nbsp; 27.07.2020 10:10 &nbsp;|&nbsp; 15 comments</span>
                                </div>
                                <p>Sed ut dolor in augue cursus ultrices. Vivamus mauris turpis, auctor vel facilisis in, tincidunt vel diam. Sed vitae scelerisque orci. Nunc non magna orci. Aliquam commodo mauris ante, quis posuere nibh vestibulum sit amet.</p>
                                <br>
                                <div>
                                    <a href="blog-details.jsp" class="filled-button">Continue Reading</a>
                                </div>
                            </article>

                            <br>
                            <br>
                            <br>

                            <article id='tabs-2'>
                                <img src="assets/images/blog-image-2-940x460.jpg" alt="">
                                <h4><a href="blog-details.html">Mauris lobortis quam id dictum dignissim</a></h4>
                                <div style="margin-bottom:10px;">
                                    <span>John Doe &nbsp;|&nbsp; 27.07.2020 10:10 &nbsp;|&nbsp; 15 comments</span>
                                </div>
                                <p>Sed ut dolor in augue cursus ultrices. Vivamus mauris turpis, auctor vel facilisis in, tincidunt vel diam. Sed vitae scelerisque orci. Nunc non magna orci. Aliquam commodo mauris ante, quis posuere nibh vestibulum sit amet</p>
                                <br>
                                <div>
                                    <a href="blog-details.jsp" class="filled-button">Continue Reading</a>
                                </div>
                            </article>
                        </section>
                    </div>

                    <div class="col-md-4">
                        <h4 class="h4">Search</h4>

                        <form id="search_form" name="gs" method="GET" action="#">
                            <input type="text" name="q" class="form-control form-control-lg" placeholder="type to search..." autocomplete="on">
                        </form>

                        <br>
                        <br>

                        <h4 class="h4">Recent posts</h4>

                        <ul>
                            <li>
                                <h5 style="margin-bottom:10px;"><a href="blog-details.jsp">Dolorum corporis ullam, reiciendis inventore est repudiandae</a></h5>
                                <small><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020 10:10</small>
                            </li>

                            <li><br></li>

                            <li>
                                <h5 style="margin-bottom:10px;"><a href="blog-details.jsp">Culpa ab quasi in rerum dolorum impedit expedita</a></h5>
                                <small><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020 10:10</small>
                            </li>

                            <li><br></li>

                            <li>
                                <h5 style="margin-bottom:10px;"><a href="blog-details.jsp">Explicabo soluta corrupti dolor doloribus optio dolorum</a></h5>

                                <small><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020 10:10</small>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <br>  
        <br>  
        <br>  
        <br>  

        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
