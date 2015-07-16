<div style="text-align : justify;">
        The spacecraft you have ordered us to send just arrived in orbit of the planet Babylon [{$targetPlanet.galaxy}:{$targetPlanet.system}]
         belonging to the empire of player mortirus
    </div>
  
    <div class="citation">
        <div class="guillemet ouvrir">&laquo;</div>
        <div class="guillemet fermer">&raquo;</div>
          
        Our spy spacecraft was sent via the space to retrieve information on the planet Babylon [{$targetPlanet.galaxy}:{$targetPlanet.system}].
         Our scientists and analysts have recovered and processed all the information transmitted by the device via subspace.
        
       
        
        <div style="font-style : normal;">
            <!-- Si les niveaux d'espionnages sont identiques, on affiche les ressources -->
			
			{foreach $spyData as $Class => $elementIDs}
                        <h3>{$LNG.tech.$Class} :</h3>
						
            <div class="rapport_colonne">
			{foreach $elementIDs as $elementID => $amount}
                            &mdash; {$LNG.tech.$elementID} : <span class="orange">{$amount|number}</span><br />
{/foreach}
                        </div>
            {/foreach}
            
                             
         
                                             
         
                                             
                  
               
                                             
                
                                    </div>
            </div>
        
    <div class="explication_utilisateur">
       
The amount of information stolen depends on your level of spying and espionage level of the opponent.
         You can consult the community forums for more information on spy reports.
    </div>
</div>