<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="SSMS.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en" runat="server">
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge"/>
	<title>Customers - Stationery stock management system</title>

	<link href="img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144"/>
	<link href="img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114"/>
	<link href="img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72"/>
	<link href="img/favicon.57x57.png" rel="apple-touch-icon" type="image/png"/>
	<link href="img/favicon.png" rel="icon" type="image/png"/>
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" href="css/lib/lobipanel/lobipanel.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/lobipanel.min.css"/>
	<link rel="stylesheet" href="css/lib/jqueryui/jquery-ui.min.css"/>
	<link rel="stylesheet" href="css/separate/pages/widgets.min.css"/>
    <link rel="stylesheet" href="css/lib/font-awesome/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/lib/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>

    <link rel="stylesheet" href="css/separate/vendor/tags_editor.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/bootstrap-select/bootstrap-select.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/select2.min.css"/>

    <link rel="stylesheet" href="css/lib/bootstrap-sweetalert/sweetalert.css"/>
    <link rel="stylesheet" href="css/separate/vendor/sweet-alert-animations.min.css"/>

    <style type="text/css">
  		.select2-selection__arrow {
  			margin-top: 5px !important;
  		}

  		.modal-upload-bottom {
  			margin-top: 70px !important;
  			padding: 10px 0 0 0 !important;
  		}

        .customRoundedBtn {
            height: 50px !important; 
            width: 50px !important; 
            margin: 0 30px 30px 0 !important; 
            position: fixed !important; 
            bottom: 0px !important; 
            right: 0px !important;
            z-index: 100 !important;
        }

        #select2-mId-container {
            color: darkgray !important;
        }

        .add-user {
            position: relative;
            top: 10px;
            border-color: #919fa9;
            background-color: #919fa9;
            color: #fff;
            height: 30px;
            height: 30px;
            padding: 0 12px;
            font-size: .8125rem;
            line-height: 28px;
        }

        #result_message {
            text-align: center;
            width: -moz-fit-content;
            margin-left: auto;
            margin-right: auto;
            margin-top: 15px;
            padding: 10px 60px;
            border: 1px solid blueviolet;
            border-radius: 20px;
            color: blueviolet;
            background: honeydew;
        }

  	</style>
</head>

<body class="with-side-menu-compact dark-theme dark-theme-blue">

	<header class="site-header">
	    <div class="container-fluid">
	        <a href="index.aspx" class="site-logo-text">S.S.M.S</a>
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
	
                        <%--User Icon--%>
	                    <div class="dropdown user-menu">
	                        <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            <img src="img/avatar-2-64.png" alt="">
	                        </button>
	                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
	                            <a class="dropdown-item" href="#"><span class="font-icon glyphicon glyphicon-user"></span>Profile</a>
	                            <a class="dropdown-item" href="#"><span class="font-icon glyphicon glyphicon-cog"></span>Settings</a>
	                            <a class="dropdown-item" href="#"><span class="font-icon glyphicon glyphicon-question-sign"></span>Help</a>
	                            <div class="dropdown-divider"></div>
	                            <a class="dropdown-item" href="#"><span class="font-icon glyphicon glyphicon-log-out"></span>Logout</a>
	                        </div>
	                    </div>
	
	                    <button type="button" class="burger-right">
	                        <i class="font-icon-menu-addl"></i>
	                    </button>

	                </div><!--.site-header-shown-->
	
	                <div class="mobile-menu-right-overlay"></div>

	                <div class="site-header-collapsed">
	                    <div class="site-header-collapsed-in">                
	                        <div class="dropdown">
	                            <button class="btn btn-rounded add-user" id="dd-header-add" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                Add new user
	                            </button>
	                        </div>
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
	        <li class="brown">
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
	            <a href="suppliers.aspx">
	                <i class="font-icon font-icon-users"></i>
	                <span class="lbl">Suppliers</span>
	            </a>
	        </li>
	        <li class="gold opened">
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

		<button class="btn btn-rounded btn-inline btn-info customRoundedBtn" 
			type="button" data-toggle="modal" data-target="#cropperModal"> <i class="fa fa-plus"></i> 
		</button>

	    <div class="container-fluid">

	    	<div class="box-typical box-typical-padding divForm hidden">
               	<h4 style="padding:5px 0 5px 25px;">Add new customer 
                   <span class="label label-success">New</span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">
				    <div class="card-block" style="margin:2px;">    
                        
                        <form id="insertCustomersForm" name="insertCustomersForm" method="post">

                            <div class="row" style="padding-bottom: 15px;">
                                <div class="col-md-4">                                     
                                    <div class="form-group">
                                        <label class="form-label" for="cName">Customer Name</label>
                                        <div class="form-control-wrapper">
                                            <input id="cName" 
                                                class="form-control" 
                                                name="[Customer name]"
                                                placeholder="Sapana Bhandari" 
                                                type="text" 
                                                data-validation="[L>0]"
										        data-validation-message="$ cannot be empty."/>
                                        </div>
                                    </div>                                        
                                </div>
                             	<div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="cContactNo">Contact No</label>
                                        <div class="form-control-wrapper">
                                            <input id="cContactNo" 
                                                class="form-control" 
                                                placeholder="9841525833" 
                                                type="text" 
                                                name="[Contact number]"
                                                data-validation="[L>0]"
										        data-validation-message="$ cannot be empty."/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="cEmail">Email Id</label>
                                        <div class="form-control-wrapper">
                                            <input id="cEmail" 
                                                class="form-control" 
                                                placeholder="sapana@gmail.com" 
                                                type="text" 
                                                name="[Email ID]"
                                                data-validation="[EMAIL]" />											       
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="padding-bottom: 15px;">                                  
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="cAddress">Address</label>
                                        <div class="form-control-wrapper">
                                            <input id="cAddress" 
                                                class="form-control" 
                                                placeholder="Nepaltar, Kathmandu, Nepal" 
                                                type="text" 
                                                name="[Address]"
                                                data-validation="[L>0]"
										        data-validation-message="$ cannot be empty."/>
                                        </div>
                                    </div>
                                </div>                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="userName">Created By</label>
                                        <div class="form-control-wrapper">
                                            <select class="select2-arrow form-control" id="userName"  
                                                name="User"
                                                data-validation="[NOTEMPTY]"
                                                data-validation-message="You have to select user name.">

                                                <option value="">Select name of the user.</option>
                                                <asp:PlaceHolder ID="UserIdPlaceholder" runat="server"></asp:PlaceHolder>                                       
                                                    <%--Dynamic Field--%>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-upload-bottom form-group">                               
                                <button class="btn btn-rounded btn-default cancleBtn" type="button">Cancle </button>
                                <button class="btn btn-primary btn-rounded submitBtn swal-btn-success" type="submit">Submit </button>
                            </div>
                        </form>

                    </div>               
                </section>                  
		    </div>	

	    	<div class="box-typical box-typical-padding divTable">
               	<h4 style="padding:5px 0 5px 25px;">Customers 
                   <span class="label label-success">List of total customers</span>
               	</h4>
                <section class="box-typical box-typical-max-350 scrollable">
				    <div class="box-typical-body">
					    <div class="table-responsive">
						    <table id="table-edit" class="table table-bordered table-hover">
					            <thead>
					                <tr>
						                <th width="1">#</th>
						                <th>Customer Name</th>
						                <th>Contact No</th>
						                <th>Email</th>
						                <th>Address</th>
		                                <th>Created By</th>
                                        <th class="tabledit-toolbar-column">Controls</th>
					                </tr>
					            </thead>
					            <tbody>
		                            <asp:PlaceHolder ID="TablePlaceHolder" runat="server"></asp:PlaceHolder>
					    	        <%--Dynamic Content--%>
					            </tbody>
				            </table>	
					    </div>
				    </div><!--.box-typical-body-->
			    </section><!--.box-typical-->
			</div>

			<div class="box-typical box-typical-padding divTable" style="background: mediumturquoise;">
               	<h4 style="padding:5px 0 5px 25px;">Customer purchase
                   <span class="label label-success">Purchase details in last 31 days</span>
               	</h4>
               	<div class="row" style="padding-bottom: 15px;"> 
               		<div class="col-md-4"></div>
               		<div class="col-md-4">
                        <!-- <label class="form-label" for="itemName">Item Name</label> -->
                        <select class="select2-arrow form-control" id="customerNameOption">
                            <option value="0">Select customer name from the list to see purchase details.</option>
                            <asp:PlaceHolder ID="CustomerNamePlaceHolder" runat="server"></asp:PlaceHolder>
                            <%--Dynamic Field--%>
                        </select>
                        
                    </div>
                    <div class="col-md-4"></div>                    
               	</div>
                <h4 id="result_message" class="hidden"></h4>
               	<section class="card hidden" style="margin: 10px 20px 10px 20px;" id="customerTableResultSection">	
				   	<table id="customerPurchaseTable" class="table table-bordered table-hover">
					    <thead>
					        <tr>
						        <th width="1">#</th>
						        <th>Customer Name</th>
						        <th>Address</th>
						        <th>Contact No</th>
						        <th>Email</th>
						        <th>Product Name</th>
						        <th>Quantity (No.)</th>
						        <th>Rate (Rs.)</th>				        
		                        <th>Total (Rs.)</th>
		                        <th>Credit (Rs.)</th>
                                <th>Billing Date</th>
                                <th>Sold By</th>
					        </tr>
					    </thead>
					    <tbody id="customerPurchaseTableTbody">
		                    <%--Dynamic content--%>
					    </tbody>
				    </table>
			    </section>
		    </div>

		    <div class="box-typical box-typical-padding divTable">
               	<h4 style="padding:5px 0 5px 25px;">Customers
                   <span class="label label-success">Who have not bought any item in the last 31 days </span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">	
				   	<table id="table-edit" class="table table-bordered table-hover">
					    <thead>
					        <tr>
						        <th width="1">#</th>
						        <th>Customer Name</th>
						        <th>Item Code</th>
						        <th>Purchase Date</th>
						        <th>Arrived Date</th>
						        <th>Arrived Quantity</th>
						        <th>Stock Quantity</th>
						        <th>Category</th>				        
		                        <th>Supplier</th>
		                        <th>Managed By</th>
					        </tr>
					    </thead>
					    <tbody>
		                    <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
					    	<tr>
					    		<td>1</td>
					    		<td>Item 1</td>
					    		<td>CO125</td>
					    		<td>15/12/2018</td>
					    		<td>16/12/2018</td>
					    		<td>100</td>
					    		<td>150</td>
					    		<td>Category 1</td>
					    		<td>Supplier 1</td>
					    		<td>Pankaj Koirala</td>
					    	</tr>
					    	<tr>
					    		<td>1</td>
					    		<td>Item 1</td>
					    		<td>CO125</td>
					    		<td>15/12/2018</td>
					    		<td>16/12/2018</td>
					    		<td>100</td>
					    		<td>150</td>
					    		<td>Category 1</td>
					    		<td>Supplier 1</td>
					    		<td>Pankaj Koirala</td>
					    	</tr>
					    	<tr>
					    		<td>1</td>
					    		<td>Item 1</td>
					    		<td>CO125</td>
					    		<td>15/12/2018</td>
					    		<td>16/12/2018</td>
					    		<td>100</td>
					    		<td>150</td>
					    		<td>Category 1</td>
					    		<td>Supplier 1</td>
					    		<td>Pankaj Koirala</td>
					    	</tr>
					    	<tr>
					    		<td>1</td>
					    		<td>Item 1</td>
					    		<td>CO125</td>
					    		<td>15/12/2018</td>
					    		<td>16/12/2018</td>
					    		<td>100</td>
					    		<td>150</td>
					    		<td>Category 1</td>
					    		<td>Supplier 1</td>
					    		<td>Pankaj Koirala</td>
					    	</tr>
					    </tbody>
				    </table>
			    </section>
		    </div>

	    </div><!--.container-fluid-->

	    <!-- modal -->
	    <div class="modal fade" id="editDivisionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00a8ff; color: #fff">
                        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                            <i class="font-icon-close-2"></i>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Change employee division &amp; Position</h4>
                    </div>
                    <div class="modal-upload">
                        <div class="modal-upload-cont">
                        
                            <section class="card" style="margin: 10px 20px 10px 20px;">
							    <div class="card-block" style="margin:2px;">
								    <form id="form-signup_v1" name="form-signup_v1" method="POST">

									    <div class="row">
										    <div class="col-md-6">
                                                <label class="form-label" for="employeeName" >Employee Name</label>
                                                <select class="select2-arrow form-control" data-size="5" id="employeeName">
                                                    <asp:PlaceHolder ID="EmployeeListPlaceholder" runat="server"></asp:PlaceHolder>
                                                    <%--Dynamic Field--%>
                                                </select>
                                            </div>
										    <div class="col-md-6">
                                                <label class="form-label" for="divIdModal">Division</label>
                                                <select class="select2-arrow" id="divIdModal">
                                                    <asp:PlaceHolder ID="DivIdOptionPlaceholderModal" runat="server"></asp:PlaceHolder>
                                                    <%--Dynamic field--%>
                                                </select>
                                                <br />
                                                <br />
                                            </div>
									    </div>	

                                        <div class="row">
                                            <div class="checkbox-bird col-md-12">
							                    <input type="checkbox" id="checkBox"/>
							                    <label for="checkBox"> 
                                                    Selection will make him/her manager of the selected division by removing old one. Unselect will just transfer his/her division. 
                                                    If transfeering employee is already a manager then his/her position will be removed as well.
							                    </label>
						                    </div>
                                        </div>
                                        <%--<hr style="margin-bottom: 15px;"/>--%>

                                        <%--<div class="row hidden" id="transferManagerDiv">
										    <div class="col-md-6">
                                                <label style="padding: 0px 0px 0px 25px;"> Transfeering employee is a manager, appoint new manager for that division. </label>
                                            </div>
										    <div class="col-md-6">
                                                <label class="form-label" for="newManagerCandidate">Employee Name</label>
                                                <select class="select2-arrow" id="newManagerCandidate">
                                                    <asp:PlaceHolder ID="NewManagerCandidatePlaceholder" runat="server"></asp:PlaceHolder>
                                                    
                                                </select>
                                                <br />
                                            </div>
									    </div>--%>
                                        
                                        <div class="row" style="margin-top:20px;">
									        <div class="modal-upload-bottom form-group">
				                                <button type="submit" class="btn btn-rounded" id="changeEmpDivBtn">Done</button>
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

    <script>
    	$(function () {

            // Jquery table editable setting
            $('#table-edit').Tabledit({

                url: 'Customers.aspx',
			    columns: {
				    identifier: [0, 'id'],
                    editable: [[1, 'cName'], [2, 'cContactNo'], [3, 'cEmail'], [4, 'cAddress']]
			    }

            });

            // Customer details table edited data save button click listener
            $(".tabledit-save-button").click(function () {
               
                var jsonObj = {};

                $(this).closest('tr').find('input').each(function () {
                    var tag = this.getAttribute('name');
                    var val = this.value;
                    jsonObj[tag] = val;
                });

                var customerData = JSON.stringify(jsonObj);

                try {
                    $.ajax({
                        type: "POST",
                        url: "Customers.aspx/UpdateCustomerDetails",
                        data: customerData,
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
                                    text: "Customer details has been successfully updated !",
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

                try {
                    $.ajax({
                        type: "POST",
                        url: "Customers.aspx/DeleteRecord",
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
                                    text: "Customer record has been successfully deleted !",
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

            //Add customer button click listener
            $(".customRoundedBtn").click(function () {
                $(".divForm").removeClass("hidden");
                $(".customRoundedBtn").addClass("hidden");
                $(".divTable").addClass("hidden");

            });

            // Cancle button click listener
            $(".cancleBtn").click(function () {

                $(".divForm").addClass("hidden");
                $(".customRoundedBtn").removeClass("hidden");
                $(".divTable").removeClass("hidden");
                document.getElementById("insertCustomersForm").reset();

            });

            // Form validation
            $('#insertCustomersForm').validate({

                submit: {
                    settings: {
                        inputContainer: '.form-group',
                        errorListClass: 'form-tooltip-error'
                    },
                    callback: {
                        onBeforeSubmit: function (node) {
                            insertData();
                        },
                        onSubmit: function (node, formData) {
                            console.log("After Submit");
                        }
                    }
                }

            });

            // Insert employee record
            function insertData() {

                var customerData = JSON.stringify({
                    cName : $("#cName").val(),
                    cContactNo : $("#cContactNo").val(),
                    cEmail : $("#cEmail").val(),
                    cAddress: $("#cAddress").val(),
                    userId: $("#userName option:selected").val()
                });

                try {

                    $.ajax({
                        type : "POST",
                        url : "Customers.aspx/InsertCustomerDetails",
                        data : customerData,
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
                                    title: "Inserted!",
                                    text: "Customer details has been successfully inserted !",
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

            $("#customerNameOption").change(function () {

                var selectedValue = $("#customerNameOption option:selected").val();

                if (selectedValue != '0') {

                    var customerID = JSON.stringify({
                        cId: selectedValue
                    });

                    try {

                        $.ajax({
                            type : "POST",
                            url : "Customers.aspx/GetCustomerPurchaseRecord",
                            data : customerID,
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

                            if (AjaxResponse.d == '') {
                                $("#customerPurchaseTableTbody").empty();
                                $("#customerTableResultSection").addClass('hidden');                             
                                $("#result_message").text("Customer does not have any purchase details in last 31 days.");
                                $("#result_message").removeClass("hidden");

                            } else {
                                $("#result_message").addClass("hidden");
                                $("#customerPurchaseTableTbody").empty();
                                $("#customerTableResultSection").removeClass('hidden');
                                $("#customerPurchaseTableTbody").append(AjaxResponse.d);
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
                

            });

        });

    </script>

	<script src="js/app.js"></script>
</body>

</html>
