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
     <title>Register</title>
     
     <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Register</h1>
                </div>
            </div>
        </div>
    </section>

    <!--================Register Box Area =================-->
    <section class="login_box_area section_gap">
        <div class="container">
            <div class="row">

                <div class="col-lg-6">
                    <div class="login_form_inner">
                        <h3>Register</h3>
                        <form class="row login_form" method="POST">

                            <div class="col-md-12 form-group">

                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Full name" value="${fullName}" required>

                            </div>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="username" name="userName" placeholder="Username" value="${userName}" required>

                            </div>
                            <div class="col-md-12 form-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>

                            </div>
                            <div class="col-md-12 form-group">
                                <input type="password" class="form-control" id="passwordConfirmInput" name="passwordConfirm" placeholder="Password Confirm" required>

                            </div>
                            <div class="col-md-12 form-group">
                                <input type="email" class="form-control" id="passwordConfirmInput" name="email" placeholder="Email" value="${email}" required>

                            </div>
                            <div class="row">
                                <div class="col">

                                    <div class="col-md-12 form-group">
                                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone" value="${phone}" required>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" id="address" name="address" placeholder="Address" value="${address}" required="">

                            </div>
                            <p style="color: red;">${message}</p>
                            <div class="row">
                                <div>
                                    <a href="<c:url value="/auth/loginPage.do"/>" class="btn btn-link">Have an account? Sign in</a>
                                </div>
                                <div class="checkout_btn_inner" style="margin-left: 20px">
                                    <button formaction="<c:url value="/auth/register.do"/>" type="submit" class="primary-btn">Let's start</button>
                                </div>
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
