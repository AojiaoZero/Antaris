{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<form action="game.php?page=Tportal&mode=missionSend" method="post" onsubmit="return CheckTarget()" id="form">
	<input type="hidden" name="target_mission" value="{$mission}">
	
<div id="page_contenu">      <h1>Space Center</h1>
          <div id="centre_spatial">  <div id="baser_centre_spatial" class="formulaire_mission categorie">
    
        <h2>Form : {$missionText}</h2>
        
        <!-- Description de la mission -->
       <div name="conteneur_coordonnees">
{$missionDesc}
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
                                       </div>

					
					
					     <!-- Si la mission autorise l'affichage des ressources dans le formulaire -->
                                             <h3>Ressources <img onmouseout="cache();" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                         <div id="form_ressource">
                             <div id="msg_fret"></div>

                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/metal.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_fer">Iron :</label>
                                  </div>
								  <div id="population901_value" style="display:none;">{$metal}</div>
                                  <input onchange="updateVars();" onkeyup="updateVars()" class="entier" data-appelation="{$LNG.tech.901}" id="population901" name="population901" maxlength="14" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population901');updateVars();">
                              </div>
							  
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/crystal.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_oro">Gold :</label>
                                  </div>
								  <div id="population902_value" style="display:none;">{$crystal}</div>
                                  <input onchange="updateVars();" onkeyup="updateVars()" class="entier" data-appelation="{$LNG.tech.902}" id="population902" name="population902" maxlength="14" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population902');updateVars();">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/deuterium.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_cristal">Cristal :</label>
                                  </div>
								  <div id="population903_value" style="display:none;">{$deuterium}</div>
                                  <input onchange="updateVars();" onkeyup="updateVars()" class="entier" data-appelation="{$LNG.tech.903}" id="population903" name="population903" maxlength="14" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population903');updateVars();">
                              </div>
                                                          <div class="ressource">
                                  <img name="entite" src="media/ingame/image/elyrium.jpg">
                                  <div class="conteneur_label">
                                      <label for="ressource_elyrium">Elyrium :</label>
                                  </div>
								  <div id="population904_value" style="display:none;">{$elyrium}</div>
                                   <input onchange="updateVars();" onkeyup="updateVars()" class="entier" data-appelation="{$LNG.tech.904}" id="population904" name="population904" maxlength="14" value="0" type="text">
                                  <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population904');updateVars();">
                              </div>
                             
                             <div class="espace"></div>
                         </div>
						 
					<!-- Si la mission autorise l'affichage des appareils spécialisés dans le formulaire -->
                             <h3>Appareils spécialisés<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                 <div id="form_appareil">
 {foreach $FleetsOnPlanet as $PopRow}
                                          <div class="appareil">
                          <img name="entite" src="styles/theme/gow/gebaeude/{$PopRow.id}.gif">
                         <div class="conteneur_label">
                              <label for="appareil_{$PopRow.id}">{$LNG.tech.{$PopRow.id}} :</label>
                         </div>
						 <div id="population{$PopRow.id}_value" style="display:none;">{$PopRow.count|number}</div>
                         <input onchange="updateVars();" onkeyup="updateVars()" class="entier" data-appelation="{$LNG.tech.{$PopRow.id}}" id="population{$PopRow.id}" name="population{$PopRow.id}" maxlength="14" value="0" type="text">
                          <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population{$PopRow.id}');">
                     </div>
                     {/foreach}
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
            <input id="valid_form" name="valid_form" value="Send mission" type="submit">
        </div>
									   
									   
									   </div>
									    
</div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
			</form>
<script type="text/javascript">
shortCutRows	= {$themeSettings.SHORTCUT_ROWS_ON_FLEET1};
</script>
									   {/block}