{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_alliance}</h1>
<div class="onglet">
<ul>		

	<li><a href="?page=alliance" title="{$LNG.ls_alliance_26}">{$LNG.ls_alliance_25}</a></li>
	{if $rights.ADMIN}<li><a href="?page=alliance&mode=admin" title="{$LNG.ls_alliance_27}">{$LNG.ls_alliance_27}</a></li>{/if}
	<li><a href="?page=alliance&mode=pactes" title="{$LNG.ls_alliance_29}">{$LNG.ls_alliance_28}</a></li>	
	{*{if $rights.ADMIN}<li><a title="Management wars">War <span class="blanc">(0)</span></a></li>{/if}*}
	{if $rights.RANKS}<li><a href="?page=alliance&mode=ranksissue" title="{$LNG.ls_alliance_30}">{$LNG.ls_alliance_31}</a></li>		{/if}
	{if $rights.MANAGEAPPLY}<li><a href="?page=alliance&mode=recruitAlly" title="{$LNG.ls_alliance_33}t">{$LNG.ls_alliance_32}</a></li>	{/if}	
	{if $rights.MEMBERLIST}<li><a href="?page=alliance&mode=memberList" title="{$LNG.ls_alliance_35}">{$LNG.ls_alliance_34}</a></li>		{/if}
	{if $rights.ROUNDMAIL}<li><a href="?page=alliance&mode=circular" title="{$LNG.ls_alliance_37}">{$LNG.ls_alliance_36}</a></li>	{/if}
	{if $rights.ADMIN}<li><a href="?page=alliance&mode=leaveAlly" title="{$LNG.ls_alliance_38}">{$LNG.ls_alliance_39}</a></li>{else}<li><a href="?page=alliance&mode=close" title="{$LNG.ls_alliance_38}">{$LNG.ls_alliance_40}</a></li>	{/if}
	</ul>


</div><div id="div_alliance"><div class="categorie">	<h2>{$LNG.ls_alliance_81} <span class="couleur_theme">{$usernames}</span></h2>
							<p>{$LNG.ls_alliance_82}.</p>
							<form id="form_chg_rang" action="" method="post">
							<input name="memberID" value="{$memberID}" type="hidden">
								<label style="display : inline-block; margin-right : 40px;" for="nouveau_rang">{$LNG.ls_alliance_83} : </label>
							

							<select id="nouveau_rang" name="nouveau_rang" style="min-width : 120px;">
							
							{foreach $rankList as $rankID => $rankRow}
							<option value="{$rankID}">{$rankRow.rankName}</option>
							{/foreach}
							
							
							
							
							
							
								</select>
								<br><br>
								<input style="margin-right : 8px;" id="valid_form_chg_rang" name="valid_form_chg_rang" value="{$LNG.ls_alliance_84}" type="submit">
							</form>
						</div></div></div>                  


								
{/block}
