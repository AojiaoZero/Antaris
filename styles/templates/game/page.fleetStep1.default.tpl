{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<form action="game.php?page=fleetStep3" method="post" onsubmit="return CheckTarget()" id="form">
	<input type="hidden" name="token" value="{$token}">
	<input type="hidden" name="fleet_group" value="0">
	<input type="hidden" name="target_mission" value="{$mission}">
	
<div id="page_contenu">      <h1>Space Center</h1>
          <div id="centre_spatial">  <div id="baser_centre_spatial" class="formulaire_mission categorie">
    
        <h2>Form : {$missionText}</h2>
        
        <!-- Description de la mission -->
       <div name="conteneur_coordonnees">
            Avaible missions will appaer here:<br>
         <div id="mission_output"></div>
        </div>

        <!-- Conteneur pour saisir les coordonnées -->
        <div name="conteneur_coordonnees">
            Please enter the coordinates of the destination planet for this mission.<br>
            <input id="galaxy" name="galaxy" size="1" maxlength="1" onChange="updateVars();return CheckTargetBis();" onkeyup="updateVars();return CheckTargetBis();" value="1" type="hidden">

            <label for="System">System:</label>
         <input id="system" name="system" size="3" maxlength="3" onChange="updateVars();return CheckTargetBis();" onkeyup="updateVars();return CheckTargetBis();" value="{$system}" type="text"><br>
			
			<label for="position">Planet:</label>
           <input id="planet" name="planet" size="2" maxlength="3" onChange="updateVars();return CheckTargetBis();" onkeyup="updateVars();return CheckTargetBis();" value="{$planet}" type="text"><br>
		  
		   <label for="position">Type : </label>
		<select id="type" name="type" onchange="updateVars();return CheckTargetBis();">
					{html_options options=$typeSelect selected=$type}
				</select>
		   
            
			<div id="reponse_ajax1"></div>
        </div>
		
        <!-- Conteneur qui contiendra tous les champs du formulaire pour la mission -->
        <div name="conteneur_champ">
            <!-- Si la mission nécessite l'affichage des raccourcis pour les coordonnées -->
                             <h3>Shortcut to your planets ({$PlanetCount})<img onmouseout="cache();" onmouseover="montre('Show / hide this part of the form.');" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                 <div id="liste_planete">
                                          
{foreach $colonyList as $ColonyRow}
										  <div onmouseout="cache();" onmouseover="montre('Insert coords [{$ColonyRow.system}:{$ColonyRow.planet}].');" onclick="javascript:setTarget({$ColonyRow.galaxy},{$ColonyRow.system},{$ColonyRow.planet},{$ColonyRow.type});updateVars();return CheckTargetBis();" class="planete" data-systeme="53" data-position="{$ColonyRow.planet}">
                          <img src="media/ingame/planet/{$ColonyRow.image}.jpg"> 
                          {$ColonyRow.name} [{$ColonyRow.galaxy}:{$ColonyRow.system}:{$ColonyRow.planet}]
                      </div>
					  
					  {foreachelse}
		
                       {$LNG.fl_no_colony}
                     
					  
			
                      {/foreach}
                                       </div><h3>Parameters and flight details<img onmouseout="cache();"  src="media/ingame/image/mission/joystick.png" class="switch"></h3>
  <div id="settings">  
                        <table>
                            <!-- Détail sur le fret et la vitesse globale de la flotte -->
                            <tbody><tr>
                                <td><img src="media/ingame/image/mission/boite.png"> Capacity :</td>
                                <td id="storage">-</td>
                                <td><img src="media/ingame/image/mission/vitesse.png"> Speed :</td>
                                <td><span name="vitesse" class="orange">64.29</span> %</td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                            <!-- Détails sur le plan de vol pour le sens « aller » -->
                            <tr>
                                <td><img src="media/ingame/image/mission/horloge.png"> Time :</td>
                               <td id="duration">-</td>
                                <td><img src="media/ingame/image/mission/funnel.png"> Comsuption :</td>
                                <td id="consumption">-</td>
                                <td><img src="media/ingame/image/mission/parametre.png"> Reactors :</td>
                                <td> <select id="speed" name="speed" onChange="updateVars()">
					{html_options options=$speedSelect}
				</select></td>
                            </tr>
                            
                                                    </tbody></table>
                    <div style="color : grey; font-style : italic;"> You can change the speed of your fleet by clicking the percentage next to "reactors". <br> Elements <span class="cyan">blue</span> represent the meaning "go way" and the elements <span class="rouge">red</span> represent the meaning "return way."</div></div>
					
					
					     <!-- Si la mission autorise l'affichage des ressources dans le formulaire -->
                                             <h3>Ressources <img onmouseout="cache();" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                         <div id="form_ressource">
                             <div id="msg_fret"></div>

                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/metal.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_fer">Iron :</label>
                                  </div>
                                  <input class="entier" name="metal" maxlength="15" onchange="updateVars();" onkeyup="updateVars()" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxResourceBis('metal');updateVars();">
                              </div>
							  
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/crystal.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_oro">Gold :</label>
                                  </div>
                                  <input class="entier" name="crystal" maxlength="15" onchange="updateVars();" onkeyup="updateVars()" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxResourceBis('crystal');updateVars();">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/deuterium.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_cristal">Cristal :</label>
                                  </div>
                                  <input class="entier" name="deuterium" maxlength="15" onchange="updateVars();" onkeyup="updateVars()" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxResourceBis('deuterium');updateVars();">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/elyrium.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_elyrium">Elyrium :</label>
                                  </div>
                                  <input class="entier" name="elyrium" maxlength="15" onchange="updateVars();" onkeyup="updateVars()" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxResourceBis('elyrium');updateVars();">
                              </div>
                             
                             <div class="espace"></div>
                         </div>
						 
					
                        

                    <!-- Si la mission autorise l'affichage des populations dans le formulaire -->
                                             <h3>Populations<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                         <div id="form_population">
						
                                                          {foreach $PopulationOnPlanet as $PopRow}
											<div class="population">
                            <img name="entite" src="styles/theme/gow/gebaeude/{$PopRow.id}.jpg">
                            <div class="conteneur_label">
                                <label for="population_{$PopRow.id}">{$LNG.tech.{$PopRow.id}} :</label>
                            </div>
							<div id="population{$PopRow.id}_value" style="display:none;">{$PopRow.count|number}</div>
                            <input onchange="updateVars();" onkeyup="updateVars()" class="entier" data-appelation="{$LNG.tech.{$PopRow.id}}" id="population{$PopRow.id}" name="population{$PopRow.id}" maxlength="14" value="0" type="text">
							

                            <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population{$PopRow.id}');">
                        </div>
                             {/foreach}
                             
                             <div class="espace"></div>
                         </div>
                
                            
              
                    
					</div>
									   
									     <div class="total">
                            
                            
							<div id="reponse_ajax"></div>
							
							
                          </div>
						  
									    <div name="submit_formulaire">            
            <input id="valid_form" name="valid_form" value="Send mission" type="submit" disabled>
        </div>
									   
									   
									   </div>
									    
</div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
			</form>
<script type="text/javascript">
data			= {$fleetdata|json};
shortCutRows	= {$themeSettings.SHORTCUT_ROWS_ON_FLEET1};
fl_no_shortcuts	= '{$LNG.fl_no_shortcuts}';
</script>
									   {/block}