<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SSMS.Index" %>

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

    <link rel="stylesheet" href="css/separate/pages/gallery.min.css"/>

    <link rel="stylesheet" href="css/separate/vendor/tags_editor.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/bootstrap-select/bootstrap-select.min.css"/>
	<link rel="stylesheet" href="css/separate/vendor/select2.min.css"/>

    <link rel="stylesheet" href="css/lib/bootstrap-sweetalert/sweetalert.css"/>
    <link rel="stylesheet" href="css/separate/vendor/sweet-alert-animations.min.css"/>

    <style type="text/css">
    	
    	.gallery-grid .gallery-col {
    		width: 100px !Important;
    		height: 100px !Important;
    		margin-right: 15px;
    		margin-top: -13px;
    	}

    	.gallery-item {
    		border-radius: 100px !Important;
    		width: 100px !Important;
    		height: 100px !Important;
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

	    <div class="container-fluid">

	    	
    		<div class="row">
	    		<div class="col-xl-6">
	    			<div class="box-typical box-typical-padding" style="background-color: #00a8ff; height: 145px;">
						<div class="gallery-grid">

							<div class="gallery-col" type="button" data-toggle="modal" data-target="#salesModal">
								<article class="gallery-item">
									<img class="gallery-picture" src="img/sales.png" alt="">
									<div class="gallery-hover-layout">
										<div class="gallery-hover-layout-in">
											<p>SALE</p>
										</div>
									</div>
								</article>
							</div><!--.gallery-col-->

							<div class="gallery-col">
								<article class="gallery-item">
									<img class="gallery-picture" src="img/order.png" alt="">
									<div class="gallery-hover-layout">
										<div class="gallery-hover-layout-in">
											<p>ORDER</p>
										</div>
									</div>
								</article>
							</div><!--.gallery-col-->

							<div class="gallery-col">
								<article class="gallery-item">
									<img class="gallery-picture" src="img/add.png" alt="">
									<div class="gallery-hover-layout">
										<div class="gallery-hover-layout-in">
											<p>ADD ITEM</p>
										</div>
									</div>
								</article>
							</div><!--.gallery-col-->
						</div>
					</div>
				</div>

				<div class="col-xl-6">
					<div class="row">
	                    <div class="col-sm-6">
	                        <article class="statistic-box red">
	                            <div>
	                                <div class="number">26</div>
	                                <div class="caption"><div>Open tickets</div></div>
	                                <div class="percent">
	                                    <div class="arrow up"></div>
	                                    <p>15%</p>
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    <div class="col-sm-6">
	                        <article class="statistic-box purple">
	                            <div>
	                                <div class="number">12</div>
	                                <div class="caption"><div>Closes tickets</div></div>
	                                <div class="percent">
	                                    <div class="arrow down"></div>
	                                    <p>11%</p>
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                </div>
            	</div>
        	</div>

	        <div class="row">
	            <div class="col-xl-6">
	                <div class="chart-statistic-box">
	                    <div class="chart-txt">
	                        <div class="chart-txt-top">
	                            <p><span class="unit">$</span><span class="number">1540</span></p>
	                            <p class="caption">Week income</p>
	                        </div>
	                        <table class="tbl-data">
	                            <tr>
	                                <td class="price color-purple">120$</td>
	                                <td>Orders</td>
	                            </tr>
	                            <tr>
	                                <td class="price color-yellow">15$</td>
	                                <td>Investments</td>
	                            </tr>
	                            <tr>
	                                <td class="price color-lime">55$</td>
	                                <td>Others</td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div class="chart-container">
	                        <div class="chart-container-in">
	                            <div id="chart_div"></div>
	                            <header class="chart-container-title">Income</header>
	                            <div class="chart-container-x">
	                                <div class="item"></div>
	                                <div class="item">tue</div>
	                                <div class="item">wed</div>
	                                <div class="item">thu</div>
	                                <div class="item">fri</div>
	                                <div class="item">sat</div>
	                                <div class="item">sun</div>
	                                <div class="item">mon</div>
	                                <div class="item"></div>
	                            </div>
	                            <div class="chart-container-y">
	                                <div class="item">300</div>
	                                <div class="item"></div>
	                                <div class="item">250</div>
	                                <div class="item"></div>
	                                <div class="item">200</div>
	                                <div class="item"></div>
	                                <div class="item">150</div>
	                                <div class="item"></div>
	                                <div class="item">100</div>
	                                <div class="item"></div>
	                                <div class="item">50</div>
	                                <div class="item"></div>
	                            </div>
	                        </div>
	                    </div>
	                </div><!--.chart-statistic-box-->
	            </div><!--.col-->
	            <div class="col-xl-6">
	                <div class="row">
	                    <div class="col-sm-6">
	                        <article class="statistic-box red">
	                            <div>
	                                <div class="number">26</div>
	                                <div class="caption"><div>Open tickets</div></div>
	                                <div class="percent">
	                                    <div class="arrow up"></div>
	                                    <p>15%</p>
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    <div class="col-sm-6">
	                        <article class="statistic-box purple">
	                            <div>
	                                <div class="number">12</div>
	                                <div class="caption"><div>Closes tickets</div></div>
	                                <div class="percent">
	                                    <div class="arrow down"></div>
	                                    <p>11%</p>
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    <div class="col-sm-6">
	                        <article class="statistic-box yellow">
	                            <div>
	                                <div class="number">104</div>
	                                <div class="caption"><div>New clients</div></div>
	                                <div class="percent">
	                                    <div class="arrow down"></div>
	                                    <p>5%</p>
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                    <div class="col-sm-6">
	                        <article class="statistic-box green">
	                            <div>
	                                <div class="number">29</div>
	                                <div class="caption"><div>Here is an example of a long name</div></div>
	                                <div class="percent">
	                                    <div class="arrow up"></div>
	                                    <p>84%</p>
	                                </div>
	                            </div>
	                        </article>
	                    </div><!--.col-->
	                </div><!--.row-->
	            </div><!--.col-->
	        </div><!--.row-->
	
	        <div class="row">
	            <div class="col-xl-6 dahsboard-column">
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Recent orders</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <table class="tbl-typical">
	                            <tr>
	                                <th><div>Status</div></th>
	                                <th><div>Clients</div></th>
	                                <th align="center"><div>Orders#</div></th>
	                                <th align="center"><div>Date</div></th>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-primary">Paid</span>
	                                    <span class="label label-success">Active</span>
	                                </td>
	                                <td>John Doe</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center"><span class="semibold">Today</span> 8:30</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-primary">Paid</span>
	                                    <span class="label label-success">Active</span>
	                                </td>
	                                <td>Thomas Bayer</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center"><span class="semibold">Today</span> 16:30</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-primary">Paid</span>
	                                    <span class="label label-default">Inactive</span>
	                                </td>
	                                <td>Nicolas Karabat</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center"><span class="semibold">Yesterday</span></td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-default">Unpaid</span>
	                                    <span class="label label-default">Inactive</span>
	                                </td>
	                                <td>Alexandre Pome</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center">23th May</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-primary">Paid</span>
	                                    <span class="label label-success">Active</span>
	                                </td>
	                                <td>John Doe</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center"><span class="semibold">Today</span> 8:30</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-primary">Paid</span>
	                                    <span class="label label-success">Active</span>
	                                </td>
	                                <td>Thomas Bayer</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center"><span class="semibold">Today</span> 16:30</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-primary">Paid</span>
	                                    <span class="label label-default">Inactive</span>
	                                </td>
	                                <td>Nicolas Karabat</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center"><span class="semibold">Yesterday</span></td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-default">Unpaid</span>
	                                    <span class="label label-default">Inactive</span>
	                                </td>
	                                <td>Alexandre Pome</td>
	                                <td align="center">3435362</td>
	                                <td class="color-blue-grey" nowrap align="center">23th May</td>
	                            </tr>
	                        </table>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Comments</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <article class="comment-item">
	                            <div class="user-card-row">
	                                <div class="tbl-row">
	                                    <div class="tbl-cell tbl-cell-photo">
	                                        <a href="#">
	                                            <img src="img/photo-64-1.jpg" alt="">
	                                        </a>
	                                    </div>
	                                    <div class="tbl-cell">
	                                        <span class="user-card-row-name"><a href="#">Matt McGill</a></span>
	                                    </div>
	                                    <div class="tbl-cell tbl-cell-date">
	                                        <span class="semibold">Today</span>
	                                        12:45
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="comment-item-txt">
	                                <p>That’s a great idea! I’m sure we could start this project as soon as possible.</p>
	                                <p>Let’s meet tomorow!</p>
	                            </div>
	                            <div class="comment-item-meta">
	                                <a href="#" class="star">
	                                    <i class="font-icon font-icon-star"></i>
	                                </a>
	                                <a href="#">
	                                    <i class="font-icon font-icon-re"></i>
	                                </a>
	                                <!--Реализация кнопками-->
	                                <!--<button type="button" class="star">-->
	                                <!--<i class="font-icon font-icon-star"></i>-->
	                                <!--</button>-->
	                                <!--<button type="button">-->
	                                <!--<i class="font-icon font-icon-re"></i>-->
	                                <!--</button>-->
	                            </div>
	                        </article>
	                        <article class="comment-item">
	                            <div class="user-card-row">
	                                <div class="tbl-row">
	                                    <div class="tbl-cell tbl-cell-photo">
	                                        <a href="#">
	                                            <img src="img/photo-64-2.jpg" alt="">
	                                        </a>
	                                    </div>
	                                    <div class="tbl-cell">
	                                        <span class="user-card-row-name"><a href="#">Tim Collins</a></span>
	                                    </div>
	                                    <div class="tbl-cell tbl-cell-date">
	                                        <span class="semibold">Today</span>
	                                        12:45
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="comment-item-txt">
	                                <p>That’s a great idea! I’m sure we could start this project as soon as possible.</p>
	                                <p>Let’s meet tomorow!</p>
	                            </div>
	                            <div class="comment-item-meta">
	                                <a href="#" class="star active">
	                                    <i class="font-icon font-icon-star"></i>
	                                </a>
	                                <a href="#">
	                                    <i class="font-icon font-icon-re"></i>
	                                </a>
	                                <!--Реализация кнопками-->
	                                <!--<button type="button" class="star">-->
	                                <!--<i class="font-icon font-icon-star"></i>-->
	                                <!--</button>-->
	                                <!--<button type="button">-->
	                                <!--<i class="font-icon font-icon-re"></i>-->
	                                <!--</button>-->
	                            </div>
	                        </article>
	                    </div><!--.box-typical-body-->
	                </section>
	            </div><!--.col-->
	            <div class="col-xl-6 dahsboard-column">
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Recent tickets</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <table class="tbl-typical">
	                            <tr>
	                                <th><div>Status</div></th>
	                                <th><div>Subject</div></th>
	                                <th align="center"><div>Department</div></th>
	                                <th align="center"><div>Date</div></th>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-success">Open</span>
	                                </td>
	                                <td>Website down for one week</td>
	                                <td align="center">Support</td>
	                                <td nowrap align="center"><span class="semibold">Today</span> 8:30</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-success">Open</span>
	                                </td>
	                                <td>Restoring default settings</td>
	                                <td align="center">Support</td>
	                                <td nowrap align="center"><span class="semibold">Today</span> 16:30</td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-warning">Progress</span>
	                                </td>
	                                <td>Loosing control on server</td>
	                                <td align="center">Support</td>
	                                <td nowrap align="center"><span class="semibold">Yesterday</span></td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span class="label label-danger">Closed</span>
	                                </td>
	                                <td>Authorizations keys</td>
	                                <td align="center">Support</td>
	                                <td nowrap align="center">23th May</td>
	                            </tr>
	                        </table>
	                    </div><!--.box-typical-body-->
	                </section><!--.box-typical-dashboard-->
	                <section class="box-typical box-typical-dashboard panel panel-default scrollable">
	                    <header class="box-typical-header panel-heading">
	                        <h3 class="panel-title">Contacts</h3>
	                    </header>
	                    <div class="box-typical-body panel-body">
	                        <div class="contact-row-list">
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-2.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Tim Collins</a></p>
	                                            <p class="user-card-row-mail"><a href="#">timcolins@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Director at Tony’s</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-1.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-3.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Molly Bridjet</a></p>
	                                            <p class="user-card-row-mail"><a href="#">mollybr@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Assistan</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-4.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-2.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Tim Collins</a></p>
	                                            <p class="user-card-row-mail"><a href="#">timcolins@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Director at Tony’s</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-1.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-3.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Molly Bridjet</a></p>
	                                            <p class="user-card-row-mail"><a href="#">mollybr@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">Assistan</div>
	                                    </div>
	                                </div>
	                            </article>
	                            <article class="contact-row">
	                                <div class="user-card-row">
	                                    <div class="tbl-row">
	                                        <div class="tbl-cell tbl-cell-photo">
	                                            <a href="#">
	                                                <img src="img/photo-64-4.jpg" alt="">
	                                            </a>
	                                        </div>
	                                        <div class="tbl-cell">
	                                            <p class="user-card-row-name"><a href="#">Maggy Smith</a></p>
	                                            <p class="user-card-row-mail"><a href="#">maggysmith@mail.com</a></p>
	                                        </div>
	                                        <div class="tbl-cell tbl-cell-status">PR Manager</div>
	                                    </div>
	                                </div>
	                            </article>
	                        </div>
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
								    <form id="form-signup_v1" name="form-signup_v1" method="POST">

									    <div class="row">
										    <div class="col-md-6">                                     
			                                    <div class="form-group">
			                                        <label class="form-label" for="itemCode">Item Code</label>
			                                        <div class="form-control-wrapper">
			                                            <input id="itemCode" 
			                                                class="form-control" 
			                                                name="[Item code]"
			                                                placeholder="COP125" 
			                                                type="text" 
			                                                data-validation="[L>0]"
													        data-validation-message="$ cannot be empty."/>
			                                        </div>
			                                    </div>                                        
			                                </div>
			                                <div class="col-md-6">                                     
			                                    <div class="form-group">
			                                        <label class="form-label" for="quantity">Quantity</label>
			                                        <div class="form-control-wrapper">
			                                            <input id="quantity" 
			                                                class="form-control" 
			                                                name="[Quantity]"
			                                                placeholder="COP125" 
			                                                type="number" 
			                                                data-validation="[L>0]"
													        data-validation-message="$ cannot be empty."/>
			                                        </div>
			                                    </div>                                        
			                                </div>
									    </div>	
									    <div class="row">
									    	<div class="col-md-12">
                                                <label class="form-label" for="customerName">Customer</label>
                                                <select class="select2-arrow" id="customerName">
                                                    <option>Select name of the customer.</option>
			                                        <asp:PlaceHolder ID="UserIdPlaceholder" runat="server"></asp:PlaceHolder>
			                                        <option>Pankaj Koirala</option>
			                                        <option>Sachin Singh</option>
			                                        <option>Kalash Manandhar</option>
			                                        <option>Arpan Kafle</option>
                                                </select>
                                                <br />
                                                <br />
                                            </div>
									    </div>
                                       
                                        <div class="row" style="margin-top:20px;">
									        <div class="modal-upload-bottom form-group">
				                                <button type="submit" class="btn btn-rounded" id="changeEmpDivBtn">Sale</button>
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

	<script type="text/javascript" src="js/lib/jqueryui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/lib/lobipanel/lobipanel.min.js"></script>
	<script type="text/javascript" src="js/lib/match-height/jquery.matchHeight.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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

		$(document).ready(function() {

			$('.panel').lobiPanel({
				sortable: true
			});
			$('.panel').on('dragged.lobiPanel', function(ev, lobiPanel){
				$('.dahsboard-column').matchHeight();
			});

			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			function drawChart() {
				var dataTable = new google.visualization.DataTable();
				dataTable.addColumn('string', 'Day');
				dataTable.addColumn('number', 'Values');
				// A column for custom tooltip content
				dataTable.addColumn({type: 'string', role: 'tooltip', 'p': {'html': true}});
				dataTable.addRows([
					['MON',  130, ' '],
					['TUE',  130, '130'],
					['WED',  180, '180'],
					['THU',  175, '175'],
					['FRI',  200, '200'],
					['SAT',  170, '170'],
					['SUN',  250, '250'],
					['MON',  220, '220'],
					['TUE',  220, ' ']
				]);

				var options = {
					height: 314,
					legend: 'none',
					areaOpacity: 0.18,
					axisTitlesPosition: 'out',
					hAxis: {
						title: '',
						textStyle: {
							color: '#fff',
							fontName: 'Proxima Nova',
							fontSize: 11,
							bold: true,
							italic: false
						},
						textPosition: 'out'
					},
					vAxis: {
						minValue: 0,
						textPosition: 'out',
						textStyle: {
							color: '#fff',
							fontName: 'Proxima Nova',
							fontSize: 11,
							bold: true,
							italic: false
						},
						baselineColor: '#16b4fc',
						ticks: [0,25,50,75,100,125,150,175,200,225,250,275,300,325,350],
						gridlines: {
							color: '#1ba0fc',
							count: 15
						},
					},
					lineWidth: 2,
					colors: ['#fff'],
					curveType: 'function',
					pointSize: 5,
					pointShapeType: 'circle',
					pointFillColor: '#f00',
					backgroundColor: {
						fill: '#008ffb',
						strokeWidth: 0,
					},
					chartArea:{
						left:0,
						top:0,
						width:'100%',
						height:'100%'
					},
					fontSize: 11,
					fontName: 'Proxima Nova',
					tooltip: {
						trigger: 'selection',
						isHtml: true
					}
				};

				var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
				chart.draw(dataTable, options);
			}
			$(window).resize(function(){
				drawChart();
				setTimeout(function(){
				}, 1000);
			});
		});


		$(function () {

            // Jquery table editable setting
            $('#table-edit').Tabledit({

                url: 'Suppliers.aspx',
			    columns: {
				    identifier: [0, 'id'],
                    editable: [[1, 'sName'], [2, 'sContactNo'], [3, 'sEmail'], [4, 'sAddress'], [5, 'sUrl'], [6, 'sPersonalNo']]
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

                var supplierData = JSON.stringify(jsonObj);

                try {
                    $.ajax({
                        type: "POST",
                        url: "Suppliers.aspx/UpdateSupplierDetails",
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
                                    title: "Updated!",
                                    text: "Supplier details has been successfully updated !",
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
                        url: "Suppliers.aspx/DeleteRecord",
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
                                    text: "Supplier record has been successfully deleted !",
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

            // Form validation
            $('#insertSuppliersForm').validate({

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

                var supplierData = JSON.stringify({
                    sName : $("#sName").val(),
                    sContactNo : $("#sContactNo").val(),
                    sEmail : $("#sEmail").val(),
                    sAddress : $("#sAddress").val(),
                    sUrl : $("#sUrl").val(),
                    sPersonalNo : $("#sPersonalNo").val(),
                    userName : $("#userName option:selected").val()
                });

                try {
                    $.ajax({
                        type : "POST",
                        url : "Suppliers.aspx/InsertSupplierDetails",
                        data : supplierData,
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
                                    text: "Supplier details has been successfully inserted !",
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
