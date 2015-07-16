{block name="title" prepend}Space Center{/block}
{block name="content"}
<div id="page_contenu">      <h1>Centre spatial</h1>
          <div id="centre_spatial">  <div id="baser_centre_spatial" class="formulaire_mission categorie">
    
        <form id="form_baser" method="post" action="javascript:ActionMethode.envoyerFormulaire('form_baser', 'centre_spatial', 'page/centre_spatial_mission.php?onglet_page=baser');">
        <h2>Formulaire : Baser des ressources et/ou du matériel</h2>
        
        <!-- Description de la mission -->
        <div name="description_mission">{$missionDescription}</div>

        <!-- Conteneur pour saisir les coordonnées -->
        <div name="conteneur_coordonnees">
            Veuillez saisir les coordonnées de la planète de destination pour cette mission.<br><br>

            <label for="systeme">Galaxy : </label>
            <input onchange="javascript:CentreSpatial.gererModificationChamp('systeme');" onkeyup="javascript:CentreSpatial.gererModificationChamp('systeme');" id="systeme" name="systeme" size="6" maxlength="1" type="text"><br>

            <label for="position">System : </label>
            <input onchange="javascript:CentreSpatial.gererModificationChamp('position');" onkeyup="javascript:CentreSpatial.gererModificationChamp('position');" id="position" name="position" size="6" maxlength="3" type="text"><br>
			
			<label for="position">Planet : </label>
            <input onchange="javascript:CentreSpatial.gererModificationChamp('position');" onkeyup="javascript:CentreSpatial.gererModificationChamp('position');" id="position" name="position" size="6" maxlength="2" type="text">

            <div class="rouge" id="reponse_ajax">Veuillez spécifier les coordonnées pour effectuer la mission.</div>
        </div>

        <!-- Conteneur qui contiendra tous les champs du formulaire pour la mission -->
        <div name="conteneur_champ">
            <!-- Si la mission nécessite l'affichage des raccourcis pour les coordonnées -->
                             <h3>Raccourci vers vos planètes (6)<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:CentreSpatial.switchPartie(&quot;liste_planete&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                 <div id="liste_planete">
                                          
{foreach $colonyList as $ColonyRow}
										  <div onmouseout="cache();" onmouseover="montre('Insérer les coordonnées [53:6].');" onclick="javascript:setTarget({$ColonyRow.galaxy},{$ColonyRow.system},{$ColonyRow.planet},{$ColonyRow.type});updateVars();" class="planete" data-systeme="53" data-position="6">
                          <img src="design/image/jeu/planete/8.jpg"> 
                          {$ColonyRow.name} [{$ColonyRow.galaxy}:{$ColonyRow.system}:{$ColonyRow.planet}]
                      </div>
					  
					  {foreachelse}
		
                       {$LNG.fl_no_colony}
                     
					  
			
                      {/foreach}
                                       </div>


                    <!-- Si la mission autorise l'affichage des appareils spécialisés dans le formulaire -->
                                             <h3>Appareils spécialisés<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:CentreSpatial.switchPartie(&quot;form_appareil&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                         <div id="form_appareil">

						 {foreach $FleetsOnPlanet as $FleetRow}
                                                          <div class="appareil">
                                 <img name="entite" src="styles/theme/gow/gebaeude/{$FleetRow.id}.gif">
                                 <div class="conteneur_label">
                                      <label for="appareil_1">{$LNG.tech.{$FleetRow.id}} :</label>
                                 </div>
                                 <input class="entier" name="ship{$FleetRow.id}" id="ship{$FleetRow.id}_input" data-appelation="{$LNG.tech.{$FleetRow.id}}" maxlength="15" value="0" type="text">
                                 <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxShip('ship{$FleetRow.id}');">
                             </div>
                                            {/foreach} 
											 
											 
                             
                             <div class="espace"></div>
                         </div>
                    

                    <!-- Si la mission autorise l'affichage des populations dans le formulaire -->
                                             <h3>Populations<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:CentreSpatial.switchPartie(&quot;form_population&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                         <div id="form_population">
					 {foreach $PopulationOnPlanet as $PopulationRow}
                                                          <div class="population">
                                 <img name="entite" src="media/ingame/population/{$PopulationRow.id}.jpg">
                                 <div class="conteneur_label">
                                      <label for="population_1">{$LNG.tech.{$PopulationRow.id}} :</label>
                                 </div>
                                 <input onchange="javascript:CentreSpatial.gererModificationChamp('population_1'); InputMethode.gererChamp('population_1', 'onchange');" onkeyup="javascript:CentreSpatial.gererModificationChamp('population_1'); InputMethode.gererChamp('population_1', 'onkeyup');" class="entier" id="population_1" name="population_1" data-appelation="{$LNG.tech.{$PopulationRow.id}}" maxlength="15" value="0" type="text">
                                 <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:CentreSpatial.insererChamp('population_1', 12075);">
                             </div>
                                   {/foreach}               
                             
							 
                             <div class="espace"></div>
                         </div>
                               <!-- Affiche l'équipage nécessaire pour faire décoller cette flotte -->
                    <h3>Equipage nécessaire pour cette flotte<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:CentreSpatial.switchPartie(&quot;liste_equipage&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                    <div id="liste_equipage">
                        <table>
                            <tbody><tr>
                                <td><img src="media/ingame/image/mission/profil_3.png"> Technicien :</td>
                                <td><span name="technicien" class="orange">300</span> u</td>
                                <td><img src="media/ingame/image/mission/profil_3.png"> Scientifique :</td>
                                <td><span name="scientifique" class="orange">120</span> u</td>
                                <td><img src="media/ingame/image/mission/profil_3.png"> Soldat :</td>
                                <td><span name="soldat" class="orange">200</span> u</td>
                            </tr>
                            <tr>
                                <td><img src="media/ingame/image/mission/profil_3.png"> Pilote :</td>
                                <td><span name="pilote" class="orange">800</span> u</td>
                                <td><img src="media/ingame/image/mission/profil_3.png"> Antaris :</td>
                                <td><span name="antaris" class="orange">0</span> u</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody></table>
                    </div>
                    
                    <!-- Paramètres et détails sur le vol -->
                    <h3>Paramètres et détails du vol<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:CentreSpatial.switchPartie(&quot;liste_parametre&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                    <div id="liste_parametre">  
                        <table>
                            <!-- Détail sur le fret et la vitesse globale de la flotte -->
                            <tbody><tr>
                                <td><img src="media/ingame/image/mission/boite.png"> Fret :</td>
                                <td><span name="fret_restant" class="orange">0</span> u</td>
                                <td><img src="media/ingame/image/mission/vitesse.png"> Vitesse :</td>
                                <td><span name="vitesse" class="orange">64.29</span> %</td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                            <!-- Détails sur le plan de vol pour le sens « aller » -->
                            <tr>
                                <td><img src="media/ingame/image/mission/horloge.png"> Temps :</td>
                                <td><span style="cursor: help;" onmouseout="cache();" onmouseover="montre(&quot;Temps du trajet pour le chemin « <span class='cyan'>aller</span> ».&quot;);" name="temps_trajet_aller" class="cyan">0s</span></td>
                                <td><img src="media/ingame/image/mission/funnel.png"> Carburant :</td>
                                <td><span style="cursor: help;" onmouseout="cache();" onmouseover="montre(&quot;Carburant nécessaire pour le chemin « <span class='cyan'>aller</span> ».&quot;);" name="carburant_aller" class="cyan">20 301</span> u</td>
                                <td><img src="media/ingame/image/mission/parametre.png"> Réacteurs :</td>
                                <td><span style="cursor: pointer;" onmouseout="cache();" onmouseover="montre(&quot;Modifier la capacité des réacteurs pour le chemin « <span class='cyan'>aller</span> ».&quot;);" name="reacteur_aller" class="cyan" onclick="javascript:CentreSpatial.changerVitesseManuelle('aller');">100</span> %</td>
                            </tr>
                            
                                                    </tbody></table>
                    <div style="color : grey; font-style : italic;"> Vous pouvez modifier la vitesse de votre flotte en cliquant sur le pourcentage à côté de « Réacteurs ».<br>                                        Les éléments en <span class="cyan">bleu</span> représentent le sens « aller » et les éléments en <span class="rouge">rouge</span> représentent le sens « retour ».</div></div>

                   
                    <!-- Si la mission autorise l'affichage des ressources dans le formulaire -->
                                             <h3>Ressources<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:CentreSpatial.switchPartie(&quot;form_ressource&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                         <div id="form_ressource">
                             <div id="msg_fret"></div>

                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/metal.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_fer">Fer :</label>
                                  </div>
                                  <input onchange="javascript:CentreSpatial.gererModificationChamp('ressource_fer'); InputMethode.gererChamp('ressource_fer', 'onchange');" onkeyup="javascript:CentreSpatial.gererModificationChamp('ressource_fer'); InputMethode.gererChamp('ressource_fer', 'onkeyup');" class="entier" id="ressource_fer" name="ressource_fer" maxlength="15" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:CentreSpatial.insererChamp('ressource_fer', 312877600);">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/crystal.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_oro">Or :</label>
                                  </div>
                                  <input onchange="javascript:CentreSpatial.gererModificationChamp('ressource_oro'); InputMethode.gererChamp('ressource_oro', 'onchange');" onkeyup="javascript:CentreSpatial.gererModificationChamp('ressource_oro'); InputMethode.gererChamp('ressource_oro', 'onkeyup');" class="entier" id="ressource_oro" name="ressource_oro" maxlength="15" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:CentreSpatial.insererChamp('ressource_oro', 254856961);">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/deuterium.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_cristal">Cristal :</label>
                                  </div>
                                  <input onchange="javascript:CentreSpatial.gererModificationChamp('ressource_cristal'); InputMethode.gererChamp('ressource_cristal', 'onchange');" onkeyup="javascript:CentreSpatial.gererModificationChamp('ressource_cristal'); InputMethode.gererChamp('ressource_cristal', 'onkeyup');" class="entier" id="ressource_cristal" name="ressource_cristal" maxlength="15" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:CentreSpatial.insererChamp('ressource_cristal', 129129914);">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/elyrium.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_elyrium">Elyrium :</label>
                                  </div>
                                  <input onchange="javascript:CentreSpatial.gererModificationChamp('ressource_elyrium'); InputMethode.gererChamp('ressource_elyrium', 'onchange');" onkeyup="javascript:CentreSpatial.gererModificationChamp('ressource_elyrium'); InputMethode.gererChamp('ressource_elyrium', 'onkeyup');" class="entier" id="ressource_elyrium" name="ressource_elyrium" maxlength="15" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:CentreSpatial.insererChamp('ressource_elyrium', 59509288);">
                              </div>
                             
                             <div class="espace"></div>
                         </div>
                
                            
            
                    </div>

        <!-- On affiche le bouton de validation pour envoyer la mission et on créé les champs « reacteur_aller », « reacteur_retour » et « securite_cle » -->
        <div name="submit_formulaire">
            <input name="securite_cle" value="RFwOzBgPypQU63VMEyXJzMObyyOKoyBajq-GwcTcSvM" type="hidden">
            <input name="reacteur_aller" value="100" type="hidden">
            <input name="reacteur_retour" value="100" type="hidden">
            <input id="valid_form" name="valid_form" value="Envoyer la mission" type="submit">
        </div>
            
        <!-- Quelques petites explications sur les calculs pour l'équipage et le fret -->
        <div style="text-align : center; color : grey; margin-top : 15px; font-style : italic;">
            L'équipage et le carburant ne sont pas pris en compte dans l'utilisation du fret.<br>
            Par contre, les équipes de colonisation et diplomatique utilisent du fret et elles sont directement intégrées à la flotte.<br>
            Pour chaque unité de ressource, pour chaque matériel et pour chaque population, vous utilisez une unité de fret.<br>
        </div>
    </form>
    
    </div>	


    <!-- Appel important à la fonction javascript qui initialise l'onglet -->
    
</div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}