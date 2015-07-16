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
	
	<div class="categorie">	<h2>{$LNG.ls_alliance_68}</h2>	{$LNG.ls_alliance_69}.<br />
							{$LNG.ls_alliance_70}.	<br /><br />	<form id="form_ceder" action="game.php?page=alliance&amp;mode=admin&amp;action=transfer" method="post"> 		<label for="id_joueur">{$LNG.ls_alliance_71} : </label>		{html_options name=newleader options=$transferUserList}		<input type="submit" id="valid_form_ceder" name="valid_form_ceder" value="{$LNG.ls_alliance_72}" />	</form></div>
	
	<div class="categorie">	<h2>{$LNG.ls_alliance_73}</h2>	{$LNG.ls_alliance_74}.<br />	{$LNG.ls_alliance_75}.<br /><br />	
	
	<form id="form_suppr_alliance" action="game.php?page=alliance&mode=leaveAlly" method="post">		<input type="submit" id="valid_form_suppr_alliance" name="valid_form_suppr_alliance" value="{$LNG.ls_alliance_76}" />	</form>
	
	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}

