<cfoutput>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_prePageDisplay")#

	<!--- top gap --->
	<div class="post-top-gap"></div>

	<!--- search Results --->
	<div>
		<!--- Search Results --->
		#cb.getSearchResultsContent()#

		<!--- Search paging --->
		#cb.quickSearchPaging()#
	</div>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_postPageDisplay")#

</cfoutput>