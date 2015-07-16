<!-- Tableau en lui-même -->
            <table class="tableau_production">
			{foreach $productionTable.production as $elementLevel => $productionData}
                              <tr>
                      <td>Level <span class="orange">{$elementLevel}</span> :</td>
					  {foreach $productionData as $resourceID => $production}
					  {$productionDiff = $production - $productionTable.production.$CurrentLevel.$resourceID}
					  
                      <td><span class="orange">{$production|number}</span> {$LNG.tech.$resourceID} /h</td>
					  
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
<div id="demolir_construction_bat_23" class="popup_texte">
    <h1>Lancer la démolition du bâtiment</h1>
    <p>Confirmez vous la démolition d'un niveau du bâtiment : Avant-poste Antaris ?</p>
    
    <div class="sous_partie">
        En détruisant ce bâtiment vous allez récupérer :
        <div class="sous_partie" style="padding-top : 0px;">
                    - 3 385 198 unités de fer<br />
                            - 2 461 962 unités d'or<br />
                            - 1 846 472 unités de cristal<br />
                            - 1 538 726 unités d'elyrium<br />
                            - 21 542 unités d'énergie / heure<br />
                </div>
        Temps de démolition : 7j 8h 2m 2s
    </div>
    
    <div class="centre"> 
        <form action="" method="post">
            <input style="margin-right : 8px;" type="button" value="Confirmer" onclick="javascript:ActionMethode.fermerPopUp(); 
                    javascript:ActionMethode.ouvrirLien('page_contenu', 'page/batiment.php', 'action=demolir&onglet_page=3&id_batiment=23&securite_cle=m9LWO-uBKflKquZVp6s8uuhvDZkWpEAh8PDoqCnfzXObmeTWnHHHivi3Cyws7N2wKuM2-dILEDDNwIAA6peB-Q', true);" />
            <input style="margin-left : 8px;" type="button" value="Annuler" onclick="javascript:ActionMethode.fermerPopUp();" />
        </form>
    </div>
</div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>