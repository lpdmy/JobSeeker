<%-- 
    Document   : blog-details.jsp
    Created on : Mar 9, 2024, 4:51:31 PM
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

                                <li class="nav-item dropdown active">
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
                        <h1>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui eaque odit, temporibus quaerat asperiores velit?</h1>
                        <span><i class="fa fa-user"></i> John Doe &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 27.07.2020 10:10</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info about-info">
            <div class="container">
                <div class="more-info-content">
                    <div class="right-content">
                        <div>
                            <img src="assets/images/blog-image-fullscren-1-1920x700.jpg" class="img-fluid" alt="">
                        </div>
                        <br>
                        <p>Phasellus convallis mauris sed elementum vulputate. Donec posuere leo sed dui eleifend hendrerit. Sed suscipit suscipit erat, sed vehicula ligula. Aliquam ut sem fermentum sem tincidunt lacinia gravida aliquam nunc. Morbi quis erat imperdiet, molestie nunc ut, accumsan diam.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam nihil magnam magni perferendis sit, inventore maxime architecto ab officia illum vitae veritatis asperiores laborum quaerat ratione omnis, possimus, sunt quae?</p>

                        <h4>Lorem ipsum dolor sit amet.</h4>

                        <br>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus amet, corporis corrupti quod illum id autem assumenda nostrum quo, odio libero dolorum. Expedita, enim non voluptatibus qui veritatis iste ad? Voluptates natus dolor, minus culpa magnam! Iusto blanditiis beatae laudantium.</p>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci dolor nemo optio facere impedit fugiat obcaecati blanditiis tempora inventore sapiente beatae aspernatur vitae fuga totam possimus eveniet, praesentium maiores! Dolorum illum voluptates ipsum aspernatur explicabo numquam, aliquid a amet, deleniti eos suscipit totam laudantium excepturi voluptatum fugiat eum nesciunt minus iste, expedita provident temporibus, alias possimus veritatis aut fugit? Eaque.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="callback-form contact-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Leave a <em>comment</em></h2>
                            <span>Suspendisse a ante in neque iaculis lacinia</span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="contact-form">
                            <form id="contact" action="" method="get">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input name="name" type="text" class="form-control" id="name" placeholder="Full Name" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input name="email" type="text" class="form-control" id="email" pattern="[^ @]*@[^ @]*" placeholder="E-Mail Address" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your Message" required=""></textarea>
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="filled-button">Submit</button>
                                        </fieldset>
                                    </div>
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
