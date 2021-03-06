﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SSMS.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en" runat="server">
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge"/>
	<title>SSMS Home - Stationery stock management system</title>

	<link href="img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144"/>
	<link href="img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114"/>
	<link href="img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72"/>
	<link href="img/favicon.57x57.png" rel="apple-touch-icon" type="image/png"/>
	<link href="img/favicon.png" rel="icon" type="image/png"/>
	<link href="img/favicon.ico" rel="shortcut icon"/>

    <link rel="stylesheet" href="css/lib/lobipanel/lobipanel.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/lobipanel.min.css"/>
	<link rel="stylesheet" href="css/lib/jqueryui/jquery-ui.min.css"/>
	<link rel="stylesheet" href="css/separate/pages/widgets.min.css"/>
    <link rel="stylesheet" href="css/lib/font-awesome/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/lib/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>

    <link rel="stylesheet" href="css/separate/pages/gallery.min.css"/>

    <link rel="stylesheet" href="css/separate/vendor/tags_editor.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/bootstrap-select/bootstrap-select.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/select2.min.css"/>

    <link rel="stylesheet" href="css/lib/bootstrap-sweetalert/sweetalert.css"/>
    <link rel="stylesheet" href="css/separate/vendor/sweet-alert-animations.min.css"/>

    <link rel="stylesheet" href="css/separate/vendor/bootstrap-touchspin.min.css"/>
    <link rel="stylesheet" href="css/separate/vendor/typeahead.min.css"/>

    <style type="text/css">
    	
    	.gallery-col {
    		width: 60px !Important;
    		height: 60px !Important;
    		margin: 0 10px 10px 0 !important;
    		position: fixed !important; 
            bottom: 0px !important; 
            right: 0px !important;
            z-index: 100 !important;
    	}

    	.gallery-item {
    		border-radius: 100px !Important;
    		width: 60px !Important;
    		height: 60px !Important;
    	}

    	.gallery-item .gallery-picture {
    		height: 100% !Important;
    	}

    	.gallery-item .gallery-hover-layout-in {
    		background: rgba(50,50,50,.7);
    		cursor: pointer;
    	}

    	.select2-selection__arrow {
  			margin-top: 5px !important;
  		}

        #select2-mId-container {
            color: darkgray !important;
        }

        .panel-title {
            width: -moz-fit-content !important;
            padding: 5px 30px 10px 30px !important;
            margin-bottom: 0px !important;
            background: #00a8ff !important;
            color: #FFFFFF !important;
        }

        .box-typical-header {
            background: darkmagenta;
        }

        .box-typical.box-typical-dashboard .box-typical-body {
            overflow: auto;
            height: 450px;
        }


    </style>

</head>

<body class="with-side-menu-compact dark-theme dark-theme-blue" onload="indexOnLoad(<%=SSMS.Index.currentUserId%>);">

	<header class="site-header">
	    <div class="container-fluid">
	        <a href="#" class="site-logo-text">S.S.M.S</a>
	        <button class="hamburger hamburger--htla">
	            <span>toggle menu</span>
	        </button>
	        <div class="site-header-content">
	            <div class="site-header-content-in">
	                <div class="site-header-shown">
	                    <div class="dropdown dropdown-notification notif">
	                        <a href="#"
	                           class="header-alarm dropdown-toggle active"
	                           id="dd-notification"
	                           data-toggle="dropdown"
	                           aria-haspopup="true"
	                           aria-expanded="false">
	                            <i class="font-icon-alarm"></i>
	                        </a>
	                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-notif" aria-labelledby="dd-notification">
	                            <div class="dropdown-menu-notif-header">
	                                Notifications
	                                <span class="label label-pill label-danger">4</span>
	                            </div>
	                            <div class="dropdown-menu-notif-list">
	                                <div class="dropdown-menu-notif-item">
	                                    <div class="photo">
	                                        <img src="img/photo-64-1.jpg" alt="">
	                                    </div>
	                                    <div class="dot"></div>
	                                    <a href="#">Morgan</a> was bothering about something
	                                    <div class="color-blue-grey-lighter">7 hours ago</div>
	                                </div>
	                                <div class="dropdown-menu-notif-item">
	                                    <div class="photo">
	                                        <img src="img/photo-64-2.jpg" alt="">
	                                    </div>
	                                    <div class="dot"></div>
	                                    <a href="#">Lioneli</a> had commented on this <a href="#">Super Important Thing</a>
	                                    <div class="color-blue-grey-lighter">7 hours ago</div>
	                                </div>
	                                <div class="dropdown-menu-notif-item">
	                                    <div class="photo">
	                                        <img src="img/photo-64-3.jpg" alt="">
	                                    </div>
	                                    <div class="dot"></div>
	                                    <a href="#">Xavier</a> had commented on the <a href="#">Movie title</a>
	                                    <div class="color-blue-grey-lighter">7 hours ago</div>
	                                </div>
	                                <div class="dropdown-menu-notif-item">
	                                    <div class="photo">
	                                        <img src="img/photo-64-4.jpg" alt="">
	                                    </div>
	                                    <a href="#">Lionely</a> wants to go to <a href="#">Cinema</a> with you to see <a href="#">This Movie</a>
	                                    <div class="color-blue-grey-lighter">7 hours ago</div>
	                                </div>
	                            </div>
	                            <div class="dropdown-menu-notif-more">
	                                <a href="#">See more</a>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="dropdown user-menu">
	                        <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            <img src="img/avatar-2-64.png" alt="">
	                        </button>
	                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
	                            <a class="dropdown-item" href="#" id="currentUser"><span class="font-icon glyphicon glyphicon-user"></span><%=currentUser%></a>
	                            <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#changePasswordModal" id="changePassword"><span class="font-icon glyphicon glyphicon-user"></span>Change Password</a>
	                            <form runat="server">                                
                                <div class="dropdown-divider"></div>
	                            <a class="dropdown-item" href="#" onclick="document.getElementById('btnLogOut').click()"><span class="font-icon glyphicon glyphicon-log-out"></span>Logout</a>
                                    <asp:Button ID="btnLogOut" runat="server" Text="Call Button Click"  Style="display:none" OnClick="logOut" />
                                </form>
	                        </div>
	                    </div>
	
	                    <button type="button" class="burger-right">
	                        <i class="font-icon-menu-addl"></i>
	                    </button>
	                </div><!--.site-header-shown-->
	
	                <div class="mobile-menu-right-overlay"></div>

	                <div class="site-header-collapsed">
	                    <div class="site-header-collapsed-in">                
	                        <%--<div class="dropdown">
	                            <button class="btn btn-rounded dropdown-toggle" id="dd-header-add" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                Add
	                            </button>
	                            <div class="dropdown-menu" aria-labelledby="dd-header-add">
	                                <a class="dropdown-item" href="#">Quant and Verbal</a>
	                                <a class="dropdown-item" href="#">Real Gmat Test</a>
	                                <a class="dropdown-item" href="#">Prep Official App</a>
	                                <a class="dropdown-item" href="#">CATprer Test</a>
	                                <a class="dropdown-item" href="#">Third Party Test</a>
	                            </div>
	                        </div>--%>
	                        <div class="site-header-search-container">
	                            <form class="site-header-search closed">
	                                <input type="text" placeholder="Search"/>
	                                <button type="submit">
	                                    <span class="font-icon-search"></span>
	                                </button>
	                                <div class="overlay"></div>
	                            </form>
	                        </div>

	                    </div><!--.site-header-collapsed-in-->
	                </div><!--.site-header-collapsed-->

	            </div><!--site-header-content-in-->
	        </div><!--.site-header-content-->
	    </div><!--.container-fluid-->
	</header><!--.site-header-->

	<div class="mobile-menu-left-overlay"></div>
	<nav class="side-menu side-menu-compact">

	    <ul class="side-menu-list">
	        <li class="brown opened">
	            <a href="index.aspx">
	                <i class="font-icon font-icon-home"></i>
	                <span class="lbl">Dashboard</span>
	            </a>
	        </li>
	        <li class="blue">
	            <a href="items.aspx">
	                <i class="font-icon font-icon-cart"></i>
	                <span class="lbl">Items</span>
	            </a>
	        </li>
	        <li class="green">
	            <a href="Suppliers.aspx">
	                <i class="font-icon font-icon-users"></i>
	                <span class="lbl">Suppliers</span>
	            </a>
	        </li>
	        <li class="gold">
	            <a href="customers.aspx">
	                <i class="font-icon font-icon-users"></i>
	                <span class="lbl">Customers</span>
	            </a>
	        </li>
	        <li class="blue">
	            <a href="stock.aspx">
	                <i class="font-icon font-icon-cart"></i>
	                <span class="lbl">Stock</span>
	            </a>
	        </li>
	    </ul>
	</nav><!--.side-menu-->

	<div class="page-content">

        <div class="gallery-col" data-toggle="modal" data-target="#salesModal" id="btnSaleCircle">
			<article class="gallery-item">
				<img class="gallery-picture" src="img/sales.png" alt="">
				<div class="gallery-hover-layout">
					<div class="gallery-hover-layout-in">
						<p>SALE</p>
					</div>
				</div>
			</article>
		</div><!--.gallery-col-->

	    <div class="container-fluid">

            <div class="row">
                <div class="col-xl-12 dahsboard-column">
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Sales details</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <table class="tbl-typical">
                                <thead>
	                                <tr>
                                        <th width="1"><div>#</div></th>
	                                    <th><div>Particulars</div></th>
                                        <th><div>Customer</div></th>
                                        <th><div>Billing date</div></th>
                                        <th><div>User</div></th>
	                                    <th align="center"><div>Quantity (No.)</div></th>
	                                    <th align="center"><div>Rate (Rs.)</div></th>
	                                    <th align="center"><div>Total (Rs.)</div></th>
                                        <th align="center"><div>Credit (Rs.)</div></th>
	                                </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="SaleTablePlaceHolder" runat="server"></asp:PlaceHolder>
					    	        <%--Dynamic Content--%>	                                
                                </tbody>
	                        </table>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	            </div><!--.col-->
            </div>

	        <div class="row hidden" id="userDiv">
	            <div class="col-xl-12 dahsboard-column">
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Users</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
                            <table id="table-edit" class="table table-bordered table-hover">
	                           <thead>
	                                <tr>
                                        <th width="1"><div>#</div></th>
                                        <th><div>Full Name</div></th>
                                        <th><div>username</div></th>
                                        <th><div>User Type</div></th>
	                                    <th><div>Phone</div></th>
	                                    <th><div>Email</div></th>
	                                    <th><div>Address</div></th>
                                        <th class="tabledit-toolbar-column">Controls</th>
	                                </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="UserTablePlaceholder" runat="server"></asp:PlaceHolder>
					    	        <%--Dynamic Content--%>	                                
                                </tbody>
	                        </table>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	            </div><!--.col-->
	        </div>

	    </div><!--.container-fluid-->

	    <!-- modal -->
	    <div class="modal fade" id="salesModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00a8ff; color: #fff">
                        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                            <i class="font-icon-close-2"></i>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Sale</h4>
                    </div>
                    <div class="modal-upload">
                        <div class="modal-upload-cont">                      
                            <section class="card" style="margin: 10px 20px 10px 20px;">
							    <div class="card-block" style="margin:2px;">

								    <form id="saleItemForm" name="saleItemForm" method="POST">

									    <div class="row">

										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label">Product code</label>
									                <div class="typeahead-container">
										                <div class="typeahead-field">
									                        <span class="typeahead-query">
										                        <input id="productCode"
                                                                       placeholder="CCC123"
											                           class="form-control"
											                           name="Product code"
											                           type="search"
											                           autocomplete="off"
                                                                       data-validation="[NOTEMPTY]"
                                                                       data-validation-message=" $ cannot be empty"/>
									                        </span>
									                    </div>
                                                    </div>
                                                </div>
                                            </div>

										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="quantity">Quantity</label>
                                                    <div class="form-control-wrapper">
                                                        <div class="form-group">
							                                <input id="quantity" disabled="true" type="text" value="1" name="quantity"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message=" Quantity cannot be empty"/>
						                                </div>
                                                    </div>
                                                </div>
                                            </div>

									    </div>	
                                        
                                        <div class="row">
                                            
										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="customerName">Customer name</label>
                                                    <div class="form-control-wrapper">
                                                        <select class="select2-arrow form-control" id="customerName"
                                                            name="Customer"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message="You have to select customer.">
                                                            <option value="">Select customer.</option>
                                                            <asp:PlaceHolder ID="CustomerNamePlaceHolder" runat="server"></asp:PlaceHolder>
                                                            <%--Dynamic Field--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="date-mask-input">Billing date</label>
                                                    <div class="form-control-wrapper">
								                        <input type="text" class="form-control" id="date-mask-input"
                                                            name="Date"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message=" $ cannot be empty"/>
                                                    </div>
                                                </div>
                                            </div>

									    </div>	

                                         <div class="row">
                                            
										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="rate">Rate (RS.)</label>
                                                    <div class="form-control-wrapper">
                                                        <input id="rate" 
                                                            class="form-control"
                                                            placeholder="Rs. 0" 
                                                            disabled="true"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="total">Total bill amount (RS.)</label>
                                                    <div class="form-control-wrapper">
                                                        <input id="total" 
                                                            disabled="true"
                                                            class="form-control"
                                                            placeholder="Rs. 0" />
                                                    </div>
                                                </div>
                                            </div>     
                                             
									    </div>	

                                         <div class="row">
                                            
										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="amountReceived">Amount received (RS.)</label>
                                                    <div class="form-control-wrapper">
                                                        <input id="amountReceived" 
                                                            class="form-control"
                                                            placeholder="Rs. 0" 
                                                            type="text"
                                                            name="number"
                                                            data-validation="[NOTEMPTY]"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="credit">Credit (RS)</label>
                                                    <div class="form-control-wrapper">
                                                        <input id="credit" 
                                                            class="form-control"
                                                            placeholder="Rs. 0" 
                                                            disabled="true"/>
                                                    </div>
                                                </div>
                                            </div>

									    </div>	

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="userName">User name</label>
                                                    <div class="form-control-wrapper">
                                                        <select class="select2-arrow form-control" disabled="true" id="userName"
                                                            name="User"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message="You have to select user.">
                                                            <option value=" <%=SSMS.Index.currentUserId%> "> <%=SSMS.Index.currentUser%> </option>
                                                            <asp:PlaceHolder ID="UserNamePlaceHolder" runat="server"></asp:PlaceHolder>
                                                            <%--Dynamic Field--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>	

                                        <div class="row" style="margin-top:20px;">
									        <div class="modal-upload-bottom form-group">
				                                <button class="btn btn-rounded" type="submit" id="btnSale">Sale</button>
				                            </div><!--.modal-upload-bottom-->
                                        </div>

								    </form>		
                                    
							    </div>
						    </section>
                        </div><!--.modal-upload-cont-->
                    </div>

               
                </div>
            </div>
        </div>
        <!-- modal -->

        <!-- change password modal -->
	    <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00a8ff; color: #fff">
                        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                            <i class="font-icon-close-2"></i>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Change Password</h4>
                    </div>
                    <div class="modal-upload">
                        <div class="modal-upload-cont">                      
                            <section class="card" style="margin: 10px 20px 10px 20px;">
							    <div class="card-block" style="margin:2px;">

								    <form class="sign-box reset-password-box" id="changePasswordForm" name="changePasswordForm" method="POST">
                                        <!--<div class="sign-avatar">
                                            <img src="img/avatar-sign.png" alt="">
                                        </div>-->

                                        <!-- Information displayer -->
                                        <div class="form-error-text-block hidden alertBoxes" id="infoDisplayer">Username must be between 6 and 18 characters.</div>

                                        <div class="form-group">
                                            <label class="form-label" for="old_password">Old Password</label>
                                            <div class="form-control-wrapper">
                                            <input type="password" class="form-control" id="old_password" placeholder="Old Password" name="Old Password" data-validation="[NOTEMPTY]"
                                                    data-validation-message="Invalid $ ."/>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label" for="new_password">New Password</label>
                                            <div class="form-control-wrapper">
                                            <input type="password" class="form-control" id="new_password" placeholder="New Password" name="New Password" data-validation="[NOTEMPTY]"
                                                    data-validation-message="Invalid $ ."/>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                            <label style="color: crimson" class="form-label">Enter the new password carefully! You will have to request to manager if you forget your password.</label>
                                        </div>

                                        <button type="submit" data-dismiss="modal" aria-label="Close" class="btn btn-rounded btn-block">Submit</button>
								    </form>		
                                    
							    </div>
						    </section>
                        </div><!--.modal-upload-cont-->
                    </div>

               
                </div>
            </div>
        </div>
        <!-- change password modal -->

        <div class="col-md-6 hidden">
		    <select class="select2" multiple="multiple">
			    <option data-icon="font-icon-home">Quant Verbal</option>
			    <option selected data-icon="font-icon-cart">Real Gmat Test</option>
			    <option data-icon="font-icon-speed">Prep test</option>
			    <option data-icon="font-icon-users">Catprep test</option>
			    <option data-icon="font-icon-comments">Third Party Test</option>
		    </select>
	    </div>

        <div class="col-md-4 hidden">
			<div class="card">
				<div class="card-header">
					Success message!
				</div>
				<div class="card-block">
					<p class="card-text">
						<button class="btn btn-primary swal-btn-success">Try Alert!</button>
					</p>
				</div>
			</div>
		</div>

	</div><!--.page-content-->

    <script src="js/lib/jquery/jquery.min.js"></script>
	<script src="js/lib/tether/tether.min.js"></script>
	<script src="js/lib/bootstrap/bootstrap.min.js"></script>
	<script src="js/plugins.js"></script>

	<script src="js/lib/bootstrap-table/bootstrap-table.js"></script>
    <script src="js/lib/bootstrap-table/bootstrap-table-export.min.js"></script>
    <script src="js/lib/bootstrap-table/tableExport.min.js"></script>
    <script src="js/lib/bootstrap-table/bootstrap-table-init.js"></script>

    <script src="js/lib/jquery-tag-editor/jquery.caret.min.js"></script>
    <script src="js/lib/jquery-tag-editor/jquery.tag-editor.min.js"></script>
    <script src="js/lib/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="js/lib/select2/select2.full.min.js"></script>

    <script src="js/lib/peity/jquery.peity.min.js"></script>
    <script src="js/lib/table-edit/jquery.tabledit.min.js"></script>
    <script src="js/lib/html5-form-validation/jquery.validation.min.js"></script>
    <script src="js/lib/bootstrap-sweetalert/sweetalert.min.js"></script>

    <script src="js/lib/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="js/lib/input-mask/jquery.mask.min.js"></script>
	<script src="js/lib/input-mask/input-mask-init.js"></script>

	<script type="text/javascript" src="js/lib/jqueryui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/lib/lobipanel/lobipanel.min.js"></script>
	<script type="text/javascript" src="js/lib/match-height/jquery.matchHeight.min.js"></script>

    <script src="js/lib/typeahead/jquery.typeahead.min.js"></script>
	<script src="js/lib/typeahead/typeahead-init.js"></script>

	<script>

        //Hashmap to store item code and price. Hashmap has been initialized from BtnSaleCircle click listener
        var rateCodeMap = new Object();

        // Form validation
        $('#saleItemForm').validate({

            submit: {
                settings: {
                    inputContainer: '.form-group',
                    errorListClass: 'form-tooltip-error'
                },
                callback: {
                    onBeforeSubmit: function (node) {
                        saleToCustomer();
                    },
                    onSubmit: function (node, formData) {
                        console.log("After Submit");
                    }
                }
            }

        });


        // To set rate for the product
        $("#productCode").focusout(function () {

            var codeNameArr = this.value.split('(');
            var productCode = codeNameArr[0];    

            if (productCode == '') {
                $("#rate").attr('placeholder', 'Rs. 0');
                $("#quantity").prop('disabled', true);
            } else {
                $("#quantity").prop('disabled', false);
                $("#rate").val(rateCodeMap["" + productCode + ""]);              
            }

        });

        // Sale product to customer
        function saleToCustomer() {

            var codeNameArr = $("#productCode").val().split('(');
            var productCode = codeNameArr[0];  

            var salesData = JSON.stringify({
                pCode: productCode,
                qty : $("#quantity").val(),
                customer : $("#customerName option:selected").val(),
                billingDate : $("#date-mask-input").val(),
                rate: $("#rate").val(),
                total: $("#total").val(),
                credit : $("#credit").val(),
                user : $("#userName option:selected").val()
            });

            try {
                $.ajax({
                    type : "POST",
                    url : "Index.aspx/SaleProduct",
                    data : salesData,
                    contentType : "application/json; charset=utf-8",
                    dataType : "json",
                    success : onSuccess,
                    failure : onFailure
                });

                function onFailure(AjaxResponse) {
                    swal({
                        title: "Error found",
                        text: AjaxResponse.d,
                        type: "warning"
                    });
                }

                function onSuccess(AjaxResponse) {

                    switch (AjaxResponse.d) {
                        case "1":
                            swal({
                                title: "Sold!",
                                text: "Transaction has been completed successfully!",
                                type: "success",
                                confirmButtonClass: "btn-success",
                                confirmButtonText: "Done"
                            });
                            break;
                        case "0":
                            swal({
                                title: "Failed",
                                text: "Unknown error :(",
                                type: "warning"
                            });
                            break;
                        default:
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

        function changePassword() {
            var oldPassword = $("#old_password").val();
            var newPassword = $("#new_password").val();

            var data = JSON.stringify({
                oldPassword: oldPassword,
                newPassword: newPassword
            });

            try {
                $.ajax({
                    type: "POST",
                    url: "Index.aspx/ChangePassword",
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
                    console.log("after query: " + AjaxResponse.d);
                    switch (AjaxResponse.d) {
                        case "0":
                            swal({
                                title: "Success!",
                                text: "Password changed successfully!",
                                type: "success",
                                confirmButtonClass: "btn-success",
                                confirmButtonText: "Done"
                            });
                            $("#changePasswordModal").modal('hide');
                            break;
                        case "1":
                            swal({
                                title: "Error!",
                                text: "Current password not matched!",
                                type: "error"
                            });
                            break;
                    }
                }
            } catch (exe) {
                swal({
                    title: "Error found",
                    text: exe,
                    type: "warning"
                });
                $("#changePasswordModal").modal('hide');
            }
        }

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

        // Sale button click function
        $("#btnSaleCircle").click(function () {

             try {

                $.ajax({
                    type : "POST",
                    url : "Index.aspx/GetProductCode",
                    contentType : "application/json; charset=utf-8",
                    dataType : "json",
                    success : onSuccess,
                    failure : onFailure
                });

                function onFailure(AjaxResponse) {
                    swal({
                        title: "Error found",
                        text: AjaxResponse.d,
                        type: "warning"
                    });
                }

                function onSuccess(AjaxResponse) {

                    var productCodePriceList = AjaxResponse.d.split('##');

                    var productCodeList = productCodePriceList[0].split(',');

                    var productPriceList = productCodePriceList[1].split(',');

                    var i;                
                    for (i = 0; i < productCodeList.length; i++) {
                        var codeArr = productCodeList[i].split('(');
                        rateCodeMap[codeArr[0]] = productPriceList[i];
                        //console.log(rateCodeMap[productCodeList[i]] = productPriceList[i]);
                        //console.log(rateCodeMap);
                    }

                    $.typeahead({
                    input: "#productCode",
                    order: "asc",
                    minLength: 1,
                    source: {
                        data: productCodeList
                    }

                });
                        
                }
            } catch (exe) {
                swal({
                    title: "Error found",
                    text: exe,
                    type: "warning"
                });
            }
            
        });

        // Key press validation to restrict char input
        $('input[name="number"]').bind('keypress', function(e){
		    var keyCode = (e.which)?e.which:event.keyCode
		    return !(keyCode>31 && (keyCode<48 || keyCode>57)); 
	    });

        // To calculate credit amount
        $("#amountReceived").keyup(function (e) {

            var totalBill = parseInt($("#total").val());
            var amountReceived = this.value;
            var credit = totalBill - amountReceived;
            $("#credit").val(credit);

        });

        // Quantity touchspin
        $("input[name='quantity']").TouchSpin();

        // Calculate total amount while increasing or decreasing quantity
        $("input[name='quantity']").change(function () {

            var rate = $("#rate").val();
            var qty = parseInt($("#quantity").val());
            var total = qty * parseInt(rate);
            $("#total").val(total);

            var codeNameArr = $("#productCode").val().split('(');
            var productCode = codeNameArr[0];  

            var sendData = JSON.stringify({
                pCode: productCode,
                requestQty : $("#quantity").val()
            });

            try {

                $.ajax({
                    type : "POST",
                    url : "Index.aspx/ValidateQuantity",
                    contentType: "application/json; charset=utf-8",
                    data : sendData,
                    dataType : "json",
                    success : onSuccess,
                    failure : onFailure
                });

                function onFailure(AjaxResponse) {
                    swal({
                        title: "Error found",
                        text: AjaxResponse.d,
                        type: "warning"
                    });
                }

                function onSuccess(AjaxResponse) {

                    if (!(AjaxResponse.d == 'available')) {
                        alert(AjaxResponse.d);
                        $("#btnSale").prop('disabled', true);
                    } else {
                        $("#btnSale").prop('disabled', false);
                    }

                    

                }

            } catch (exe) {
                swal({
                    title: "Error found",
                    text: exe,
                    type: "warning"
                });
            }



        });

        // Jquery table editable setting
        $('#table-edit').Tabledit({

            url: 'Suppliers.aspx',
			columns: {
				identifier: [0, 'id'],
                editable: [[1, 'uFullName'], [2, 'uName'], [3, 'uType'], [4, 'uPhone'], [5, 'uEmail'], [6, 'uAddress']]
			}

        });

        // Employee details table edited data save button click listener
        $(".tabledit-save-button").click(function () {
               
            var jsonObj = {};

            $(this).closest('tr').find('input').each(function () {
                var tag = this.getAttribute('name');
                var val = this.value;
                jsonObj[tag] = val;
            });

            var userData = JSON.stringify(jsonObj);

            try {
                $.ajax({
                    type: "POST",
                    url: "Index.aspx/UpdateUser",
                    data: userData,
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

                    switch (AjaxResponse.d) {
                        case "1":
                            swal({
                                title: "Updated!",
                                text: "User details has been successfully updated !",
                                type: "success",
                                confirmButtonClass: "btn-success",
                                confirmButtonText: "Done"
                            });
                            break;
                        case "0":
                            swal({
                                title: "Failed",
                                text: "Unknown error :(",
                                type: "warning"
                            });
                            break;
                        default:
                            swal({
                                title: "Error found",
                                text: AjaxResponse.d,
                                type: "warning"
                            });
                    }
                }

            } catch (e) {
                swal({
                    title: "Error found",
                    text: e,
                    type: "warning"
                });
            }
                        
        });

        $(".tabledit-confirm-button").click(function (e) {
            e.preventDefault();

            var data = JSON.stringify({
                id: $(this).closest('tr').children('td:first').text()
            });

            alert(data);
            try {
                $.ajax({
                    type: "POST",
                    url: "Index.aspx/DeleteRecord",
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

                    switch (AjaxResponse.d) {
                        case "1":
                            swal({
                                title: "Deleted!",
                                text: "User record has been successfully deleted !",
                                type: "success",
                                confirmButtonClass: "btn-success",
                                confirmButtonText: "Done"
                            });
                            break;
                        case "0":
                            swal({
                                title: "Failed",
                                text: "Unknown error :(",
                                type: "warning"
                            });
                            break;
                        default:
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

        });

        //Add supplier button click listener
        $(".customRoundedBtn").click(function () {
            $(".divForm").removeClass("hidden");
            $(".customRoundedBtn").addClass("hidden");
            $("#table-edit").addClass("hidden");

        });

        // Cancle button click listener
        $(".cancleBtn").click(function () {

            $(".divForm").addClass("hidden");
            $(".customRoundedBtn").removeClass("hidden");
            $("#table-edit").removeClass("hidden");
            document.getElementById("insertSuppliersForm").reset();

        });
        


        $(function () {

            $('.panel').lobiPanel({
				sortable: true
			});
			$('.panel').on('dragged.lobiPanel', function(ev, lobiPanel){
				$('.dahsboard-column').matchHeight();
            });

           
        });

        function indexOnLoad(uId) {

            if (uId == 1) {
                $("#userDiv").removeClass('hidden');
            }

        }
  

	</script>

<script src="js/app.js"></script>
</body>
</html>
