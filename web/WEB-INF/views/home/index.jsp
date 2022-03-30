<%-- 
    Document   : index
    Created on : Mar 7, 2022, 10:29:30 AM
    Author     : Tin Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row">
    <c:forEach var="product" items="${list}">
        <!-- single product -->
        <div class="col-lg-4 col-md-6">
            <form action="<c:url value="/cart/add.do"/>">
                <div class="single-product">
                    <img class="img-fluid" src="<c:url value="/products/${product.id}.jpg" />">
                    <div class="product-details">
                        <input type="hidden" value="${product.id}" name="id">
                        <div class="col d-flex justify-content-center">
                            <h6>${product.description}</h6>
                        </div>
                        <div class="price col d-flex justify-content-center">
                            <h6><fmt:formatNumber value="${product.price * (1 - product.discount)}" pattern="$#,##0.00"/></h6>
                            <h6 class="l-through"><fmt:formatNumber value="${product.price}" pattern="$#,##0.00"/></h6>
                        </div>
                        <div class="col d-flex justify-content-center">
                            <input type="number" class="" value="1" min="1" name="quantity" style="width: 80px;">
                        </div>
                        <div class="prd-bottom col d-flex justify-content-center">
                            
                                <button class="button-77" type="submit">
                                    <span><i class="bi bi-cart-fill"></i></span>
                                    Add to cart
                                </button>
                           
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>

</div>

<div class="row">
    <div class="col" style="text-align: center;">
        <br/>
        <form action="<c:url value="/home/index.do"/> ">
            <button type="submit" class="btn btn-sm primary-btn" name="op" value="FirstPage" title="First Page" <c:if test="${page==1}">disabled</c:if> ><i class="bi bi-chevron-bar-left"></i></i> </button>
            <button type="submit" class="btn btn-sm primary-btn" name="op" value="PreviousPage" title="Previous Page" <c:if test="${page==1}">disabled</c:if> ><i class="bi bi-chevron-left"></i></i></i> </button>
            <button type="submit" class="btn btn-sm primary-btn" name="op" value="NextPage" title="Next Page" <c:if test="${page==totalPage}">disabled</c:if> ><i class="bi bi-chevron-right"></i></i></i> </button>
            <button type="submit" class="btn btn-sm primary-btn" name="op" value="LastPage" title="Last Page" <c:if test="${page==totalPage}">disabled</c:if> ><i class="bi bi-chevron-bar-right"></i></i> </button>
            <input type="number" min="1" max="8" name="gotoPage" value="${page}" class="btn btn-sm btn-outline-default" style="text-align: right; width: 55px" title="Enter page number" />
            <button type="submit" class="btn btn-sm primary-btn" name="op" value="GotoPage" title="Goto Page" ><i class="bi bi-arrow-up-right-circle"></i></button>
        </form>
        Page ${page}/${totalPage}
    </div>
</div>