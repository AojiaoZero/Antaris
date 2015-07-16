{block name="title" prepend}Planet Jump{/block}
{block name="content"}
		 <!-- Si la mission autorise l'affichage des ressources dans le formulaire -->
                                           
                         <div id="liste_equipage">
 
							 
							 
							  <table>
                            <tbody>
							
							{foreach $MissionSelector as $MissionID}<tr>
							
                                <td> <label for="radio_{$MissionID}">{$LNG.type_mission.{$MissionID}}</label></td>
                                <td><input id="radio_{$MissionID}" type="radio" name="mission" value="{$MissionID}" {if $mission == $MissionID}checked="checked"{/if} style="width:30px;" onclick="document.getElementById('valid_form').removeAttribute('disabled')"></td>
								 
                                
                            </tr>{/foreach}
                            
                        </tbody></table>
						
						
                         </div>
						 
						 
						 
						 
        		<input type="hidden" name="tokens" value="{$tokens}">

			{/block}
			
	