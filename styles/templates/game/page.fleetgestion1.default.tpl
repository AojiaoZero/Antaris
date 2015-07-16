{block name="title" prepend}{$LNG.lm_fleettable_5}{/block}
{block name="content"}
<script type="text/javascript">
var lgn = '{$LNG.ls_ovbuild_17}';
var lgn1 = '{$LNG.ls_ovbuild_18}';
</script>
<div id="page_contenu"><h1>{$LNG.lm_fleettable_5}</h1><div class="onglet">
              <ul>
                  <li><a href="?page=fleetTable" title="{$LNG.lm_fleettable_1}">{$LNG.lm_fleettable_2}</a></li>
              <li><a href="?page=fleetTable&mode=manage" title="{$LNG.lm_fleettable_3}">{$LNG.lm_fleettable_4}</a></li>
              </ul>
          </div>
           <div id="div_vaisseau">    <div id="page_vaisseau_equipe">	<div class="categorie explication">		<h2>{$LNG.lm_fleettable_6} <img class="icone_creer" src="/design/image/jeu/icone/blanc/aide.png"></h2>	{$LNG.lm_fleettable_7}	</div>	<div id="liste_equipe">{foreach $userComp as $messageID => $xb}<div id="emballage_equipe_{$messageID}" class="emballage_equipe">	<div id="equipe_{$messageID}" class="equipe">		<h2>Flotte : <span class="orange" style="cursor : pointer;">{$xb.manage_name}</span><img class="icone_equipe" src="/design/image/jeu/icone/blanc/tag.png"><img class="supprimer" src="/design/image/jeu/icone/couleur/corbeille.png" onclick="javascript:VaisseauEquipe.supprimerEquipe('{$messageID}');"></h2>		<h3>Vaisseaux</h3>		<div class="liste_vaisseau">		

{if $xb.ship202 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/202.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship202}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.202}</span></a></div></div>
{/if}{if $xb.ship203 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/203.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship203}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.203}</span></a></div></div>
{/if}{if $xb.ship204 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/204.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship204}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.204}</span></a></div></div>
{/if}{if $xb.ship205 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/205.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship205}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.205}</span></a></div></div>
{/if}{if $xb.ship206 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/206.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship206}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.206}</span></a></div></div>
{/if}{if $xb.ship207 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/207.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship207}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.207}</span></a></div></div>
{/if}{if $xb.ship211 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/211.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship211}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.211}</span></a></div></div>
{/if}{if $xb.ship214 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/214.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship214}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.214}</span></a></div></div>
{/if}{if $xb.ship215 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/215.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship215}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.215}</span></a></div></div>
{/if}{if $xb.ship216 != ''}
<div class="item"><img src="styles/theme/gow/gebaeude/216.gif"><div class="element reel" name="nom_vaisseau_2015"><a ><span class="couleur_theme">{$xb.ship216}</span> {$LNG.lm_achat_units}<br><span class="nom">{$LNG.tech.216}</span></a></div></div>
{/if}
</div></div></div>{/foreach}
									
									
									<div id="nouvelle_equipe" class="equipe">		<h2>{$LNG.lm_fleettable_8} <img class="icone_creer" src="/design/image/jeu/icone/blanc/plus.png"></h2>		<a onclick="javascript:VaisseauEquipe.afficherFormulaireCreation();" class="centre">{$LNG.lm_fleettable_8} !</a>		<form id="form_creer_equipe" action="javascript:VaisseauEquipe.creerEquipe();">		<h3>{$LNG.lm_fleettable_10}</h3>			<div class="liste_vaisseau">	

									 {foreach $FleetsOnPlanet as $FleetRow}
		<div class="item">
		<img src="styles/theme/gow/gebaeude/{$FleetRow.id}.gif" title="{$LNG.tech.{$FleetRow.id}}"/>
		<div class="element">
		<input type="text" class="entier" id="ship{$FleetRow.id}" name="ship{$FleetRow.id}" value="0" /> ({$FleetRow.count|number})
		</div>
		</div>	
		{/foreach}

		</div>						<div class="centre">				<input value="{$LNG.lm_fleettable_9}" type="submit">			</div>		</form>	</div>	</div></div></div></div>                    <!-- Fin du corps -->
      
			
			{/block}
{block name="script" append}<script src="scripts/game/fleetTable.js"></script>{/block}

