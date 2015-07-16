{block name="title" prepend}{$LNG.ls_bank_1}{/block}
{block name="content"}
<script type="text/javascript">
var tportal = {$tportalss};
var lgn = '{$LNG.ls_bank_38}';
var lgn1 = '{$LNG.ls_bank_39}';
var lgn2 = '{$LNG.ls_bank_40}';
var lgn3 = '{$LNG.ls_bank_41}';
var Bankacceptas = 0;
</script>
<div id="page_contenu">      <h1>{$LNG.ls_bank_1}</h1><div class="onglet">
              <ul>
                  <li><a href="game.php?page=bank" title="{$LNG.ls_bank_2}">{$LNG.ls_bank_3}</a></li>
                  <li><a href="game.php?page=bank&mode=evolution" title="{$LNG.ls_bank_4}">{$LNG.ls_bank_5}</a></li>
                  <li><a href="game.php?page=bank&mode=transaction" title="{$LNG.ls_bank_6}">{$LNG.ls_bank_7}</a></li> 
              </ul>
          </div><div id="banque">
<!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.ls_bank_17}</h2>

<div name="banque_transaction">
    <!-- Image d'illustration de la banque -->
    <img name="illustration" src="design/image/banque.jpg" />
    
    <!-- Paragraphe explicatif -->
    <p>
        {$LNG.ls_bank_18}
    </p>


        
        {if $pagecheck == 0}
        <h3>{$LNG.ls_bank_19}?</h3>
        <!-- On parcours l'ensemble des appareils et des ressources qui sont présent sur la planète -->
        <div class="choix_marchandise">
                                                    <div class="item_produit_vendu" name="ressource:metal" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseVendu('ressource', 'metal');"
                     onmouseover="montre('{$LNG.ls_bank_27}.');">
                  
                     
                                           
                     <img src="media/ingame/image/metal.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.901}
                </div>
                                                            <div class="item_produit_vendu" name="ressource:crystal" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseVendu('ressource', 'crystal');"
                     onmouseover="montre('{$LNG.ls_bank_27}.');">
                  
                     
                                           
                     <img src="media/ingame/image/oro.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.902}
                </div>
                                                            <div class="item_produit_vendu" name="ressource:deuterium" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseVendu('ressource', 'deuterium');"
                     onmouseover="montre('{$LNG.ls_bank_27}.');">
                  
                     
                                           
                     <img src="media/ingame/image/cristal.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.903}
                </div>
                                                            <div class="item_produit_vendu" name="ressource:elyrium" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseVendu('ressource', 'elyrium');"
                     onmouseover="montre('{$LNG.ls_bank_27}.');">
                  
                     
                                           
                     <img src="media/ingame/image/elyrium.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.904}
                </div>
                                                                                                                                    
                                                           
                                                                                                                                                                                        </div>


        
        <h3>{$LNG.ls_bank_20}?</h3>
        <!-- On parcours tous les appareils et ressources vendu par la confédération et que le joueur a débloqué -->
        <div class="choix_marchandise">
                                                    
                <div class="item_produit_acheter" name="ressource:metal" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseAcheter('ressource', 'metal');"
                     onmouseover="montre('{$LNG.ls_bank_28}.');">
                  
                     
                                           
                     <img src="media/ingame/image/metal.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.901}
                </div>
                                                            
                <div class="item_produit_acheter" name="ressource:crystal" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseAcheter('ressource', 'crystal');"
                     onmouseover="montre('{$LNG.ls_bank_28}');">
                  
                     
                                           
                     <img src="media/ingame/image/oro.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.902}
                </div>
                                                            
                <div class="item_produit_acheter" name="ressource:deuterium" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseAcheter('ressource', 'deuterium');"
                     onmouseover="montre('{$LNG.ls_bank_28}');">
                  
                     
                                           
                     <img src="media/ingame/image/cristal.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.903}
                </div>
                                                            
                <div class="item_produit_acheter" name="ressource:elyrium" onmouseout="cache();"
                     onclick="javascript:Banque.selectionMarchandiseAcheter('ressource', 'elyrium');"
                     onmouseover="montre('{$LNG.ls_bank_28}');">
                  
                     
                                           
                     <img src="media/ingame/image/elyrium.jpg" />
                     {$LNG.ls_bank_26} : {$LNG.tech.904}
                </div>
                                                                                
               
                                            </div>


        <!-- Formulaire pour saisir la quantité de produit que l'on souhaite vendre -->
        <h3>{$LNG.ls_bank_21} :</h3>
        <form id="form_transaction" action="?page=bank&mode=sendSale" method="post">
            <label for="quantite_vendu">{$LNG.ls_bank_22} :</label>
            <input type="text" class="entier" id="quantite_vendu" name="quantite_vendu" maxlenght="12" size="12" value="0" 
                   onchange="javascript:Banque.actualiserProposition();" 
                   onkeyup="javascript:Banque.actualiserProposition();" />

            <input type="submit" name="valid_form" value="{$LNG.ls_bank_23}" id="postsend" disabled="disabled" />

            <div style="margin-top : 10px; font-style : italic;" class="gris">
                {$LNG.ls_bank_24}.
            </div>

            <!-- Toutes les variables cachées nécessaires pour la transaction -->
            <input type="hidden" name="type_vendu" id="type_vendu" value="" />
            <input type="hidden" name="id_vendu" id="id_vendu" value="" />
            <input type="hidden" name="type_acheter" id="type_acheter" value="" />
            <input type="hidden" name="id_acheter" id="id_acheter" value="" />
        </form>


        <!-- La réponse « ajax » s'effectue dans cette partie -->
        <h3>{$LNG.ls_bank_25} :</h3>
        <div id="proposition_banque">
            <div class="chargement"></div>
            <div id="result_message" class="message_flux">{$LNG.ls_bank_42}</div>
        </div>
		
		{else}
		 <h3>{$LNG.ls_bank_35} : </h3>
        <div name="transaction_realiser">
              
                <!-- Réponse affirmatif : la confédération a accepté la transaction -->
                <div class="reponse_valide">{$LNG.ls_bank_36}.</div>
                <table> 
                            <tbody><tr>
                                <td>{$LNG.ls_bank_30} :</td>
                                <td><span class="orange">{$quantite_vendu}</span> u. 
                                    {$langsell}</td>
                            </tr>
                            <tr>
                                <td>{$LNG.ls_bank_31} :</td>
                                <td><span class="{if $taxSell < 0}rouge{else}vert{/if}">{$taxSell} %</span><br></td>
                            </tr>
                            <tr>
                                <td>{$LNG.ls_bank_32} :</td>
                                <td><span class="{if $taxBuy < 0}rouge{else}vert{/if}">{$taxBuy} %</span><br></td>
                            </tr>
                            <tr>
                                <td>{$LNG.ls_bank_33} :</td>
                                <td class="jaune">{$impots} %</td>
                            </tr>
                            <tr>
                                <td>{$LNG.ls_bank_34} :</td>
                                <td><span class="orange">{$result}</span> u. 
                                    {$langbuy}</td> 
                            </tr>
                        </tbody></table>
                
            
            <br>
            <a href="?page=bank&mode=transaction">{$LNG.ls_bank_37}.</a>
        </div>
		{/if}
     </div></div></div>     
	 {/block}