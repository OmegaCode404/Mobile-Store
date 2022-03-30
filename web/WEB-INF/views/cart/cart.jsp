<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zxx" class="no-js">

    <title>Cart Shopping</title>
    <jsp:include page="/WEB-INF/header.jsp" />
    <!-- End Header Area -->
    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shopping Cart</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->


    <!--================Cart Area =================-->
    <section class="cart_area" style="margin-top: 60px;">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                                <th scope="col">Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="total" value="0" />
                            <c:forEach var="item" items="${cart.items}">
                            <form>
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="<c:url value="/products/${item.id}.jpg" />" height="150">
                                            </div>
                                            <div class="media-body">
                                                <p>${item.description}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <h5><fmt:formatNumber value="${item.price * (1 - item.discount)}" pattern="$#,##0.00"/></h5>
                                    </td>
                                    <td>
                                        <div class="product_count">
                                            <input type="number" min="1" value="${item.quantity}" name="quantity" style="width: 60px;">
                                        </div>
                                    </td>
                                    <td>
                                        <h5><fmt:formatNumber value="${item.quantity * item.price * (1 - item.discount)}" pattern="$#,##0.00" /></h5>
                                    </td>
                                    <td>
                                        <div style="display: flex;">
                                            <input type="hidden" value="${item.id}" name="id" />
                                            <button type="submit" class="btn btn-sm button-82-front" formaction="<c:url value="/cart/delete.do"/>">Delete</button>
                                            <button type="submit" style="background-color: #2596be; margin-left: 15px" class="btn btn-sm button-82-front" formaction="<c:url value="/cart/update.do"/>">Update</button>
                                        </div>

                                    </td>
                                </tr>
                            </form>
                            <c:set var="total" value="${total + item.quantity * item.price * (1 - item.discount)}" />
                        </c:forEach>


                        <tr class="bottom_button" s>
                            <td>
                                <input type="hidden" value="${item.id}" name="id" />
                                <a class="gray_btn" href="<c:url value="/cart/empty.do" />">Empty Cart</a>
                            </td>
                            <td></td>
                            <td></td>
                            <td>
                                <h5>Subtotal</h5>
                            </td>
                            <td>
                                <h5><fmt:formatNumber value="${total}" pattern="$#,##0.00"/></h5>
                            </td>
                        </tr>
                        <tr class="out_button_area">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <div class="checkout_btn_inner d-flex align-items-center">
                                    <a class="gray_btn" href="<c:url value="/cart/viewhome.do" />">Continue Shopping</a>
                                    <a class="primary-btn" href="<c:url value="/checkout/index.do" />">Checkout</a>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

    <!-- start footer Area -->
    <jsp:include page="/WEB-INF/footer.jsp" />