<cfoutput>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>
		<cfif cb.isEntryView()>
			#cb.getCurrentEntry().getTitle()#
		<cfelse>
			#cb.siteName()# - #cb.siteTagLine()#
		</cfif>
		</title>
		<meta name="generator" 	 content="ContentBox powered by ColdBox" />
		<meta name="robots" 	 content="index,follow" />
		<meta name="description" content="">
		<meta name="author" content="">
		<!--- Meta per page or index --->
		<cfif cb.isEntryView() AND len(cb.getCurrentEntry().getHTMLDescription())>
			<meta name="description" content="#cb.getCurrentEntry().getHTMLDescription()#" />
		<cfelse>
			<meta name="description" content="#HTMLEditFormat( cb.siteDescription() )#" />
		</cfif>
		<cfif cb.isEntryView() AND len(cb.getCurrentEntry().getHTMLKeywords())>
			<meta name="keywords" 	 content="#cb.getCurrentEntry().getHTMLKeywords()#" />
		<cfelse>
			<meta name="keywords" 	 content="#cb.siteKeywords()#" />
		</cfif>

		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--- Base HREF For SES URLs based on ColdBox--->
		<base href="#getSetting('htmlBaseURL')#" />

		<!--- Bootstrap --->
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/bootstrap.min.css?v=1" />
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/main.css?v=1" />

		<!--- Font Awesome --->
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/font-awesome.min.css" />

		<!--- Minify & Cache Our Assets --->
		<!--- <cfif cb.layoutsetting('minifyCacheAssets',true)>
			<!--- Use LESS --->
			<cfif cb.layoutsetting('useLESS',true)>
				#cb.minify(assets="#cb.layoutRoot()#/includes/css/less/blog.less,#cb.layoutRoot()#/includes/css/less/messagebox.less,#cb.layoutRoot()#/includes/css/less/paging.less,#cb.layoutRoot()#/includes/css/less/breadcrumbs.less", location="#cb.layoutRoot()#/includes/css")#
			<cfelse>
				#cb.minify(assets="#cb.layoutRoot()#/includes/css/main.css", location="#cb.layoutRoot()#/includes/css")#
			</cfif>
		<cfelse>
			<!--- Include our unminified, unLESSified, non cached version of the stylesheet --->
			<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/main.css?v=1" />
		</cfif> --->

		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeHeadEnd")#
	</head>
	<body>
		<div id="wrapper">
			#cb.quickView(view='_header')#
			<div class="infoHeader">
				<h1 class="mobile-title">Nathanial Welsh</h1>
				<ul>
					<li><i class="fa fa-search fa-2x"></i></li>
					<li class="search-list">#cb.quickView("_search")#
					<li class="site-banner">Nathanial Welsh</li>
				</ul>
			</div>
			<!-- Full Page Image Background Carousel Header -->
			<cfif cb.getCurrentPage().getSlug() EQ cb.getHomePage()>
				<header id="myCarousel" class="carousel slide">
					<div class="carousel-inner">
						<div class="item active">
							<div class="fill" style="background-image:url(#cb.layoutRoot()#/includes/img/storm.jpg);"></div>
							<!--- <div class="carousel-caption">
								<h2>Code It</h2>
							</div> --->
						</div>
						<div class="item">
							<div class="fill" style="background-image:url(#cb.layoutRoot()#/includes/img/mboard.jpg);"></div>
							<!--- <div class="carousel-caption">
								<h2>Build It</h2>
							</div> --->
						</div>
						<div class="item">
							<div class="fill" style="background-image:url(#cb.layoutRoot()#/includes/img/space.jpg);"></div>
							<!--- <div class="carousel-caption">
								<h2>Launch It</h2>
							</div> --->
						</div>
					</div>

					<a class="left carousel-control" href="##myCarousel" data-slide="prev">
						<span class="icon-prev"></span>
					</a>
					<a class="right carousel-control" href="##myCarousel" data-slide="next">
						<span class="icon-next"></span>
					</a>

				</header>
			</cfif>

			<div id="page-content-wrapper">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_afterBodyStart")#
				<!--- <cfif not getPlugin("messagebox").isEmpty()>
					<div class="row-fluid">
						<div class="span12">
							#cb.getPlugin("messagebox").renderit()#
						</div>
					</div>
				</cfif> --->

				<!--- breadcrumbs only if not home page. --->
				<!--- <cfif cb.getCurrentPage().getSlug() NEQ cb.getHomePage()>
					<div class="row-fluid">
						<div class="col-md-12">
							<div class="breadcrumb"><a href="#cb.linkHome()#">Home</a> #cb.breadCrumbs(separator="<span class='divider'>/</span>")#</div>
						</div>
					</div>
				</cfif> --->
				<div class="row-fluid">
					<!--- ContentBoxEvent --->
					#cb.event("cbui_beforeContent")#

					<!--- Content --->
					#renderView()#

					<!--- ContentBoxEvent --->
					#cb.event("cbui_afterContent")#
				</div>
			</div>
			#cb.quickView(view='_footer')#
		</div>


	</body>

	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/jquery.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/d3.min.js"></script>

	<script>
	    $("##menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("##wrapper").toggleClass("toggled");
	    });
    </script>
	<script>
		$('.carousel').carousel({
			interval: 10000 //changes the speed
		})
	</script>
</html>
</cfoutput>
