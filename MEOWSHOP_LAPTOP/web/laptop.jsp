<%-- Document : list Created on : Oct 25, 2024, 10:43:01 PM Author : MSII --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Laptop</title>
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
        body {
            margin: 0px;
            padding: 0px;
            font-family: Arial, sans-serif;
            background-color: whitesmoke;
        }

        .card-icon {
            display: flex;
            flex-direction: column;
            gap: 5px;
            justify-content: center;
            align-items: center;
        }

        .container-content {
            width: 900px;
            /* Đặt độ rộng cố định là 800px */
            margin: 0 auto;
            /* Căn giữa phần tử body theo chiều ngang */
            padding: 0;
        }

        .br {
            text-align: center;
        }

        .item:hover .br {
            color: black; /* Thay "red" bằng màu bạn muốn */
            font-weight: bold;
        }

        .owl-carousel.ver1 .owl-nav button.owl-prev {
            position: absolute;
            left: -14px;
            /* Đặt vị trí bên trái ngoài cùng */
            top: 4%;
            transform: translateY(-40%);
        }

        .owl-carousel.ver1 .owl-nav button.owl-next {
            position: absolute;
            right: 5px;
            /* Đặt vị trí bên phải ngoài cùng */
            top: 4%;
            transform: translateY(-40%);
        }

        .owl-carousel.ver2 .owl-nav button.owl-prev {
            position: absolute;
            left: -15px;
            /* Đặt vị trí bên trái ngoài cùng */
            top: 40%;
            transform: translateY(-50%);
        }

        .owl-carousel.ver2 .owl-nav button.owl-next {
            position: absolute;
            right: -15px;
            /* Đặt vị trí bên phải ngoài cùng */
            top: 40%;
            transform: translateY(-50%);
        }

        .owl-carousel.sale .owl-nav button.owl-prev {
            position: absolute;
            left: -25px;
            /* Đặt vị trí bên trái ngoài cùng */
            top: 40%;
            transform: translateY(-50%);
        }

        .owl-carousel.sale .owl-nav button.owl-next {
            position: absolute;
            right: -25px;
            /* Đặt vị trí bên phải ngoài cùng */
            top: 40%;
            transform: translateY(-50%);
        }

        .owl-carousel.ver3 .owl-nav button.owl-prev {
            position: absolute;
            left: -16px;
            /* Đặt vị trí bên trái ngoài cùng */
            top: 45%;
            transform: translateY(-50%);
        }

        .owl-carousel.ver3 .owl-nav button.owl-next {
            position: absolute;
            right: -16px;
            /* Đặt vị trí bên phải ngoài cùng */
            top: 45%;
            transform: translateY(-50%);
        }

        /* Thay đổi kích thước hoặc kiểu cho mũi tên */
        .owl-carousel .owl-nav button.owl-prev i,
        .owl-carousel .owl-nav button.owl-next i {
            font-size: 12px;
            /* Kích thước biểu tượng mũi tên */
        }

        .brand-container {
            transition: transform 0.3s ease-in-out;
        }

        .brand-logo {
            transition: transform 0.3s ease-in-out;
        }

        /* Hiệu ứng zoom khi hover vào thẻ div chứa ảnh */
        .brand-container:hover .brand-logo {
            transform: scale(1.1);
            /* Phóng to ảnh lên 10% */
        }
        /* .owl-carousel .owl-item img {
        display: block;
        width: 100%;
    } */
    </style>

    <body style="background-color: whitesmoke;">

        <div>
            <%@include file="header.jsp" %>
        </div>
        <div class="container-content">
            <div style="margin-top: 15px">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb" style="font-size: 12px;">
                        <li class="breadcrumb-item"><a style="text-decoration: none" class="brea" href="home">Trang chủ</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Laptop</li>
                    </ol>
                </nav>
            </div>
            <div style="display: flex;">
                <div style="width: 75%;">
                    <div style="margin-top: 10px;">
                        <h3 style="font-weight: bold;">Laptop</h3>
                    </div>
                    <div style="margin-top: 35px;">
                        <div style="border-radius: 15px;
                             margin: 0 auto;
                             height: 12px;">
                            <div class="owl-carousel owl-theme ver1" style="margin-top: 10px;">
                                <c:forEach items="${requestScope.brandList}" var="b">
                                    <div class="item">
                                        <a style="text-decoration: none; color: black;" href="laptoplist?brand=${b.id}">
                                            <div class="br" style="font-size: 12px">${b.name}</div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
                <div style="width: 25%;">
                    <img width="100%" src="images/list_img/logo.png" alt="">
                </div>
            </div>

            <!-- CATRGORY BRAND -->
            <div style="border-radius: 15px;
                 margin: 0 auto;">
                <div class="owl-carousel owl-theme ver2" style="margin-top: 10px;">
                    <c:forEach items="${requestScope.brandList}" var="b">
                        <div class="item brand-container"
                             style="height: 70px ;
                             border-radius: 15px;
                             background-color: white;
                             display: flex;
                             justify-content: space-between;
                             align-items: center;">
                            <div style="display: flex;
                                 align-items: center;">
                                <div style="margin-left: 10px;
                                     width: 30%;">
                                    <a style="text-decoration: none; color: black;" href="laptoplist?brand=${b.id}">
                                        <img src="${b.logo}" alt="">
                                    </a>
                                </div>
                                <div style="margin-left: 5px;
                                     margin-top: 5px;">
                                    <a style="text-decoration: none; color: black;" href="laptoplist?brand=${b.id}">
                                        <h5 style="font-size: 12px;">${b.name}</h5>
                                    </a>
                                </div>
                            </div>
                            <div style="width: 30%;
                                 margin-right: 10px;">
                                <a style="text-decoration: none; color: black;" href="laptoplist?brand=${b.id}">
                                    <img class="brand-logo" src="${b.image}" alt="">
                                </a>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </div>

            <!-- Quang cao -->
            <div>
                <div class="owl-carousel owl-theme ver3" style="margin-top:25px;">
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner1.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner2.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner3.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner4.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner5.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner6.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner7.png" alt="">
                    </div>
                    <div class="item">
                        <img style="border-radius: 20px;" src="images/list_img/banner8.png" alt="">
                    </div>
                </div>
            </div>

            <!-- Mua online gia sieu ra -->
            <div style="margin-top: 30px;
                 border-radius: 15px;
                 background-color: white;
                 height: 420px;">
                <div style="display: flex;
                     justify-content: center;
                     align-items: center;
                     gap: 10px;">
                    <div>
                        <img src="images/list_img/khuyenmaiHot.png" alt="">
                    </div>
                    <div>
                        <h4 style="text-align: center;
                            padding-top: 10px;
                            font-weight: bold;">
                            Khuyến mãi hot 
                        </h4>
                    </div>
                </div>
                <div style="border-radius: 15px;
                     margin: 0 auto;
                     width: 98%;">
                    <div class="owl-carousel owl-theme sale" style="margin-top: 10px;">
                        <c:forEach items="${requestScope.saleList}" var="p">
                            <div class="item">
                                <div class="card">
                                    <div class="row brand-container"
                                         style="display: flex;
                                         justify-content: center;
                                         align-items: center;height: 205px">

                                        <div class="col-8">
                                            <a href="product?productID=${p.id}" style="text-decoration: none; color: black;">
                                                <div>
                                                    <img class="brand-logo" src="${p.imageLaptop}" class="card-img-top"
                                                         alt="...">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;
                                                        font-size: 10px;
                                                        font-weight: bold;">
                                                        ${p.name}
                                                    </h6>
                                                </div>
                                            </a>
                                        </div>
                                        <div style="margin-top: 10px;" class="col-4">
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6;
                                                    height: 30px;
                                                    width: 30px;
                                                    border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/graphic.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;
                                                        font-size: 10px;">Chip ${p.cpu}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6;
                                                    height: 30px;
                                                    width: 30px;
                                                    border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/ram.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;
                                                        font-size: 10px;"> RAM ${p.ram}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6;
                                                    height: 30px;
                                                    width: 30px;
                                                    border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/chip.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;
                                                        font-size: 10px;">${p.graphics}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div style="padding-top: 0px;
                                         padding-left: 5px;
                                         padding-right: 5px;" class="card-body">
                                        <div>
                                            <p
                                                style="margin-bottom: 10px;
                                                width: 100%;
                                                text-align: center;
                                                font-weight: bold;
                                                background-color: #ef4444;
                                                border-radius: 15px;
                                                color: white;
                                                font-size: 10px;">
                                                <span><i class="fas fa-fire fa-lg"
                                                         style="color: #FFD43B;"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;Còn lại
                                                ${p.quantity} chiếc
                                            </p>
                                            <p
                                                style="margin-bottom: 5px;
                                                width: 40%;
                                                text-align: center;
                                                color: gray;
                                                background-color: gainsboro;
                                                border-radius: 15px;
                                                font-size: 10px;
                                                font-weight: bold;">
                                                Trả góp 0%</p>
                                            <span class="price" style="margin-bottom: 10px;
                                                  text-decoration: line-through;
                                                  color: gray;
                                                  font-size: 10px;
                                                  font-weight: bold;">${p.price}</span><span style="margin-bottom: 10px;
                                                  text-decoration: line-through;
                                                  color: gray;
                                                  font-size: 10px;
                                                  font-weight: bold;">₫</span>
                                            <span style="color: red;
                                                  margin-left: 5px;
                                                  font-size: 10px;">-${p.discount}%</span>
                                            <div style="display: flex;
                                                 justify-content: flex-start;
                                                 align-items: center;">
                                                <div class="price" style="font-weight: bold;
                                                     color: black;
                                                     font-size: 18px;">${p.price - p.discountAmount} 
                                                </div><span style="font-weight: bold;
                                                            color: black;
                                                            font-size: 18px;">₫</span>&nbsp;&nbsp;
                                                <span style="color: green;
                                                      font-size: 12px;">-</span><div class="price" style="color: green;
                                                      font-size: 12px;">${p.discountAmount}</div><span style="color: green;
                                                      font-size: 12px;">₫</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- HET MUA ONLINE GIA SIEU RE -->
            <!-- Nhu cau  -->
            <div style="margin-top: 30px;
                 display: flex;
                 justify-content: space-between;">
                <c:forEach items="${requestScope.commandList}" var="c">
                    <div class="brand-container" style="height: 65px;
                         width: 19%;
                         display: flex;
                         background: white;
                         border-radius: 15px;
                         justify-content: space-around;
                         align-items: center">
                        <div>
                            <img class="brand-logo" width="50px" src="${c.image}" alt="alt"/>
                        </div>
                        <div>
                            <h6 style="font-size: 12px">${c.name}</h6>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- Show san pham -->
            <div class="row" style="margin-top: 30px">
                <div class="col-3" style="background-color: white;
                     height: fit-content;
                     border-radius: 20px;">
                    <form>
                        <div style="margin-top: 15px;
                             text-align: center;
                             font-size: 15px;
                             font-weight: bold;">
                            <i class="fas fa-sort-amount-down"></i> Bộ lọc tìm kiếm
                        </div>
                        <hr>
                        <div style="margin-left: 10px">
                            <h6>Hãng sản xuất</h6>
                            <input type="radio" ${requestScope.brandId == "0" ? "checked" : ""} name="brand" value="${0}">&nbsp;&nbsp;<span style="font-size: 12px;">All</span><br>
                            <c:forEach items="${requestScope.brandList}" var = "b">
                                <input type="radio" ${requestScope.brandId == b.id + "" ? "checked" : ""} name="brand" value="${b.id}">&nbsp;&nbsp;<span style="font-size: 12px;">${b.name}</span><br>
                            </c:forEach>
                        </div>
                        <hr>
                        <div style="margin-left: 10px">
                            <h6>Mức giá</h6>
                            <input type="radio" ${requestScope.priceId == "0" ? "checked" : ""} name="price" value="${0}">&nbsp;&nbsp;<span style="font-size: 12px;">All</span><br>
                            <c:set var="priceList" value="${requestScope.priceList}" />
                            <c:forEach begin="0" end="${priceList.size()-1}" var="i">
                                <input type="radio" ${requestScope.priceId == (i+1) + "" ? "checked" : ""}  name="price" value="${i+1}">&nbsp;&nbsp;<span style="font-size: 12px;">${priceList.get(i)}</span><br>
                            </c:forEach>
                        </div>
                        <hr>
                        <div style="margin-left: 10px">
                            <h6>Kích thước màn hình</h6>
                            <input type="radio" ${requestScope.screenId == "0" ? "checked" : ""} name="screen" value="${0}">&nbsp;&nbsp;<span style="font-size: 12px;">All</span><br>
                            <c:set var="priceList" value="${requestScope.sreenSize}" />
                            <c:forEach begin="0" end="${sreenSize.size()-1}" var="i">
                                <input type="radio" ${requestScope.screenId == (i+1) + "" ? "checked" : ""} name="screen" value="${i+1}">&nbsp;&nbsp;<span style="font-size: 12px;">${sreenSize.get(i)}</span><br>
                            </c:forEach>
                        </div>
                        <div style="margin-left: 85px;
                             margin-bottom: 10px;
                             margin-top: 10px">
                            <input type="submit" name="" value="Filter" />
                        </div>

                    </form>
                </div>
                <div class="col-9">
                    <div style="display: flex;
                         justify-content: space-between;">
                        <div style="font-size: 12px;">
                            Tìm thấy <span style="font-weight: bold;">${requestScope.total}</span> kết quả
                        </div>
                        <form action="laptop">
                            <div style="font-size: 12px;">Sắp xếp theo:
                                <!-- Thêm các input ẩn để giữ lại tham số bộ lọc -->
                                <input type="hidden" name="brand" value="${requestScope.brandId}" />
                                <input type="hidden" name="price" value="${requestScope.priceId}" />
                                <input type="hidden" name="screen" value="${requestScope.screenId}"/>
                                <select onchange="this.form.submit()" name="sort" style="margin-left: 10px;">
                                    <option ${requestScope.op == "0" ? "selected" : ""} value="0">Nổi bật</option>
                                    <option ${requestScope.op == "1" ? "selected" : ""} value="1">Giá thấp nhất</option>
                                    <option ${requestScope.op == "2" ? "selected" : ""} value="2">Giá cao nhất</option>
                                    <option ${requestScope.op == "3" ? "selected" : ""} value="3">Sản phẩm mới nhất</option>
                                    <option ${requestScope.op == "4" ? "selected" : ""} value="4">Sản phẩm cũ hơn</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <c:if test="${requestScope.total == 0}">
                        <div style="display: flex;
                             justify-content: center;
                             flex-direction: column;
                             align-items: center">
                            <div>
                                <img src="images/product/empty.png" alt="alt"/>
                            </div>
                            <h6 style="text-align: center;">Rất tiếc, chúng tôi không tìm thấy sản phẩm nào phù hợp.</h6>
                        </div>
                    </c:if>
                    <c:if test="${requestScope.total != 0}">
                        <div style="display: flex;
                             flex-wrap: wrap;">
                            <c:forEach items="${requestScope.productList}" var="p">
                                <div class="col-3">
                                    <div class="card">
                                        <div class="row brand-container"
                                             style="display: flex;
                                             justify-content: center;
                                             align-items: center;
                                             margin-left: 0px;height: 255px;">
                                            <div class="col-8">
                                                <a href="product?productID=${p.id}" style="text-decoration: none; color: black;">
                                                    <div>
                                                        <img width="100%" class="brand-logo" src="${p.imageLaptop}" class="card-img-top"
                                                             alt="...">
                                                    </div>
                                                    <div>
                                                        <h6 style="text-align: center;
                                                            font-size: 10px;
                                                            font-weight: bold;">
                                                            ${p.name}
                                                        </h6>
                                                    </div>
                                                </a>
                                            </div>
                                            <div style="margin-top: 10px;padding-left: 3px;" class="col-4">
                                                <div class="card-icon">
                                                    <div
                                                        style="background-color: #f3f4f6;
                                                        height: 30px;
                                                        width: 30px;
                                                        border-radius: 100%;">
                                                        <img style="padding-top: 2px;
                                                             padding-left: 7px" height="23px" width="23px"
                                                             src="images/graphic.svg" alt="">
                                                    </div>
                                                    <div>
                                                        <h6 style="text-align: center;
                                                            font-size: 10px;">Chip ${p.cpu}</h6>
                                                    </div>
                                                </div>
                                                <div class="card-icon">
                                                    <div
                                                        style="background-color: #f3f4f6;
                                                        height: 30px;
                                                        width: 30px;
                                                        border-radius: 100%;">
                                                        <img style="padding-top: 2px;
                                                             padding-left: 7px" height="23px" width="23px"
                                                             src="images/ram.svg" alt="">
                                                    </div>
                                                    <div>
                                                        <h6 style="text-align: center;
                                                            font-size: 10px;"> RAM ${p.ram}</h6>
                                                    </div>
                                                </div>
                                                <div class="card-icon">
                                                    <div
                                                        style="background-color: #f3f4f6;
                                                        height: 30px;
                                                        width: 30px;
                                                        border-radius: 100%;">
                                                        <img style="padding-top: 2px;
                                                             padding-left: 7px" height="23px" width="23px"
                                                             src="images/chip.svg" alt="">
                                                    </div>
                                                    <div>
                                                        <h6 style="text-align: center;
                                                            font-size: 10px;">${p.graphics}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="padding-top: 0px;
                                             padding-left: 5px;
                                             padding-right: 5px;" class="card-body">
                                            <div>
                                                <p
                                                    style="margin-bottom: 5px;
                                                    width: 40%;
                                                    text-align: center;
                                                    color: gray;
                                                    background-color: gainsboro;
                                                    border-radius: 15px;
                                                    font-size: 10px;
                                                    font-weight: bold;">
                                                    Trả góp 0%</p>
                                                <span class="price" style="margin-bottom: 10px;
                                                      text-decoration: line-through;
                                                      color: gray;
                                                      font-size: 10px;
                                                      font-weight: bold;">${p.price}</span><span style="margin-bottom: 10px;
                                                      text-decoration: line-through;
                                                      color: gray;
                                                      font-size: 10px;
                                                      font-weight: bold;">₫</span>
                                                <span style="color: red;
                                                      margin-left: 5px;
                                                      font-size: 10px;">-${p.discount}%</span>
                                                <div style="display: flex;
                                                     justify-content: flex-start;
                                                     align-items: center;">
                                                    <div class="price" style="font-weight: bold;
                                                         color: black;
                                                         font-size: 15px;">${p.price - p.discountAmount} 
                                                    </div><span style="font-weight: bold;
                                                                color: black;
                                                                font-size: 15px;">₫</span>&nbsp;&nbsp;
                                                </div>
                                                <div style="display: flex;
                                                     justify-content: flex-start;
                                                     align-items: center;">
                                                    <span style="color: green;
                                                          font-size: 12px;">Giảm&nbsp;</span><div class="price" style="color: green;
                                                          font-size: 12px;">${p.discountAmount}</div><span style="color: green;
                                                          font-size: 12px;">₫</span>
                                                </div>
                                                <p style="font-size: 12px;
                                                   margin-bottom: 0px">${p.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <c:set var="page" value="${requestScope.page}"/>
                        <div style="margin-left: 215px;margin-top: 20px;">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="laptop?page=${page-1 == 0 ? requestScope.num : (page -1)}&brand=${requestScope.brandId}&price=${requestScope.priceId}&screen=${requestScope.screenId}&sort=${requestScope.op}">Previous</a></li>
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                        <li class="page-item">
                                            <a class="page-link" style="${page == i ? "background: whitesmoke;":"" }" href="laptop?page=${i}&brand=${requestScope.brandId}&price=${requestScope.priceId}&screen=${requestScope.screenId}&sort=${requestScope.op}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="laptop?page=${page+1 == (requestScope.num + 1) ? 1 : (page + 1)}&brand=${requestScope.brandId}&price=${requestScope.priceId}&screen=${requestScope.screenId}&sort=${requestScope.op}">Next</a></li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div>
            <%@include file="footer.jsp" %>
        </div>


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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

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

        <script>
            $(document).ready(function () {
                $(".owl-carousel.sale").owlCarousel({
                    loop: false,
                    margin: 10,
                    nav: true,
                    dots: false, // Tắt các dấu chấm tròn điều hướng
                    items: 4, // Số lượng sản phẩm hiển thị mỗi lần
                    slideBy: 1, // Số sản phẩm di chuyển mỗi lần
                    navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 4
                        },
                        1000: {
                            items: 4
                        }
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $(".owl-carousel.ver1").owlCarousel({
                    loop: false,
                    margin: 10,
                    nav: true,
                    dots: false, // Tắt các dấu chấm tròn điều hướng
                    items: 4, // Số lượng sản phẩm hiển thị mỗi lần
                    slideBy: 1, // Số sản phẩm di chuyển mỗi lần
                    navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 7
                        },
                        1000: {
                            items: 7
                        }
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $(".owl-carousel.ver2").owlCarousel({
                    loop: false,
                    margin: 10,
                    nav: true,
                    dots: false, // Tắt các dấu chấm tròn điều hướng
                    items: 4, // Số lượng sản phẩm hiển thị mỗi lần
                    slideBy: 1, // Số sản phẩm di chuyển mỗi lần
                    navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 4
                        },
                        1000: {
                            items: 4
                        }
                    }
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $(".owl-carousel.ver3").owlCarousel({
                    loop: false,
                    margin: 10,
                    nav: true,
                    dots: false, // Tắt các dấu chấm tròn điều hướng
                    items: 1, // Số lượng sản phẩm hiển thị mỗi lần
                    slideBy: 1, // Số sản phẩm di chuyển mỗi lần
                    navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1
                        }
                    }
                });
            });
        </script>
    </body>

</html>