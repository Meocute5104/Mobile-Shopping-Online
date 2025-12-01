<%-- 
    Document   : menu
    Created on : Oct 28, 2024, 11:22:24 AM
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
        <a href="userTask"> 
            User Task 
        </a> 
        || 
        <a href="sellerTask"> 
            Seller Task 
        </a> 
    <c:if test="${sessionScope.account!=null}"> 
        || 
        <a href="info"> 
            User Info 
        </a>        
        || 
        <a href="logout"> 
            Logout 
        </a> 
        &nbsp;&nbsp;&nbsp; 
        <span style="color:red">[ ${sessionScope.account.username} ]</span> 
    </c:if> 
    <c:if test="${sessionScope.account==null}"> 
        || 
        <a href="login"> 
            Login 
        </a> 
    </c:if>
</body>
</html>
