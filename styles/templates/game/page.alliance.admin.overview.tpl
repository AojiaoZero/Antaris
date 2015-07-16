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
	</ul></div><div id="div_alliance"><div class="categorie centre">	<h2>{$LNG.ls_alliance_91}</h2>	
	


	<form id="form_info" method="post" action="game.php?page=alliance&mode=admin">
	<input type="hidden" name="send" value="1">
	<table style="margin : 0px auto 10px auto; width : 75%;">		
	
	
	<tr>			<td style="text-align : left; width : 50%;"><label onmouseover="montre('{$LNG.ls_alliance_92}.');" onmouseout="cache();" for="nom">{$LNG.ls_alliance_6} <sup>(?)</sup> :</label></td>			<td style="text-align : left; width : 50%;"><input type="text" id="nom" name="ally_name" maxlenght="25" size="25" value="{$ally_name}" /></td>		</tr>



	<tr>			<td style="text-align : left;"><label onmouseover="montre('{$LNG.ls_alliance_7}');" onmouseout="cache();" for="tag">TAG <sup>(?)</sup> :</label></td>			<td style="text-align : left;"><input type="text" id="tag" name="ally_tag" maxlenght="6" size="8" value="{$ally_tag}" /></td>		</tr>	

	<tr>			<td style="text-align : left;"><label onmouseover="montre('{$LNG.ls_alliance_93}.');" onmouseout="cache();" for="logo">{$LNG.ls_alliance_94} <sup>(?)</sup> :</label></td>			<td style="text-align : left;"><input type="text" id="logo" name="image" maxlenght="255" size="45" value="{$ally_image}" /></td>		</tr>	

	<tr>			<td style="text-align : left;"><label for="lien">{$LNG.ls_alliance_95} :</label></td>			<td style="text-align : left;"><input type="text" id="lien" name="web" maxlenght="150" size="45" value="{$ally_web}" /></td>		</tr>

	<tr>			<td style="text-align : left;"><label for="defcon">DEFCON :</label></td>			<td style="text-align : left;">				<select id="defcon" name="defcon"><option value="1" >{$LNG.ls_alliance_96} n°1</option><option value="2" >{$LNG.ls_alliance_96} n°2</option><option value="3" >{$LNG.ls_alliance_96} n°3</option><option value="4" >{$LNG.ls_alliance_96} n°4</option><option value="5" selected="selected">{$LNG.ls_alliance_96} n°5</option>				</select>			</td>		</tr>	

	<tr>			<td colspan="2" style="text-align : center;"><input style="margin-top : 10px;" type="submit" id="valid_form_info" name="valid_form_info" value="{$LNG.ls_alliance_97}" /></td>		</tr>	
	
	
	</table>	</form></div><div class="categorie centre">	<h2 onclick="ActionMethode.echangeAffichage('div_texte_plus'); ActionMethode.echangeAffichage('div_texte_moins');">{$LNG.ls_alliance_98}</h2>	<div id="div_texte_plus" style="display : block;">		
	
	<form id="form_texte" method="post" action="?page=alliance&mode=admin">	
	<input type="hidden" name="textMode" value="external">
	<input type="hidden" name="send" value="2">
	<table style="width : 75%; margin : 0px auto 10px auto;">			
							<tr>
								<td style="text-align : left; padding-left : 4px;">
									<input class="bbcode" name="bbcode_gras" value="B" onclick="insertionBBcode('form_texte', 'texte', '<b>', '</b>');" type="button">
                        <input class="bbcode" name="bbcode_italique" value="I" onclick="insertionBBcode('form_texte', 'texte', '<i>', '</i>');" type="button">
                        <input class="bbcode" name="bbcode_souligne" value="U" onclick="insertionBBcode('form_texte', 'texte', '<u>', '</u>');" type="button">
								
									
								</td>
							
								<td style="text-align : right;"><input class="bbcode_couleur fond_rouge" id="bbcode_rouge" name="bbcode_rouge" value="" onclick="insertionBBcode('form_texte', 'texte', '[rouge]', '[/rouge]');" type="button"><input class="bbcode_couleur fond_orange" id="bbcode_orange" name="bbcode_orange" value="" onclick="insertionBBcode('form_texte', 'texte', '[orange]', '[/orange]');" type="button"><input class="bbcode_couleur fond_jaune" id="bbcode_jaune" name="bbcode_jaune" value="" onclick="insertionBBcode('form_texte', 'texte', '[jaune]', '[/jaune]');" type="button"><input class="bbcode_couleur fond_chartreuse" id="bbcode_chartreuse" name="bbcode_chartreuse" value="" onclick="insertionBBcode('form_texte', 'texte', '[chartreuse]', '[/chartreuse]');" type="button"><input class="bbcode_couleur fond_vert" id="bbcode_vert" name="bbcode_vert" value="" onclick="insertionBBcode('form_texte', 'texte', '[vert]', '[/vert]');" type="button"><input class="bbcode_couleur fond_cyan" id="bbcode_cyan" name="bbcode_cyan" value="" onclick="insertionBBcode('form_texte', 'texte', '[cyan]', '[/cyan]');" type="button"><input class="bbcode_couleur fond_bleu" id="bbcode_bleu" name="bbcode_bleu" value="" onclick="insertionBBcode('form_texte', 'texte', '[bleu]', '[/bleu]');" type="button"><input class="bbcode_couleur fond_violet" id="bbcode_violet" name="bbcode_violet" value="" onclick="insertionBBcode('form_texte', 'texte', '[violet]', '[/violet]');" type="button"><input class="bbcode_couleur fond_rose" id="bbcode_rose" name="bbcode_rose" value="" onclick="insertionBBcode('form_texte', 'texte', '[rose]', '[/rose]');" type="button"><input class="bbcode_couleur fond_gris" id="bbcode_gris" name="bbcode_gris" value="" onclick="insertionBBcode('form_texte', 'texte', '[gris]', '[/gris]');" type="button"><input class="bbcode_couleur fond_blanc" id="bbcode_blanc" name="bbcode_blanc" value="" onclick="insertionBBcode('form_texte', 'texte', '[blanc]', '[/blanc]');" type="button">
								</td>
							</tr>
						
							<tr>
								<td colspan="2" style="text-align : left;"><textarea id="texte" name="text" placeholder="{$ally_description}" rows="10" style="width : 100%;">{$ally_description}</textarea></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align : center;"><input type="submit" id="valid_form_texte" name="valid_form_texte" value="{$LNG.ls_alliance_99}" /></td>
							</tr>		</table>		</form>	</div>	
							
							
							
							
							
							<div id="div_texte_moins" style="display : none; margin-bottom : 10px;">		{$LNG.ls_alliance_100}.	</div></div><div class="categorie centre">	<h2 onclick="ActionMethode.echangeAffichage('div_texte_interne_plus'); ActionMethode.echangeAffichage('div_texte_interne_moins');">{$LNG.ls_alliance_101}</h2>	<div id="div_texte_interne_plus" style="display :none;">		<form id="form_texte_interne" method="post" action="?page=alliance&mode=admin">	
	<input type="hidden" name="textMode" value="internal">
<input type="hidden" name="send" value="3">	<table style="width : 75%; margin : 0px auto 10px auto;">			
							<h2 onclick="ActionMethode.echangeAffichage('div_texte_interne_plus'); ActionMethode.echangeAffichage('div_texte_interne_moins');">Edition du texte privé</h2>	<div id="div_texte_interne_plus" style="">			<table style="width : 75%; margin : 0px auto 10px auto;">			<tbody><tr>
								<td style="text-align : left; padding-left : 4px;">
									<input class="bbcode" name="bbcode_gras" value="B" onclick="insertionBBcode('form_tchat', 'tchat_message', '<b>', '</b>');" type="button">
                        <input class="bbcode" name="bbcode_italique" value="I" onclick="insertionBBcode('form_tchat', 'tchat_message', '<i>', '</i>');" type="button">
                        <input class="bbcode" name="bbcode_souligne" value="U" onclick="insertionBBcode('form_tchat', 'tchat_message', '<u>', '</u>');" type="button">
								
									
								</td>
								<td style="text-align : right;"><input class="bbcode_couleur fond_rouge" id="bbcode_rouge" name="bbcode_rouge" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[rouge]', '[/rouge]');" type="button"><input class="bbcode_couleur fond_orange" id="bbcode_orange" name="bbcode_orange" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[orange]', '[/orange]');" type="button"><input class="bbcode_couleur fond_jaune" id="bbcode_jaune" name="bbcode_jaune" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[jaune]', '[/jaune]');" type="button"><input class="bbcode_couleur fond_chartreuse" id="bbcode_chartreuse" name="bbcode_chartreuse" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[chartreuse]', '[/chartreuse]');" type="button"><input class="bbcode_couleur fond_vert" id="bbcode_vert" name="bbcode_vert" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[vert]', '[/vert]');" type="button"><input class="bbcode_couleur fond_cyan" id="bbcode_cyan" name="bbcode_cyan" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[cyan]', '[/cyan]');" type="button"><input class="bbcode_couleur fond_bleu" id="bbcode_bleu" name="bbcode_bleu" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[bleu]', '[/bleu]');" type="button"><input class="bbcode_couleur fond_violet" id="bbcode_violet" name="bbcode_violet" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[violet]', '[/violet]');" type="button"><input class="bbcode_couleur fond_rose" id="bbcode_rose" name="bbcode_rose" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[rose]', '[/rose]');" type="button"><input class="bbcode_couleur fond_gris" id="bbcode_gris" name="bbcode_gris" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[gris]', '[/gris]');" type="button"><input class="bbcode_couleur fond_blanc" id="bbcode_blanc" name="bbcode_blanc" value="" onclick="insertionBBcode('form_texte_interne', 'texte_interne', '[blanc]', '[/blanc]');" type="button">
								</td>
							</tr>
						
							<tr>
								<td colspan="2" style="text-align : left;"><textarea id="texte_interne" placeholder="{$ally_text}"  name="text" rows="10" style="width : 100%;">{$ally_text}</textarea></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align : center;"><input type="submit" id="valid_form_texte_interne" name="valid_form_texte_interne" value="{$LNG.ls_alliance_99}" /></td>
							</tr>		</table>		</form>	</div>	<div id="div_texte_interne_moins" style="display : block; margin-bottom : 10px;">		{$LNG.ls_alliance_100}.	</div></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}