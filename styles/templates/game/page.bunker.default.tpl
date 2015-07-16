{block name="title" prepend}Bunker{/block}
{block name="content"}
<div id="page_contenu"><h1>Bunker resources</h1><div class="onglet">
              <ul>
                 <li><a href="?page=Bunker" title="{$LNG.ls_bunker_1}">{$LNG.ls_bunker_1}</a></li>
                  <li><a href="?page=Bunker&mode=historique" title="{$LNG.ls_bunker_2}">{$LNG.ls_bunker_2}</a></li>
              </ul>
          </div>
          <div id="div_bunker"><!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.ls_bunker_1}</h2>

<div name="bunker_transaction">
    <!-- Image d'illustration du bunker à ressources -->
    <img name="illustration" src="media/image/bunker.jpg" />
    
    <!-- Paragraphe explicatif -->
    <p>
       {$LNG.ls_bunker_3}
    </p>
    
    <!-- Si le formulaire a été envoyé par le joueur -->
        
    <!-- Formulaire à remplir pour effectuer des actions auprès du bunker -->
    <form id="form_bunker" method="post" action="?page=bunker">
	<input type="hidden" name="mode" value="send">
        <table>
            <tr>
                <th class="nom_ressource">{$LNG.ls_bunker_4}</th>
                <th class="quantite">{$LNG.ls_bunker_5}</th>
                <th class="capacite_restante">{$LNG.ls_bunker_6}</th>
                <th class="actions">{$LNG.ls_bunker_7}</th>
            </tr>

            <!-- On parcours les quatres ressources du jeu -->
                       {foreach $bunkerTable as $resourceID => $resouceData}
					  
					   <tr>
                <td class="nom_ressource">
                    <img src="media/ingame/image/{$resouceData.name}.jpg" />
                    <span class="intutile" style="cursor:help;">
                        <span class="{$resouceData.in}">•</span>
                        {$resouceData.resname}
                    </span>
                </td>
                <td class="quantite">
                    <span class="orange">{pretty_number($resouceData.bunker)}</span> {$LNG.ls_bunker_8}
                </td>
                <td class="capacite_restante">
                    <span class="gris">{pretty_number($resouceData.remaining)}</span> {$LNG.ls_bunker_9}
                </td>
                <td class="actions">
                    <select id="action_{$resouceData.name}" name="action_{$resouceData.name}">
                        <option value="ajouter" >{$LNG.ls_bunker_10}</option>
                        <option value="retirer" >{$LNG.ls_bunker_11}</option>
                    </select>
                  
                    <input  type="text" class="entier"  name="quantite_{$resouceData.name}" 
                            data-max="{$resouceData.remaining}"
                            data-quantite_bunker="{$resouceData.bunker}"
                            data-insertion_possible="1"
                            value="0" /> {$LNG.ls_bunker_9}
                </td>
            </tr>
                {/foreach}       
        </table>
        
        
     
        <!-- Explication sur le captcha -->
        <div name="explication_captcha">
            {$LNG.ls_bunker_12}
        </div><!--
        
        --><div name="captcha">
            <label for="captcha">Enter the code :</label> 
            
            <!-- Affichage de l'image captcha -->
            <div class="champ">
                <input type="text" id="captcha" name="captcha"  value="" />
                <img name="captcha" src="?page=Bunker&mode=getCode" />
            </div>

        </div>
                
        <input type="submit" name="valid_form_bunker" value="{$LNG.ls_bunker_13}" />
    </form>
  
</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
