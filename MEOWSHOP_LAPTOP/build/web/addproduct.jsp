<%-- 
    Document   : addproduct
    Created on : Nov 7, 2024, 1:20:03 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
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
                <h1>Thêm Sản Phẩm Mới</h1>
                <c:if test="${requestScope.mess ne null}">
                    <h2 style="color: red;">
                        ${requestScope.mess}
                    </h2>
                </c:if>
                <form action="addproduct" method="POST" enctype="multipart/form-data">

                    <table class="table" border="1">
                        <tbody>
                            <tr>
                                <td><label for="ProductID">Mã Sản Phẩm:</label></td>
                                <td><input type="text" name="ProductID" id="ProductID" required><br><br></td>

                                <td><label for="ProductName">Tên Sản Phẩm:</label></td>
                                <td><input type="text" name="ProductName" id="ProductName" required><br><br></td>
                            </tr>
                            <tr>
                                <td>                    <label for="Brand_id">Thương Hiệu:</label>
                                </td>
                                <td><select name="Brand_id" id="Brand_id" required>
                                        <!-- Thay thế bằng dữ liệu từ bảng Brand -->
                                        <option value="">Chọn Thương Hiệu</option>
                                        <c:forEach items="${requestScope.brand}" var="b">
                                            <option value="${b.id}">${b.name}</option>
                                        </c:forEach>

                                        <!-- ... -->
                                    </select><br><br></td>

                                <td>                    <label for="Command_id">Dòng Sản Phẩm:</label>
                                </td>
                                <td><select name="Command_id" id="Command_id" required>
                                        <!-- Thay thế bằng dữ liệu từ bảng Command -->
                                        <option value="">Chọn Dòng Sản Phẩm</option>
                                        <c:forEach items="${requestScope.command}" var="b">
                                            <option value="${b.id}">${b.name}</option>
                                        </c:forEach>
                                        <!-- ... -->
                                    </select><br><br></td>
                            </tr>
                            <tr>
                                <td>                    <label for="ScreenSize">Kích Thước Màn Hình (inch):</label>
                                </td>
                                <td>                    <input type="number" step="0.1" name="ScreenSize" id="ScreenSize" required><br><br>
                                </td>

                                <td>                    <label for="ScreenSize_type">Loại Màn Hình:</label>
                                </td>
                                <td><select name="ScreenSize_type" id="ScreenSize_type">
                                        <!-- Thay thế bằng danh sách loại màn hình -->
                                        <option value="">Chọn Loại Màn Hình</option>
                                        <option value="1">Nhỏ</option>
                                        <option value="2">Trung bình</option>
                                        <option value="3">Lớn</option>
                                        <option value="4">Rất lớn</option>
                                        <!-- ... -->
                                    </select><br><br></td>
                            </tr>
                            <tr>
                                <td>                    <label for="CPU">CPU:</label>
                                </td>
                                <td>                    <input type="text" name="CPU" id="CPU" required><br><br>
                                </td>

                                <td>                    <label for="CPU_type">Loại CPU:</label>
                                </td>
                                <td><select name="CPU_type" id="CPU_type">
                                        <!-- Thay thế bằng danh sách loại CPU -->
                                        <option value="">Chọn Loại CPU</option>
                                        <option value="1">Thấp</option>
                                        <option value="2">Trung bình</option>
                                        <option value="3">Cao</option>
                                        <option value="4">Rất cao</option>
                                        <!-- ... -->
                                    </select><br><br></td>
                            </tr>
                            <tr>
                                <td><label for="RAM">RAM:</label></td>
                                <td>                    <input type="text" name="RAM" id="RAM" required><br><br>
                                </td>

                                <td><label for="RAM_type">Loại RAM:</label></td>
                                <td><select name="RAM_type" id="RAM_type">
                                        <!-- Thay thế bằng danh sách loại RAM -->
                                        <option value="">Chọn Loại RAM</option>
                                        <option value="1">Thấp</option>
                                        <option value="2">Trung bình</option>
                                        <option value="3">Cao</option>
                                        <option value="4">Rất cao</option>
                                        <!-- ... -->
                                    </select><br><br></td>
                            </tr>
                            <tr>
                                <td>                    <label for="Graphics">Card Đồ Họa:</label>
                                </td>
                                <td>                    <input type="text" name="Graphics" id="Graphics"><br><br>
                                </td>

                                <td>                    <label for="Graphics_type">Loại Card Đồ Họa:</label>
                                </td>
                                <td><select name="Graphics_type" id="Graphics_type">
                                        <!-- Thay thế bằng danh sách loại card đồ họa -->
                                        <option value="">Chọn Loại Card Đồ Họa</option>
                                        <option value="1">Card onboard</option>
                                        <option value="2">Card rời</option>
                                        <!-- ... -->
                                    </select><br><br></td>
                            </tr>
                            <tr>
                                <td>                    <label for="Price">Giá Bán (VND):</label>
                                </td>
                                <td>                    <input type="number" name="Price" id="Price" required><br><br>
                                </td>

                                <td>                    <label for="ReleaseDate">Ngày Ra Mắt:</label>
                                </td>
                                <td>                    <input type="date" name="ReleaseDate" id="ReleaseDate"><br><br>
                                </td>
                            </tr>
                            <tr>
                                <td>                    <label for="Description">Mô Tả:</label><br>
                                </td>
                                <td>                    <textarea name="Description" id="Description" rows="5" cols="50"></textarea><br><br>
                                </td>

                                <td>                    <label for="ImageLaptop">Hình Ảnh Laptop:</label>
                                </td>
                                <td>                    <input type="file" name="ImageLaptop" id="ImageLaptop"><br><br>
                                </td>
                            </tr>
                            <tr>
                                <td>                    <label for="StockQuantity">Số Lượng Tồn Kho:</label>
                                </td>
                                <td>                    <input type="number" name="StockQuantity" id="StockQuantity" required><br><br>
                                </td>

                                <td>                    <label for="Warranty">Bảo Hành:</label>
                                </td>
                                <td>                    <input type="text" name="Warranty" id="Warranty"><br><br>
                                </td>
                            </tr>
                            <tr>
                                <td>                    <label for="Discount">Giảm Giá (%):</label>
                                </td>
                                <td>                    <input type="number" name="Discount" id="Discount"><br><br>
                                </td>

                                <td>                    <label for="color_id">Màu Sắc:</label>
                                </td>
                                <td><select name="color_id" id="color_id" required>
                                        <!-- Thay thế bằng dữ liệu từ bảng Color -->
                                        <option value="">Chọn Màu Sắc</option>
                                        <c:forEach items="${requestScope.color}" var="b">
                                            <option value="${b.id}">${b.name}</option>
                                        </c:forEach>
                                        <!-- ... -->
                                    </select><br><br></td>
                            </tr>
                            <tr>
                                <td>                    <label for="image">Hình Ảnh Khác:</label>
                                </td>
                                <td>                    <input type="file" name="image" id="image"><br><br>
                                </td>
                                <td></td>
                                <td><input type="submit" value="Thêm Sản Phẩm"></td>
                            </tr>

                        </tbody>
                    </table>

                </form>
            </div>
        </div>
    </body>
</html>
