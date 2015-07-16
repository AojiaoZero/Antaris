<!-- Tableau en lui-même -->
            <table class="tableau_production">
                            {foreach $productionTable.storage as $elementLevel => $productionData}
                              <tr>
                      <td>Level <span class="orange">{$elementLevel}</span> :</td>
					  {foreach $productionData as $resourceID => $storage}
					  {$storageDiff = $storage - $productionTable.storage.$CurrentLevel.$resourceID}
					 
                      <td><span class="orange">{$storage|number}</span> {$LNG.tech.$resourceID} /h</td>
					  
					  {/foreach}
                  </tr>
				  {/foreach}
                        </table>
            </div>
    <div class="espace"></div>
</div>
    
<!-- Un lien qui permet de revenir à la page des bâtiments -->
<a onclick="history.go(-1)" title="Back to the building page">Back to the building page.</a>

<!-- La fenêtre pop-up qui permet de lancer une destruction de bâtiment -->
<div id="demolir_construction_bat_11" class="popup_texte">
    <h1>Lancer la démolition du bâtiment</h1>
    <p>Confirmez vous la démolition d'un niveau du bâtiment : Hangar de fer ?</p>
    
    <div class="sous_partie">
        En détruisant ce bâtiment vous allez récupérer :
        <div class="sous_partie" style="padding-top : 0px;">
                    - 4 687 unités de fer<br />
                                                    - 1 unités d'énergie / heure<br />
                </div>
        Temps de démolition : 44s
    </div>
    
    <div class="centre"> 
        <form action="" method="post">
            <input style="margin-right : 8px;" type="button" value="Confirmer" onclick="javascript:ActionMethode.fermerPopUp(); 
                    javascript:ActionMethode.ouvrirLien('page_contenu', 'page/batiment.php', 'action=demolir&onglet_page=3&id_batiment=23&securite_cle=m9LWO-uBKflKquZVp6s8uuhvDZkWpEAh8PDoqCnfzXObmeTWnHHHivi3Cyws7N2wKuM2-dILEDDNwIAA6peB-Q', true);" />
            <input style="margin-left : 8px;" type="button" value="Annuler" onclick="javascript:ActionMethode.fermerPopUp();" />
        </form>
    </div>
</div></div>     