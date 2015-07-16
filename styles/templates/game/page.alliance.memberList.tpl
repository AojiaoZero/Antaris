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
	</ul></div><div id="div_alliance"><div class="categorie">	<h2>{$LNG.ls_alliance_85} <span class="couleur_alliance">[{$ally_tag}]</span></h2>		<table style="border-bottom : 1px solid black;">			
	{foreach $memberList as $userID => $memberListRow}
	
	<tr>				<td style="text-align : center; width : 8%; vertical-align : middle;">
											<img class="arrondi" src="/media/files/{$memberListRow.avatar}" style="width : 35px; height : 35px; cursor : pointer;"
											onclick="location.href='game.php?page=playerCard&id={$userID}';" 					onmouseover="montre('{$LNG.ls_click_1} !');" onmouseout="cache();" />				</td>				<td style="text-align : left; width : 31%; vertical-align : middle;">
											<b>{$LNG.ti_userna} :</b> {$memberListRow.username}<br />
											{if $rights.MEMBERLIST}{if $memberListRow.onlinetime < 4}<span class="vert">{$LNG.al_memberlist_on}</span>{elseif $memberListRow.onlinetime <= 15}<span class="jaune">{$memberListRow.onlinetime} {$LNG.al_memberlist_min}</span>{else}<span class="rouge">{$LNG.al_memberlist_off}</span>{/if}{else}-{/if} ({$memberListRow.onlinetimebis})
										</td>				<td style="text-align : left; width : 24%; vertical-align : middle;">
											<b>{$LNG.ls_alliance_90} : </b><span class="couleur_theme">{$memberListRow.points}</span><br />
											<b>{$LNG.ls_overview_33} : </b><span class="couleur_theme">{$memberListRow.total_rank}</span> / {$total_usr}
										</td>				<td style="text-align : left; width : 26%; vertical-align : middle;"><b>Rank : </b><a href="game.php?page=alliance&mode=changerank&memberID={$userID}" title="Le renvoyer">{$memberListRow.rankName}</a><br />					{$LNG.ls_alliance_86} {$memberListRow.register_time}
										</td>				<td style="text-align : left; width : 11%; vertical-align : middle;">					<a class="cyan" onclick="location.href='game.php?page=messages&mode=write&id={$userID}';">{$LNG.ls_alliance_87}</a><br />			
{if $canKick}										<a onclick="location.href='game.php?page=alliance&amp;mode=admin&amp;action=membersKick&amp;id={$userID}';" class="rouge" title="{$LNG.ls_alliance_88}.">{$LNG.ls_alliance_89}</a>{else}-{/if}				</td>			</tr>		
										{/foreach}
										
										
										</table></div></div></div>                    <!-- Fin du corps -->
{/block}