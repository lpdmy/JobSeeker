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
                <nav class="navbar navbar-expand-lg"  style="background-color: #0006">
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

        <div class="container-fluid register" style="margin: 0 auto; margin-top: 91px">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://downloadlogomienphi.com/sites/default/files/logos/download-logo-vector-dai-hoc-fpt-mien-phi.jpg" alt="" style="border-radius: 5px"/>
                    <h3>Welcome</h3>
                    <p class="text-white">You are 30 seconds away from earning your own money!</p>
                    <a href="login.jsp"><input type="submit" name="" value="Login"/><br/></a>
                </div>
                <div class="col-md-9 register-right">
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist" style="width: 19%">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Hirer</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <h3 class="register-heading">Apply as a Employee <br> <i style="color: red; font-size: 14px;">Up your avatar first!</i></h3>

                            <form class="row register-form" method="post" action="register" >

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required placeholder="First Name *" value="" name="fname" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" required placeholder="Last Name *" value="" name="lname" />
                                    </div>

                                    <div class="form-group">
                                        <input type="password" class="form-control" required placeholder="Password *" value="" name="pass" />
                                    </div>
                                    <div class="form-group">
                                        <p style="color: red">${requestScope.error1}</p>
                                        <input type="password" class="form-control" required placeholder="Confirm Password *" value="" name="cpass"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="number" class="form-control" required placeholder="Year Experience *" value="" name="year"/>
                                    </div>
                                    <div class="form-group">
                                        <div class="maxl">
                                            <label class="radio inline"> 
                                                <input type="radio" name="gender" value="M" checked>
                                                <span> Male </span> 
                                            </label>
                                            <label class="radio inline"> 
                                                <input type="radio" name="gender" value="F">
                                                <span>Female </span> 
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <p style="color: red">${requestScope.error2}</p>

                                    <div class="form-group">
                                        <input type="email" class="form-control" required placeholder="Your Email *" value="" name="email"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" required placeholder="Username *" value="" name="user"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="tel" name="phone" required class="form-control" placeholder="Your Phone *" value="" />
                                    </div>
                                    <div class="form-group">
                                        <input type="date" class="form-control" required placeholder="Birth Date" value="" name="birthdate" />
                                    </div>
                                    <!--                                        <div class="form-group">
                                                                                <input type="file" class="form-control" name="file" size="60" />
                                                                            </div>-->
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" name="img" value="${requestScope.img_link}" />
                                    </div>
                                    <input type="submit" class="btnRegister"  value="Register"/>
                                </div>
                            </form>
                            <p style="margin-left: 10%; color: green">${requestScope.mes}</p> 

                            <form style="margin: 0; padding-top: 0;" class="row register-form" action="UploadFileServlet" method="post" enctype="multipart/form-data">

                                <div class="form-group">
                                    Ảnh 3x4:  <input type="file" class="form-control" name="file" size="60"/>
                                    <input type="submit" class="btnRegister"  value="Upload"/>
                                </div>

                            </form>
                        </div>






                        <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <h3  class="register-heading">Apply as a Hirer</h3>
                            <form action="registerhirer" method="post">
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="" name="fname" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" name="lname" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" value="" name="email" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="tel"  class="form-control" placeholder="Phone *" value="" name="phone" required/>
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="M" checked>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="F">
                                                    <span>Female </span> 
                                                </label>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="" name="pass" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Confirm Password *" value="" name="cpass" required/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Security Code *" value="" name="code" required />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="companyId">
                                                <jsp:useBean id="cp" class="dao.CompanyDAO"></jsp:useBean>
                                                <c:set var="companyList" value="${cp.allCompanies}"></c:set>
                                                    <option class="hidden"  selected disabled>Company</option>
                                                <c:forEach items="${companyList}" var="cl"> 
                                                    <option value="${cl.companyId}">${cl.companyName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <input type="text" name="accountId" value="${sessionScope.account.id}" hidden>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Username" value=""  name="user"/>
                                        </div>
                                        <p style="color: red">${requestScope.error3}</p>

                                        <input type="submit" class="btnRegister"  value="Register"/>
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
