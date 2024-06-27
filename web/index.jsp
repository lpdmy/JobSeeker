<%-- 
    Document   : index
    Created on : Mar 9, 2024, 3:27:35 PM
    Author     : lpdie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
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
                                <li class="nav-item active">
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
        <!-- Banner Starts Here -->
        <div class="main-banner header-text" id="top">
            <div class="Modern-Slider">
                <!-- Item -->
                <div class="item item-1">
                    <div class="img-fill">
                        <div class="text-content">
                            <h6>Welcome to Job Seeker - Your Gateway to Exciting Career Opportunities</h6>
                            <h4>Find jobs <br> is easier than ever</h4>
                            <p>Find your dreaming jobs in 30 seconds with our website. </p>
                            <a href="jobs.jsp" class="filled-button">Jobs</a>
                        </div>
                    </div>
                </div>
                <!-- // Item -->
                <!-- Item -->
                <div class="item item-2">
                    <div class="img-fill">
                        <div class="text-content">
                            <h6>If you are unemployed, our website is for you</h6>
                            <h4>All jobs <br>  are here</h4>
                            <p>You will not scared of unemployment any more. Find the job suitable for you now.</p>
                            <a href="about.jsp" class="filled-button">About Us</a>
                        </div>
                    </div>
                </div>
                <!-- // Item -->
                <!-- Item -->
                <div class="item item-3">
                    <div class="img-fill">
                        <div class="text-content">
                            <h6>Resources for Career Growth!</h6>
                            <h4>A lot of chances <br>are waiting for you.</h4>
                            <p>Enhance your professional development with our comprehensive collection of resources, including resume writing tips, interview guidance, career advice articles.</p>
                            <a href="contact.jsp" class="filled-button">Contact Us</a>
                        </div>
                    </div>
                </div>
                <!-- // Item -->
            </div>
        </div>
        <!-- Banner Ends Here -->

        <div class="request-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h4>Request a call back right now ?</h4>
                        <span>Don't be shy, just contact!</span>
                    </div>
                    <div class="col-md-4">
                        <a href="contact.jsp" class="border-button">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Featured <em>Jobs</em></h2>
                            <span>The most many salary jobs</span>
                        </div>
                    </div>
                    <jsp:useBean id="jobData" class="dao.JobDAO"></jsp:useBean>
                    <c:forEach items="${jobData.top3}" var="j">
                        <jsp:setProperty property="jobId" name="jobData" value="${j.id}"></jsp:setProperty>
                            <div class="col-md-4">
                                <div class="service-item">
                                    <img src="assets/images/${jobData.companyByJobId.img}" alt="" height="250px">
                                <div class="down-content">
                                    <h4>${jobData.companyByJobId.companyName}</h4>
                                    <div style="margin-bottom:10px;">
                                        <span> <sup>$</sup>${j.salary}  </span>
                                    </div>

                                    <p>${j.jobType}</p>

                                    <a href="job-details?id=${j.id}" class="filled-button">View More</a>
                                </div>
                            </div>

                            <br>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <div class="fun-facts">
            <div class="container">
                <div class="more-info-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="left-image">
                                <img src="assets/images/about-1-570x350.jpg" class="img-fluid" alt="" >
                            </div>
                        </div>
                        <div class="col-md-6 align-self-center">
                            <div class="right-content">
                                <span>Who we are</span>
                                <h2>Get to know about <em>our company</em></h2>
                                <p>This website is for the world problem of unemployment. We hope we can help to give a solution to this problems and make the world much better and better.</p>
                                <a href="about.jsp" class="filled-button">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="more-info">
            <div class="container">
                <div class="section-heading">
                    <h2>Read our <em>Blog</em></h2>
                    <span>Static Blog</span>
                </div>

                <div class="row" id="tabs">
                    <div class="col-md-4">
                        <ul>
                            <li><a href='#tabs-1'>IT Jobs is rare nowadays <br> <small>John Doe &nbsp;|&nbsp; 27.03.2024 11:11</small></a></li>
                            <li><a href='#tabs-2'>FPT University is developing fast and furious <br> <small>Truong Gia Binh &nbsp;|&nbsp; 28.09.2007 10:10</small></a></li>
                            <li><a href='#tabs-3'>Unemployment is serious!! <br> <small>John Doe &nbsp;|&nbsp; 27.07.2020 10:10</small></a></li>
                        </ul>

                        <br>



                        <br>
                    </div>

                    <div class="col-md-8">
                        <section class='tabs-content'>
                            <article id='tabs-1'>
                                <img src="assets/images/blog-image-1-940x460.jpg" alt="">
                                <h4><a href="blog-details.jsp">IT Jobs is rare nowadays</a></h4>
                                <p>With the rapid advancement of technology, there's been a surge in the number of individuals pursuing careers in IT. This influx of talent has led to heightened competition for available positions</p>
                            </article>
                            <article id='tabs-2'>
                                <img src="https://fpt.com/Images/images/tin-tuc-2021/toa-nha/Toan-canh-toa-nha.jpg" alt="">
                                <h4><a href="blog-details.jsp">FPT University is developing fast and furious</a></h4>
                                <p>FPT in my heart. I love FPT for 4 days: Spring, Summer, Autumn and Winter. I love FPT for 3 days: Yesterday, Today and Tomorow</p>
                            </article>
                            <article id='tabs-3'>
                                <img src="assets/images/blog-image-3-940x460.jpg" alt="">
                                <h4><a href="blog-details.jsp">Unemployment is serious!! </a></h4>
                                <p>Mauris lobortis quam id dictum dignissim. Donec pellentesque erat dolor, cursus dapibus turpis hendrerit quis. Suspendisse at suscipit arcu. Nulla sed erat lectus. Nulla facilisi. In sit amet neque sapien. Donec scelerisque mi at gravida efficitur. Nunc lacinia a est eu malesuada. Curabitur eleifend elit sapien, sed pulvinar orci luctus eget. 
                                </p>
                            </article>
                        </section>
                    </div>
                </div>


            </div>
        </div>

        <div class="testimonials">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>What they say <em>about us</em></h2>
                            <span>The feedbacks of our customer</span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="owl-testimonials owl-carousel">

                            <div class="testimonial-item">
                                <div class="inner-content">
                                    <h4>Bui Ac Nhan</h4>
                                    <span>Toxic Person</span>
                                    <p>"This website is better than my website.As a dedicated web developer, I am committed to crafting websites that not only meet but exceed user expectations. From FPT with love."</p>
                                </div>
                                <img src="https://png.pngtree.com/png-vector/20220624/ourmid/pngtree-anonymous-unknown-avatar-icon-unnamed-png-image_5324340.png" alt="">
                            </div>

                            <div class="testimonial-item">
                                <div class="inner-content">
                                    <h4>Steve Jobs</h4>
                                    <span>CEO of Apple</span>
                                    <p>"10 points have no but... This website is amazing. I can find many employees for my company. Excellent work. Well done. Amazing good job!"</p>
                                </div>
                                <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRyhVpapLrbhDkT3VQP4KIpAV0Q04mZkDfKd-PUwRDC-ZLobdfg" alt="">
                            </div>

                            <div class="testimonial-item">
                                <div class="inner-content">
                                    <h4>David Wood</h4>
                                    <span>Chief Accountant</span>
                                    <p>"Ut ultricies maximus turpis, in sollicitudin ligula posuere vel. Donec finibus maximus neque, vitae egestas quam imperdiet nec. Proin nec mauris eu tortor consectetur tristique."</p>
                                </div>
                                <img src="http://placehold.it/60x60" alt="">
                            </div>

                            <div class="testimonial-item">
                                <div class="inner-content">
                                    <h4>Andrew Boom</h4>
                                    <span>Marketing Head</span>
                                    <p>"Curabitur sollicitudin, tortor at suscipit volutpat, nisi arcu aliquet dui, vitae semper sem turpis quis libero. Quisque vulputate lacinia nisl ac lobortis."</p>
                                </div>
                                <img src="http://placehold.it/60x60" alt="">
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="callback-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Request a <em>call back</em></h2>
                            <span>Send us your love</span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="contact-form">
                            <form id="contact" action="" method="post">
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
                                            <button type="submit" id="form-submit" class="border-button">Send Message</button>
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
        <script src="https://static.elfsight.com/platform/platform.js" data-use-service-core defer></script>
        <div class="elfsight-app-7ede5ddd-cd2e-4274-9091-4932b53efb90" data-elfsight-app-lazy></div>
        <jsp:include page="includes/footer.html"></jsp:include>
    </body>
</html>
