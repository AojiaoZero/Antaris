{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<div id="page_contenu">      <h1>Space Center</h1>
          <div id="centre_spatial">      <div id="baser_centre_spatial" class="formulaire_mission categorie">
    
        <h2>Form Send</h2>
    <div name="formulaire_envoyer">
        <!-- Les liens pour revenir sur le menu ou sur la mission -->
        <div class="retour_menu">
            &lt;&lt; <a href="game.php?page=fleetTable">Back to the space center menu.</a><br>
            
        </div>

        <!-- On affiche le message renvoyé par le formulaire -->
         <span class="vert">A fleet ({$arraysum} vessels) began his journey
                             to Alpha Base 3 [{$destination}] to perform the mission « {$LNG.type_missionbis.{$targetMission}} ».</span>
            </div>
      
            
    
    </div>	


</div></div>       
{/block}