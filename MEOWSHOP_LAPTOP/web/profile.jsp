<%-- 
    Document   : profile
    Created on : Nov 5, 2024, 1:44:43 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
        <c:set var="u" value="${sessionScope.account}"/>
        <div style="margin-top: 50px;" class="container-content">
            <div style="display: flex; justify-content: space-between;">
                <!--Ben trai-->
                <div style="width: 200px;background-color: white;border-radius: 15px;">
                    <div style="margin: 10px;display: flex;gap: 20px;">
                        <div>
                            <img width="50px" src="images/profile/faker.jpeg" alt="alt"/> 
                        </div>
                        <div>
                            <h6>${u.name}</h6>
                            <p>${u.phone}</p>
                        </div>
                    </div>
                    <div style="display: flex; justify-content: center; align-items: center;
                         flex-direction: column; gap: 20px;">
                        <div>
                            <a href="profile?op=0">
                                Xem hồ sơ
                            </a>
                        </div>
                        <div>
                            <a href="profile?op=1">
                                Đơn hàng của tôi
                            </a> 
                        </div>
                        <div>
                            <a href="logout">
                                Đăng xuất
                            </a>
                        </div>
                    </div>
                </div>

                <!--Ben phai-->
                <div style="width: 950px; background-color: white; border-radius: 15px;">
                    <c:if test="${requestScope.op eq 0}">
                        <h5 style="text-align: center;margin-bottom: 20px;">Thông tin cá nhân</h5>
                        <div style="display: flex; justify-content: center; align-items: center;">
                            <div>
                                <form action="profile" method="post">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>           
                                                    <img width="100px" src="images/profile/faker.jpeg" alt="alt"/> 
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>Name</td>
                                                <td>
                                                    <input type="text" name="name" value="${u.name}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Username</td>
                                                <td>
                                                    <input type="text" name="username" value="${u.username}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td>
                                                    <input type="text" name="email" value="${u.email}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Phone</td>
                                                <td>
                                                    <input type="text" name="phone" value="${u.phone}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Password</td>
                                                <td>
                                                    <input readonly type="password" name="name" value="${u.password}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>New password</td>
                                                <td>
                                                    <input type="password" name="repass"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="submit" value="Change infomation"/>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${requestScope.op eq 1}">
                        <c:forEach items="${requestScope.listOrder}" var="i">
                            <div style="margin-top: 20px;">
                                <strong>Code Order:</strong> ${i.id} &nbsp; &nbsp;&nbsp; 
                                <strong>Date:</strong> ${i.date}   &nbsp; &nbsp;&nbsp; 
                                <strong>Total Amount:</strong> <span class="price">${i.totalAmount}</span>  &nbsp; &nbsp;&nbsp;   
                                <strong>Status:</strong> ${i.status}   &nbsp; &nbsp;&nbsp;   
                                <a href="cancle?oid=${i.id}">Hủy đơn</a>
                            </div>
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
                                    <c:forEach items="${requestScope.listOrderLine}" var="o">
                                        <c:if test="${o.oid == i.id}">
                                            <tr>
                                                <td style=" text-align: center;">
                                                    <img width="50px;" src="${o.productColor.image}" alt="alt"/>
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
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </c:forEach>
                    </c:if>
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
    </body>

</html>
