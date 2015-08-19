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

		<!--- Main --->
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/main.css?v=1" />

		<!--- Prism --->
		<link rel="stylesheet" href="#cb.layoutRoot()#/includes/css/prism.css?v=1" />

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

		<!--- RSS Stuff --->
		<link rel="alternate" type="application/rss+xml" title="Recent Updates" href="#cb.linkRSS()#" />
		<cfif cb.isEntryView()>
			<link rel="alternate" type="application/rss+xml" title="Entry's Recent Comments" href="#cb.linkRSS(comments=true,entry=cb.getCurrentEntry())#" />
		</cfif>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeHeadEnd")#
	</head>
	<body>
		<div id="wrapper">
			<!--- ContentBoxEvent --->
			#cb.event("cbui_afterBodyStart")#

				#cb.quickView(view='_header')#
				<div class="infoHeader">
					<h1 class="mobile-title">Nathanial Welsh</h1>
					<ul>
						<li><i class="fa fa-search fa-2x"></i></li>
						<li class="search-list">#cb.quickView("_search")#
						<li class="site-banner"><a href="index.cfm">Nathanial Welsh</a></li>
					</ul>
				</div>

				<!--- <cfif not getPlugin("messagebox").isEmpty()>
					<div class="row-fluid">
						<div class="span12">
							#cb.getPlugin("messagebox").renderit()#
						</div>
					</div>
				</cfif> --->
				<div id="page-content-wrapper">
					<div class="row-fluid">
						<!--- ContentBoxEvent --->
						#cb.event("cbui_beforeContent")#

						<!--- Content --->
						#renderView()#

						<!--- ContentBoxEvent --->
						#cb.event("cbui_afterContent")#
					</div>
				</div>
				<hr>

				#cb.quickView(view='_footer')#
		</div>
	</body>

	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/jquery.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/d3.min.js"></script>
	<script type="text/javascript" src="#cb.layoutRoot()#/includes/js/prism.js"></script>
	
	<script>
	    $("##menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("##wrapper").toggleClass("toggled");
	    });
    </script>
</html>
</cfoutput>
