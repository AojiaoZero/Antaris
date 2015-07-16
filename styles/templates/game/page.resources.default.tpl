{block name="title" prepend}{$LNG.lm_resources}{/block}
{block name="content"}

<script type="text/javascript">
	var metal_prod_old 	= {$metalprod};
	var crystal_prod_old 	= {$crystalprod};
	var deuterium_prod_old 	= {$deutprod};
	var elyrium_prod_old 	= {$elyriumprod};
	
</script>

<div id="page_contenu"><h1>{$LNG.ls_ress_1}</h1><div id="page_production">	<div class="categorie">		<h2>{$LNG.ls_ress_2}</h2>		<div id="div_tableau_production"><table>
			<tr>
				<th>{$LNG.ls_ress_3}</th>
				<th>{$LNG.tech.901}</th>
				<th>{$LNG.tech.902}</th>
				<th>{$LNG.tech.903}</th>
				<th>{$LNG.tech.904}</th>
				<th>{$LNG.tech.911}</th>
				<th>{$LNG.ls_ress_4}</th>
			</tr>
			<tr style="height:22px">
	<td>{$LNG.rs_basic_income}</td>
	<td>{$basicProduction.901|number}</td>
	<td>{$basicProduction.902|number}</td>
	<td>{$basicProduction.903|number}</td>
	<td>{$basicProduction.904|number}</td>
	<td>{$basicProduction.911|number}</td>
</tr>
			{foreach $productionList as $productionID => $productionRow}
<tr style="height:22px">
	<td>{$LNG.tech.$productionID } (<span class="couleur_theme">{$productionRow.elementLevel}</span>)</td>
	<td><span style="color:{if $productionRow.production.901 > 0}lime{elseif $productionRow.production.901 < 0}red{else}white{/if}">{$productionRow.production.901|number}</span></td>
	<td><span style="color:{if $productionRow.production.902 > 0}lime{elseif $productionRow.production.902 < 0}red{else}white{/if}">{$productionRow.production.902|number}</span></td>
	<td><span style="color:{if $productionRow.production.903 > 0}lime{elseif $productionRow.production.903 < 0}red{else}white{/if}">{$productionRow.production.903|number}</span></td>
	<td><span style="color:{if $productionRow.production.904 > 0}lime{elseif $productionRow.production.904 < 0}red{else}white{/if}">{$productionRow.production.904|number}</span></td>
	<td><span style="color:{if $productionRow.production.911 > 0}lime{elseif $productionRow.production.911 < 0}red{else}white{/if}">{$productionRow.production.911|number}</span></td>
	<td id="{$productionID}_rpircent">{$productionRow.prodLevel} %</td>
</tr>
{/foreach}
			
	
			
			
			
			
			
			<tr>
			<td>{$LNG.ls_ress_5} :</td>
			<td>+{$CivilProduction.901|number}</td>
			<td>+{$CivilProduction.902|number}</td>
			<td>+{$CivilProduction.903|number}</td>
			<td>+{$CivilProduction.904|number}</td>
			<td>0</td>
			<td></td>
		  </tr><tr>
			<td><div style="cursor : help;" onmouseover="montre('<h3>Some explanations on the specificity of a planet :</h3>Each planet has different specific soils. Indeed, a planet can have richer soil for some resources and poorer for autres.Néanmoins, the sum of all the specifics of your planet is always 0%. For the sake of equality, mothers planets do not have specific.<div style=\'padding : 5px 0px 0px 10px;\'>A little explanation: If you have <span class=\'vert\'>+8</span>% for iron, then you produce 8% more through the floor of your planet rich in iron.</div>');" onmouseout="cache();">Specificity of the planet <sup>(?)</sup> :</div></td>	
			<td><span class="{if $colo_metal == 0}blanc{elseif $colo_metal < 0}rouge{else}vert{/if}">{$colo_metal}%</span></td>	<td><span class="{if $colo_crystal == 0}blanc{elseif $colo_crystal < 0}rouge{else}vert{/if}">{$colo_crystal}%</span></td>	<td><span class="{if $colo_deut == 0}blanc{elseif $colo_deut < 0}rouge{else}vert{/if}">{$colo_deut}%</span></td>	<td><span class="{if $colo_elyrium == 0}blanc{elseif $colo_elyrium < 0}rouge{else}vert{/if}">{$colo_elyrium}%</span></td>	<td>0 <span style="font-size : 0.9em;">u./h</span></td>
			<td></td>
		  </tr>
		  
		  
		  
		  <tr class="total_production">
	<td>{$LNG.rs_sum}:</td>
	<td><span>{$totalProduction.901|number}</span></td>
	<td><span>{$totalProduction.902|number}</span></td>
	<td><span>{$totalProduction.903|number}</span></td>
	<td><span>{$totalProduction.904|number}</span></td>
	<td><span>{$totalProduction.911|number}</span></td>
	<td></td>
</tr>
			
		  
		  
		  <tr style="height:22px">
	<td>{$LNG.rs_storage_capacity}</td>
	<td><span>{$storage.901}</span></td>
	<td><span>{$storage.902}</span></td>
	<td><span>{$storage.903}</span></td>
	<td><span>{$storage.904}</span></td>
	<td>-</td>
	<td></td>
</tr>
	</table>		</div>	</div>	<div class="legende gris">		{$LNG.ls_ress_6}.	</div>	<div class="categorie">		<h2>{$LNG.ls_ress_7}</h2>		<div id="div_gestion_production">	
	
	
	
	
	<div class="production">
					<div class="nom">{$LNG.tech.901} {$LNG.ls_ress_8} :</div>
					<div id="metalpircent" class="pourcentage" style="width : {$metalprod*2}px; margin-right : {200 - $metalprod*2}px;"></div>
					<div class="texte">
						<a class="bouton" onclick="javascript:Production('metal_prod', 'decrease');" title="Decrease with 10% the production of iron">-</a>
						<a id="metal_prod" class="changer_prod" title="Modifier the production of fer">{$metalprod}%</a>
						<a class="bouton" onclick="javascript:Production('metal_prod', 'increase');" title="Increase with 10% the production of iron">+</a>
					</div>
					<div class="espace"></div>
				</div>
				<div class="production">
					<div class="nom">{$LNG.tech.902} {$LNG.ls_ress_8} :</div>
					<div id="crystalpircent" class="pourcentage" style="width : {$crystalprod*2}px; margin-right : {200 - $crystalprod*2}px;"></div>
					<div class="texte">
						<a class="bouton" onclick="javascript:Production('crystal_prod', 'decrease');" title="Decrease with 10% the production of gold">-</a>
						<a id="crystal_prod" class="changer_prod" title="Modifier la production d'or">{$crystalprod}%</a>
						<a class="bouton" onclick="javascript:Production('crystal_prod', 'increase');" title="Increase with 10% the production of gold">+</a>
					</div>
					<div class="espace"></div>
				</div>	<div class="production">
					<div class="nom">{$LNG.tech.903} {$LNG.ls_ress_8} :</div>
					<div id="deutpircent" class="pourcentage" style="width : {$deutprod*2}px; margin-right : {200 - $deutprod*2}px;"></div>
					<div class="texte">
						<a class="bouton" onclick="javascript:Production('deuterium_prod', 'decrease');" title="Decrease with 10% the production of crystal">-</a>
						<a id="deuterium_prod" class="changer_prod" title="Modifier the production of cristal">{$deutprod}%</a>
						<a class="bouton" onclick="javascript:Production('deuterium_prod', 'increase');" title="Increase with 10% the production of crystal">+</a>
					</div>
					<div class="espace"></div>
				</div>	<div class="production">
					<div class="nom">{$LNG.tech.904} {$LNG.ls_ress_8} :</div>
					<div id="elyriumpercent" class="pourcentage" style="width : {$elyriumprod*2}px; margin-right : {200 - $elyriumprod*2}px;"></div>
					<div class="texte">
						<a class="bouton" onclick="javascript:Production('elyrium_prod', 'decrease');" title="Decrease with 10% the production of elyrium">-</a>
						<a id="elyrium_prod" class="changer_prod" title="Modifier the production of elyrium">{$elyriumprod}%</a>
						<a class="bouton" onclick="javascript:Production('elyrium_prod', 'increase');" title="Increase with 10% the production of elyrium">+</a>
					</div>
					<div id="msgend"></div>
					<div class="espace"></div>
				</div>		</div>	</div>	<div class="legende gris">		{$LNG.ls_ress_9}	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}