<%-- 
    Document   : dashboard
    Created on : Nov 5, 2024, 5:31:11 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard</title>
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
    <body>
        
        <div style="height: 100vh; width: 400px; background: #000000;">
            <h1 style="color: white;">Dashboard</h1>
            
            <h4 style="color: white;">Hello ${sessionScope.account.name}</h4>
            <div style="margin-left: 20px; display: flex; justify-content: center; flex-direction: column;
                 gap: 30px;">
                <div style="margin-top: 50px;">
                    <a style="text-decoration: none; color: white; font-size: 20px;" href="productmanager">
                        Product
                    </a>
                </div>
                <div>
                    <a style="text-decoration: none; color: white; font-size: 20px;" href="usermanager">
                        User
                    </a>
                </div>
                <div>
                    <a style="text-decoration: none; color: white; font-size: 20px;" href="ordermanager">
                        Order
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
