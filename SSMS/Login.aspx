<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SSMS.Login" %>

<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Shikshya Guru - Admin authentication</title>

	<link href="img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
	<link href="img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
	<link href="img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
	<link href="img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
	<link href="img/favicon.png" rel="icon" type="image/png">
	<link href="img/favicon.ico" rel="shortcut icon">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
    <link rel="stylesheet" href="css/separate/pages/login.min.css">
    <link rel="stylesheet" href="css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">

    <link rel="stylesheet" href="css/lib/bootstrap-sweetalert/sweetalert.css"/>
    <link rel="stylesheet" href="css/separate/vendor/sweet-alert-animations.min.css"/>

    <style type="text/css">
        
        body, html {
            height: 100%;
        }

        .bg {
            /* The image used */
            background-image: url("img/bg4.jpg");

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .sign-box {
            background-color: rgba(224,247,250 ,.6) !important;
            width: 20% !important;
        }

        .alertBoxes {
            background-color: rgba(224,247,250 ,.5) !important;
        }

    </style>
</head>

<body class="bg">

    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid loginContainer">

                <!-- Login Form -->
                <form class="sign-box" id="loginForm">
                    <div class="sign-avatar">
                        <img src="img/avatar-sign.png" alt="">
                    </div>
                    <header class="sign-title">Admin</header>
                   
                    <!-- Information displayer -->
                    <div class="form-error-text-block hidden alertBoxes" id="infoDisplayer">Username must be between 6 and 18 characters.</div>
                
                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="text" class="form-control" id="txt_uname" placeholder="username"
                                name="User name/code"
                                data-validation="[NOTEMPTY]"
                                data-validation-message="Invalid $ ."/>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="password" class="form-control" id="txt_pwd" placeholder="password"
                                name="Password"
                                data-validation="[NOTEMPTY]"
                                data-validation-message="Invalid $ ."/>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="checkbox float-left">
                            <input type="checkbox" id="signed-in"/>
                            <%--<label for="signed-in">Keep me active</label>--%>
                        </div>
                        <div class="float-right reset">
                            <%--<a href="#" id="forgetPassBtn">Forget Password ?</a>--%>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-rounded">Enter</button>

                    <%--<p class="sign-note">Does'nt have access ? <a href="#" id="proceedBtn">Proceed</a></p>--%>
                    <!--<button type="button" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>-->
                </form>
                <!-- Login Form -->

                <!-- Rerquest Institution Code Form -->
                <form class="sign-box hidden" id="requestForm">

                    <div class="sign-avatar no-photo">&plus;</div>
                    <header class="sign-title">Request Admin Access</header>

                    <!-- Information displayer -->
                    <div class="alert alert-success alertBoxes hidden" role="alert" id="infoDisplayerRequest"></div>

                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="text" class="form-control" placeholder="Institution Name" id="institutionName"
                                name="Institution name"
                                data-validation="[NOTEMPTY]"
                                data-validation-message="$ cannot be left empty ."/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="email" class="form-control" placeholder="E-mail" id="email" 
                                name="Email"
                                data-validation="[EMAIL]"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-control-wrapper">
                            <input type="tel" class="form-control" placeholder="Phone Number" id="phoneNumber" 
                                name="Phone number"
                                data-validation="[L==10, INTEGER]"
                                data-validation-message="$ is not valid."/>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-rounded btn-success sign-up">Submit</button>

                    <p class="sign-note">Already have an access? <a href="#" class="goBackToSignIn">Sign in</a></p>
                    <!--<button type="button" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>-->
                </form>
                 <!-- Rerquest Institution Code Form -->

                 <!-- Reset Password Form -->
                <form class="sign-box reset-password-box hidden" id="resetPwForm">
                    <!--<div class="sign-avatar">
                        <img src="img/avatar-sign.png" alt="">
                    </div>-->
                    <header class="sign-title">Reset Password</header>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="E-Mail or Phone"/>
                    </div>
                    <button type="submit" class="btn btn-rounded">Reset</button>

                    or <a href="#" class="goBackToSignIn">Sign in</a>
                </form>
                <!-- Reset Password Form -->

            </div>
        </div>
    </div><!--.page-center-->


<!-- Database part start from here -->

<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="js/lib/jquery/jquery.min.js"></script>
<script src="js/lib/tether/tether.min.js"></script>
<script src="js/lib/bootstrap/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script type="text/javascript" src="js/lib/match-height/jquery.matchHeight.min.js"></script>
<script src="js/lib/html5-form-validation/jquery.validation.min.js"></script>
<script src="js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="database/authentication.js"></script>

    <script type="text/javascript" >

        // Login
        function login() {

            var username = $("#txt_uname").val();
            var password = $("#txt_pwd").val();
            console.log('uname: ', username);
            console.log('pword: ', password);

            var data = JSON.stringify({
                username: username,
                password: password
            });

            try {
                $.ajax({
                    type: "POST",
                    url: "Login.aspx/VerifyLoginCredentials",
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onSuccess,
                    failure: onFailure
                });

                function onFailure(AjaxResponse) {
                    swal({
                        title: "Error found",
                        text: AjaxResponse.d,
                        type: "warning"
                    });
                }

                function onSuccess(AjaxResponse) {
                    console.log('check: ', AjaxResponse.d);
                    switch (AjaxResponse.d) {
                        case "1":
                            console.log('1: ', 'login success!');
                            window.location.replace("Index.aspx");
                            break;
                        case "0":
                            console.log('0: ', 'login failed!');
                            swal({
                                title: "Login Failed",
                                text: "Username and password does not match :(",
                                type: "warning"
                            });
                            break;
                        case "2":
                            console.log('2: ', 'Password Error!');
                            swal({
                                title: "Login Failed",
                                text: "Password does not match :(",
                                type: "warning"
                            });
                            break;
                        default:
                            console.log('default: ', 'Unknown Error!');
                            swal({
                                title: "Error found",
                                text: AjaxResponse.d,
                                type: "warning"
                            });
                    }

                }
            } catch (exe) {
                swal({
                    title: "Error found",
                    text: exe,
                    type: "warning"
                });
            }
        }

        // Login validation
        $('#loginForm').validate({

            submit: {
                settings: {
                    inputContainer: '.form-group',
                    errorListClass: 'form-tooltip-error'
                },
                callback: {
                    onBeforeSubmit: function (node) {
                        // Successfull form validation call login method
                        login();
                    },
                    onSubmit: function (node, formData) {
                        console.log("After Submit");
                    }
                }
            }
        });


        // 5. Different buttons hidden status manupulation
        $("#proceedBtn").click(function () {
            // $(".loginContainer").load("sign-up.html");
            $("#loginForm").addClass("hidden");
            $("#requestForm").removeClass("hidden");
        });


        $(".goBackToSignIn").click(function () {
            $("#loginForm").removeClass("hidden");
            $("#requestForm").addClass("hidden");
            $("#resetPwForm").addClass("hidden");
        });


        $("#forgetPassBtn").click(function () {
            $("#loginForm").addClass("hidden");
            $("#resetPwForm").removeClass("hidden");
        });
        // Different buttons hidden status manupulation


        // 6. Form's Ui height style
        $(function () {
            $('.page-center').matchHeight({
                target: $('html')
            });
        });
        // Form's Ui height style


    </script>

</body>
</html>