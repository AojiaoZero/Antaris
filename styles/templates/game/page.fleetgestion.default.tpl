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
          <div id="div_vaisseau">    <div id="page_vaisseau_equipe">	<div class="categorie explication">		<h2>{$LNG.lm_fleettable_6} <img class="icone_creer" src="/design/image/jeu/icone/blanc/aide.png" /></h2>		{$LNG.lm_fleettable_7}	</div>	
		  
		  
		  <div id="liste_equipe">	
 <div id="nouvelle_equipe" class="equipe">		<h2>{$LNG.lm_fleettable_8} <img class="icone_creer" src="/design/image/jeu/icone/blanc/plus.png" /></h2>		<a onclick="javascript:VaisseauEquipe.afficherFormulaireCreation();" class="centre">{$LNG.lm_fleettable_8} !</a>		<form id="form_creer_equipe" action="javascript:VaisseauEquipe.creerEquipe();">	
		  <h3>{$LNG.lm_fleettable_10}</h3>			<div class="liste_vaisseau">			
		  {foreach $FleetsOnPlanet as $FleetRow}
		<div class="item">
		<img src="styles/theme/gow/gebaeude/{$FleetRow.id}.gif" title="{$LNG.tech.{$FleetRow.id}}"/>
		<div class="element">
		<input type="text" class="entier" id="ship{$FleetRow.id}" name="ship{$FleetRow.id}" value="0" /> ({$FleetRow.count|number})
		</div>
		</div>	
		{/foreach}
		
		</div>				<div class="centre">				<input type="submit" value="{$LNG.lm_fleettable_9}"/>			</div>		</form>	</div>	</div>	</div>	</div>	</div>	       
			
			{/block}
{block name="script" append}<script src="scripts/game/fleetTable.js"></script>{/block}

