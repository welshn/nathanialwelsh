﻿<cfoutput>
<div class="hotdog-wrapper">
	<a href="##menu-toggle" id="menu-toggle"><i class="fa fa-bars fa-2x hotdog"></i></a>
</div>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<cfset menuData = cb.rootMenu(type="data",levels="*")>
		<cfloop array="#menuData#" index="menuItem">
			<cfif !cb.isBlogView() and !cb.isSearchView() and event.buildLink(cb.getCurrentPage().getSlug()) eq menuItem.link>
				<li class="active">
			<cfelse>
				<li>
			</cfif>
				<a href="#menuItem.link#">#menuItem.title#</a>
			</li>
		</cfloop>

		<cfif ( !prc.cbSettings.cb_site_disable_blog )>
			<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
				<a href="#event.buildLink('blog')#">Blog</a>
			</li>
		</cfif>

		<div class="motto">
			<h2>Observe<br>
			Adapt<br>
			Overcome</h2>
		</div>
	</ul>
	<!--- 			<cfif structKeyExists(menuItem, "subPageMenu")>
					<li class="">
						<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</b></a>
						#buildSubMenu(menuItem.subPageMenu)#
					</li>
				<cfelse> --->
	<!--- Blog Search Form --->
	<!--- <cfif ( !prc.cbSettings.cb_site_disable_blog )>
		<form id="searchForm" class="navbar-search pull-right" name="searchForm" method="post" action="#cb.linkSearch()#">
			<input type="text" class="search-query span2" placeholder="Search">
		</form>
	</cfif> --->
</div>
</cfoutput>

<!--- <cfscript>
	public any function buildSubMenu(menuData) {
		var menu = '<ul class="dropdown-menu">';
		for(var menuItem in arguments.menuData){
			if(!structKeyExists(menuItem, "subPageMenu")){
				menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
			} else {
				menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
				menu &= buildSubMenu(menuItem.subPageMenu);
				menu &= '</li>';
			}
		}
		menu &= '</ul>';

		return menu;
	}
</cfscript> --->
