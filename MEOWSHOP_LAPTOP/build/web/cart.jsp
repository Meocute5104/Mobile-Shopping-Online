<%-- 
    Document   : cart
    Created on : Nov 4, 2024, 5:26:09 PM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Owl Carousel CSS -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    </head>
    <style>
        .container-content {
            width: 1200px;
            /* Đặt độ rộng cố định là 800px */
            margin: 0 auto;
            /* Căn giữa phần tử body theo chiều ngang */
            padding: 0;
        }

    </style>
    <body style="background-color: whitesmoke;">
        <div>
            <%@include file="header.jsp" %>
        </div>
        <c:set var="size" value="${sessionScope.size}"/>
        <c:set var="o" value="${sessionScope.cart}" />
        <c:set var="t" value="0" />
        <div style="margin-top: 50px;" class="container-content">
            <div style="display: flex;justify-content: space-between;">
                <div style="width: 900px;background-color: white; border-radius: 15px;">
                    <h5>Hello ${sessionScope.account.name}, đang có ${size} sản phẩm</h5>
                    <table class="table">
                        <thead style="border: 1px black solid;">
                            <tr class="table-active">
                                <th style="font-size: 10px;text-align: center;">No</th>
                                <th style="font-size: 10px;text-align: center;">Image</th>
                                <th style="font-size: 10px;text-align: center;">Name</th>
                                <th style="font-size: 10px;text-align: center;">Quantity</th>

                                <th style="font-size: 10px;text-align: center;">Color</th>
                                <th style="font-size: 10px;text-align: center;">Price</th>
                                <th style="font-size: 10px;text-align: center;">Money</th>
                                <th style="font-size: 10px;text-align: center;">Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${o.items}" var="i">
                                <c:set var="t" value="${t+1}"/>
                                <tr class="table-active" style="border: 1px black solid;">
                                    <td style="font-size: 10px;text-align: center;">${t}</td>
                                    <td>
                                        <img width="70px;" src="${i.productColor.image}" alt="alt"/>
                                    </td>
                                    <td style="font-size: 10px;">${i.product.name}</td>
                                    <td style="font-size: 12px;text-align: center;">
                                        <button><a style="text-decoration: none; color: black;" href="process?num=-1&id=${i.productColor.id}">-</a></button>
                                        <input type="text" style="width: 20px;padding-left: 6px;" readonly value="${i.quantity}" />
                                        <button><a style="text-decoration: none; color: black;" href="process?num=1&id=${i.productColor.id}">+</a></button>
                                    </td>
                                    <td style="font-size: 10px;text-align: center;">${i.productColor.color.name}</td>
                                    <td class="price" style="font-size: 10px;text-align: center;">${i.price}<span style="font-size: 10px">₫</span></td>
                                    <td class="price" style="font-size: 10px;text-align: center;">${i.price * i.quantity}<span style="font-size: 10px">₫</span></td>
                                    <td style="font-size: 10px;text-align: center;">
                                        <form action="process" method="post">
                                            <input type="hidden" name="id" value="${i.productColor.id}" />
                                            <button type="submit">
                                                <i class="far fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                </div>
                <div style="width: 280px;background-color: white; border-radius: 15px;">
                    <div style="margin: 10px;">
                        <h6>Thông tin đơn hàng</h6>
                        <div style="display: flex;justify-content: space-between;">
                            <div>
                                Tổng tiền
                            </div>
                            <div style="display: flex;">
                                <div class="price">
                                    ${o.totalRoot} 
                                </div>
                                <div>
                                    &nbsp;₫
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div style="display: flex;justify-content: space-between;">
                            <div>
                                Tổng khuyến mãi
                            </div>
                            <div style="display: flex;">
                                <div class="price">
                                    ${o.totalDiscount} 
                                </div>
                                <div>
                                    &nbsp;₫
                                </div>
                            </div>
                        </div>
                        <div style="display: flex;justify-content: space-between; align-items: center;">
                            <div>
                                Phí vận chuyển
                            </div>
                            <div style="display: flex;">
                                <div style="font-size: 12px;">
                                    Miễn phí
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div style="display: flex;justify-content: space-between;">
                            <div>
                                Cần thanh toán
                            </div>
                            <div style="display: flex;">
                                <div class="price">
                                    ${o.totalMoney} 
                                </div>
                                <div>
                                    &nbsp;₫
                                </div>
                            </div>
                        </div>
                        <div style="margin-left: 60px; margin-top: 30px;">
                            <form style="margin: 0 auto;" action="checkout" method="post">
                                <input style="display: block; padding: 10px; background-color: #ef4444; color: white; border-radius: 15px; border: none;" type="submit" value="Xác nhận đơn hàng" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <%@include file="footer.jsp" %>
        </div>
        <script>
            function formatCurrency() {
                // Lấy tất cả các thẻ có class "price"
                var priceElements = document.getElementsByClassName("price");

                // Duyệt qua từng phần tử
                for (var i = 0; i < priceElements.length; i++) {
                    var priceText = priceElements[i].textContent;

                    // Loại bỏ các ký tự không phải số (ví dụ như "đ")
                    var priceNumber = priceText.replace(/\D/g, '');

                    // Chuyển đổi số thành định dạng tiền tệ
                    var formattedPrice = new Intl.NumberFormat('vi-VN').format(priceNumber);

                    // Cập nhật lại nội dung của thẻ div với số đã định dạng và thêm lại ký tự "đ"
                    priceElements[i].textContent = formattedPrice;
                }
            }

            // Gọi hàm để định dạng số trong các thẻ div có class "price"
            formatCurrency();
        </script>
        <!-- Javascript -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Owl Carousel JS -->
    </body>
</html>
