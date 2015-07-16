{block name="title" prepend}{$LNG.ls_popu_1}{/block}
{block name="content"}
<script>
var formationBis = {$formationBis};
</script>
<div id="page_contenu">	<h1>{$LNG.ls_popu_1}</h1>

	
	

<div id="div_population" class="centre"><h2 class="titre_corps">{$LNG.ls_popu_2}</h2>
              <div class="explication_unite_formation">
                  <div class="production_caserne">
                      {$LNG.ls_popu_3} <b>{$formation}</b>&nbsp;<img src="media/ingame/population/ticket.png" onmouseover="montre('Logo designating a training unit');" onmouseout="cache();" /> {$LNG.ls_popu_4} 
                      (<span style="font-size : 12px; font-style : italic;" class="gris">including {$notused} unused</span>). 
                  </div>

                  {$LNG.ls_popu_6}
              </div><h2 class="titre_corps">{$LNG.ls_popu_7}</h2>
              
			  <form action="game.php?page=population" method="post">
			  <input type="hidden" name="mode" value="comfirm">
			  
			

			<!-- On débute l'item population -->
			{foreach $elementList as $ID => $Element}
			{if $ID != 309}
			<input type="hidden" id="totalos_{$ID}" value="{$Element.TotalCost}" name="totalos_{$ID}">
			{/if}
<div class="item_population">
    <!-- Fond de l'item -->
    <div class="fond">
        <!-- On affiche le nom de la population dans un lien qui redirige vers la description de celui-ci -->
        <h2 onclick="location.href='game.php?page=information&id={$ID}';">{$LNG.tech.{$ID}}</h2>
        
        <!-- On affiche le nomdre d'unité pour cette population -->
        <div class="nombre"><span class="orange">{$Element.amount}</span> units</div>
        
        <!-- Pour afficher l'image avec une information bulle quand on survole qui permet de connaître les caractéristiques et la description de la population -->
        <div class="image">
           
				<img src="media/ingame/population/{$ID}.jpg" alt="{$LNG.tech.{$ID}}" onmouseover="montre('<!-- Les informations sur la population : prix et description --><div class=\'description_bulle\'>    <!-- On affiche le nom de la population et le niveau -->    <h2>{$LNG.tech.{$ID}} (<span class=\'blanc\'>{$Element.amount}</span>)</h2>    <table>        <tr>            <td colspan=\'1\'><h3>For one unit :</h3></td>            <td><h3>Description :</h3></td>        </tr>        <tr>            <!-- On affiche les caractèristiques (si c\'est des troupes combattantes, sinon on affiche un message) -->                            <td style=\'font-weight : normal; text-align : left; width : 40%;\'>                 {if $ID == 306 || $ID == 307} This population participate in combat, and therefore it have combat feature.{else}  This population does not participate in combat, and therefore it does not have combat feature.    {/if}            </td>                                <!-- On affiche la description de la population -->                <td style=\'font-weight : normal; text-align : justify; width : 60%; padding-left : 15px;\'>                   {$LNG.shortDescription.{$ID}}                </td>                    </tr>    </table><div>');" onmouseout="cache();">
				 
				 
        </div>
        
        <!-- Permet de savoir si la population est déboquée -->
		{if !$Element.techacc}
        <div class="action">
            <!-- Si les formations sont impossible pour cette population -->
                            {$LNG.ls_popu_8} « {$LNG.tech.{$ID}} ».
                
            <!-- On peut former la population -->
                    </div>
					{elseif $ID == 309}
					 <div class="action">
            <!-- Si les formations sont impossible pour cette population -->
                            {$LNG.ls_popu_9}
              
            <!-- Si la population est bloquée -->
                    </div>
                    
					{else}
					 <div class="action">
            <!-- Si les formations sont impossible pour cette population -->
                            <table>
                    <tr>
                        <td>{$LNG.ls_popu_10} :</td>
						 {foreach $Element.costRessources as $RessID => $RessAmount}
                        <td><b>{$RessAmount|number}</b> formation u.</td>
						{/foreach}
                    </tr>
                    <tr>
                        <td>{$LNG.ls_popu_11} :</td>
                        <td><input  type="text" class="entier" maxlenght="12" id="population_{$ID}" name="population_{$ID}"
                                    onchange="javascript:calculation({$ID});" 
                                    onkeyup="javascript:calculation({$ID});" 
                                    value="{$Element.Produced}" /> u. / h
                        </td>
                    </tr>
                    <tr>
                        <td>{$LNG.ls_popu_12} :</td>
                        <td><span id="total_{$ID}" name="total_{$ID}">{$Element.TotalCost}</span>
                              &nbsp;<img src="media/ingame/population/ticket.png" onmouseover="montre('Logo designating a training unit');" onmouseout="cache();" />/ hour
                        </td>
                    </tr>
                </table>
                     </div>
					{/if}
    </div>
</div>
{/foreach}
   <div class="espace"></div>    <h2 class="titre_corps">{$LNG.ls_popu_13}</h2>
                  <div id="msg_affectation_prod">
                      <span class="orange">{$LNG.ls_popu_14}.</span>
                  </div>
                  <div class="conteneur_submit">
                      <input type="submit" id="valid_forming" name="valid_forming" value="{$LNG.ls_bunker_13}" disabled >
                  </div>
                  <div class="espace"></div>
              </form></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
