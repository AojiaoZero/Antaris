{block name="title" prepend}{$LNG.lm_info}{/block}
{block name="content"}
<div id="page_contenu"><!-- La description du bâtiment -->
<h1>Description: {$LNG.tech.$elementID}</h1>

<!-- L'item de description détaillée -->
<div class="item_description">
    <!-- D'abord, l'image du bâtiment -->
    <div class="image">
        <img src="{$dpath}gebaeude/{$elementID}.{if $elementID < 200}jpg{elseif $elementID > 200 && $elementID < 300}gif{elseif $elementID > 300 && $elementID < 400}jpg{else}gif{/if}" alt="Image du bâtiment : {$LNG.tech.$elementID}" />
        <div class="calque_img"></div>
        
        <!-- Pour lancer une démolition d'un niveau -->
                    <span class="rouge">Destruction impossible</span>
        
                    </div>

    <!-- Puis, les informations -->
    <div class="information">
        <!-- La description complète du bâtiment -->
        <div class="description">{$LNG.longDescription.$elementID}</div>
{if $number == 1}
        <!-- Si le bâtiment a un effet, on l'affiche -->
                    <h2 class="titre_corps">Affectation</h2>
					
            <div class="effet">{$elementBonus}</div>
                {/if}
        <!-- On affiche les pré-requis pour débloquer le bâtiment -->
        <h2 class="titre_corps">Prerequisites to unlock this item</h2>
        <div class="pre_requis">
		{foreach from=$AllTech item=i key=k}
		<span class="vert">{$LNG.tech.{$i.requireID}}, lvl. {$planetinfo{$i.requireID}} <i>({$i.requireLevel})</i></span><br />
		{foreachelse}
		<span class="orange">No prerequisite</span>
		{/foreach}
		
		
		</div>

        <!-- Les centrales, les mines, les extracteurs, la caserne, l'usine, le laboratoire et l'avant poste des Antaris : on affiche leurs productions -->
                                                    
            
{if !empty($productionTable.production)}
<!-- On affiche un tableau avec les productions du bâtiment -->
            <h2 class="titre_corps">Production of resource</h2>
            <div class="tableau_production">
                Table production / storage for the building according to these next levels.
            </div>
{include file="shared.information.production.tpl"}
{elseif !empty($productionTable.storage)}
<!-- On affiche un tableau avec les productions du bâtiment -->
            <h2 class="titre_corps">Storage</h2>
            <div class="tableau_production">
                Table production / storage for the building according to these next levels.
            </div>
{include file="shared.information.storage.tpl"}
{elseif !empty($FleetInfo)}
{include file="shared.information.shipInfo.tpl"}
{elseif !empty($gateData)}
{include file="shared.information.gate.tpl"}
{elseif !empty($MissileList)}
{include file="shared.information.missiles.tpl"}
{elseif !empty($ResearchList)}
{include file="shared.information.research.tpl"}
{else}
</div>
</div>
<a onclick="history.go(-1)" title="Back to the research page">Return to the technology page.</a>

</div>
    {/if}
{/block}