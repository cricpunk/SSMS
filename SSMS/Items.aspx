<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="SSMS.Items" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en" runat="server">
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge"/>
	<title>Item details - Stationery stock management system</title>

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

  	</style>

</head>

<body class="with-side-menu-compact dark-theme dark-theme-blue">

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
	        <li class="blue opened">
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
        <button class="btn btn-primary submitBtn swal-btn-success" type="button" data-toggle="modal" id="addCategory" data-target="#addCategoryModal" 
            style="margin: 0 30px 30px 0 !important;right: 0px !important;position: absolute;">Add category 
        </button>

	    <div class="container-fluid">

	    	<div class="box-typical box-typical-padding divForm hidden">
               	<h4 style="padding:5px 0 5px 25px;">Add new item 
                   <span class="label label-success">New</span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">                       
				    <div class="card-block" style="margin:2px;">    
                        
                        <form id="insertItemsForm" name="insertItemsForm" method="post">

                            <div class="row" style="padding-bottom: 15px;">
                                <div class="col-md-4">                                     
                                    <div class="form-group">
                                        <label class="form-label" for="iName">Item Name</label>
                                        <div class="form-control-wrapper">
                                            <input id="iName" 
                                                class="form-control" 
                                                name="[Item name]"
                                                placeholder="Copy" 
                                                type="text" 
                                                data-validation="[L>0]"
										        data-validation-message="$ cannot be empty."/>
                                        </div>
                                    </div>                                        
                                </div>
                             	<div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="itemCode">Item Code</label>
                                        <div class="form-control-wrapper">
                                            <input id="itemCode" 
                                                class="form-control" 
                                                placeholder="CP125" 
                                                type="text" 
                                                name="[Item code]"
                                                data-validation="[L>0]"
										        data-validation-message="$ cannot be empty."/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="price">Price</label>
                                        <div class="form-control-wrapper">
                                            <input id="price" 
                                                class="form-control" 
                                                placeholder="RS. 150" 
                                                type="text" 
                                                name="[Price]"
                                                data-validation="[L>0, INTEGER]"
										        data-validation-message="$ cannot be empty & must be an integer."/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="padding-bottom: 15px;">                                  
                                <div class="col-md-4">
                                    <div class="form-group">
										<label class="form-label" for="date-mask-input">Purchase Date</label>
                                        <div class="form-control-wrapper">
										    <input type="text" class="form-control" id="date-mask-input"
                                                name="[Date]"
                                                data-validation="[L>0]"
										        data-validation-message="$ cannot be empty."/>
                                        </div>
									</div>
                                </div>
                             	<div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="category">Category</label>
                                        <div class="form-control-wrapper">
                                            <select class="select2-arrow form-control" id="category"
                                                name="Category"
                                                data-validation="[NOTEMPTY]"
                                                data-validation-message="You have to select category.">
                                                <option value="">Select item category.</option>
                                                <asp:PlaceHolder ID="CategoryPlaceHolder" runat="server"></asp:PlaceHolder>
                                                <%--Dynamic Field--%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="supplier">Supplier</label>
                                        <div class="form-control-wrapper">
                                            <select class="select2-arrow form-control" id="supplier"
                                                name="Supplier"
                                                data-validation="[NOTEMPTY]"
                                                data-validation-message="You have to select supplier.">
                                                <option value="">Select supplier name.</option>
                                                <asp:PlaceHolder ID="SupplierPlaceHolder" runat="server"></asp:PlaceHolder>
                                                <%--Dynamic Field--%>
                                            </select>                                        
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="padding-bottom: 15px;">  
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="description">Description</label>
                                        <div class="form-control-wrapper">
                                            <textarea rows="4" class="form-control" placeholder="Item description ..........." id="description"
                                                name="[Description]"
                                                data-validation="[L>0, L<500]"
										        data-validation-message="$ cannot be empty & must be less then 500 characters."></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-label" for="userName">Created By</label>
                                        <div class="form-control-wrapper">
                                            <select class="select2-arrow form-control" id="userName"
                                                name="User name"
                                                data-validation="[NOTEMPTY]"
                                                data-validation-message="You have to select user name.">
                                                <option value="">Select name of the user.</option>
                                                <asp:PlaceHolder ID="UserNamePlaceHolder" runat="server"></asp:PlaceHolder>
                                                <%--Dynamic Field--%>
                                            </select>                                      
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    
                                    
                                    <br />
                                    <br />
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
               	<h4 style="padding:5px 0 5px 25px;">Item 
                   <span class="label label-success">Details</span>
               	</h4>
               	<section class="card" style="margin: 10px 20px 10px 20px;">	
				   	<table id="table-edit" class="table table-bordered table-hover">
					    <thead>
					        <tr>
                                <th width="1">#</th>
						        <th>Item Name</th>
						        <th>Item Code</th>
                                <th>Description</th>
						        <th>Price</th>
						        <th>Purchase Date</th>
						        <th>Category</th>				        
		                        <th>Supplier</th>		                        
		                        <th>Created By</th>
                                <th class="tabledit-toolbar-column">Controls</th>
					        </tr>
					    </thead>
					    <tbody>
		                    <asp:PlaceHolder ID="TablePlaceHolder" runat="server"></asp:PlaceHolder>
					    	<%--Dynamic Content--%>
					    </tbody>
				    </table>
			    </section>
		    </div>

            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="box-typical box-typical-padding divTable">
               	        <h4 style="padding:5px 0 5px 25px;">Category 
                           <span class="label label-success">Details</span>
               	        </h4>
               	        <section class="card" style="margin: 10px 20px 10px 20px;">	
				   	        <table id="table-edit-category" class="table table-bordered table-hover">
					            <thead>
					                <tr>
                                        <th width="1">#</th>
						                <th>Category</th>
						                <th>Description</th>
					                </tr>
					            </thead>
					            <tbody>
		                            <asp:PlaceHolder ID="CategoryTablePlaceHolder" runat="server"></asp:PlaceHolder>
					    	        <%--Dynamic Content--%>
					            </tbody>
				            </table>
			            </section>
		            </div>
                </div>
                <div class="col-md-3"></div>
            </div>                    

	    </div><!--.container-fluid-->

	    <!-- modal -->
	    <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00a8ff; color: #fff">
                        <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                            <i class="font-icon-close-2"></i>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Add items category</h4>
                    </div>
                    <div class="modal-upload">
                        <div class="modal-upload-cont">
                        
                            <section class="card" style="margin: 10px 20px 10px 20px;">
							    <div class="card-block" style="margin:2px;">
								    <form id="form-signup_v1" name="form-signup_v1" method="POST">

									    <div class="row">
										    <div class="col-md-12">
                                                <fieldset class="form-group">
										            <label class="form-label" for="categoryName">Category</label>
										            <input type="text" class="form-control" id="categoryName"/>
									            </fieldset>
                                            </div>
										    
									    </div>	
                                        <div class="row">
									    	<div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label" for="customerName">Customer</label>
                                                    <div class="form-control-wrapper">
                                                        <select class="select2-arrow" id="customerName">
                                                        <option>Select name of the customer.</option>
			                                            <asp:PlaceHolder ID="UserIdPlaceholder" runat="server"></asp:PlaceHolder>
			                                            <option>Pankaj Koirala</option>
			                                            <option>Sachin Singh</option>
			                                            <option>Kalash Manandhar</option>
			                                            <option>Arpan Kafle</option>
                                                    </select>                                      
                                                    </div>
                                                </div>
                                            </div>
									    </div>
                                        <div class="row">
                                            <div class="col-md-12"> 
                                                <label class="form-label" for="categoryDesc">Category description</label>
                                                <textarea rows="4" class="form-control" placeholder="Category description ..........." id="categoryDesc"></textarea>                                                   
						                    </div>
                                        </div>
                                        <%--<hr style="margin-bottom: 15px;"/>--%>
                                        
                                        <div class="row" style="margin-top:-40px;">
									        <div class="modal-upload-bottom form-group">
				                                <button type="button" class="btn btn-rounded" id="btnAddCategory">Add</button>
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

    <script src="js/lib/input-mask/jquery.mask.min.js"></script>
	<script src="js/lib/input-mask/input-mask-init.js"></script>

    <script>
    	$(function () {

            // Jquery table editable setting
            $('#table-edit').Tabledit({

                url: 'Suppliers.aspx',
			    columns: {
				    identifier: [0, 'id'],
                    editable: [[1, 'iName'], [2, 'iCode'], [3, 'description'], [4, 'price'], [5, 'purchaseDate']]
			    }

            });

            // Add category
            $("#btnAddCategory").click(function (e) {
                e.preventDefault();

                var category = JSON.stringify({
                    category: $("#categoryName").val(),
                    description: $("#categoryDesc").val()
                });

                try {
                    $.ajax({
                        type: "POST",
                        url: "Items.aspx/InsertCategory",
                        data: category,
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
                                    text: "Category has been successfully inserted !",
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

            // Employee details table edited data save button click listener
            $(".tabledit-save-button").click(function () {
               
                var jsonObj = {};

                $(this).closest('tr').find('input').each(function () {
                    var tag = this.getAttribute('name');
                    var val = this.value;
                    jsonObj[tag] = val;
                });

                var itemData = JSON.stringify(jsonObj);

                try {
                    $.ajax({
                        type: "POST",
                        url: "Items.aspx/UpdateItemDetails",
                        data: itemData,
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
                                    text: "Item details has been successfully updated !",
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
                        url: "Items.aspx/DeleteRecord",
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
                                    text: "Item record has been successfully deleted !",
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

            //Add item button click listener
            $(".customRoundedBtn").click(function () {
                $(".divForm").removeClass("hidden");
                $(".customRoundedBtn").addClass("hidden");
                $(".divTable").addClass("hidden");
                $("#addCategory").addClass("hidden");

                try {
                    $.ajax({
                        type: "POST",
                        url: "Items.aspx/GetCataSuppUser",
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
                        $("#category").children('option:not(:first)').remove();
                        $("#supplier").children('option:not(:first)').remove();
                        $("#userName").children('option:not(:first)').remove();
                        $("#category").append(optionArray[0]);
                        $("#supplier").append(optionArray[1]);
                        $("#userName").append(optionArray[2]);

                    }

                } catch (exe) {
                    swal({
                        title: "Error found",
                        text: exe,
                        type: "warning"
                    });
                }

            });

            // Cancle button click listener
            $(".cancleBtn").click(function () {

                $(".divForm").addClass("hidden");
                $(".customRoundedBtn").removeClass("hidden");
                $(".divTable").removeClass("hidden");
                $("#addCategory").removeClass("hidden");
                document.getElementById("insertItemsForm").reset();

            });

            // Form validation
            $('#insertItemsForm').validate({

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

                var managerId;
                if ($("#mId").prop("selectedIndex") == 0) {
                    managerId = null;
                } else {
                    managerId = $("#mId option:selected").val();
                }

                var itemData = JSON.stringify({
                    iName : $("#iName").val(),
                    iCode: $("#itemCode").val(),
                    description: $("#description").val(),
                    price : $("#price").val(),
                    purchaseDate: $("#date-mask-input").val(),
                    category : $("#category option:selected").val(),
                    supplier : $("#supplier option:selected").val(),                    
                    userName : $("#userName option:selected").val()
                });

                try {
                    $.ajax({
                        type : "POST",
                        url : "Items.aspx/InsertItemDetails",
                        data : itemData,
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
                                    text: "Item details has been successfully inserted !",
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

        });

    </script>


<script src="js/app.js"></script>
</body>
</html>
