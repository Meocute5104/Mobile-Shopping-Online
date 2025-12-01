<%-- 
    Document   : OrderManage
    Created on : Nov 7, 2024, 8:08:27 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Manage</title>
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
                <h1>Danh sach don hang</h1>
                <form action="ordermanager" method="get">
                    <div>
                        Trạng thái đơn hàng
                        <select onchange="this.form.submit()" name="op" required>
                            <!-- Thay thế bằng dữ liệu từ bảng Brand -->
                            <option ${requestScope.op eq 1 ? "selected" : ""} value="1">Pending</option>
                            <option ${requestScope.op eq 2 ? "selected" : ""} value="2">Shipping</option>
                            <option ${requestScope.op eq 3 ? "selected" : ""} value="3">Cancle</option>
                        </select>
                    </div>
                    <div>
                        <table class="table" border="0">
                            <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>UserName</th>
                                    <th>OrderDate</th>
                                    <th>TotalAmount</th>
                                    <th>Status</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.list}" var="i">
                                    <tr>
                                        <td>${i.id}</td>
                                        <td>${i.user.username}</td>
                                        <td>${i.date}</td>
                                        <td class="price">${i.totalAmount}</td>
                                        <td>${i.status}</td>
                                        <c:if test="${i.status eq 'Pending'}">
                                            <td>
                                                <a href="uporder?oid=${i.id}&op=1">
                                                    Checked
                                                </a>
                                            </td>

                                            <td>
                                                <a href="uporder?oid=${i.id}&op=2">
                                                    Cancle
                                                </a>
                                            </td>
                                        </c:if>

                                        <td>
                                            <a href="detailorder?oid=${i.id}">
                                                Detail
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </form>
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
