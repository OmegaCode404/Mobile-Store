<%-- 
    Document   : login
    Created on : Mar 17, 2022, 11:40:22 AM
    Author     : Tin Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">



    <jsp:include page="/WEB-INF/header.jsp" />
    <!-- End Header Area -->
   <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Login</h1>
                </div>
            </div>
        </div>
    </section>
    <!--================Login Box Area =================-->
    <section class="login_box_area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login_box_img">
                        <img class="img-fluid" src="<c:url value="/img/login.jpg" />" alt="">
                        <div class="hover">
                            <h4>Not have an account</h4>
                            <p>Join in by registering yourself an account</p>
                            <a class="primary-btn" href="<c:url value="/auth/registerPage.do" />">Create an Account</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login_form_inner">
                        <h3>Log in</h3>
                        <form class="row login_form" method="POST" >
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="userName" name="userName" placeholder="Username" value="${userName}" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                            </div>
                            <p style="color: red;">${message}</p>
                            <div class="col-md-12 form-group">
                                <button type="submit" class="primary-btn" formaction="<c:url value="/auth/login.do" />">Log In</button>
                                <a href="#">Forgot Password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Login Box Area =================-->

    <!-- start footer Area -->
    <jsp:include page="/WEB-INF/footer.jsp" />
