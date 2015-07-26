<cfoutput>
<div class="search">
    <form id="searchForm" name="searchForm" method="post" action="#cb.linkContentSearch()#">
      <label>
      	<input name="q" type="text" class="keywords" id="textfield" maxlength="50" value="#cb.getSearchTerm()#" onclick="this.value=''" placeholder="Search..." />
        <!--- <input name="b" type="submit" value="Search" class="btn" style="position: relative; top: -6px;" /> --->
      </label>
    </form>
</div>
</cfoutput>