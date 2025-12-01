<%-- 
    Document   : detailorder
    Created on : Nov 7, 2024, 8:48:11 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    </head>
    <body>

        <div>
            <%@include file="header.jsp" %>
        </div>
        <div style="display: flex;">
            <div>
                <%@include file="dashboard.jsp" %>
            </div>
            <div>
                <h1>Detail orderID: ${requestScope.oid}</h1>
                <div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th style=" text-align: center;">Image</th>
                                <th style=" text-align: center;">Name</th>
                                <th style=" text-align: center;">Color</th>
                                <th style=" text-align: center;">Quantity</th>
                                <th style=" text-align: center;">Price</th>
                                <th style=" text-align: center;">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.list}" var="o">
                                <tr>
                                    <td style=" text-align: center;">
                                        <a href="product?productID=${o.productColor.product.id}">
                                            <img width="50px;" src="${o.productColor.image}" alt="alt"/>
                                        </a>
                                    </td>
                                    <td style=" text-align: center;">
                                        ${o.productColor.product.name}
                                    </td>
                                    <td style=" text-align: center;">
                                        ${o.productColor.color.name}
                                    </td>
                                    <td style=" text-align: center;" class="price">${o.quantity}</td>
                                    <td style=" text-align: center;" class="price">${o.price}</td>
                                    <td style=" text-align: center;" class="price">${o.quantity * o.price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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
    </body>
</html>
