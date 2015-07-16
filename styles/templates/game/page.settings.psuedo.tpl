{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_settings_1}</h1><div id="page_profil">	<div class="onglet" style="margin-bottom : 0px; padding-bottom : 0px;">		<ul>			

<li><a href="?page=settings&mode=psuedo" title="{$LNG.ls_settings_2}">{$LNG.ls_settings_2}</a></li>		
<li><a href="?page=settings&mode=personal" title="{$LNG.ls_settings_3}">{$LNG.ls_settings_3}</a></li>			
<li><a href="?page=settings&mode=avatar" title="{$LNG.ls_settings_4}">{$LNG.ls_settings_4}</a></li>			
<li><a href="?page=settings&mode=signature" title="{$LNG.ls_settings_5}">{$LNG.ls_settings_5}</a></li>			
<li><a href="?page=settings&mode=design" title="{$LNG.ls_settings_57}">{$LNG.ls_settings_57}</a></li>
</ul>
	<div class="onglet">		<ul>			
	
	<li><a href="?page=settings&mode=password" title="{$LNG.ls_settings_6}">{$LNG.ls_settings_6}</a></li>			
	<li><a href="?page=settings&mode=vmode" title="{$LNG.ls_settings_7}">{$LNG.ls_settings_7}</a></li>			
	<li><a href="?page=settings&mode=delete" title="{$LNG.ls_settings_8}">{$LNG.ls_settings_8}</a></li>		
	
	</ul>		</div>

	<div id="div_profil_onglet"><div class="categorie">
						<h2>{$LNG.ls_settings_9}</h2>
						{$LNG.ls_settings_10}
						
						<form action="game.php?page=settings" method="post" id="form_pseudo">	<table>
						<input type="hidden" name="mode" value="psuedoSend">
								<tr>
								{if $changeNickTime < 0}
									<td><label for="pseudo">{if $changeNickTime < 0}{$LNG.ls_settings_11}{/if} :</label></td>
									<td>
									
									<input type="text" id="pseudo" name="pseudo" size="20" maxlength="20" />
									{else}{$LNG.ls_settings_12} <span class="couleur_theme">{$ddate}</span>, {$LNG.ls_settings_13}.
									</td>{/if}
								</tr>
								{if $changeNickTime < 0}
								<tr>
									<td colspan="2"><input type="submit" name="valid_form" value="{$LNG.ls_settings_14}" /></td>
								</tr>
								{else}<tr><td colspan="2"></td></tr>{/if}
							</table>	</form>
					  </div>	</div></div></div>     </div>                <!-- Fin du corps -->
            <div class="espace"></div>
{/block}