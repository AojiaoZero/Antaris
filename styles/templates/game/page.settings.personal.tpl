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
						<h2>{$LNG.ls_settings_15}</h2>
						{$LNG.ls_settings_16}
						
						<form id="form_donnees" method="post" action="game.php?page=settings">
						<input type="hidden" name="mode" value="personalSend">
						<table>
                                <tr>
									<td><label for="mail">{$LNG.ls_settings_17} :</label></td>
									<td style="height : 22px;">{$email}</td>
								</tr>
								<tr>
									<td><label for="date_de_naissance">{$LNG.ls_settings_18} :</label></td>
									<td>{if $drates == 0}
									
									<input type="text" placeholder="dd" id="date_de_naissance" name="date_de_naissance" size="2" maxlength="2" value="" />/
									<input type="text" placeholder="mm" id="date_de_naissance1" name="date_de_naissance1" size="2" maxlength="2" value="" />/
									<input type="text" placeholder="year" id="date_de_naissance2" name="date_de_naissance2" size="4" maxlength="4" value="" />
									{else}
									{$drate}
									{/if}
									</td>
								</tr>
								<tr>
									<td><label for="sexe">{$LNG.ls_settings_19} :</label></td>
									<td>
										{if !$sexe}<select id="sexe" name="sexe">
											<option value="1" >{$LNG.ls_settings_20}</option>
											<option value="2" >{$LNG.ls_settings_21}</option>
										</select>{elseif $sexe == "1"}{$LNG.ls_settings_20}{elseif $sexe == 2}{$LNG.ls_settings_21}{/if}
									</td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" name="valid_form" value="{$LNG.ls_settings_22}" /></td>
								</tr>
							</table>	</form>
					  </div>	</div></div></div>       </div>              <!-- Fin du corps -->
            <div class="espace"></div>
{/block}