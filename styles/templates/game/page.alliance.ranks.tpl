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
	{if $rights.MANAGEAPPLY}<li><a href="?page=alliance&mode=recruitAlly" title="{$LNG.ls_alliance_33}">{$LNG.ls_alliance_32}</a></li>	{/if}	
	{if $rights.MEMBERLIST}<li><a href="?page=alliance&mode=memberList" title="{$LNG.ls_alliance_35}">{$LNG.ls_alliance_34}</a></li>		{/if}
	{if $rights.ROUNDMAIL}<li><a href="?page=alliance&mode=circular" title="{$LNG.ls_alliance_37}">{$LNG.ls_alliance_36}</a></li>	{/if}
	{if $rights.ADMIN}<li><a href="?page=alliance&mode=leaveAlly" title="{$LNG.ls_alliance_38}">{$LNG.ls_alliance_39}</a></li>{else}<li><a href="?page=alliance&mode=close" title="{$LNG.ls_alliance_38}">{$LNG.ls_alliance_40}</a></li>	{/if}
	</ul>
	</div>

	
	<div id="div_alliance">
	<div class="categorie">
	<h2>{$LNG.ls_alliance_41}</h2>	
	
	
	<table id="table_rang" style="width : 674px; margin-bottom : 15px;">
	<form action="game.php?page=alliance&amp;mode=admin&amp;action=permissionsSend" method="post">
<input type="hidden" value="1" name="send">
	<tr>
	<td style="width : 165px;"> </td>	
	{foreach $avalibleRanks as $rankName}
	
		<td style="width : 47px;"><img onmouseout="cache();" onmouseover="montre('{$LNG.$rankName}')" src="styles/resource/images/alliance/{$rankName}.png" alt="" width="16" height="16"></td>
		
		{/foreach}
	<td style="width : 170px; text-align : left; padding-left : 15px;">				</td>	
	
	</tr>
	

	{foreach $rankList as $rankID => $rankRow}
	<tr>			
	
	<td style="width : 165px;">{$rankRow.rankName}  : </td>	
	{foreach $avalibleRanks as $rankName}
	<input type="hidden" name="rank[{$rankID}][name]" value="{$rankRow.rankName}">
	<td style="width : 47px;"><input type="checkbox" class="droit_rang" name="rank[{$rankID}][{$rankName}]" value="1"{if $rankRow[$rankName]} checked{/if}{if !$ownRights[$rankName]} disabled{/if}></td>	
	{/foreach}
			

	<td style="width : 170px; text-align : left; padding-left : 15px;">				<a href="game.php?page=alliance&amp;mode=admin&amp;action=permissionsSend&amp;deleteRank={$rankID}" class="orange">{$LNG.ls_alliance_42}</a>			</td>	
	</tr>	
	{/foreach}
	</table>	
	
	
	<div class="gris">		{$LNG.ls_alliance_43}	</div>
	{if $CountHowMuch != 0}
	<input type="submit" id="valid_form_creer_rang" name="valid_form_creer_rang" value="{$LNG.ls_alliance_44}" />{/if}</div>
	
	</form>
	
	<div class="categorie">	<h2>{$LNG.ls_alliance_45}</h2>	{$LNG.ls_alliance_46}.	<br /><br />
	<form id="form_creer_rang" action="game.php?page=alliance&amp;mode=admin&amp;action=permissionsSend" method="post">
	<label for="nom_rang">{$LNG.ls_alliance_47} : </label>		<input type="text" id="nom_rang" name="newrank[rankName]" style="margin-right : 10px; margin-left : 10px;" value="" size="20" maxlength="20" required/>		<input type="submit" id="valid_form_creer_rang" name="valid_form_creer_rang" value="{$LNG.al_create}" />	</form></div></div></div>    
	{/block}