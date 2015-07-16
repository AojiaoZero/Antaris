{block name="title" prepend}{$LNG.ls_bank_1}{/block}
{block name="content"}
<div id="page_contenu">      <h1>{$LNG.ls_bank_1}</h1><div class="onglet">
              <ul>
                  <li><a href="game.php?page=bank" title="{$LNG.ls_bank_2}">{$LNG.ls_bank_3}</a></li>
                  <li><a href="game.php?page=bank&mode=evolution" title="{$LNG.ls_bank_4}">{$LNG.ls_bank_5}</a></li>
                  <li><a href="game.php?page=bank&mode=transaction" title="{$LNG.ls_bank_6}">{$LNG.ls_bank_7}</a></li> 
              </ul>
          </div><div id="banque">
<!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.ls_bank_10}</h2>

<div name="banque_evolution">
    <!-- Image d'illustration de la banque -->
    <img name="illustration" src="design/image/banque.jpg">
    
    <!-- Paragraphe explicatif -->
    <p>
        {$LNG.ls_bank_11}
    </p>

    <!-- Tableau des évolutions -->
    <table>
        <!-- En-têtes du tableau -->
        <tbody><tr>
            <th>{$LNG.ls_bank_12}</th>
            <th>{$LNG.ls_bank_13}</th>
            <th>{$LNG.ls_bank_14}</th>
            <th>{$LNG.ls_bank_15}</th>
            <th>{$LNG.ls_bank_16}</th>
        </tr>
    
        
                                    <!-- Affiche les détails sur le produit : stock, valeur push et impots -->
                <tr>
                    <td>
                        <img src="media/ingame/image/metal.jpg">
                        {$LNG.tech.901}
                    </td>
                    <td><span class="orange">{$bank_metal}</span>&nbsp;u.</td>
                    <td><span class="gris">1,00</span>&nbsp;u.</td>
                    <td class="jaune">28 %</td>
                    <td><span class="taux {if $taxe_metal < 0}rouge{else}vert{/if}">{if $taxe_metal > 0}+{/if}{$taxe_metal} %</span></td>
                </tr>
                            <!-- Affiche les détails sur le produit : stock, valeur push et impots -->
                <tr>
                    <td>
                        <img src="media/ingame/image/oro.jpg">
                        {$LNG.tech.902}
                    </td>
                    <td><span class="orange">{$bank_crystal}</span>&nbsp;u.</td>
                    <td><span class="gris">1,33</span>&nbsp;u.</td>
                    <td class="jaune">30 %</td>
                    <td><span class="taux {if $taxe_crystal < 0}rouge{else}vert{/if}">{if $taxe_crystal > 0}+{/if}{$taxe_crystal} %</span></td>
                </tr>
                            <!-- Affiche les détails sur le produit : stock, valeur push et impots -->
                <tr>
                    <td>
                        <img src="media/ingame/image/cristal.jpg">
                        {$LNG.tech.903}
                    </td>
                    <td><span class="orange">{$bank_deuterium}</span>&nbsp;u.</td>
                    <td><span class="gris">2,00</span>&nbsp;u.</td>
                    <td class="jaune">32 %</td>
                    <td><span class="taux {if $taxe_deuterium < 0}rouge{else}vert{/if}">{if $taxe_deuterium > 0}+{/if}{$taxe_deuterium} %</span></td>
                </tr>
                            <!-- Affiche les détails sur le produit : stock, valeur push et impots -->
                <tr>
                    <td>
                        <img src="media/ingame/image/elyrium.jpg">
                        {$LNG.tech.904}
                    </td>
                    <td><span class="orange">{$bank_elyrium}</span>&nbsp;u.</td>
                    <td><span class="gris">4,00</span>&nbsp;u.</td>
                    <td class="jaune">34 %</td>
                    <td><span class="taux {if $taxe_elyrium < 0}rouge{else}vert{/if}">{if $taxe_elyrium > 0}+{/if}{$taxe_elyrium} %</span></td>
                </tr>
                
                                    <!-- Affiche les détails sur le produit : stock, valeur push et impots -->
               
           
    </tbody></table>
</div></div></div>        
{/block}
