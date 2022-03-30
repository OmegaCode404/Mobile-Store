<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

    <title>Phone Shop</title>

    <jsp:include page="/WEB-INF/header.jsp" />
    <!-- End Header Area -->
   
    <!-- start product Area -->
    <section style="margin-top: 200px">
        <!-- single product slide -->
        <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
    </section>
    <!-- end product Area -->


    <!-- start footer Area -->
    <jsp:include page="/WEB-INF/footer.jsp" />