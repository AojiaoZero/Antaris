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