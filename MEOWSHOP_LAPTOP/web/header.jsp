<%-- Document : header Created on : Oct 16, 2024, 1:11:39 PM Author : MSII --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>JSPPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            header {
                background-color: #cb1c22;
                width: 100%;
                height: 80px;
                margin: 0px;
            }

            .container-content-header {
                width: 900px;
                /* Đặt độ rộng cố định là 800px */
                margin: 0 auto;
                /* Căn giữa phần tử body theo chiều ngang */
                padding: 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .but-Header {
                background-color: #7e161c;
                color: white;
                border-radius: 20px;
                border: 0;
                height: 33px;
                width: 110px;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                /* Hiển thị khi di chuột vào */
            }

            .dropdown-content {
                display: none;
                /* Ẩn mặc định */
            }

            .dropdown {
                position: relative;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
                /* Thêm hiệu ứng khi hover vào các item */
            }

            .dropdown-content {
                display: none;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                opacity: 1;
            }
        </style>
    </head>

    <body>
        <header>
            <div class="container-content-header">
                <!-- logoFsoft -->
                <a href="home">
                    <div style="padding-top: 20px;">
                        <img width="115px" height="30px" src="images/logoFsoft.png" alt="">
                    </div>
                </a>


                <!-- Phan DANH MUC -->
                <div
                    style="padding-top: 20px;display: flex; justify-content: center; align-items: center; gap: 5px;">
                    <div class="dropdown" style="display: inline-block; position: relative;">
                        <button class="but-Header">
                            <i class="fas fa-stream"></i>
                            <span style="font-size: 14px;"> Danh mục </span>
                        </button>
                        <div style="border-radius: 15px; position: absolute; z-index: 1000; display: block;"
                             class="dropdown-content">
                            <a href="laptop" style="border-radius: 15px;">
                                <div>
                                    <i class="fas fa-laptop"></i>&nbsp; &leftrightharpoons;
                                    <span style="font-size: 12px;">Laptop</span>
                                </div>
                            </a>
                            <hr>
                            <c:forEach items="${requestScope.brandList}" var="b">
                                <a style="text-decoration: none; color: black;" href="laptoplist?brand=${b.id}">
                                    <div>
                                        <img width="18px" src="${b.image}" alt="Day la ${b.image}"/>&nbsp; &leftrightharpoons;
                                        <span style="font-size: 12px;">${b.name}</span>
                                    </div>
                                </a>
                            </c:forEach>

                        </div>
                    </div>


                    <!-- PHAN SEARCH -->
                    <div>
                        <form action="search">
                            <div style="position: relative; display: inline-block;">
                                <input type="text" name="key" placeholder= "Nhập tên máy tính cần tìm ... " value="${!(requestScope.key eq null) ? requestScope.key : ""}"
                                       style="border-radius: 15px; height: 33px; width: 400px; border: 0px; padding-right: 30px; padding-left: 20px; font-size: 10px;font-weight: bold; color: gray;">
                                <button type="submit"
                                        style="background-color: rgb(250, 219, 224); border-radius: 100%;
                                        padding-left: 2px;padding-right: 2px; position: absolute; right: 5px; top: 50%; transform: translateY(-50%);">
                                    <i style="color: #d52121; width: 20px;" class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </form>
                    </div>


                </div>

                <div
                    style="padding-top: 20px; display: flex; justify-content: center; align-items: center; gap: 5px;">
                    <div class="dropdown" style="display: inline-block; position: relative;">
                        <button class="but-Header">
                            <a href="login">
                                <i class="fas fa-user-circle fa-lg" style="color: black;"></i>
                            </a>
                        </button>
                        <div style="border-radius: 15px; position: absolute; z-index: 1000; display: block;"
                             class="dropdown-content"> 
                            <c:if test="${sessionScope.account eq null}">
                                <a href="login" style="border-radius: 15px;">
                                    <div>
                                        <i style="width: 20px;" class="fas fa-user"></i>&nbsp; &leftrightharpoons;
                                        <span style="font-size: 10px;">Đăng nhập</span>
                                    </div>
                                </a>
                                <a href="signin" style="border-radius: 15px;">
                                    <div>

                                        <i style="width: 20px;" class="fas fa-user-edit"></i>&nbsp; &leftrightharpoons;
                                        <span style="font-size: 10px;">Đăng ký</span>

                                    </div>
                                </a>
                            </c:if>
                            <c:if test="${!(sessionScope.account eq null)}">
                                <c:if test="${sessionScope.account.role.id eq 3 }">
                                    <h6 style="margin-top: 10px;text-align: center; font-size: 12px">
                                        Xin chào ${sessionScope.account.name} !
                                    </h6>
                                    <a href="profile" style="border-radius: 15px;">
                                        <div>
                                            <i style="width: 20px;" class="fas fa-user"></i>&nbsp; &leftrightharpoons;
                                            <span style="font-size: 10px;">Thông tin cá nhân</span>
                                        </div>
                                    </a>
                                    <a href="profile?op=1" style="border-radius: 15px;">
                                        <div>
                                            <i style="width: 20px;" class="fas fa-cart-plus"></i></i>&nbsp; &leftrightharpoons;
                                            <span style="font-size: 10px;">Đơn hàng của tôi</span>
                                        </div>
                                    </a>
                                    <a href="logout" style="border-radius: 15px;">
                                        <div>
                                            <i style="width: 20px;" class="fas fa-sign-out-alt"></i>&nbsp; &leftrightharpoons;
                                            <span style="font-size: 10px;">Đăng xuất</span>
                                        </div>
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.account.role.id eq 1 }">
                                    <h6 style="margin-top: 10px;text-align: center; font-size: 12px">
                                        Xin chào ${sessionScope.account.name} !
                                    </h6>
                                    <a href="productmanager" style="border-radius: 15px;">
                                        <div>
                                            <i style="width: 20px;" class="fas fa-user"></i>&nbsp; &leftrightharpoons;
                                            <span style="font-size: 10px;">Dashboard</span>
                                        </div>
                                    </a>
                                    <a href="logout" style="border-radius: 15px;">
                                        <div>
                                            <i style="width: 20px;" class="fas fa-sign-out-alt"></i>&nbsp; &leftrightharpoons;
                                            <span style="font-size: 10px;">Đăng xuất</span>
                                        </div>
                                    </a>
                                </c:if>
                            </c:if>
                        </div>
                    </div>

                    <button class="but-Header" style="background-color: #000000;">
                        <a href="buy" style="color: white; text-decoration: none;">
                            <i class="fas fa-shopping-cart fa-sm"></i>
                            <span style="font-size: 14px;"> Giỏ hàng (${sessionScope.size eq null ? "0" : sessionScope.size}) </span>
                        </a>
                    </button>
                </div>

            </div>
        </header>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
    </body>

</html>