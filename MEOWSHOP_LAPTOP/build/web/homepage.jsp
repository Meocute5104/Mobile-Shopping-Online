<%-- 
    Document   : homepage
    Created on : Oct 16, 2024, 1:13:48 PM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT Meow Shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

        <style>
            body {
                margin: 0px;
                padding: 0px;
                font-family: Arial, sans-serif;
            }

            .card-icon {
                display: flex;
                flex-direction: column;
                gap: 5px;
                justify-content: center;
                align-items: center;
            }

            #bgHome {
                margin: 0;
                padding: 0;
                height: 525px;
                background-image: url('images/bgHome.png');
                /* Thay 'your-image.jpg' bằng đường dẫn đến ảnh của bạn */
                background-size: cover;
                /* Tự động điều chỉnh kích thước hình ảnh để bao phủ toàn bộ màn hình */
                background-position: center;
                /* Đặt hình ảnh ở giữa */
                background-repeat: no-repeat;
                /* Không lặp lại hình ảnh */
            }

            .container-content {
                width: 900px;
                /* Đặt độ rộng cố định là 800px */
                margin: 0 auto;
                /* Căn giữa phần tử body theo chiều ngang */
                padding: 0;
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

            /* Đặt vị trí mũi tên trái bên ngoài cùng */
            .owl-carousel .owl-nav button.owl-prev {
                position: absolute;
                left: -10px;
                /* Đặt vị trí bên trái ngoài cùng */
                top: 40%;
                transform: translateY(-50%);
                color: #fff;
                /* Màu chữ cho mũi tên */
                border: none;
                padding: 10px;
                border-radius: 50%;
            }

            /* Đặt vị trí mũi tên phải bên ngoài cùng */
            .owl-carousel .owl-nav button.owl-next {
                position: absolute;
                right: -10px;
                /* Đặt vị trí bên phải ngoài cùng */
                top: 40%;
                transform: translateY(-50%);
                color: #fff;
                border: none;
                padding: 10px;
                border-radius: 50%;
            }

            /* Thay đổi kích thước hoặc kiểu cho mũi tên */
            .owl-carousel .owl-nav button.owl-prev i,
            .owl-carousel .owl-nav button.owl-next i {
                font-size: 20px;
                /* Kích thước biểu tượng mũi tên */
            }
        </style>
    </head>

    <body style="background-color: whitesmoke">
        <div>
            <%@include file="header.jsp" %>
        </div>

        <div id="bgHome">
            <!---------------- BRAND LON ---------------------------->
            <div class="container-content">

                <div style="padding-top: 20px; width: 100%; margin: 0 auto;" id="carouselExampleDark"
                     class="carousel carousel-dark slide" data-bs-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="2000">
                            <img src="images/bannerHome.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="images/bannerHome.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="images/bannerHome.png" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <!------------------- BRAND NHO -------------------------->
                <div style=" padding-top: 10px; width: 100%; margin: 0 auto;" id="carouselExampleIndicators"
                     class="carousel slide" data-bs-ride="carousel">

                    <div class="carousel-inner">
                        <!-- Slide 1 -->
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan1.png" class="d-block w-100"
                                         alt="Image 1">
                                </div>
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan2.png" class="d-block w-100"
                                         alt="Image 2">
                                </div>
                            </div>
                        </div>

                        <!-- Slide 2 -->
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan3.png" class="d-block w-100"
                                         alt="Image 1">
                                </div>
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan4.png" class="d-block w-100"
                                         alt="Image 2">
                                </div>
                            </div>
                        </div>

                        <!-- Slide 3 -->
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan5.png" class="d-block w-100"
                                         alt="Image 1">
                                </div>
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan6.png" class="d-block w-100"
                                         alt="Image 2">
                                </div>
                            </div>
                        </div>

                        <!-- Slide 4 -->
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan7.png" class="d-block w-100"
                                         alt="Image 1">
                                </div>
                                <div class="col-6">
                                    <img style="border-radius: 20px;" src="images/smallBan8.png" class="d-block w-100"
                                         alt="Image 2">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Carousel controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="container-content">
            <!-------------------- DANH MUC BRAND ------------------------>
            <div>
                <div style="padding-top: 100px; margin: 0 auto; display: flex; justify-content: space-between;">
                    <div class="brand-container"
                         style="border-radius: 20px; background-color: white; height: 170px; width: 170px; ">
                        <a href="laptop" style="text-decoration: none; color: black;">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Laptop</h6>
                                <div style="margin-left: 30px; margin-top: 25px;">
                                    <img class="brand-logo" width="75%" src="images/logoLaptop.jpg" alt="">

                                </div>
                            </div>
                        </a>
                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=2" class="brand-container"
                           style="text-decoration: none; color: black; display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Acer</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoAcer.jpg" alt="">
                            </div>
                        </a>

                        <a href="laptoplist?brand=3" class="brand-container"
                           style="text-decoration: none; color: black; display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Asus</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoAsus.jpg" alt="">
                            </div>
                        </a>

                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=4" class="brand-container"
                           style="text-decoration: none; color: black; display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Dell</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoDell.png" alt="">
                            </div>
                        </a>

                        <a href="laptoplist?brand=5" class="brand-container"
                           style="text-decoration: none; color: black; display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Gigabyte</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoGigabyte.png" alt="">
                            </div>
                        </a>

                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=6" class="brand-container"
                           style="text-decoration: none; color: black; display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Huawei</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoHuawei.jpg" alt="">
                            </div>
                        </a>

                        <a href="laptoplist?brand=7" class="brand-container"
                           style="text-decoration: none; color: black; display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">MSI</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoMSI.jpg" alt="">
                            </div>
                        </a>

                    </div>
                    <div class="brand-container"
                         style="border-radius: 20px; background-color: white; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=1" style="text-decoration: none; color: black;">
                            <h6 style="margin-left: 15px; margin-top: 15px;">MacBook</h6>
                            <div style="margin-left: 30px; margin-top: 25px;">
                                <img class="brand-logo" width="75%" src="images/logoMacbook.jpg" alt="">
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Giam Soc San Than toc // Danh cho nhung san pham co discount khung -->
            <div style="margin-top: 30px; border-radius: 15px; background-color: #f9d2d9; height: 545px;">
                <img style="border-radius: 15px;" width="100%" src="images/sanThantoc.png" alt="">
                <div style="border-radius: 15px; margin: 0 auto; background-color: white; height: 448px; width: 98%;">
                    <div
                        style="padding-top: 10px; padding-bottom: 3px; background-color: #fadcdc; border-top-right-radius: 15px; border-top-left-radius: 15px; border-bottom: #e4343f solid;">
                        <h6 style="text-align: center; color: red;"><strong>Đang diễn ra: </strong><i
                                class="far fa-calendar-alt" style="color: #ff0000;"></i> <span id="currentDate"
                                style="font-weight: bold;text-align: center; font-size: 16px; margin-top: 5px;"></span>
                        </h6>
                        <h6 style="text-align: center; "><strong>Thời gian còn lại: </strong><i class="far fa-clock"
                                                                                                style="color: #ff0011;"></i> <span id="countdown"
                                                                                                style="text-align: center; font-size: 20px; margin-top: 10px;font-weight: bold;">
                            </span></h6>
                    </div>

                    <div class="owl-carousel owl-theme ver1" style="margin-top: 10px;">
                        <c:forEach items="${requestScope.saleList}" var="p">
                            <div class="item">
                                <div class="card">
                                    <div class="row brand-container"
                                         style="display: flex; justify-content: center; align-items: center; height: 205px;">
                                        <div class="col-8">
                                            <a href="product?productID=${p.id}" style="text-decoration: none; color: black;">
                                                <div>
                                                    <img class="brand-logo" src="${p.imageLaptop}" class="card-img-top"
                                                         alt="...">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;font-size: 10px; font-weight: bold;">
                                                        ${p.name}
                                                    </h6>
                                                </div>
                                            </a>
                                        </div>
                                        <div style="margin-top: 10px;" class="col-4">
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/graphic.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;">Chip ${p.cpu}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/ram.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;"> RAM ${p.ram}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/chip.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;">${p.graphics}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div style="padding-top: 0px; padding-left: 5px; padding-right: 5px;" class="card-body">
                                        <div>
                                            <p
                                                style="margin-bottom: 10px; width: 100%; text-align: center;font-weight: bold; background-color: #ef4444; border-radius: 15px; color: white; font-size: 10px;">
                                                <span><i class="fas fa-fire fa-lg"
                                                         style="color: #FFD43B;"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;Còn lại
                                                ${p.quantity} chiếc
                                            </p>
                                            <p
                                                style="margin-bottom: 5px; width: 40%; text-align: center; color: gray; background-color: gainsboro; border-radius: 15px; font-size: 10px; font-weight: bold;">
                                                Trả góp 0%</p>
                                            <span class="price" style="margin-bottom: 10px; text-decoration: line-through; color: gray; font-size: 10px; font-weight: bold;">${p.price}</span><span style="margin-bottom: 10px; text-decoration: line-through; color: gray; font-size: 10px; font-weight: bold;">₫</span>
                                            <span style="color: red; margin-left: 5px; font-size: 10px;">-${p.discount}%</span>
                                            <div style="display: flex; justify-content: flex-start; align-items: center;">
                                                <div class="price" style="font-weight: bold; color: black; font-size: 18px;">${p.price - p.discountAmount} 
                                                </div><span style="font-weight: bold; color: black; font-size: 18px;">₫</span>&nbsp;&nbsp;
                                                <span style="color: green; font-size: 12px;">-</span><div class="price" style="color: green; font-size: 12px;">${p.discountAmount}</div><span style="color: green; font-size: 12px;">₫</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- HET GIAM GIA THAN TOC -->
            <!-- QUANG CAO -->
            <!------------------- QUANG CAO NHO -------------------------->
            <div style="padding-top: 30px; width: 100%; margin: 0 auto;" id="carouselExample2" class="carousel slide"
                 data-bs-ride="carousel">
                <div class="carousel-inner">
                    <!-- Slide 1 -->
                    <div class="carousel-item active">
                        <div class="row">
                            <div style="margin-top: 10px;" class="col-4">
                                <img style="border-radius: 20px;" src="images/quangCao1.png" class="d-block w-100"
                                     alt="Image 1">
                            </div>
                            <div style="margin-top: 10px;" class="col-4">
                                <img style="border-radius: 20px;" src="images/quangCao2.png" class="d-block w-100"
                                     alt="Image 2">
                            </div>
                            <div style="margin-top: 10px;" class="col-4">
                                <img style="border-radius: 20px;" src="images/quangCao3.png" class="d-block w-100"
                                     alt="Image 1">
                            </div>
                        </div>
                    </div>

                    <!-- Slide 2 -->
                    <div class="carousel-item">
                        <div class="row">
                            <div style="margin-top: 10px;" class="col-4">
                                <img style="border-radius: 20px;" src="images/quangCao4.png" class="d-block w-100"
                                     alt="Image 1">
                            </div>
                            <div style="margin-top: 10px;" class="col-4">
                                <img style="border-radius: 20px;" src="images/quangCao5.png" class="d-block w-100"
                                     alt="Image 2">
                            </div>
                            <div style="margin-top: 10px;" class="col-4">
                                <img style="border-radius: 20px;" src="images/quangCao6.png" class="d-block w-100"
                                     alt="Image 1">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Carousel controls -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample2"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample2"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!-- HET QUAG CAO -->

            <!-------------------- DANH MUC BRAND ------------------------>
            <div>
                <div style="padding-top: 30px; margin: 0 auto; display: flex; justify-content: space-between;">
                    <div class="brand-container"
                         style="border-radius: 20px; background-color: white; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=8" style="text-decoration: none; color: black;">
                            <h6 style="margin-left: 15px; margin-top: 15px;">Lenovo</h6>
                            <div style="margin-left: 30px; margin-top: 25px;">
                                <img class="brand-logo" width="75%" src="images/logoLenovo.jpg" alt="">
                            </div>
                        </a>
                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=9" class="brand-container"
                           style="text-decoration: none; color: black;display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Vaio</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoVaio.jpg" alt="">
                            </div>
                        </a>

                        <a href="laptoplist?brand=7" class="brand-container"
                           style="text-decoration: none; color: black;display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">HP</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoHp.png" alt="">
                            </div>
                        </a>

                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=10" class="brand-container"
                           style="text-decoration: none; color: black;display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Laptop AI</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoLaptopAI.png" alt="">
                            </div>
                        </a>

                        <a href="laptoplist?brand=7" class="brand-container"
                           style="text-decoration: none; color: black;display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Doanh nhân</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoLaptopDoanhNhan.jpg" alt="">
                            </div>
                        </a>

                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=7" class="brand-container"
                           style="text-decoration: none; color: black;display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Mỏng nhẹ</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoLaptopMongNhe.jpg" alt="">
                            </div>
                        </a>

                        <a href="laptoplist?brand=7" class="brand-container"
                           style="text-decoration: none; color: black;display: flex; justify-content: space-between; border-radius: 20px; background-color: white; height: 80px; width: 170px; ">
                            <div>
                                <h6 style="margin-left: 15px; margin-top: 15px;">Sinh viên</h6>
                            </div>
                            <div style="margin-right: 15px;">
                                <img class="brand-logo" height="75px" src="images/logoLaptopSinhVien_VanPhong.jpg"
                                     alt="">
                            </div>
                        </a>

                    </div>
                    <div class="brand-container"
                         style="border-radius: 20px; background-color: white; height: 170px; width: 170px; ">
                        <a href="laptoplist?brand=8" style="text-decoration: none; color: black;">

                            <h6 style="margin-left: 15px; margin-top: 15px;">Gaming - Đồ Họa</h6>
                            <div style="margin-left: 30px; margin-top: 25px;">
                                <img class="brand-logo" width="75%" src="images/logoLaptopGaming.jpg" alt="">
                            </div>
                        </a>
                    </div>
                </div>
            </div>


            <!-- Mua online gia sieu ra -->
            <div
                style="margin-top: 30px; border-radius: 15px; background-color: pink; height: 410px;">
                <h4 style="text-align: center; padding-top: 10px; font-weight: bold;">
                    <span><i class="fas fa-shopping-bag" style="color: #fae9e9;"></i></span>&nbsp;Mua Online giá siêu rẻ
                    &nbsp;<span><i class="fas fa-shopping-bag" style="color: #fae9e9;"></i></span>
                </h4>
                <div style="border-radius: 15px; margin: 0 auto; height: 300px; width: 98%;">
                    <div class="owl-carousel owl-theme ver1" style="margin-top: 10px;">
                        <c:forEach items="${requestScope.cheapList}" var="p">
                            <div class="item">
                                <div class="card">
                                    <div class="row brand-container"
                                         style="display: flex; justify-content: center; align-items: center; height: 205px">
                                        <div class="col-8">
                                            <a href="product?productID=${p.id}" style="text-decoration: none; color: black;">
                                                <div>
                                                    <img class="brand-logo" src="${p.imageLaptop}" class="card-img-top"
                                                         alt="...">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;font-size: 10px; font-weight: bold;">
                                                        ${p.name}
                                                    </h6>
                                                </div>
                                            </a>
                                        </div>
                                        <div style="margin-top: 10px;" class="col-4">
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/graphic.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;">Chip ${p.cpu}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/ram.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;"> RAM ${p.ram}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/chip.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;">${p.graphics}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div style="padding-top: 0px; padding-left: 5px; padding-right: 5px;" class="card-body">
                                        <div>
                                            <p
                                                style="margin-bottom: 10px; width: 100%; text-align: center;font-weight: bold; background-color: #ef4444; border-radius: 15px; color: white; font-size: 10px;">
                                                <span><i class="fas fa-fire fa-lg"
                                                         style="color: #FFD43B;"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;Còn lại
                                                ${p.quantity} chiếc
                                            </p>
                                            <p
                                                style="margin-bottom: 5px; width: 40%; text-align: center; color: gray; background-color: gainsboro; border-radius: 15px; font-size: 10px; font-weight: bold;">
                                                Trả góp 0%</p>
                                            <span class="price" style="margin-bottom: 10px; text-decoration: line-through; color: gray; font-size: 10px; font-weight: bold;">${p.price}</span><span style="margin-bottom: 10px; text-decoration: line-through; color: gray; font-size: 10px; font-weight: bold;">₫</span>
                                            <span style="color: red; margin-left: 5px; font-size: 10px;">-${p.discount}%</span>
                                            <div style="display: flex; justify-content: flex-start; align-items: center;">
                                                <div class="price" style="font-weight: bold; color: black; font-size: 18px;">${p.price - p.discountAmount} 
                                                </div><span style="font-weight: bold; color: black; font-size: 18px;">₫</span>&nbsp;&nbsp;
                                                <span style="color: green; font-size: 12px;">-</span><div class="price" style="color: green; font-size: 12px;">${p.discountAmount}</div><span style="color: green; font-size: 12px;">₫</span>
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
            <div style="margin-top: 30px;">
                <img style="border-radius: 20px;" width="100%" src="images/bg20_11.png" alt="">
            </div>

            <!-- QUY CO THOI THUONG -->
            <div style="margin-top: 30px; border-radius: 15px; background-color: white; height: 383px;">
                <h4 style="text-align: center; padding-top: 10px; font-weight: bold;">
                    <span><i class="fas fa-shopping-bag" style="color: #fae9e9;"></i></span>&nbsp;Quý cô thời thượng
                    &nbsp;<span><i class="fas fa-shopping-bag" style="color: #fae9e9;"></i></span>
                </h4>
                <div style="border-radius: 15px; margin: 0 auto; height: 300px; width: 98%;">
                    <div class="owl-carousel owl-theme ver1" style="margin-top: 10px;">
                        <c:forEach items="${requestScope.ladyList}" var="p">
                            <div class="item">
                                <div class="card">
                                    <div class="row brand-container"
                                         style="display: flex; justify-content: center; align-items: center;">
                                        <div class="col-8">
                                            <a href="product?productID=${p.id}" style="text-decoration: none; color: black;">
                                                <div>
                                                    <img class="brand-logo" src="${p.imageLaptop}" class="card-img-top"
                                                         alt="...">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center;font-size: 10px; font-weight: bold;">
                                                        ${p.name}
                                                    </h6>
                                                </div>
                                            </a>
                                        </div>
                                        <div style="margin-top: 10px;" class="col-4">
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/graphic.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;">Chip ${p.cpu}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/ram.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;"> RAM ${p.ram}</h6>
                                                </div>
                                            </div>
                                            <div class="card-icon">
                                                <div
                                                    style="background-color: #f3f4f6; height: 30px; width: 30px; border-radius: 100%;">
                                                    <img style="padding-top: 5px;" height="23px" width="23px"
                                                         src="images/chip.svg" alt="">
                                                </div>
                                                <div>
                                                    <h6 style="text-align: center; font-size: 10px;">${p.graphics}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div style="padding-top: 0px; padding-left: 5px; padding-right: 5px;" class="card-body">
                                        <div>
                                            <p
                                                style="margin-bottom: 10px; width: 100%; text-align: center;font-weight: bold; background-color: #ef4444; border-radius: 15px; color: white; font-size: 10px;">
                                                <span><i class="fas fa-fire fa-lg"
                                                         style="color: #FFD43B;"></i></span>&nbsp;&nbsp;&nbsp;&nbsp;Còn lại
                                                ${p.quantity} chiếc
                                            </p>
                                            <p
                                                style="margin-bottom: 5px; width: 40%; text-align: center; color: gray; background-color: gainsboro; border-radius: 15px; font-size: 10px; font-weight: bold;">
                                                Trả góp 0%</p>
                                            <span class="price" style="margin-bottom: 10px; text-decoration: line-through; color: gray; font-size: 10px; font-weight: bold;">${p.price}</span><span style="margin-bottom: 10px; text-decoration: line-through; color: gray; font-size: 10px; font-weight: bold;">₫</span>
                                            <span style="color: red; margin-left: 5px; font-size: 10px;">-${p.discount}%</span>
                                            <div style="display: flex; justify-content: flex-start; align-items: center;">
                                                <div class="price" style="font-weight: bold; color: black; font-size: 18px;">${p.price - p.discountAmount} 
                                                </div><span style="font-weight: bold; color: black; font-size: 18px;">₫</span>&nbsp;&nbsp;
                                                <span style="color: green; font-size: 12px;">-</span><div class="price" style="color: green; font-size: 12px;">${p.discountAmount}</div><span style="color: green; font-size: 12px;">₫</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                    </div>
                </div>
            </div>
            <!-- QUY CO THOI THUONG HET -->

            <!-- Chieu nang khong kho -->
            <div style="margin-top: 20px;">
                <h4 style="font-weight: bold;">Chiều nàng không khó</h4>
                <div style="margin-top: 20px;">
                    <a href="">
                        <img style="border-radius: 15px;" width="100%" src="images/chieuNang1.png" alt="">
                    </a>
                </div>
                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <div>
                        <a href="">
                            <img style="border-radius: 15px;" width="100%" src="images/chieuNang2.png" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img style="border-radius: 15px;" width="100%" src="images/chieuNang3.png" alt="">

                        </a>
                    </div>
                </div>
                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <div>
                        <a href="">
                            <img style="border-radius: 15px;" width="100%" src="images/chieuNang4.png" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img style="border-radius: 15px;" width="100%" src="images/chieuNang5.png" alt="">
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <img style="border-radius: 15px;" width="100%" src="images/chieuNang6.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <!-- HET CHIEU NANG KHONG KHO -->

            <!-- QUY CO THOI THUONG -->
            <div style="margin-top: 30px; border-radius: 15px; background-color: white; height: 180px;">
                <h4 style="padding-left: 10px ;padding-top: 10px; font-weight: bold;">
                    Ưu đãi thanh toán
                </h4>
                <div style="border-radius: 15px; margin: 0 auto; width: 98%;">
                    <div class="owl-carousel owl-theme ver2" style="margin-top: 10px;">
                        <div class="item">
                            <img style="border-radius: 15px;" src="images/Thanhtoan1.png" alt="">
                        </div>
                        <div class="item">
                            <img style="border-radius: 15px;" src="images/Thanhtoan2.png" alt="">
                        </div>
                        <div class="item">
                            <img style="border-radius: 15px;" src="images/Thanhtoan3.png" alt="">
                        </div>
                        <div class="item">
                            <img style="border-radius: 15px;" src="images/Thanhtoan4.png" alt="">
                        </div>
                        <div class="item">
                            <img style="border-radius: 15px;" src="images/Thanhtoan5.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <!-- QUY CO THOI THUONG HET -->
        </div>


        <div style="margin-top: 20px">
            <%@include file="footer.jsp" %>
        </div>


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
                $(".owl-carousel.ver2").owlCarousel({// Đúng tên class của Owl Carousel
                    loop: false,
                    margin: 10,
                    nav: true,
                    dots: false, // Tắt các dấu chấm tròn điều hướng
                    items: 3, // Hiển thị 3 ảnh mỗi lần
                    slideBy: 1, // Số ảnh di chuyển mỗi lần
                    navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
                    responsive: {
                        0: {
                            items: 1 // Hiển thị 1 ảnh khi màn hình nhỏ hơn 600px
                        },
                        600: {
                            items: 3 // Hiển thị 2 ảnh khi màn hình lớn hơn 600px
                        },
                        1000: {
                            items: 3 // Hiển thị 3 ảnh khi màn hình lớn hơn 1000px
                        }
                    }
                });
            });
        </script>

        <script>
            // Function to update the countdown timer
            function updateCountdown() {
                const countdownElement = document.getElementById('countdown');
                const now = new Date().getTime();
                const countdownTime = new Date(now + 12 * 60 * 60 * 1000).getTime(); // 12 hours from now

                const interval = setInterval(function () {
                    const currentTime = new Date().getTime();
                    const distance = countdownTime - currentTime;

                    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    countdownElement.innerHTML = hours + " : " + minutes + " : " + seconds;

                    if (distance < 0) {
                        clearInterval(interval);
                        countdownElement.innerHTML = "EXPIRED";
                    }
                }, 1000);
            }

            // Function to display the current date
            function displayCurrentDate() {
                const currentDateElement = document.getElementById('currentDate');
                const now = new Date();
                const options = {year: 'numeric', month: 'long', day: 'numeric'};
                currentDateElement.innerHTML = now.toLocaleDateString('vi-VN', options);
            }

            // Initialize the countdown and current date display
            updateCountdown();
            displayCurrentDate();
        </script>

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