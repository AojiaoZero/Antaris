{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<form action="game.php?page=Tportal&mode=missionSend" method="post" onsubmit="return CheckTargetPortal()" id="form">
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
		  
		  
            
			<div id="reponse_ajax1"></div>
			
			
		
        </div>
		<div name="submit_formulaire">
            <input id="valid_form" name="valid_form" value="Envoyer la mission" type="submit">
        </div><div class="espace"></div>
		 </div> </div></div>
		 {/block}