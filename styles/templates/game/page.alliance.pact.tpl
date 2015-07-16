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
	</ul></div><div id="div_alliance">
	{if $rights.DIPLOMATIC}
	<div class="categorie">	<h2>{$LNG.ls_alliance_64}</h2>	{$LNG.ls_alliance_65}.<br>
						{$LNG.ls_alliance_66}.<br><br>	<div id="resultat_pacte">		<form id="form_pacte" method="post" action="">			<label for="tag_pacte" style="margin-right : 20px;">{$LNG.ls_alliance_15} :</label>			<input id="tag_pacte" name="tag_pacte" size="8" maxlength="6" style="margin-right : 20px;" type="text">			<input id="valid_tag_pacte" name="valid_tag_pacte" value="{$LNG.ls_alliance_17}" type="submit">		</form>	</div></div>{/if}
						
						
						
						{*<div class="categorie">
						<h2>List of accepted and pending pacts</h2>	Your alliance has no pact with other alliances.</div>*}
						
						<div class="categorie">	<h2>{$LNG.ls_alliance_67}</h2><div style="width : 90%; margin : 0px auto; border-bottom : 1px solid black;">	<table style="width : 100%; margin : 0px auto;">		<tbody>
						
						{foreach $diploList.0 as $diploMode => $diploAlliances}	
						{if !empty($diploAlliances)}
						{foreach $diploAlliances as $diploID => $diploName}
						{$diploName}
						{/foreach}
						{/if}
						{/foreach}
						
						{if array_filter($diploList.1)}
						{foreach $diploList.1 as $diploMode => $diploAlliances}	
						{if !empty($diploAlliances)}
						{foreach $diploAlliances as $diploID => $diploName}
						{$diploName}
						{/foreach}
						{/if}
						{/foreach}
						{/if}
					
						{if array_filter($diploList.2)}
						{foreach $diploList.2 as $diploMode => $diploAlliances}	
						{if !empty($diploAlliances)}
						{foreach $diploAlliances as $diploID => $diploName}
						{$diploName}
						{/foreach}
						{/if}
						{/foreach}
						{/if}
									
									
									</tbody></table></div></div>
						
						
						</div></div>                    <!-- Fin du corps -->
            
{/block}
