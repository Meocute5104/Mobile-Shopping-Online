<%-- 
    Document   : usermanage
    Created on : Nov 7, 2024, 6:23:48 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Manage</title>
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
                <div>
                    <form class="d-flex" action="adduser" method="get">
                        <button class="btn btn-outline-success" type="submit">Add new user</button>
                    </form>
                </div>
                <h1>Danh sách người dùng</h1>
                <table border="1">
                    <thead class="table">
                        <tr>
                            <th>Name</th>
                            <th>UserName</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Active</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.list}" var="u">
                            <tr>
                                <td>${u.name}</td>
                                <td>${u.username}</td>
                                <td>${u.email}</td>
                                <td>${u.phone}</td>
                                <td>Hải Dương</td>
                                <td>
                                    <c:if test="${u.active eq 0}">
                                        <a href="ban?id=${u.id}">BAN</a>
                                    </c:if>
                                    <c:if test="${u.active eq 1}">
                                        <a href="ban?id=${u.id}">UNBAN</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

                <div style="width: 700px;" class="container">
                    <canvas id="myChart"></canvas>
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
                    labels: ['ha123','nguyenkhoa5104', 'nguyenkhoa5104'],
                    datasets: [{
                            label: '',
                            data: [
                                655262700,
                                313731700,
                                40626600,
                            ],
                            //backgroundColor:'green',
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
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
                        text: 'Khach hang Vip',
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
    </body>
</html>
