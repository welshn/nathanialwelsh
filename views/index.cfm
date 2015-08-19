<cfoutput>
	<div class="col-md-9 content-blog">
		<!--- top gap --->
		<div class="post-top-gap"></div>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_preIndexDisplay")#

		<!--- Are we filtering by category? --->
		<cfif len(rc.category)>
			<div class="buttonBar">
				<button class="button2" onclick="return to('#cb.linkHome()#')" title="Remove filter and view all entries">Remove Filter</button>
			</div>
			<div class="infoBar">
				Category Filtering: '#rc.category#'
			</div>
			<br/>
		</cfif>

		<!--- Are we searching --->
		<cfif len(rc.q)>
			<div class="buttonBar">
				<button class="button2" onclick="return to('#cb.linkHome()#')" title="Clear search and view all entries">Clear Search</button>
			</div>
			<div class="infoBar">
				Searching by: '#rc.q#'
			</div>
			<br/>
		</cfif>

		#cb.quickEntries()#

		<cfif prc.entriesCount>
			<div class="contentBar">#cb.quickPaging()#</div>
		</cfif>

		<!--- ContentBoxEvent --->
		#cb.event("cbui_postIndexDisplay")#

	</div>

	<div class="col-md-3">
		<div class="well">
			#cb.quickView(view='_blogsidebar')#
		</div>
	</div>

</cfoutput>
