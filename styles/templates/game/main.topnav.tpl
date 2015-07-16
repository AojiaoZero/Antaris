          <!-- Le corps de la page -->
            <div id="corps">
              
        <div id="ressource_contenu"><!-- On affiche le titre pour les ressources -->
<h1>{$LNG.ls_topnav_7}</h1>


<div class="selection_planete">
    <!-- Un select particulier et customisé pour la liste des planètes -->
    

			
</div>


 <!-- Pour afficher l'énergie sur la planète toute à droite -->

{foreach $resourceTable as $resourceID => $resouceData}
{if !isset($resouceData.current)}
{$resouceData.current = $resouceData.max + $resouceData.used}
<div class="darkmatter" onmouseover="montre(' <div style=\'padding : 2px 8px; min-width : 170px;\'>                                              <b>  {$LNG.tech.$resourceID} {$LNG.ls_topnav_6} :</b><br />                                              — {$LNG.ls_topnav_5} : <span class=\'orange\'>{$resouceData.max|number}</span><br />                                                                                      </div>');" onmouseout="cache();">
   {$resouceData.current|number}
</div>

{else}
	{/if}
									{/foreach}

<!-- Permet d'afficher les ressources -->
<div class="conteneur_ressource">


{foreach $resourceTable as $resourceID => $resouceData}
{if !isset($resouceData.current)}
{$resouceData.current = $resouceData.max + $resouceData.used}
{else}
    <!-- Le fer -->
    <div class="item_ressource {$resouceData.name}" id="current_{$resouceData.name}"  name="{$resouceData.current|number}" onmouseover="montre(' <div style=\'padding : 2px 8px; min-width : 170px;\'>                                                      <b>{$LNG.ls_topnav_4} {$LNG.tech.$resourceID} :</b><br />                                                      — {$LNG.ls_topnav_1} : <span class=\'orange\'>{$resouceData.bunker|number}</span> u.<br />                                                      — {$LNG.ls_topnav_2} : <span class=\'orange\'>{$resouceData.max|number}</span> u.<br />                                                      — {$LNG.ls_topnav_3} : <span class=\'orange\'>{$resouceData.percent}</span>%                                                  </div>');" onmouseout="cache();">
        {if $resouceData.current >= $resouceData.max}<span class="rouge">{$resouceData.current|number}</span>{else}{$resouceData.current|number}{/if}
    </div>
	{/if}
									{/foreach}

	
	
	
    <div class="espace"></div>
</div>
<div class="espace"></div>
<!-- On appel le javascript nécessaire pour customizer le select pour les planètes -->
<script type="text/javascript">$('select#select_custom').ddslick({ width : 220 });</script>
{if !$vmode}
		<script type="text/javascript">
		var viewShortlyNumber	= {$shortlyNumber|json}
		var vacation			= {$vmode};
		{foreach $resourceTable as $resourceID => $resouceData}
		{if isset($resouceData.production)}
		resourceTicker({
			available: {$resouceData.current|json},
			limit: [0, {$resouceData.max|json}],
			production: {$resouceData.production|json},
			valueElem: "current_{$resouceData.name}"
		}, true);
		{/if}
		{/foreach}
		</script>
		{/if}</div>