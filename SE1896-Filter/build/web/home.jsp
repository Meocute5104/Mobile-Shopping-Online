<%-- 
    Document   : home.jsp
    Created on : Oct 26, 2024, 5:15:17 PM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Home Page!</h1>
        <h3>
            <a><a href="add.jsp">Goi file add.jsp</a>
        </h3>
        <h3>So nguoi truy cap app: ${sessionScope.counter} </h3>
    </body>
</html>
