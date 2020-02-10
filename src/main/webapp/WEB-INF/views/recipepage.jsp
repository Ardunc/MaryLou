<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>${recipe.name}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="static/css/bootstrap.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="static/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="static/css/jcarousel.css" rel="stylesheet" />
<link href="static/css/flexslider.css" rel="stylesheet" />
<link href="static/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="static/skins/default.css" rel="stylesheet" />
<!-- boxed bg -->
<link id="bodybg" href="bodybg/bg1.css" rel="stylesheet" type="text/css" />
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

<style type="text/css">
img {
	border-radius: 50%;
}
</style>
</head>

<body>
	<div id="wrapper">
		<!-- toggle top area -->
		<div class="hidden-top">
			<div class="hidden-top-inner container">
				<div class="row">
					<div class="span12">
						<ul>
							<li><strong>We are available for any custom works
									this month</strong></li>
							<li>Main office: Springville center X264, Park Ave S.01</li>
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


		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>${recipe.name}</h2>
						</div>
					</div>

				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">

					<c:if test="${not empty loggedInUser}">

						<c:if test="${not empty activerecipe.image}">
							<img
								src="static/img/recipe/${activerecipe.recipeid}/recipe/${activerecipe.image}"
								alt="Profile Image"
								style="height: 300px; width: 300px; object-fit: cover; position: absolute; right: 0%;">
							<span><a href="#"
								style="position: absolute; right: 85px; top: 325px;"
								modal" data-target="#add-images" class="btn btn-danger">
									Change Photo <i class="fa fa-pencil"></i>
							</a></span>

						</c:if>

						<span class="text-danger text-center">${error}</span>
						<%-- 						<c:if test="${not empty activerecipe.image}">
							
						</c:if> --%>
						<c:if test="${empty activerecipe.image}">
							<a href="#" data-toggle="modal" data-target="#add-images"
								class="btn btn-danger"> Add Image</a>
						</c:if>
					</c:if>
					<c:if test="${empty loggedInUser}">
						<img
							src="static/img/recipe/${activerecipe.recipeid}/recipe/${activerecipe.image}"
							alt="Recipe Image"
							style="height: 300px; width: 300px; object-fit: cover; position: absolute; right: 0%;">
					</c:if>
					<h1>${error}${success}</h1>
					<div class="span9">
						<div class="span8">
							<h2>${activerecipe.summary}</h2>

							<h2>Ingredients:</h2>
							<br>
							<table>
								<tr>
									<td><c:forEach var="item" items="${ingredients}">
											<p>${item}</p>
										</c:forEach></td>
									<td>
									<c:forEach var="item" items="${prices}">
									<p>${item}</p>
									</c:forEach>
									</td>
									<td>								
										<c:forEach var="item2" items="${urls}">
											<button onclick="window.open('${item2}', '_blank')" 
												type="button">Walmart.com Link</button><br>
										</c:forEach>
									
									</td>
								</tr>
							</table>
							<br> <br>
							<h2>Instructions:</h2>
							<br>
							<c:forEach var="item" items="${instructions}">
								<p>${item}</p>
							</c:forEach>
							<br> <br> <a
								href="deleterecipe?recipeid=${activerecipe.recipeid}"
								onclick="confirmed(); return false;"> <i class="icon-trash"></i></a>
						</div>
					</div>
				</div>
			</div>



			<div id="add-images" class="modal styled hide fade" tabindex="-1"
				role="dialog" aria-labelledby="mySignupModalLabel"
				aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="text-center" id="mySignupModalLabel">
						Add <strong>Pictures</strong>
					</h4>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" action="addrecipeimages"
						method="POST" class="form-horizontal">
						<div class="control-group">

							<div class="controls">
								<label>Please select:</label> <input type="hidden"
									name="recipeid" value="${activerecipe.recipeid}"> <input
									id="file" type="file" id="two2" name="file">
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn">Upload</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>




		<jsp:include page="footer.jsp" />
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