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
                                <li class="nav-item active">
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
                        <h1>Contact Us</h1>
                        <span>feel free to send us a message now!</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="contact-information">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="contact-item">
                            <i class="fa fa-phone"></i>
                            <h4>Phone</h4>
                            <p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate nec cursus augue.</p>
                            <a href="#">+84 092 201 0136</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-item">
                            <i class="fa fa-envelope"></i>
                            <h4>Email</h4>
                            <p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate nec cursus augue.</p>
                            <a href="#">mylpdde180283@fpt.edu.vn</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-item">
                            <i class="fa fa-map-marker"></i>
                            <h4>Location</h4>
                            <p>FPT University, Da Nang <br> Vietnam</p>
                            <a href="https://www.google.com/maps/d/u/0/viewer?mid=1EF_lKf0Ymp6INITDY95Sir6RpaE&hl=en_US&ll=16.07567487463727%2C108.17028414795462&z=17">View on Google Maps</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="callback-form contact-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Send us a <em>message</em></h2>
                            <span>Don't be shy</span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="contact-form">
                            <form id="contact" action="" method="get">
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input name="name" type="text" class="form-control" id="name" placeholder="Full Name" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input name="email" type="text" class="form-control" id="email" pattern="[^ @]*@[^ @]*" placeholder="E-Mail Address" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <fieldset>
                                            <input name="subject" type="text" class="form-control" id="subject" placeholder="Subject" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your Message" required=""></textarea>
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-12">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="filled-button">Send Message</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="map">
            <!-- How to change your own map point
                    1. Go to Google Maps
                    2. Click on your location point
                    3. Click "Share" and choose "Embed map" tab
                    4. Copy only URL and paste it within the src="" field below
            -->
            <iframe src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=FPT%20University%20Danang+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="100%" height="500px" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
