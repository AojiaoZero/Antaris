{block name="title" prepend}{$LNG.lm_statistics}{/block}
{block name="content"}
<div id="page_contenu">


<h1>Server statistics</h1>
<div class="categorie">	
<h2>Search Criteria</h2>
	
	
	<form name="stats" id="stats" method="post" action="">

	<label for="type" style="margin-right : 10px;">Ranking : </label>	
	 <select name="who" id="who" onchange="$('#stats').submit();">{html_options options=$Selectors.who selected=$who}</select>
	
	<label for="ordre_champ" style="margin-right : 10px;">Sort by : </label>	
	<select name="type" id="type" onchange="$('#stats').submit();">
	{if $who == 1}
	{html_options options=$Selectors.type selected=$type}
	{else}
	{html_options options=$Selectors.type2 selected=$type}
	{/if}
	</select>
	
	<label for="top" style="margin-right : 10px;">Top : </label>
	<select name="range" id="range" onchange="$('#stats').submit();">{html_options options=$Selectors.range selected=$range}</select>
	
	<input type="submit" id="valid_form" name="valid_form" value="Display" />

	</form>
	</div>
	<div class="categorie">	
	
	<h2>Results </h2>




{if $who == 1}
	{include file="shared.statistics.playerTable.tpl"}
{elseif $who == 2}
	{include file="shared.statistics.allianceTable.tpl"}
{/if}
{/block}