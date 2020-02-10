<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Mary Lou Homepage</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="static/css/bootstrap.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="static/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="static/css/jcarousel.css" rel="stylesheet" />
<link href="static/css/flexslider.css" rel="stylesheet" />
<link href="static/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="ico/favicon.png" />

<!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
	<div id="wrapper">
		<!-- toggle top area -->
		<div class="hidden-top">
			<div class="hidden-top-inner container">
				<div class="row">
					<div class="col-12">
						<ul>
							<li><strong>Alex R Duncan</strong></li>
							<li>Full Stack Java Developer</li>
							<li>Call us <i class="icon-phone"></i> (123) 456-7890 -
								(123) 555-7891
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end toggle top area -->
		<!-- start header -->
		<jsp:include page="header.jsp" />
		<!-- end header -->
		<section id="featured">
			<!-- start slider -->
			<!-- Slider -->
			<div id="nivo-slider">
				<div class="nivo-slider">
					<!-- Slide #1 image -->
					<img src="static/img/slides/nivo/food1.jpg" alt=""
						title="#caption-1"/>
					<!-- Slide #2 image -->
					<img src="static/img/slides/nivo/food2.jpg" alt=""
						title="#caption-2"/>
					<!-- Slide #3 image -->
					<img src="static/img/slides/nivo/food3.jpg" alt=""
						title="#caption-3"/>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-12">
							<!-- Slide #1 caption -->
							<div class="nivo-caption" id="caption-1">
								<div>
									<h2>
										Health <strong>conscious</strong>
									</h2>
									<p>It is health that is real wealth and not pieces of gold and silver. -Mahatma Gandhi</p>
								
								</div>
							</div>
							<!-- Slide #2 caption -->
							<div class="nivo-caption" id="caption-2">
								<div>
									<h2>
										Easy to <strong>use</strong>
									</h2>
									<p>Find all the recipes you need in one convenient place!</p>
								</div>
							</div>
							<!-- Slide #3 caption -->
							<div class="nivo-caption" id="caption-3">
								<div>
									<h2>
										Perfect for <strong>meal prep</strong>
									</h2>
									<p>Make all your meals for the week at once and save time and money!</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end slider -->
		</section>
		<section class="callaction">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="big-cta">
							<div class="cta-text">
								<h3>
									We've created more than <col- class="highlight"><strong>3
											recipes</strong></col-> this year!
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">

				<!-- divider -->
				<div class="row">
					<div class="col-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
				<!-- Portfolio Projects -->
				<div class="row">
					<div class="col-12">
						<h4 class="heading">
							Some of our recent <strong>recipes</strong>
						</h4>
						<div class="row">
							
									<!-- Item Project and Filter Name -->
									<c:forEach var="item" items="${recipedb}"> 
									
									<div class="card col-3" style="width: 18rem; height: 33rem;">
										
										<img class="card-img-top" style="height: 16rem; object-fit: cover; margin-top: 1rem;"src="static/img/recipe/${item.recipeid}/recipe/${item.image}" alt="${item.name}">
										
										<div class="card-body">
											<h5 class="card-title">${item.name}</h5>
											<p class="card-text" style="overflow: hidden; text-overflow:ellipsis; ">${item.summary}</p>
											<a class="btn btn-success" style="position: absolute; right: 1rem; bottom: 1rem;" href="recipepage?recipeid=${item.recipeid}">View Recipe</a>
									
										</div>
									</div>
									</c:forEach>
						</div>
					</div>
				</div>
				<!-- End Portfolio Projects -->
				<!-- divider -->
				<div class="row">
					<div class="col-12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->
				<div class="row">

				</div>
			</div>
		</section>
		<section id="bottom">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="aligncenter">
							<div id="twitter-wrapper">
								<div id="twitter"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		

<footer>
      <div class="container">
        <div class="row">
          <div class="col-3">
            <div class="widget">
              <h5 class="widgetheading">Browse pages</h5>
              <ul class="link-list">
                <li><a href="#">About our company</a></li>
                <li><a href="#">Our services</a></li>
                <li><a href="#">Meet our team</a></li>
                <li><a href="#">Explore our portfolio</a></li>
                <li><a href="#">Get in touch with us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-3">
            <div class="widget">
              <h5 class="widgetheading">Important stuff</h5>
              <ul class="link-list">
                <li><a href="#">Press release</a></li>
                <li><a href="#">Terms and conditions</a></li>
                <li><a href="#">Privacy policy</a></li>
                <li><a href="#">Career center</a></li>
                <li><a href="#">Flattern forum</a></li>
              </ul>
            </div>
          </div>
          <div class="col-3">
            <div class="widget">
              <h5 class="widgetheading">Flickr photostream</h5>
              <div class="flickr_badge">
                <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
              </div>
              <div class="clear">
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="widget">
              <h5 class="widgetheading">Get in touch with us</h5>
              <address>
								<strong>Flattern studio, Pte Ltd</strong><br>
								 Springville center X264, Park Ave S.01<br>
								 Semarang 16425 Indonesia
					 		</address>
              <p>
                <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891 <br>
                <i class="icon-envelope-alt"></i> email@domainname.com
              </p>
            </div>
          </div>
        </div>
      </div>
      <div id="sub-footer">
        <div class="container">
          <div class="row">
            <div class="col-6">
              <div class="copyright">
                <p>
                  <col->&copy; Flattern - All right reserved.</col->
                </p>
                <div class="credits">
                  <!--
                    All the links in the footer should remain intact.
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Flattern
                  -->
                  Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
              </div>
            </div>
            <div class="col-6">
              <ul class="social-network">
                <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-facebook icon-square"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-twitter icon-square"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-linkedin icon-square"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Pinterest"><i class="icon-pinterest icon-square"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Google plus"><i class="icon-google-plus icon-square"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
	</div>
	<a href="#" class="scrollup"><i
		class="icon-chevron-up icon-square icon-32 active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="static/js/jquery.js"></script>
	<script src="static/js/jquery.easing.1.3.js"></script>
	<script src="static/js/bootstrap.js"></script>
	<script src="static/js/jcarousel/jquery.jcarousel.min.js"></script>
	<script src="static/js/jquery.fancybox.pack.js"></script>
	<script src="static/js/jquery.fancybox-media.js"></script>
	<script src="static/js/google-code-prettify/prettify.js"></script>
	<script src="static/js/portfolio/jquery.quicksand.js"></script>
	<script src="static/js/portfolio/setting.js"></script>
	<script src="static/js/jquery.flexslider.js"></script>
	<script src="static/js/jquery.nivo.slider.js"></script>
	<script src="static/js/modernizr.custom.js"></script>
	<script src="static/js/jquery.ba-cond.min.js"></script>
	<script src="static/js/jquery.slitslider.js"></script>
	<script src="static/js/animate.js"></script>

	<!-- Template Custom JavaScript File -->
	<script src="static/js/custom.js"></script>

</body>
</html>
