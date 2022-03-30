<%-- 
    Document   : header
    Created on : Mar 20, 2022, 10:12:30 PM
    Author     : SE151117 - Nguyen Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zxx" class="no-js">

    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="<c:url value="/img/fav1.png" />">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
     
        <!--
                CSS
                ============================================= -->
        <link rel="stylesheet" href="<c:url value="/css/linearicons.css" />">
        <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css" />">
        <link rel="stylesheet" href="<c:url value="/css/themify-icons.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.css" />">
        <link rel="stylesheet" href="<c:url value="/css/owl.carousel.css" />">
        <link rel="stylesheet" href="<c:url value="/css/nice-select.css" />">
        <link rel="stylesheet" href="<c:url value="/css/nouislider.min.css" />">
        <link rel="stylesheet" href="<c:url value="/css/ion.rangeSlider.css" />">
        <link rel="stylesheet" href="<c:url value="/css/ion.rangeSlider.skinFlat.css" />">
        <link rel="stylesheet" href="<c:url value="/css/magnific-popup.css" />">
        <link rel="stylesheet" href="<c:url value="/css/main.css" />">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    </head>

    <body>



        <!-- Start Header Area -->
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-light main_box">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="<c:url value="/home/index.do" />"><img src="<c:url value="/img/logo1.png" />"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <li class="nav-item active"><a class="nav-link" href="<c:url value="/home/index.do" />">Home</a></li>
                                <form class="d-flex">

                                    <c:if test="${user == null}">
                                        <li class="nav-item"><a class="nav-link" href="<c:url value="/auth/loginPage.do"  />">Login</a></li>
                                        <li class="nav-item"><a class="nav-link" href="<c:url value="/auth/registerPage.do"  />">Register</a></li>
        
                                    </c:if>
                                    <c:if test="${user != null}">
                                        <li class="nav-item"><a class="nav-link" href="<c:url value="#"  />">${user.name}</a></li>
                                        <li class="nav-item"><a class="nav-link" href="<c:url value="/auth/logout.do"  />">Logout</a></li>
                                    </c:if>

                                </form>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="nav-item"><a href="<c:url value="/cart/view.do"/>" class="cart"><span><i class="bi bi-cart-fill"></i>   ${cart.numOfProducts}</span></a></li>

                            </ul>
                        </div>
                    </div>
                </nav>
            </div>

        </header>
    <body>                                         
