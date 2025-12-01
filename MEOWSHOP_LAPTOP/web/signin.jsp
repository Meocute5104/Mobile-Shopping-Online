<%-- 
    Document   : login
    Created on : Oct 17, 2024, 10:12:25 AM
    Author     : MSII
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign in</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            #bgHome {
                margin: 0;
                padding: 0;
                height: 1vp;
                background-image: url('images/bgHome.png');
                /* Thay 'your-image.jpg' bằng đường dẫn đến ảnh của bạn */
                background-size: cover;
                /* Tự động điều chỉnh kích thước hình ảnh để bao phủ toàn bộ màn hình */
                background-position: center;
                /* Đặt hình ảnh ở giữa */
                background-repeat: no-repeat;
                /* Không lặp lại hình ảnh */
            }
        </style>
    </head>

    <body>

        <div id="bgHome" style="display: flex; justify-content: center;">
            <div style="padding-top: 180px; width: 50%; margin: 0 auto;" id="carouselExampleDark"
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
            <div style="margin: 0 auto; width: 40%; height: 100vh; border-radius: 20px; padding: 30px;">

                <!-- Pills content -->
                <div class="tab-content">
                    <div style=" padding: 18px; background-color: rgba(247, 209, 215, 0.7); border-radius: 20px;" class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                        <form action="signin" method="post">
                            <div class="text-center mb-3">
                                <p>Sign up with:</p>
                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-facebook-f"></i>
                                </button>

                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-google"></i>
                                </button>

                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-twitter"></i>
                                </button>

                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-github"></i>
                                </button>
                            </div>

                            <p class="text-center">or:</p>

                            <!-- Name input -->
                            <div class="form-outline mb-4">
                                <input required type="text" name="name" id="registerName" class="form-control" />
                                <label class="form-label" for="registerName">Name</label>
                            </div>

                            <!-- Username input -->
                            <div class="form-outline mb-4">
                                <input required type="text" name="user" id="registerUsername" class="form-control" />
                                <label class="form-label" for="registerUsername">Username</label>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-4">
                                <input required type="email" name="email" id="registerEmail" class="form-control" />
                                <label class="form-label" for="registerEmail">Email</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input required type="tel" name="phone" id="registerPhone" class="form-control" pattern="\d{10}" maxlength="10" title="Vui lòng nhập số điện thoại gồm 10 chữ số" />
                                <label class="form-label" for="registerPhone">Phone</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <input required type="password" name="pass" id="registerPassword" class="form-control" />
                                <label class="form-label" for="registerPassword">Password</label>
                            </div>

                            <!-- Repeat Password input -->
                            <div class="form-outline mb-4">
                                <input required type="password" name="repeatpass" id="registerRepeatPassword" class="form-control" />
                                <label class="form-label" for="registerRepeatPassword">Repeat password</label>
                            </div>
                            <div>
                                <c:if test="${!(requestScope.error2 eq null)}">
                                    <h6 style="color: red">${requestScope.error2}</h6>
                                </c:if>
                            </div>
                            <!-- Checkbox -->
                            <div class="form-check d-flex justify-content-center mb-4">
                                <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck" checked
                                       aria-describedby="registerCheckHelpText" />
                                <label class="form-check-label" for="registerCheck">
                                    I have read and agree to the terms
                                </label>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-block mb-3">Sign up</button>
                            <div class="text-center">
                                <p>Is your account exist? <a href="login" id="register-link">Login</a></p>
                            </div>
                        </form>
                    </div>
                    <div style="padding: 18px; background-color: rgba(247, 209, 215, 0.7); border-radius: 20px;" class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">

                    </div>
                </div>
            </div>
        </div>
        <!-- Pills content -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>

</html>
