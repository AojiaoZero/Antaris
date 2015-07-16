{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
<script type="text/javascript">
var lgn		= "{$LNG.ls_settings_56}"
</script>


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
						<h2>{$LNG.ls_settings_55}</h2>
						{$LNG.ls_settings_52} 
						<div id="showaction">
						<form id="form_graphisme" method="post" action="javascript:ProfilOption.formulaireOptionGraphique();">	<table>
								<tr>
									<td><label for="couleur">{$LNG.ls_settings_53} :</label></td>
									<td>
										<input type="button" class="bbcode_couleur" name="visualiser_couleur" onclick="ActionMethode.echangeAffichage('palette_couleur');" style="background : #{$custom_color};" />
										<input type="hidden" name="couleur" value="{$custom_color}" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<div id="palette_couleur"><input type="button" class="bbcode_couleur" name="couleur_FF0000" onclick="javascript:ProfilOption.changerCouleur('FF0000');" style="background : #FF0000;" /><input type="button" class="bbcode_couleur" name="couleur_FF4400" onclick="javascript:ProfilOption.changerCouleur('FF4400');" style="background : #FF4400;" /><input type="button" class="bbcode_couleur" name="couleur_FF6600" onclick="javascript:ProfilOption.changerCouleur('FF6600');" style="background : #FF6600;" /><input type="button" class="bbcode_couleur" name="couleur_FF9900" onclick="javascript:ProfilOption.changerCouleur('FF9900');" style="background : #FF9900;" /><input type="button" class="bbcode_couleur" name="couleur_FFBB00" onclick="javascript:ProfilOption.changerCouleur('FFBB00');" style="background : #FFBB00;" /><input type="button" class="bbcode_couleur" name="couleur_FFFF00" onclick="javascript:ProfilOption.changerCouleur('FFFF00');" style="background : #FFFF00;" /><input type="button" class="bbcode_couleur" name="couleur_CCFF00" onclick="javascript:ProfilOption.changerCouleur('CCFF00');" style="background : #CCFF00;" /><br /><input type="button" class="bbcode_couleur" name="couleur_075502" onclick="javascript:ProfilOption.changerCouleur('075502');" style="background : #075502;" /><input type="button" class="bbcode_couleur" name="couleur_118822" onclick="javascript:ProfilOption.changerCouleur('118822');" style="background : #118822;" /><input type="button" class="bbcode_couleur" name="couleur_00FF00" onclick="javascript:ProfilOption.changerCouleur('00FF00');" style="background : #00FF00;" /><input type="button" class="bbcode_couleur" name="couleur_44FF00" onclick="javascript:ProfilOption.changerCouleur('44FF00');" style="background : #44FF00;" /><input type="button" class="bbcode_couleur" name="couleur_77FF00" onclick="javascript:ProfilOption.changerCouleur('77FF00');" style="background : #77FF00;" /><input type="button" class="bbcode_couleur" name="couleur_99FF00" onclick="javascript:ProfilOption.changerCouleur('99FF00');" style="background : #99FF00;" /><input type="button" class="bbcode_couleur" name="couleur_AAFF00" onclick="javascript:ProfilOption.changerCouleur('AAFF00');" style="background : #AAFF00;" /><br /><input type="button" class="bbcode_couleur" name="couleur_002255" onclick="javascript:ProfilOption.changerCouleur('002255');" style="background : #002255;" /><input type="button" class="bbcode_couleur" name="couleur_004088" onclick="javascript:ProfilOption.changerCouleur('004088');" style="background : #004088;" /><input type="button" class="bbcode_couleur" name="couleur_3360AA" onclick="javascript:ProfilOption.changerCouleur('3360AA');" style="background : #3360AA;" /><input type="button" class="bbcode_couleur" name="couleur_5580BB" onclick="javascript:ProfilOption.changerCouleur('5580BB');" style="background : #5580BB;" /><input type="button" class="bbcode_couleur" name="couleur_55BBAA" onclick="javascript:ProfilOption.changerCouleur('55BBAA');" style="background : #55BBAA;" /><input type="button" class="bbcode_couleur" name="couleur_77CCDD" onclick="javascript:ProfilOption.changerCouleur('77CCDD');" style="background : #77CCDD;" /><input type="button" class="bbcode_couleur" name="couleur_86F0FC" onclick="javascript:ProfilOption.changerCouleur('86F0FC');" style="background : #86F0FC;" /><br /><input type="button" class="bbcode_couleur" name="couleur_5F1789" onclick="javascript:ProfilOption.changerCouleur('5F1789');" style="background : #5F1789;" /><input type="button" class="bbcode_couleur" name="couleur_781CAC" onclick="javascript:ProfilOption.changerCouleur('781CAC');" style="background : #781CAC;" /><input type="button" class="bbcode_couleur" name="couleur_D32EE2" onclick="javascript:ProfilOption.changerCouleur('D32EE2');" style="background : #D32EE2;" /><input type="button" class="bbcode_couleur" name="couleur_853FAD" onclick="javascript:ProfilOption.changerCouleur('853FAD');" style="background : #853FAD;" /><input type="button" class="bbcode_couleur" name="couleur_A363C7" onclick="javascript:ProfilOption.changerCouleur('A363C7');" style="background : #A363C7;" /><input type="button" class="bbcode_couleur" name="couleur_E26AED" onclick="javascript:ProfilOption.changerCouleur('E26AED');" style="background : #E26AED;" /><input type="button" class="bbcode_couleur" name="couleur_F5A2E3" onclick="javascript:ProfilOption.changerCouleur('F5A2E3');" style="background : #F5A2E3;" /><br /><input type="button" class="bbcode_couleur" name="couleur_444444" onclick="javascript:ProfilOption.changerCouleur('444444');" style="background : #444444;" /><input type="button" class="bbcode_couleur" name="couleur_555555" onclick="javascript:ProfilOption.changerCouleur('555555');" style="background : #555555;" /><input type="button" class="bbcode_couleur" name="couleur_777777" onclick="javascript:ProfilOption.changerCouleur('777777');" style="background : #777777;" /><input type="button" class="bbcode_couleur" name="couleur_999999" onclick="javascript:ProfilOption.changerCouleur('999999');" style="background : #999999;" /><input type="button" class="bbcode_couleur" name="couleur_AAAAAA" onclick="javascript:ProfilOption.changerCouleur('AAAAAA');" style="background : #AAAAAA;" /><input type="button" class="bbcode_couleur" name="couleur_CCCCCC" onclick="javascript:ProfilOption.changerCouleur('CCCCCC');" style="background : #CCCCCC;" /><input type="button" class="bbcode_couleur" name="couleur_FFFFFF" onclick="javascript:ProfilOption.changerCouleur('FFFFFF');" style="background : #FFFFFF;" /><br />				</div>
									</td>
								</tr>
								
								<tr>
									<td><label for="galaxy_attack">Galaxy attack (space) :</label></td>
									<td>
										<select id="galaxy_attack" name="galaxy_attack">
											<option value="0" {if $galaxy_space == 0}selected="selected"{/if}>Use fleet management options</option>
											<option value="1" {if $galaxy_space == 1}selected="selected"{/if}>Being redirected to fleets page</option>
										</select>
									</td>
								</tr>
								
                               
								<tr>
									<td colspan="2"><input type="submit" name="valid_form" value="{$LNG.ls_settings_54}" /></td>
								</tr>
							</table>	</form>
							</div>
					  </div>	</div></div></div>  </div>                   <!-- Fin du corps -->
            <div class="espace"></div>
{/block}