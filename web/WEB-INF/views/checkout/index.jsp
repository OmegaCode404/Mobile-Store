<%-- 
    Document   : checkout
    Created on : Mar 20, 2022, 9:08:34 PM
    Author     : SE151117 - Nguyen Trong Tin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:useBean id="now" class="java.util.Date" />
<html lang="zxx" class="no-js">

    <title>Check Out</title>
    <jsp:include page="/WEB-INF/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Checkout</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Checkout Area =================-->
    <section class="checkout_area section_gap">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="row order_d_inner">
                            <div class="col">
                                <div class="details_item">
                                    <h4>Order Info</h4>
                                    <ul class="list">
                                        <li><a href="#"><span>Order number</span> : ${user.id}</a></li>
                                        <li><a href="#"><span>Name</span> : ${user.name}</a></li>
                                        <li><a href="#"><span>Address</span> : ${user.address}</a></li>
                                        <li><a href="#"><span>Phone</span> : ${user.phone}</a></li>
                                        <li><a href="#"><span>Email</span> : ${user.email}</a></li>
                                        <li><a href="#"><span>Date</span> : <fmt:formatDate value="${now}" pattern="dd-MM-yyyy" /></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col">

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                    <th scope="col"></th>
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


                                        </td>
                                    </tr>
                                </form>
                                <c:set var="total" value="${total + item.quantity * item.price * (1 - item.discount)}" />
                            </c:forEach>


                            <tr class="bottom_button" s>
                                <td>

                                </td>
                                <td></td>
                                <td><h5>Subtotal</h5></td>
                                <td><h5><fmt:formatNumber value="${total}" pattern="$#,##0.00"/></h5></td>
                                <td>
                                </td>
                            </tr>
                            <tr class="out_button_area">
                                <td></td>
                                <td></td>
                                <td><a class="gray_btn" href="<c:url value="/cart/viewhome.do" />">Continue Shopping</a></td>
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">

                                        <a class="primary-btn" href="<c:url value="/checkout/pay.do" />">Pay</a>
                                    </div>
                                </td>
                                <td>
                                    
                                </td>
                                <td>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Checkout Area =================-->

<!-- start footer Area -->
<jsp:include page="/WEB-INF/footer.jsp" />
