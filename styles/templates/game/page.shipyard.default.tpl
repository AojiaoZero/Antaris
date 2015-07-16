{block name="title" prepend}{if $mode == "defense"}{$LNG.lm_defenses}{elseif $mode == "orbit"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}{/block}
{block name="content"}
<div id="page_contenu">	

{if $inmode == 1}
<h1>Specialized equipment</h1><div class="onglet">	<ul>		
<li><a onclick="location.href='game.php?page=shipyard&mode=fleet';" title="Afficher les appareils de l'onglet : Transport, espionnage et militaire">Transport & espionnage</a></li>		
<li><a onclick="location.href='game.php?page=shipyard&mode=recy';" title="Afficher les appareils de l'onglet : Recycleurs de ruines">Recyclers</a></li>	
<li><a onclick="location.href='game.php?page=shipyard&mode=combat';" title="Afficher les appareils de l'onglet : Recycleurs de ruines">Combats</a></li>		
<li><a onclick="location.href='game.php?page=shipyard&mode=energy';" title="Afficher les appareils de l'onglet : Sources d'énergie">Energy Sources</a></li>	
</ul>
</div>
{else}
<h1>Planetary defenses</h1><div class="onglet">	<ul>		
<li><a onclick="location.href='game.php?page=defense&mode=defense';" title="Afficher les appareils de l'onglet : On the surface of the planet">On the surface of the planet</a></li>				
<li><a onclick="location.href='game.php?page=defense&mode=orbit';" title="Afficher les appareils de l'onglet : Orbiting the planet">Orbiting the planet</a></li>	
</ul>
</div>
{/if}


<h2 class="titre_corps">List of specialized equipment under construction</h2>


{if !empty($BuildList)}
<table style="width:760px">
	<tr>
		<td class="transparent">
			
			<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
			<input type="hidden" name="action" value="delete">
			<table>
			
			<tr>
				<td><select width="300" style="width: 695px" name="auftr[]" id="auftr" size="3" multiple><option>&nbsp;</option></select></td>
			</tr>
			
			</table>
			</form>
			
		</td>
	</tr>
</table>
<br>
{else}
<div id="div_liste_construction" class="centre"><i>No specialized equipment is under construction.</i></div>
{/if}








<div id="div_liste_appareil" class="centre"><h2 class="titre_corps"></h2><!-- On débute l'item appareil -->
{if $mode == "fleet"}<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">{else}<form action="game.php?page=defense" method="post">{/if}
{foreach $elementList as $ID => $Element}
<div class="item grand">
    <!-- On affiche le nom de l'appareil dans un lien qui redirige vers la description de celui-ci -->
    <div class="titre">
        <a onclick="location.href='game.php?page=information&id={$ID}';" 
           class="titre_contour">{$LNG.tech.{$ID}}</a>
    </div>
    
    <!-- Pour afficher l'image avec une information bulle quand on survole qui permet de connaître le prix et la description de l'appareil -->
    <div class="image">
        <img src="{$dpath}gebaeude/{$ID}.gif" alt="Picture of : {$LNG.tech.{$ID}}" 
             onmouseover="montre('<!-- Les informations sur l\'appareil : prix et description --><div class=\'description_bulle\'>    <!-- On affiche le nom de l\'appareil -->    <h2>{$LNG.tech.{$ID}} (<span class=\'blanc\'>{$Element.available|number}</span>)</h2>    <table>        <tr>            <td colspan=\'2\'><h3>For 1 unit :</h3></td>            <td><h3>Description :</h3></td>        </tr>        <tr>            <!-- On affiche le prix en ressource, les caractèristiques ainsi que le temps de construction -->            <td> {foreach $Element.costRessources as $RessID => $RessAmount}               {$LNG.tech.{$RessID}} :<br />    {/foreach}                                       Time :<br /><br />                                                                                                         </td>            <td>              {foreach $Element.costRessources as $RessID => $RessAmount}   <span class=\'{if $Element.costOverflow[$RessID] == 0}vert{else}rouge{/if}\'>{$RessAmount|number}</span><br />  {/foreach}                                           {$Element.elementTime|time}<br /><br />                                                                                                       </td>                        <!-- On affiche la description de l\'appareil -->            <td>{$LNG.shortDescription.{$ID}}</td>        </tr>        <tr>            <td colspan=\'3\' class=\'gris\' style=\'padding-top : 10px; text-align : center;\'>                You can now build {$Element.maxBuildable} unit(s).            </td>        </tr>    </table><div>');" onmouseout="cache();" />
    </div>
    
    <!-- Permet de savoir si l'appareil est constructible -->
   


   <div class="action">
     {if !$Element.techacc}
	
			   
		
			   <span class="rouge" onmouseover="montre('<b>To unlock this ship :</b><div style=\'padding : 3px 0px 0px 15px;\'>{foreach from=$Element.AllTech item=i key=k}<span class=\'rouge\'>{$LNG.tech.{$i.requireID}} lvl.  {$i.requireLevel} {*<i>(0)</i>*}</span><br /> {/foreach}</div>');" onmouseout="cache();" style="cursor : help;"><b>Blocked</b></span>
		
		 
		
		
		
   {elseif $Element.AlreadyBuild}
                    <span class="rouge" style="cursor : help;"><b>Bloqué</b></span>
					
					
					
					
        	{elseif $NotBuilding && $Element.buyable}
					
					 
                <input class="entier" size="{$maxlength}" maxlength="{$maxlength}" id="input_{$ID}" name="fmenge[{$ID}]" value="0" type="text" tabindex="{$smarty.foreach.FleetList.iteration}">
                <input value="Max" type="button" onclick="$('#input_{$ID}').val('{$Element.maxBuildable}')">
				
				
				
				
					
					
					{/if}
    </div>
	
	
	
	
    
    <!-- On affiche le nomdre d'unité pour cet appareil dans un degradé noir -->
    <div class="nombre">{$Element.available|number} <span style="font-size:0.84em;font-weight:normal;">{$LNG.lm_achat_units}</span></div>
</div>
{/foreach}
<div class="espace"></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
			
			<div class="build_band" style="text-align:center;">
        <input type="submit" value="{$LNG.bd_build_ships}">       

    </div>
</form>
<script type="text/javascript">
data			= {$BuildList|json};
bd_operating	= '{$LNG.bd_operating}';
bd_available	= '{$LNG.bd_available}';
</script>
{/block}