{block name="title" prepend}{$LNG.lm_topkb}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_topkb}</h1>
          <div id="div_bunker"><!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.lm_topkb}</h2>

<div name="bunker_historique">
    <!-- Image d'illustration du bunker à ressources -->
    <img name="illustration" src="media/image/halloffame.jpg" />
    
    <!-- Paragraphe explicatif -->
    <p>
	{$LNG.lm_topkb_desc}
       
    </p>
    
    <!-- S'il y a des enregistrements d'historique -->
	
	
	 
	 
    <table>
        <tr>
            <th>{$LNG.tkb_platz}</th>
	<th><a href="game.php?page=battleHall&order=owner&sort={if $sort == "ASC"}DESC{else}ASC{/if}"{if $order == "owner"} style="font-weight:bold;"{/if}>{$LNG.tkb_owners}</a></th>
    <th><a href="game.php?page=battleHall&order=date&sort={if $sort == "ASC"}DESC{else}ASC{/if}"{if $order == "date"} style="font-weight:bold;"{/if}>{$LNG.tkb_datum}</a></th>
	<th><a href="game.php?page=battleHall&order=units&sort={if $sort == "ASC"}DESC{else}ASC{/if}"{if $order == "units"} style="font-weight:bold;"{/if}>{$LNG.tkb_units}</a></th>
        </tr>
        
        <!-- On parcours tous les enregistrements -->
		
		
		{foreach $TopKBList as $hallCat}
{foreach $hallCat as $rank => $hallRow}
                <tr class="day{floor($hallRow.date / 86400)} week{floor($hallRow.date / 604800)}">
            <td>{if $rank == 1}
						<img src="media/ingame/icon/trophee_1.png" />
						{elseif $rank == 2}
						<img src="media/ingame/icon/trophee_2.png" />
						{elseif $rank == 3}
						<img src="media/ingame/icon/trophee_3.png" />
						{else}{$rank}.{/if}</td>
    <td><a href="game.php?page=raport&amp;mode=battlehall&amp;raport={$hallRow.rid}" target="_blank">
	{if $hallRow.result == "a"}
	<span style="color:#00FF00">{$hallRow.attacker}</span> VS <span style="color:#FF0000">{$hallRow.defender}</span>
	{elseif $hallRow.result == "r"}
	<span style="color:#FF0000">{$hallRow.attacker}</span> VS <span style="color:#00FF00">{$hallRow.defender}</span>
	{else}
	{$hallRow.attacker} VS {$hallRow.defender}
	{/if}
	</a></td>
    <td>{$hallRow.date}</td>
	<td>{$hallRow.units|number}</td>
        </tr>
	{/foreach}
{/foreach}
		
            </table> 
		
		{*{/if}*}
    
    <!-- On affiche la pagination de la page -->
    
    </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}