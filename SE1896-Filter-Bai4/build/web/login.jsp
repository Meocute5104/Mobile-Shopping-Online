<%-- 
    Document   : login
    Created on : Oct 28, 2024, 11:27:15 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/> 
        <h1>Login Page</h1> 
        <h3 style="color: red">${requestScope.ms}</h3> 
        <form action="login" method="post"> 
            enter username:<input type="text" name="user"/><br/> 
            enter password:<input type="password" name="pass"/><br/> 
            <input type="submit" value="LOGIN"/> 
        </form> 
    </body>
</html>
