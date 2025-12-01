<%-- 
    Document   : productdetail
    Created on : Oct 31, 2024, 2:41:42 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.p.name}</title>
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
        .container-content {
            width: 900px;
            /* Đặt độ rộng cố định là 800px */
            margin: 0 auto;
            /* Căn giữa phần tử body theo chiều ngang */
            padding: 0;
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

        /* Thay đổi kích thước hoặc kiểu cho mũi tên */
        .owl-carousel .owl-nav button.owl-prev i,
        .owl-carousel .owl-nav button.owl-next i {
            font-size: 12px;
            /* Kích thước biểu tượng mũi tên */
        }
        #content {
            overflow: hidden;
            max-height: 300px; /* Chiều cao tối đa khi nội dung bị thu gọn */
            transition: max-height 1s ease-out;
        }

        #content.expanded {
            max-height: fit-content; /* Chiều cao tối đa khi nội dung được mở rộng */
        }
    </style>
    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        <div class="container-content">
            <div style="margin-top: 15px">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb" style="font-size: 12px;">
                        <li class="breadcrumb-item"><a style="text-decoration: none" class="brea" href="home">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a style="text-decoration: none" class="brea" href="laptop">Laptop</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${requestScope.p.name}</li>
                    </ol>
                </nav>
            </div>
            <div style="margin-top: 40px;" class="row">
                <div class="col-7">
                    <div>
                        <div class="owl-carousel owl-theme ver3" style="margin-top:25px;">
                            <div style="width: 60%;margin-left: 100px;" class="item">
                                <img style="border-radius: 20px;" src="${requestScope.p.imageLaptop}" alt="">
                            </div>
                            <c:forEach items="${requestScope.listColor}" var="i">
                                <div style="width: 60%;margin-left: 100px;" class="item">
                                    <img src="${i.image}" alt="alt"/> 
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--Thong so noi bat-->
                    <div style="border: 1px gainsboro solid; border-radius: 5px;">
                        <h6 style="margin-left: 10px;margin-top: 10px;">Thông số nổi bật</h6>
                        <div style="margin: 20px 20px;display: flex; justify-content: space-between;
                             background: whitesmoke; border-radius: 10px;padding: 5px 5px;">
                            <div style="display: flex; flex-direction: column;
                                 justify-content: center; align-items: flex-start;">
                                <p style="font-size: 10px; margin: 0;">CPU</p>
                                <h6 style="font-size: 12px;">Chip ${requestScope.p.cpu}</h6>
                            </div>
                            <div style="display: flex; justify-content: center; align-items: center; gap:20px;">
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.cpuType == 1 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_Low_be11159e35.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Thấp</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.cpuType == 2 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_Mid_4168820fd7.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Trung bình</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.cpuType == 3 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_High_5599e942c3.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Cao</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.cpuType == 3 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_Very_Hight_f30cee0c43.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Rất cao</p>
                                </div>
                            </div>
                        </div>
                        <div style="margin: 20px 20px;display: flex; justify-content: space-between;
                             background: whitesmoke; border-radius: 10px;padding: 5px 5px;">
                            <div style="display: flex; flex-direction: column;
                                 justify-content: center; align-items: flex-start;">
                                <p style="font-size: 10px; margin: 0;">RAM</p>
                                <h6 style="font-size: 12px;">${requestScope.p.ram}</h6>
                            </div>
                            <div style="display: flex; justify-content: center; align-items: center; gap:20px;">
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.ramType == 1 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_Low_c3a4d4fe07.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Thấp</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.ramType == 2 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_Mid_935e1f0c32.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Trung bình</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.ramType == 3 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_High_10663ba5d6.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Cao</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.ramType == 4 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Level_Very_Hight_941be28988.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Rất cao</p>
                                </div>
                            </div>
                        </div>
                        <div style="margin: 20px 20px;display: flex; justify-content: space-between;
                             background: whitesmoke; border-radius: 10px;padding: 5px 5px;">
                            <div style="display: flex; flex-direction: column;
                                 justify-content: center; align-items: flex-start;">
                                <p style="font-size: 10px; margin: 0;">CPU</p>
                                <h6 style="font-size: 12px;">${requestScope.p.graphics}</h6>
                            </div>
                            <div style="display: flex; justify-content: center; align-items: center; gap:20px;">
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.graphType == 1 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Name_AMD_555d97b43b.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Card on</p>
                                </div>
                                <div style="margin-right: 55px;display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.graphType == 2 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Name_Nvidia_01b92a36c0.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Card rời</p>
                                </div>           
                            </div>
                        </div>
                        <div style="margin: 20px 20px;display: flex; justify-content: space-between;
                             background: whitesmoke; border-radius: 10px;padding: 5px 5px;">
                            <div style="display: flex; flex-direction: column;
                                 justify-content: center; align-items: flex-start;">
                                <p style="font-size: 10px; margin: 0;">Kích thước màn hình</p>
                                <h6 style="font-size: 12px;">${requestScope.p.screenSize} inch</h6>
                            </div>
                            <div style="display: flex; justify-content: center; align-items: center; gap:20px;">
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.screenType == 1 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Property_1_Small_cc63976abf.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Nhỏ</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.screenType == 2 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Property_1_Mid_998c6d23d5.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Trung bình</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.screenType == 3 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Property_1_Large_75036236d0.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Lớn</p>
                                </div>
                                <div style="display: flex; justify-content: center; align-items: center;flex-direction: column;">
                                    <img ${requestScope.p.screenType == 4 ? "style='filter: invert(0) brightness(0.5);'" : ""} src="https://cdn2.fptshop.com.vn/svg/Property_1_Very_large_8dc8be8781.svg" alt="alt"/>
                                    <p style="font-size: 10px; margin: 0;">Rất lớn</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr><!-- comment -->
                    <div>
                        <h6>Chính sách dành cho sản phẩm</h6>
                        <div style="display: flex; justify-content: flex-start; align-content: center; gap: 20px;">
                            <div>
                                <img src="images/detailproduct/icon1.svg" alt="alt"/>
                                <span style="font-size: 12px;">Hàng chính hãng</span><br>
                                <img src="images/detailproduct/icon2.svg" alt="alt"/>
                                <span style="font-size: 12px;">Giao hàng miễn phí trong 90 phút</span><br>
                                <img src="images/detailproduct/icon3.svg" alt="alt"/>
                                <span style="font-size: 12px;">Chính sách đổi trả</span><br>
                            </div>
                            <div>
                                <img src="images/detailproduct/icon4.svg" alt="alt"/>
                                <span style="font-size: 12px;">Bảo hành (tháng): 12</span><br>
                                <img src="images/detailproduct/icon5.svg" alt="alt"/>
                                <span style="font-size: 12px;">Hỗ trợ cài đặt miễn phí</span><br>
                                <img src="images/detailproduct/icon6.svg" alt="alt"/>
                                <span style="font-size: 12px;">Chính sách trả góp</span><br>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <h5>Video về sản phẩm</h5>
                        <div class="row">
                            <div class="col-3">
                                <iframe style="border-radius: 25px;" width="100%" height="250px" src="https://www.youtube.com/embed/22bdPTiUwdw?si=imuyVfZ4UZZELrfG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            </div>
                            <div class="col-3">
                                <iframe style="border-radius: 25px;" width="100%" height="250px" src="https://www.youtube.com/embed/ArYUniiePig" title="Cách quay màn hình máy tính mà không phải ai cũng biết" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>                            </div>
                            <div class="col-3">
                                <iframe style="border-radius: 25px;" width="100%" height="250px" src="https://www.youtube.com/embed/uiqGVGWzUwg" title="Cách tắt nguồn laptop SIÊU NHANH chỉ bằng một phím bấm! #Shorts" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>                            </div>
                            <div class="col-3">
                                <iframe style="border-radius: 25px;" width="100%" height="250px" src="https://www.youtube.com/embed/BzS_vPCxRbw" title="Card đồ họa #RTX và #GTX khác nhau như thế nào?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>                            </div>
                        </div>
                    </div>
                </div>
                <!--Het noi dung  ben trai-->                 
                <!--Bat dau Noi dung ben phai-->                    
                <div class="col-5">
                    <img src="images/detailproduct/1nambaohanh.svg" alt="alt"/>
                    <h3>${requestScope.p.name}</h3>
                    <p style="font-size: 10px;">${requestScope.p.id} | <span style="color: brown">0 bình luận</span></p>
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <div style="font-size: 14px; font-weight: bold;">
                            Màu sắc (${requestScope.num} items ) 
                        </div>
                        <div>
                            <c:forEach items="${requestScope.listColor}" var="c">
                                <a href="product?productID=${requestScope.p.id}&colorID=${c.color.id}" style="padding: 2px 3px; ${requestScope.colorID eq c.color.id ? "background: #fae9e9;" : ""}
                                   display: inline-block; border: 1px solid #cb1c22; border-radius: 5px;text-decoration: none;color:black;">
                                    <img width="30px" src="${c.image}" alt="alt"/> <span style="font-size: 14px;">${c.color.name}</span>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                    <div style="border: 1px solid yellow;border-radius: 5px; margin-top: 25px;
                         background: linear-gradient(to bottom, #fffde7, #ffffff);
                         padding: 20px;
                         border-radius: 8px;">
                        <div style="margin: 0px 5px;display: flex; justify-content: space-between;">
                            <div>
                                <p style="margin: 0; font-size: 15px;">Mua ngay với giá</p>
                                <div style="display: flex;
                                     justify-content: flex-start;
                                     align-items: center;">
                                    <div class="price" style="font-weight: bold;
                                         color: black;
                                         font-size: 20px;">${p.finalPrice} 
                                    </div><span style="font-weight: bold;
                                                color: black;
                                                font-size: 20px;">₫</span>&nbsp;&nbsp;
                                </div>
                                <span class="price" style="margin-bottom: 10px;
                                      text-decoration: line-through;
                                      color: gray;
                                      font-size: 10px;
                                      font-weight: bold;">${p.price}</span>
                                <span style="margin-bottom: 10px;
                                      text-decoration: line-through;
                                      color: gray;
                                      font-size: 10px;
                                      font-weight: bold;">₫</span>
                                <span style="color: red;
                                      margin-left: 5px;
                                      font-size: 10px;">-${p.discount}%</span>
                            </div>
                            <div style="margin-top: 30px;font-size: 12px; font-weight: bold;">
                                Hoặc
                            </div>
                            <div>
                                <p style="margin: 0; font-size: 15px;">Trả góp</p>
                                <div style="display: flex;
                                     justify-content: flex-start;
                                     align-items: center;">
                                    <div class="price" style="font-weight: bold;
                                         color: black;
                                         font-size: 20px;">${Math.floor(p.finalPrice/12)} 
                                    </div><span style="font-weight: bold;
                                                color: black;
                                                font-size: 20px;">₫</span>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                        <div style="font-size: 10px; margin-left: 5px; margin-top: 5px;">
                            <i class="fas fa-check-circle fa-sm" style="color: #63E6BE;"></i>
                            Giảm ngay <span class="price">${p.discountAmount}</span>
                            <span style="font-weight: bold;
                                  color: black;
                                  font-size: 10px;">₫</span> áp dụng đến 31/12
                        </div>
                        <div style="margin-top: 10px;">
                            <img width="100%" src="images/detailproduct/dacquyen.jpeg" alt="alt"/>
                        </div>        
                    </div>  
                            <div style="margin-left: 100px; margin-top: 30px;">
                        <form name="f" action="" method="post">
                            <input style="display: block; padding: 10px; background-color: #ef4444; color: white; border-radius: 15px; border: none;" type="submit" value="Thêm vào giỏ hàng" onclick="buy('${requestScope.p.id}', '${requestScope.colorID}')" />
                        </form>
                    </div>
                </div>
                <!--Het noi dung ben phai-->
            </div>
            <hr>
        </div>
        <div style="padding: 0; background-color: whitesmoke">
            <div id="content" style=" border-radius: 25px ;width: 700px; margin: 30px auto; padding: 0; background-color: white">
                <h4 style="text-align: center;">Thông tin sản phẩm</h4>
                <h6>
                    Mô tả sản phẩm
                </h6>
                <img width="100%" src="images/detailproduct/motasp.jpg" alt="alt"/>
                <p style="font-weight: bold;">
                    HP 14s-dq5121TU là điển hình cho một chiếc laptop mỏng nhẹ giá rẻ nhưng có cấu hình ấn tượng. Sở hữu con chip Intel Core i3 1215U xung nhịp cao cùng RAM 8GB và ổ cứng SSD 512GB, máy đảm bảo cả về khả năng xử lý mạnh mẽ cũng như đa nhiệm mượt mà, hiệu suất vượt trội.
                </p>
                <h6>
                    Nổi bật với thiết kế siêu mỏng nhẹ
                </h6>
                <img width="100%" src="images/detailproduct/noibat.png" alt="alt"/> 
                <p>
                    HP 14s-dq5121TU xuất hiện với diện mạo thanh lịch, trẻ trung khi khoác lên mình “tấm áo” màu bạc thời thượng và đống nhất cho cả mặt bên trong và bên ngoài. Logo HP được làm bóng bẩy, dù không cần nhiều họa tiết nhưng vẫn đủ để tạo điểm nhấn nổi bật cho máy. Việc sử dụng chất liệu nhựa cao cấp giúp tối ưu trọng lượng laptop nhưng vẫn đảm bảo được sự bền bỉ và chắc chắn để chịu được những rủi ro, va đập trong quá trình sử dụng, bảo vệ tốt cho hệ thống linh kiện bên trong. Với độ dày chỉ 1.79cm và nặng 1.46kg, người dùng có thể dễ dàng mang theo laptop đi bất cứ đâu để phục vụ cho mục đích sử dụng của mình. 
                </p>
                <h6>
                    Hiệu năng mạnh mẽ với chip Intel Core i3 1215U
                </h6>
                <p>
                    Vi xử lý Intel Core i3 1215U là con chip quen thuộc trên dòng laptop sinh viên và laptop văn phòng. Với 6 nhân 8 luồng, xung nhịp tối đa lên đến 4.4GHz, chipset này thậm chí còn “vượt mặt” một số chip Intel Core i5 đời đầu về khả năng xử lý. GPU Intel UHD Graphics có thể làm tốt những công việc đồ họa và chơi game Full HD. Nhờ vậy, sức mạnh của HP Pavilion 14s-dq5121TU đáp ứng hoàn hảo từ những tác vụ cơ bản đến chuyên sâu, vận hành được cả phần mềm chuyên nghiệp đòi hỏi phần cứng cao, để bạn luôn làm việc với hiệu suất tốt nhất.
                </p>
                <img width="100%" src="images/detailproduct/hieunang.png">
                <h6>
                    Sẵn sàng chỉ trong vài giây với ổ cứng SSD
                </h6>
                <p>
                    Với HP 14s-dq5121TU, bạn không cần phải chờ đợi bởi máy được trang bị 512GB ổ cứng SSD PCIe siêu tốc, giúp quá trình khởi động cực nhanh với chỉ trong vài giây. Không chỉ khởi động mà các thao tác khác như tắt máy, chạy ứng dụng, sao chép dữ liệu cũng đều đảm bảo tốc độ thần tốc, giúp tiết kiệm thời gian hoàn thành công việc. Ngoài ra, HP Pavilion còn có sẵn 8GB RAM, thoải mái cho hoạt động đa nhiệm, mở nhiều tab, nhiều phần mềm để làm nhiều công việc cùng lúc.                 
                </p>
                <h6>
                    Thời lượng pin dài
                </h6>
                <p>
                    Sở hữu viên pin 3 Cell 41Wh giúp laptop HP 14s-dq5121TU có thể duy trì hoạt động liền mạch lên tới khoảng 7 - 8 giờ cho mỗi lần sạc đầy, tương đương một ngày làm việc mà không cần sạc lại. Nhờ đó, bạn sẽ không phải mang theo sạc đi khắp nơi, thoải mái sử dụng ở những địa điểm không có sẵn nguồn sạc. Tính năng sạc nhanh giúp lấy lại pin cho máy nhanh chóng. Bạn chỉ mất khoảng 45 phút để sạc lại được 50% pin, sẵn sàng tiếp tục công việc.
                </p>
                <img width="100%" style="margin-bottom: 30px;" src="images/detailproduct/pindai.png">
            </div>
            <div style="margin: 0 auto;">
                <button style="display: block; margin: 0 auto; padding: 10px; border-radius: 15px;
                        background-color: black; color: white;" id="toggleButton">Đọc thêm</button>
            </div>
        </div>

        <!--San pham tuong tu-->
        <div class="container-content">
            <h5 style="margin-top: 10px ;text-align: center;">Sản phẩm tương tự</h5>
            <div style="border-radius: 15px;
                 margin: 0 auto;
                 width: 98%;">
                <div class="owl-carousel owl-theme sale" style="margin-top: 10px;">
                    <c:forEach items="${requestScope.sameProduct}" var="p">
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
        <div>
            <%@include file="footer.jsp" %>
        </div>
        <script>
            document.getElementById('toggleButton').addEventListener('click', function () {
                var content = document.getElementById('content');
                var button = document.getElementById('toggleButton');

                if (content.classList.contains('expanded')) {
                    content.classList.remove('expanded');
                    button.innerText = 'Đọc thêm';
                } else {
                    content.classList.add('expanded');
                    button.innerText = 'Thu gọn';
                }
            });
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
        <script>
            function buy(id1, id2){
                document.f.action = "buy?pid=" + id1 + "&cid=" + id2;
                document.f.submit();
            }
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".owl-carousel.ver3").owlCarousel({
                    loop: false,
                    margin: 10,
                    nav: true,
                    dots: true, // Tắt các dấu chấm tròn điều hướng
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
    </body>
</html>
