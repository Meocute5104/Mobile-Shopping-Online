<%-- 
    Document   : productmanage
    Created on : Nov 5, 2024, 6:05:15 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Manager</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Owl Carousel CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

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
                <div style="width: 500px;">
                    <form class="d-flex" action="productmanager">
                        <input class="form-control me-2" name="key" value="${requestScope ne null ? requestScope.key : ""}" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <div>
                    <form class="d-flex" action="addproduct" method="get">
                        <button class="btn btn-outline-success" type="submit">Add new product</button>
                    </form>
                </div>
                <div>
                    <div style="display: flex;
                         justify-content: space-between;">
                        <div style="font-size: 12px;">
                            Tìm thấy <span style="font-weight: bold;">${requestScope.total}</span> kết quả
                        </div>
                        <form action="productmanager">
                            <div style="font-size: 12px;">Sắp xếp theo:
                                <!-- Thêm các input ẩn để giữ lại tham số bộ lọc -->
                                <input type="hidden" name="key" value="${requestScope.key}" />
                                <select onchange="this.form.submit()" name="sort" style="margin-left: 10px;">
                                    <option ${requestScope.op eq "0" ? "selected" : ""} value="0">Nổi bật</option>
                                    <option ${requestScope.op eq "1" ? "selected" : ""} value="1">Giá thấp nhất</option>
                                    <option ${requestScope.op eq "2" ? "selected" : ""} value="2">Giá cao nhất</option>
                                    <option ${requestScope.op eq "3" ? "selected" : ""} value="3">Sản phẩm mới nhất</option>
                                    <option ${requestScope.op eq "4" ? "selected" : ""} value="4">Sản phẩm cũ hơn</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ProductID</th>
                            <th>Image</th>
                            <th>ProductName</th>
                            <th>Brand</th>
                            <th>Price</th>
                            <th>Color</th>
                            <th>Discount(%)</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listproduct}" var="i">
                            <tr class="table-active">
                                <td>${i.product.id}</td>
                                <td>
                                    <img width="70px;" src="${i.image}" alt="alt"/>
                                </td>
                                <td>${i.product.name}</td>
                                <td>${i.product.brand.name}</td>
                                <td>${i.product.price}</td>
                                <td>${i.color.name}</td>
                                <td>${i.product.discount}</td>
                                <td>${i.quantity}</td>
                                <td>
                                    <a href="delete?id=${i.id}">
                                        Delete
                                    </a>
                                    <a href="update?id=${i.id}">
                                        Update
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:set var="page" value="${requestScope.page}"/>
                <div style="margin-left: 215px;margin-top: 20px;">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="productmanager?page=${page-1 == 0 ? requestScope.num : (page -1)}&key=${requestScope.key}&sort=${requestScope.op}">Previous</a></li>
                                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <li class="page-item">
                                    <a class="page-link" style="${page == i ? "background: whitesmoke;":"" }" href="productmanager?page=${i}&key=${requestScope.key}&sort=${requestScope.op}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="productmanager?page=${page+1 == (requestScope.num + 1) ? 1 : (page + 1)}&key=${requestScope.key}&sort=${requestScope.op}">Next</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="container">
                    <canvas id="myChart"></canvas>
                </div>
                        
                <div class="container">
                    <canvas id="myChart1"></canvas>
                </div>
                      
            </div>
        </div>


        <script>
            let myChart = document.getElementById('myChart').getContext('2d');
            // Global Options
            Chart.defaults.global.defaultFontFamily = 'Lato';
            Chart.defaults.global.defaultFontSize = 18;
            Chart.defaults.global.defaultFontColor = '#777';

            let massPopChart = new Chart(myChart, {
                type: 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
                data: {
                    labels: ['Macbook', 'Acer', 'Asus', 'Dell', 'Gigabyte', 'Huawei', 'MSI', 'Lenovo', 'Vaio', 'HP'],
                    datasets: [{
                            label: '',
                            data: [
                                624778800,
                                384842200,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0
                            ],
                            //backgroundColor:'green',
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
                                'rgba(75, 192, 192, 0.6)',
                                'rgba(153, 102, 255, 0.6)',
                                'rgba(255, 159, 64, 0.6)',
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)'
                            ],
                            borderWidth: 1,
                            borderColor: '#777',
                            hoverBorderWidth: 3,
                            hoverBorderColor: '#000'
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'Doanh thu theo hãng',
                        fontSize: 25
                    },
                    legend: {
                        display: true,
                        position: 'right',
                        labels: {
                            fontColor: '#000'
                        }
                    },
                    layout: {
                        padding: {
                            left: 50,
                            right: 0,
                            bottom: 0,
                            top: 0
                        }
                    },
                    tooltips: {
                        enabled: true
                    }
                }
            });
        </script>
        
        
        


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

    </body>
</html>
