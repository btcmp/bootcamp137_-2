<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html style="overflow: hidden;" lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Creative - Bootstrap Admin Template</title>

    <!-- Bootstrap CSS -->    
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="resources/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="resources/css/elegant-icons-style.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">    
    <!-- full calendar css-->
    <link href="resources/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet">
    <link href="resources/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet">
    <!-- easy pie chart-->
    <link href="resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen">
    <!-- owl carousel -->
    <link rel="stylesheet" href="resources/css/owl.carousel.css" type="text/css">
    <link href="resources/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
    <link rel="stylesheet" href="resources/css/fullcalendar.css">
    <link href="resources/css/widgets.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/style-responsive.css" rel="stylesheet">
    <link href="resources/css/xcharts.min.css" rel=" stylesheet"> 
    <link href="resources/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
  <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;display: block;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;padding: 5px 5px 8px 5px;font: 10px arial, san serif;text-align: left;}</style><style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;display: block;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;padding: 5px 5px 8px 5px;font: 10px arial, san serif;text-align: left;}</style></head>

  <body>
  <!-- container section start -->
  <section id="container" class="">
     
      
      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
            <a href="index.html" class="logo">Nice <span class="lite">POS</span></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    <!-- task notificatoin start -->
                    <li id="task_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="icon-task-l">
                            <span class="badge bg-important">6</span>
                        </span></a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 6 pending letter</p>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Design PSD </div>
                                        <div class="percent">90%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="sr-only">90% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">
                                            Project 1
                                        </div>
                                        <div class="percent">30%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                            <span class="sr-only">30% Complete (warning)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Digital Marketing</div>
                                        <div class="percent">80%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Logo Designing</div>
                                        <div class="percent">78%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%">
                                            <span class="sr-only">78% Complete (danger)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Mobile App</div>
                                        <div class="percent">50%</div>
                                    </div>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                            <span class="sr-only">50% Complete</span>
                                        </div>
                                    </div>

                                </a>
                            </li>
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- task notificatoin end -->
                    <!-- inbox notificatoin start-->
                    <li id="mail_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-l"></i>
                            <span class="badge bg-important">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./resources/img/avatar-mini.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Greg  Martin</span>
                                    <span class="time">1 min</span>
                                    </span>
                                    <span class="message">
                                        I really like this admin panel.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./resources/img/avatar-mini2.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Bob   Mckenzie</span>
                                    <span class="time">5 mins</span>
                                    </span>
                                    <span class="message">
                                     Hi, What is next project plan?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./resources/img/avatar-mini3.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Phillip   Park</span>
                                    <span class="time">2 hrs</span>
                                    </span>
                                    <span class="message">
                                        I am like to buy this Admin Template.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./resources/img/avatar-mini4.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Ray   Munoz</span>
                                    <span class="time">1 day</span>
                                    </span>
                                    <span class="message">
                                        Icon fonts are great.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox notificatoin end -->
                    <!-- alert notification start-->
                    <li id="alert_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-l"></i>
                            <span class="badge bg-important">7</span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 4 new notifications</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary"><i class="icon_profile"></i></span> 
                                    Friend Request
                                    <span class="small italic pull-right">5 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-warning"><i class="icon_pin"></i></span>  
                                    John location.
                                    <span class="small italic pull-right">50 mins</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-danger"><i class="icon_book_alt"></i></span> 
                                    Project 3 Completed.
                                    <span class="small italic pull-right">1 hr</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-success"><i class="icon_like"></i></span> 
                                    Mick appreciated your work.
                                    <span class="small italic pull-right"> Today</span>
                                </a>
                            </li>                            
                            <li>
                                <a href="#">See all notifications</a>
                            </li>
                        </ul>
                    </li>
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="resources/img/avatar1_small.jpg">
                            </span>
                            <span class="username">MiniProjectCeria</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i> My Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_mail_alt"></i> My Inbox</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_clock_alt"></i> Timeline</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_chat_alt"></i> Chats</a>
                            </li>
                            <li>
                                <a href="login.html"><i class="icon_key_alt"></i> Log Out</a>
                            </li>
                            <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>
                            <li>
                                <a href="documentation.html"><i class="icon_key_alt"></i> Documentation</a>
                            </li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>      
      <!--header end-->

      <!--sidebar start-->
      <aside>
          <div id="sidebar" class="nav-collapse " style="overflow: hidden;" tabindex="5000">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" href="index.html">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Master Tabel</span>
                          <span class="menu-arrow arrow_carrot-down"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="view-form-employee.html">Employee</a></li>                          
                          <li><a class="" href="view-category.html">Category</a></li>
                          <li><a class="" href="view-supplier.html">Supplier</a></li>
                          <li><a class="" href="view-outlet.html">Outlet</a></li>
                          <li><a class="" href="view-items.html">Item</a>


                      </ul>
                  </li>       
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Purchase</span>
                          <span class="menu-arrow arrow_carrot-down"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="view-tabel-pr.html">Request</a></li>
                          <li><a class="" href="view-tabel-pr-detail.html">Request Detail</a></li>
                          <li><a class="" href="view-tabel-po.html">Order</a></li>
                          <li><a class="" href="view-tabel-po-detail.html">Order Detail</a></li>
                          
                      </ul>
                  </li>
                 <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Adjusment</span>
                          <span class="menu-arrow arrow_carrot-down"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="#adjustment">Adjusment</a></li>
                          <li><a class="" href="view-detail-adjusment.html">Adjusment Detail</a></li>                          
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Transfer Stok</span>
                          <span class="menu-arrow arrow_carrot-down"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="view-transfer-stok.html">transfer Stok</a></li>
                          <li><a class="" href="detailview-transfer-.html">transfer Stok Detail</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_desktop"></i>
                          <span>Sales Order</span>
                          <span class="menu-arrow arrow_carrot-down"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="view-sales-order.html">Sales Order</a></li>
                      </ul>
                  </li>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
              <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
                        <li><i class="fa fa-laptop"></i>Dashboard</li>                          
                    </ol>
                </div>
            </div>
         
              <!-- project team & activity end -->

          </section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section start -->

    <!-- javascripts -->
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/jquery-ui-1.10.4.min.js"></script>
    <script src="resources/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="resources/js/jquery.scrollTo.min.js"></script>
    <script src="resources/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts scripts -->
    <script src="resources/assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="resources/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="resources/js/owl.carousel.js"></script>
    <!-- jQuery full calendar -->
    &lt;<script src="resources/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
    <script src="resources/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
    <!--script for this page only-->
    <script src="resources/js/calendar-custom.js"></script>
    <script src="resources/js/jquery.rateit.min.js"></script>
    <!-- custom select -->
    <script src="resources/js/jquery.customSelect.min.js"></script>
    <script src="resources/assets/chart-master/Chart.js"></script>
   
    <!--custome script for all page-->
    <script src="resources/js/scripts.js"></script>
    <!-- custom script for this page-->
    <script src="resources/js/sparkline-chart.js"></script>
    <script src="resources/js/easy-pie-chart.js"></script>
    <script src="resources/js/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="resources/js/jquery-jvectormap-world-mill-en.js"></script>
    <script src="resources/js/xcharts.min.js"></script>
    <script src="resources/js/jquery.autosize.min.js"></script>
    <script src="resources/js/jquery.placeholder.min.js"></script>
    <script src="resources/js/gdp-data.js"></script>  
    <script src="resources/js/morris.min.js"></script>
    <script src="resources/js/sparklines.js"></script>    
    <script src="resources/js/charts.js"></script>
    <script src="resources/js/jquery.slimscroll.min.js"></script>
  <script>

      //knob
      $(function() {
        $(".knob").knob({
          'draw' : function () { 
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
          $("#owl-slider").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true

          });
      });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
      
      /* ---------- Map ---------- */
    $(function(){
      $('#map').vectorMap({
        map: 'world_mill_en',
        series: {
          regions: [{
            values: gdpData,
            scale: ['#000', '#000'],
            normalizeFunction: 'polynomial'
          }]
        },
        backgroundColor: '#eef3f7',
        onLabelShow: function(e, el, code){
          el.html(el.html()+' (GDP - '+gdpData[code]+')');
        }
      });
    });



  </script>

  

<div id="ascrail2000" class="nicescroll-rails" style="width: 6px; z-index: 1000; background: rgb(247, 247, 247) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; height: 100%; right: 0px; opacity: 0; display: none;"><div style="position: relative; top: 0px; float: right; width: 6px; height: 0px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px;"></div></div><div id="ascrail2000-hr" class="nicescroll-rails" style="height: 6px; z-index: 1000; background: rgb(247, 247, 247) none repeat scroll 0% 0%; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; opacity: 0;"><div style="position: relative; top: 0px; height: 6px; width: 0px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px; left: 0px;"></div></div><div id="ascrail2001" class="nicescroll-rails" style="width: 3px; z-index: auto; background: rgb(247, 247, 247) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; left: 177px; height: 304px; display: block; opacity: 0;"><div style="position: relative; top: 0px; float: right; width: 3px; height: 0px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px;"></div></div><div id="ascrail2001-hr" class="nicescroll-rails" style="height: 3px; z-index: auto; background: rgb(247, 247, 247) none repeat scroll 0% 0%; top: 301px; left: 0px; position: fixed; cursor: default; display: none; width: 177px; opacity: 0;"><div style="position: relative; top: 0px; height: 3px; width: 0px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px; left: 0px;"></div></div><div class="jvectormap-label" style="display: none; left: 855px; top: 272px;">Russia</div><div id="ascrail2002" class="nicescroll-rails" style="width: 6px; z-index: 1000; background: rgb(247, 247, 247) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; height: 100%; right: 0px; display: none;"><div style="position: relative; top: 0px; float: right; width: 6px; height: 0px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px;"></div></div><div id="ascrail2002-hr" class="nicescroll-rails" style="height: 6px; z-index: 1000; background: rgb(247, 247, 247) none repeat scroll 0% 0%; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none;"><div style="position: relative; top: 0px; height: 6px; width: 0px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px;"></div></div><div id="ascrail2003" class="nicescroll-rails" style="width: 3px; z-index: auto; background: rgb(247, 247, 247) none repeat scroll 0% 0%; cursor: default; position: fixed; top: 0px; left: 177px; height: 304px; display: block; opacity: 0;"><div style="position: relative; top: 0px; float: right; width: 3px; height: 220px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px;"></div></div><div id="ascrail2003-hr" class="nicescroll-rails" style="height: 3px; z-index: auto; background: rgb(247, 247, 247) none repeat scroll 0% 0%; top: 301px; left: 0px; position: fixed; cursor: default; display: none; width: 177px; opacity: 0;"><div style="position: relative; top: 0px; height: 3px; width: 180px; background-color: rgb(0, 122, 255); background-clip: padding-box; border-radius: 10px;"></div></div><div class="jvectormap-label">
</div>

<%@ file include = "view-adjustment.jsp" %>
</body>
</html>