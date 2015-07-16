{block name="title" prepend}{$LNG.lm_fleettable_5}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_fleettable_5}</h1>
<div class="onglet">
            <ul>
              <li><a href="?page=fleetTable" title="{$LNG.lm_fleettable_1}">{$LNG.lm_fleettable_2}</a></li>
              <li><a href="?page=fleetTable&mode=manage" title="{$LNG.lm_fleettable_3}">{$LNG.lm_fleettable_4}</a></li>
            </ul>
          </div>
		  
          <div id="centre_spatial"><div id="transporter_centre_spatial" class="formulaire_mission categorie">
    
        
        <h2><div class="transparent" style="text-align:left;float:left;">{$LNG.fl_fleets} {$activeFleetSlots} / {$maxFleetSlots}</div>
			<div class="transparent" style="text-align:right;float:right;">{$activeExpedition} / {$maxExpedition} {$LNG.fl_expeditions}</div></h2>
        
        <!-- Description de la mission -->
        



        <!-- Conteneur qui contiendra tous les champs du formulaire pour la mission -->
        <div name="conteneur_champ">
           
            <!-- SI la mission est de « recycler » ou de « baser des vaisseaux ruines » ALORS on affiche la liste des vaisseaux ruines -->
                <div id="form_vaisseau">
                    <!-- Il faut au moins un vaisseau sur la planète -->
                                        <table>
                        <tr>
                          <th>{$LNG.fl_number}</th>
		<th>{$LNG.fl_mission}</th>
		<th>{$LNG.fl_ammount}</th>
		<th>{$LNG.fl_beginning}</th>
		<th>{$LNG.fl_departure}</th>
		<th>{$LNG.fl_destiny}</th>
		<th>{$LNG.fl_arrival}</th>
		<th>{$LNG.fl_objective}</th>
		<th>{$LNG.fl_order}</th>
                        </tr>
                        
                        <!-- On parcours tous les modèles de vaisseau présent sur la planète -->
                                                    
                                                                                     
                           {foreach name=FlyingFleets item=FlyingFleetRow from=$FlyingFleetList}
	<tr>
	<td>{$smarty.foreach.FlyingFleets.iteration}</td>
	<td>{$LNG.type_mission.{$FlyingFleetRow.mission}}
	
	</td>
	<td><a class="tooltip_sticky" data-tooltip-content="<table width='100%'><tr><th colspan='2' style='text-align:center;'>{$LNG.fl_info_detail}</th></tr>{foreach $FlyingFleetRow.FleetList as $shipID => $shipCount}<tr><td class='transparent'>{$LNG.tech.{$shipID}}:</td><td class='transparent'>{$shipCount}</td></tr>{/foreach}</table>">{$FlyingFleetRow.amount}</a></td>
	<td><a href="game.php?page=galaxy&amp;galaxy={$FlyingFleetRow.startGalaxy}&amp;system={$FlyingFleetRow.startSystem}">[{$FlyingFleetRow.startGalaxy}:{$FlyingFleetRow.startSystem}:{$FlyingFleetRow.startPlanet}]</a></td>
	<td{if $FlyingFleetRow.state == 0} style="color:lime"{/if}>{$FlyingFleetRow.startTime}</td>
	<td><a href="game.php?page=galaxy&amp;galaxy={$FlyingFleetRow.endGalaxy}&amp;system={$FlyingFleetRow.endSystem}">[{$FlyingFleetRow.endGalaxy}:{$FlyingFleetRow.endSystem}:{$FlyingFleetRow.endPlanet}]</a></td>
	{if $FlyingFleetRow.mission == 4 && $FlyingFleetRow.state == 0}
	<td>-</td>
	{else}
	<td{if $FlyingFleetRow.state != 0} style="color:lime"{/if}>{$FlyingFleetRow.endTime}</td>
	{/if}
	<td id="fleettime_{$smarty.foreach.FlyingFleets.iteration}" class="fleets" data-fleet-end-time="{$FlyingFleetRow.returntime}" data-fleet-time="{$FlyingFleetRow.resttime}">{pretty_fly_time({$FlyingFleetRow.resttime})}</td>
	<td>
	{if !$isVacation && $FlyingFleetRow.state != 1}
		<form action="game.php?page=fleetTable&amp;action=sendfleetback" method="post">
		<input name="fleetID" value="{$FlyingFleetRow.id}" type="hidden">
		<input value="{$LNG.fl_send_back}" type="submit">
		</form>
		
	{else}
	&nbsp;-&nbsp;
	{/if}
	</td>
	</tr>
	{foreachelse}
	<tr>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
	</tr>
	{/foreach}
                                            </table>

                    <!-- Le joueur ne possède pas de vaisseaux sur cette planète -->
                                    </div>


                   <form action="?page=fleetStep1" method="post">
<input type="hidden" name="galaxy" value="{$targetGalaxy}">
<input type="hidden" name="system" value="{$targetSystem}">
<input type="hidden" name="planet" value="{$targetPlanet}">
<input type="hidden" name="type" value="{$targetType}">
<input type="hidden" name="target_mission" value="{$targetMission}"> 
                    

                    <!-- Si la mission autorise l'affichage des appareils spécialisés dans le formulaire -->
                                             <h3>List of your fleets (<a onclick="javascript:maxShips();">All</a>)</h3>
                         <div id="form_appareil">
{foreach $FleetsOnPlanet as $FleetRow}
                                                          <div class="appareil">
                                 <img name="entite" src="styles/theme/gow/gebaeude/{$FleetRow.id}.gif" />
                                 <div class="conteneur_label">
                                      <label for="appareil_{$FleetRow.id}">{$LNG.tech.{$FleetRow.id}} :</label>
                                 </div>
								 {if $FleetRow.speed != 0}
								 <div id="ship{$FleetRow.id}_value" style="display:none;">{$FleetRow.count|number}</div>
                                 <input type="text" class="entier" id="ship{$FleetRow.id}_input" value="0" name="ship{$FleetRow.id}" 
                                        data-appelation="{$LNG.tech.{$FleetRow.id}}" maxlength="15" value="0" />
                                 <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" 
                                      onclick="javascript:maxShip('ship{$FleetRow.id}');" />
									  {else}
									  {/if}
                             </div>
                                                 
                             {/foreach}
                             <div class="espace"></div>
                         </div>
                 
                    
                
                            
            
                    </div>

        <div name="submit_formulaire">
            <input type="submit" id="valid_form" name="valid_form" value="Continue" />
        </div>
            
        
    </form>
    
    </div>	


    <!-- Appel important à la fonction javascript qui initialise l'onglet -->
    
</div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
{block name="script" append}<script src="scripts/game/fleetTable.js"></script>{/block}