<%-- 
    Document   : adduser
    Created on : Nov 7, 2024, 7:11:39 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add user</title>
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
                <h1>Thêm Nguoi Dung Mới</h1>
                <c:if test="${requestScope.mess ne null}">
                    <h2 style="color: red;">
                        ${requestScope.mess}
                    </h2>
                </c:if>
                <div>
                    <form action="adduser" method="POST">
                        <table>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td>Name</td>
                                        <td>
                                            <input type="text" name="name" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>UserName</td>
                                        <td>
                                            <input type="text" name="username" required/>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>	Email</td>
                                        <td>
                                            <input type="text" name="email" required/>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td>
                                            <input type="text" name="phone" required/>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td>
                                            <input type="text" name="password" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Role</td>
                                        <td>
                                            <select name="role" required>
                                                <!-- Thay thế bằng dữ liệu từ bảng Brand -->
                                                <c:forEach items="${requestScope.list}" var="b">
                                                    <option value="${b.id}">${b.name}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="submit" value="ADD NEW USER"/>
                        </table>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
