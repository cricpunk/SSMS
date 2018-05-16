<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SSMS.ChangePassword" %>

<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>StartUI - Premium Bootstrap 4 Admin Dashboard Template</title>

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
    <style type="text/css">
        
        video { 
            position: fixed;
            top: 50%;
            left: 50%;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            transform: translateX(-50%) translateY(-50%);
            background-size: cover;
            transition: 1s opacity;
        }

        .sign-box {
            background-color: rgba(224,247,250 ,.6) !important;
        }

        .alertBoxes {
            background-color: rgba(224,247,250 ,.5) !important;
        }

    </style>
</head>
<body>
    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box reset-password-box" id="changePasswordForm">
                    <!--<div class="sign-avatar">
                        <img src="img/avatar-sign.png" alt="">
                    </div>-->
                    <header class="sign-title">Update Password</header>

                    <!-- Information displayer -->
                    <div class="form-error-text-block hidden alertBoxes" id="infoDisplayer">Username must be between 6 and 18 characters.</div>

                    <div class="form-group">
                        <div class="form-control-wrapper">
                        <input type="password" class="form-control" id="old_password" placeholder="Old Password" name="Old Password" data-validation="[NOTEMPTY]"
                                data-validation-message="Invalid $ ."/>
                            </div>
                    </div>
                    <div class="form-group">
                        <div class="form-control-wrapper">
                        <input type="password" class="form-control" id="new_password" placeholder="New Password" name="New Password" data-validation="[NOTEMPTY]"
                                data-validation-message="Invalid $ ."/>
                            </div>
                    </div>
                    <div class="form-group">
                        <div class="form-control-wrapper">
                        <input type="password" class="form-control" id="confirm_new_password" placeholder="Confirm New Password" name="Confirm New Password" data-validation="[NOTEMPTY]"
                                data-validation-message="Invalid $ ."/>
                            </div>
                    </div>
                    <button type="submit" class="btn btn-rounded btn-block">Submit</button>
                </form>
            </div>
        </div>
    </div><!--.page-center-->

<script src="https://www.gstatic.com/firebasejs/4.10.1/firebase.js"></script>
<script src="js/lib/jquery/jquery.min.js"></script>
<script src="js/lib/tether/tether.min.js"></script>
<script src="js/lib/bootstrap/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script type="text/javascript" src="js/lib/match-height/jquery.matchHeight.min.js"></script>
<script src="js/lib/html5-form-validation/jquery.validation.min.js"></script>
<script src="js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="database/authentication.js"></script>
<script src="js/app.js"></script>

    <script type="text/javascript" >

        // Login
        function changePassword() {

            var oldPassword = $("#txt_uname").val();
            var newPassword = $("#txt_pwd").val();
            var confirmNewPassword = $("#txt_pwd").val();
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
        $('#changePasswordForm').validate({

            submit: {
                settings: {
                    inputContainer: '.form-group',
                    errorListClass: 'form-tooltip-error',
                },
                callback: {
                    onBeforeSubmit: function (node) {
                        console.log("After Submit Call");
                        // Successfull form validation call change password method
                        changePassword();
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
