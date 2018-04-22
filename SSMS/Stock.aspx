<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="SSMS.Stock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en" runat="server">
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge"/>
	<title>Stock details - Stationery stock management system</title>

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

  	</style>
</head>

<body class="with-side-menu-compact dark-theme dark-theme-blue" onload="loadProductList();">

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
	        <li class="gold">
	            <a href="customers.aspx">
	                <i class="font-icon font-icon-users"></i>
	                <span class="lbl">Customers</span>
	            </a>
	        </li>
	        <li class="blue opened">
	            <a href="stock.aspx">
	                <i class="font-icon font-icon-cart"></i>
	                <span class="lbl">Stock</span>
	            </a>
	        </li>
	    </ul>
	</nav><!--.side-menu-->

	<div class="page-content">

		<div class="gallery-col">
			<article class="gallery-item">
				<img class="gallery-picture" src="img/delete.png" alt="">
				<div class="gallery-hover-layout">
					<div class="gallery-hover-layout-in">
					</div>
				</div>
			</article>
		</div><!--.gallery-col-->
        <button class="btn btn-primary submitBtn swal-btn-success" type="button" data-toggle="modal" id="btnAddToStock" data-target="#addItemToStockModal" 
            style="margin: 0 30px 30px 0 !important;right: 0px !important;position: absolute;">Add item to stock 
        </button>

	    <div class="container-fluid">

	    	<div class="box-typical box-typical-padding divTable">
               	<h4 style="padding:5px 0 5px 25px;">Items 
                   <span class="label label-success">List of total items in stock</span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">	
				   	<table id="stockTable" class="table table-bordered table-hover">
					    <thead>
					        <tr>
						        <th width="1">#</th>
						        <th>Item Name</th>
						        <th>Arrived Quantity</th>
						        <th>Stock Quantity</th>
						        <th>Arrived Date</th>
					        </tr>
					    </thead>
					    <tbody>
		                    <asp:PlaceHolder ID="StockTablePlaceHolder" runat="server"></asp:PlaceHolder>
                            <%--Dynamic content--%>
					    </tbody>
				    </table>
			    </section>
		    </div>

		    <div class="box-typical box-typical-padding divTable" style="background: mediumturquoise;">
               	<h4 style="padding:5px 0 5px 25px;">Item details 
                   <span class="label label-success">Single item details from the stock</span>
               	</h4>
               	<div class="row" style="padding-bottom: 15px;"> 
               		<div class="col-md-4"></div>
               		<div class="col-md-4">
                        <select class="select2-arrow form-control" id="productNameForStock">
                            <option value="0">Select item from the list to see stock details.</option>
                            <%--Dynamic Field--%>
                        </select>
                    </div>
                    <div class="col-md-4" style="padding-top: 10px;">
                    	<div class="checkbox-toggle">
							<input type="checkbox" id="showLessDetails"/>
							<label for="showLessDetails">Show more details</label>
						</div>					
                    </div>
               	</div>
               	<section class="card" style="margin: 10px 20px 10px 20px;">	
				   	<table id="ItemStockedByCompanyTable" class="table table-bordered table-hover hidden">
					    <%--Dynamic--%>
				    </table>
			    </section>
		    </div>

		    <div class="box-typical box-typical-padding divTable">
               	<h4 style="padding:5px 0 5px 25px;">Items 
                   <span class="label label-success">Out of stock</span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">	
				   	<table id="table-edit" class="table table-bordered table-hover">
					    <thead>
					        <tr>
						        <th width="1">#</th>
						        <th>Item Name</th>
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
		                    <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
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

		    <div class="box-typical box-typical-padding divTable" style="background: mediumturquoise;">
               	<h4 style="padding:5px 0 5px 25px;">Unsold stock 
                   <span class="label label-success">Unsold item in last 31 days</span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">	
				   	<table id="table-edit" class="table table-bordered table-hover">
					    <thead>
					        <tr>
						        <th width="1">#</th>
						        <th>Item Name</th>
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
	    <div class="modal fade" id="addItemToStockModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00a8ff; color: #fff">
                        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                            <i class="font-icon-close-2"></i>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Add product to stock</h4>
                    </div>
                    <div class="modal-upload">
                        <div class="modal-upload-cont">                      
                            <section class="card" style="margin: 10px 20px 10px 20px;">
							    <div class="card-block" style="margin:2px;">

								    <form id="addProductToStockForm" name="form-signup_v1" method="POST">

									    <div class="row">

										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="productName">Product name</label>
                                                    <div class="form-control-wrapper">
                                                        <select class="select2-arrow form-control" id="productName"
                                                            name="Product"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message="You have to select product.">
                                                            <option value="">Select product.</option>
                                                            <asp:PlaceHolder ID="ProductPlaceHolder" runat="server"></asp:PlaceHolder>
                                                            <%--Dynamic Field--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="productName">Quantity</label>
                                                    <div class="form-control-wrapper">
                                                        <div class="form-group">
							                                <input id="quantity" type="text" value="1" name="quantity"
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
                                                    <label class="form-label" for="date-mask-input">Date</label>
                                                    <div class="form-control-wrapper">
								                        <input type="text" class="form-control" id="date-mask-input"
                                                            name="Date"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message=" $ cannot be empty"/>
                                                    </div>
                                                </div>
                                            </div>
										    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="form-label" for="userName">User name</label>
                                                    <div class="form-control-wrapper">
                                                        <select class="select2-arrow form-control" id="userName"
                                                            name="User"
                                                            data-validation="[NOTEMPTY]"
                                                            data-validation-message="You have to select user.">
                                                            <option value="">Select user.</option>
                                                            <asp:PlaceHolder ID="UserNamePlaceHolder" runat="server"></asp:PlaceHolder>
                                                            <%--Dynamic Field--%>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
									    </div>	

                                        <div class="row" style="margin-top:20px;">
									        <div class="modal-upload-bottom form-group">
				                                <button class="btn btn-rounded" type="submit">Add</button>
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

    <script src="js/lib/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="js/lib/input-mask/jquery.mask.min.js"></script>
	<script src="js/lib/input-mask/input-mask-init.js"></script>

    <script>

        $(function () {

            // Touch spin setup
            $("input[name='quantity']").TouchSpin();

            // Jquery table editable setting
            //     $('#table-edit').Tabledit({

            //         url: 'Customers.aspx',
            //columns: {
            // identifier: [0, 'id'],
            //             editable: [[1, 'cName'], [2, 'cContactNo'], [3, 'cEmail'], [4, 'cAddress']]
            //}

            //     });

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
                $("#table-edit").addClass("hidden");

            });

            // Cancle button click listener
            $(".cancleBtn").click(function () {

                $(".divForm").addClass("hidden");
                $(".customRoundedBtn").removeClass("hidden");
                $("#table-edit").removeClass("hidden");
                document.getElementById("insertCustomersForm").reset();

            });

            // Form validation
            $('#addProductToStockForm').validate({

                submit: {
                    settings: {
                        inputContainer: '.form-group',
                        errorListClass: 'form-tooltip-error'
                    },
                    callback: {
                        onBeforeSubmit: function (node) {
                            insertIntoStock();
                        },
                        onSubmit: function (node, formData) {
                            console.log("After Submit");
                        }
                    }
                }

            });

            // To get product details and user details
            $("#btnAddToStock").click(function () {

                try {
                    $.ajax({
                        type: "POST",
                        url: "Stock.aspx/GetProductAndUser",
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

                        // Response of ajax will be in <option>##<option>##<option> format and we need to split those three by ##
                        // Once splited we will append options into select tag
                        var optionArray = AjaxResponse.d.split('##');

                        // Before appending options dont forget to clear select otherwise item will be repeated
                        $("#productName").children('option:not(:first)').remove();
                        $("#userName").children('option:not(:first)').remove();
                        $("#productName").append(optionArray[0]);
                        $("#userName").append(optionArray[1]);

                    }

                } catch (exe) {
                    swal({
                        title: "Error found",
                        text: exe,
                        type: "warning"
                    });
                }

            });

            // Insert product into stock
            function insertIntoStock() {

                var supplierData = JSON.stringify({
                    pId: $("#productName option:selected").val(),
                    quantity: $("#quantity").val(),
                    arrivedDate: $("#date-mask-input").val(),
                    uId: $("#userName option:selected").val()
                });

                try {
                    $.ajax({
                        type: "POST",
                        url: "Stock.aspx/InsertIntoStock",
                        data: supplierData,
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
                                    title: "Inserted!",
                                    text: "Product has been successfully added to stock !",
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

          
            $("#productNameForStock").change(function () {

                if ($("#productNameForStock option:selected").val() == 0) {
                    $("#ItemStockedByCompanyTable").addClass('hidden');
                } else {

                    var productId = JSON.stringify({
                        productId : $("#productNameForStock option:selected").val()
                    });

                    if ($("#showLessDetails").is(':checked')) {
                        getStockMoreDetailInformation(productId);
                    } else {                           
                        getStockLessDetailInformation(productId);
                    }                   

                }

            });


            $("#showLessDetails").change(function () {

                if ($("#productNameForStock option:selected").val() == 0) {
                    $("#ItemStockedByCompanyTable").addClass('hidden');
                } else {

                    var productId = JSON.stringify({
                        productId : $("#productNameForStock option:selected").val()
                    });

                    if (this.checked) {
                        getStockMoreDetailInformation(productId);
                    } else {                           
                        getStockLessDetailInformation(productId);
                    }                   

                }

            }) 

            function getStockLessDetailInformation(productId) {

                try {
                    $.ajax({
                        type: "POST",
                        url: "Stock.aspx/GetProductStockDetails",
                        contentType: "application/json; charset=utf-8",
                        data : productId,
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
                        
                        appendLessDetailsTable();
                        $("#itemDetailsTableBody").append(AjaxResponse.d);
                        $("#ItemStockedByCompanyTable").removeClass('hidden');

                    }

                } catch (exe) {
                    swal({
                        title: "Error found",
                        text: exe,
                        type: "warning"
                    });
                }

            }

            function getStockMoreDetailInformation(productId) {

                try {
                    $.ajax({
                        type: "POST",
                        url: "Stock.aspx/GetStockWithProductDetails",
                        contentType: "application/json; charset=utf-8",
                        data : productId,
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

                        appendMoreDetailsTable();
                        $("#itemDetailsTableBody").append(AjaxResponse.d);
                        $("#ItemStockedByCompanyTable").removeClass('hidden');

                    }

                } catch (exe) {
                    swal({
                        title: "Error found",
                        text: exe,
                        type: "warning"
                    });
                }

            }

            function appendLessDetailsTable() {

                var appendThis =
                    '<thead>'+
					    '<tr>'+
						    '<th width="1">#</th>'+
						    '<th>Item Name</th>'+
                            '<th>Arrived Quantity</th>'+
                            '<th>Stock Quantity</th>' +
                            '<th>Arrived Date</th>'+
					    '</tr>'+
				    '</thead>'+
				    '<tbody id="itemDetailsTableBody">'+		            
                    '</tbody>';

                $("#ItemStockedByCompanyTable").empty();
                $("#ItemStockedByCompanyTable").append(appendThis);

            }

            function appendMoreDetailsTable() {

                var appendThis =
                    '<thead>'+
					    '<tr>'+
						    '<th width="1">#</th>'+
						    '<th>Item Name</th>'+
						    '<th>Code</th>'+
						    '<th>Category</th>'+
                            '<th>Description</th>'+
                            '<th>Price</th>'+
                            '<th>Purchase Date</th>'+
                            '<th>Arrived date</th>'+
                            '<th>Arrived Qty</th>'+
                            '<th>Stock Qty</th>'+
                            '<th>Supplier</th>'+
                            '<th>User</th>'+
					    '</tr>'+
				    '</thead>'+
				    '<tbody id="itemDetailsTableBody">'+		            
                    '</tbody>';

                $("#ItemStockedByCompanyTable").empty();
                $("#ItemStockedByCompanyTable").append(appendThis);

            }


        });

        // Set product name is select tag for checking stock details
        function loadProductList() {

                // Setting up product name list
                $.ajax({
                    type: "POST",
                    url: "Stock.aspx/GetProductAndUser",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: onResultSuccess
                });

                function onResultSuccess(AjaxResponse) {

                    // Response of ajax will be in <option>##<option>##<option> format and we need to split those three by ##
                    // Once splited we will append options into select tag
                    var optionArray = AjaxResponse.d.split('##');
                    // Before appending options dont forget to clear select otherwise item will be repeated
                    $("#productNameForStock").children('option:not(:first)').remove();
                    $("#productNameForStock").append(optionArray[0]);

                }

            }
        

    </script>

<script src="js/app.js"></script>
</body>
</html>
