<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_profile" value="active" />

<c:if test="${empty loggedInUser}">
	<%-- <jsp:forward page="login.jsp"/> --%>
	<%
		response.sendRedirect("login");
	%>
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>New Recipe</title>
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


</head>

<body>
	<div>
		<jsp:include page="header.jsp" />
		<h1>${entered}</h1>
		<br>
		<h1>${entered2}</h1>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="span12">

						<form action="addrecipe" method="post" class="form-horizontal">
							<table style="width: 100%;">
								<tr>
									<td>

										<h3>Recipe Name</h3> <input name="recipeName"
										placeholder="text" style="width: 300px;"/>
										<h3>Recipe Summary</h3> <input name="summary"
										placeholder="text" />
									</td>
								</tr>
								<tr>
									<td>
										<div class="container1">
											<h3>Ingredients</h3>
											<button class="add_form_field">
												Add New Field &nbsp; <span
													style="font-size: 16px; font-weight: bold;">+ </span>
											</button>
											<div>
												<input name="ingredients" placeholder="text" />
											</div>
											<div id="additionalfields"></div>

										</div>
									</td>
									<td>
										<div class="container1">
											<h3>Skus</h3>
<!-- 											<button class="add_form_field">
												Add New Field &nbsp; <span
													style="font-size: 16px; font-weight: bold;">+ </span>
											</button>-->
											<div> 
												<input name="skus" placeholder="text" />
											</div>
											<div id="skufields"></div>

										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="container1">
											<h3>Steps</h3>
											<button class="add_form_field1">
												Add New Field &nbsp; <span
													style="font-size: 16px; font-weight: bold;">+ </span>
											</button>
											<div>
												<input name="steps" placeholder="text" />
											</div>
											<div id="stepfields"></div>

										</div>
									</td>

								</tr>
								<tr>
									<td>
										<button type="submit" id="submit" class="btn btn-danger">Submit</button>
									</td>
								</tr>
							</table>
						</form>

					</div>
				</div>

			</div>




		</section>


		<!-- divider -->
		<div class="row">
			<div class="span12">
				<div class="solidline"></div>
			</div>
		</div>
		<!-- end divider -->


		<jsp:include page="footer.jsp" />
	</div>
	<a href="#" class="scrollup"><i
		class="icon-chevron-up icon-square icon-32 active"></i></a>
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<script src="static/js/dynamicform.js"></script>

	<!-- Template Custom JavaScript File -->
	<script src="static/js/custom.js"></script>

</body>

</html>