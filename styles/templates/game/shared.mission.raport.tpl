{block name="title" prepend}{$pageTitle}{/block}
{block name="content"}
<div id="header"></div>
 <!-- Pour afficher la version de l'univers -->
        <div id="version_univers"></div>
        
                <div id="rapport_exporter">
            <div class="bar superieure"></div>
            <div class="bar inferieure"></div>
        <div id="page_contenu"><h1>Exporting a Report</h1><div id="page_rapport_exportation"><h2 class="titre_corps">Share this post</h2>
              You can share this report with other members of the community through this link :<br>
              Need to add link here
              <br><br>
              Info : <span class="rouge">It is strictly prohibited to provide any details of a hostile planet on the forum or on chat.</span>
              <br><br>
              <h2 class="titre_corps">{if $Raport.mode == 1}{$LNG.sys_destruc_title}{else}{$LNG.sys_attack_title}{/if} 
{$Raport.time}:</h2>
              <div class="contenu_message">

<div name="attaque_portail" class="conteneur_message">
    
    
			<div style="width : 620px; text-align : center; margin : 20px auto;">
			
			{foreach $Raport.rounds as $Round => $RoundInfo}
			  {if $Round == 0}  <h3>The armies before battle :</h3>{elseif $Round == $RoundInfo@last}<h3>The armies after the battle :</h3>		{/if}  
			 

			{if $Round == 0 || $Round == $RoundInfo@last}
            {foreach $RoundInfo.attacker as $Player}
			{$PlayerInfo = $Raport.players[$Player.userID]}
			<!-- Titre du tableau pour le joueur attaquant -->
            <div class="titre_tableau">
                Army of the attacker « <span class="rouge">{$PlayerInfo.name}</span> »
            </div>
                        {if !empty($Player.ships)}
							<table class="combat">
					<tbody><tr>
						<th>Name</th>
						<th>Attack ({$PlayerInfo.tech[0]}%)</th>
						<th>Hull ({$PlayerInfo.tech[1]}%)</th>
						<th>Shield ({$PlayerInfo.tech[2]}%)</th>
						<th>Amount</th>
					</tr>
					{foreach $Player.ships as $ShipID => $ShipData}
					                    					<tr>
						<td>{$LNG.shortNames.{$ShipID}}</td>
						<td>{$ShipData[1]|number}</td>
						<td>{$ShipData[2]|number}</td>
						<td>{$ShipData[3]|number}</td>
						<td>{$ShipData[0]|number}</td>
					</tr>
                    	{/foreach}
                    									</tbody></table>
						{elseif $RoundInfo > 1}
						<table class="combat">
					<tbody><tr>
						<th>Name</th>
						<th>Attack </th>
						<th>Hull </th>
						<th>Shield </th>
						<th>Amount</th>
					</tr>
								<tr>
						<td colspan="5"><span class="rouge">Destroyed</span></td>
					</tr>
						</tbody></table>
						
						
					{else}The defendant has no army on this planet.
						{/if}
			
            {/foreach}
			
			{foreach $RoundInfo.defender as $Player}
		{$PlayerInfo = $Raport.players[$Player.userID]}
              <div class="titre_tableau">
                Army of the defender « <span class="cyan">{$PlayerInfo.name}</span> »
            </div>
                        {if !empty($Player.ships)}
							<table class="combat">
					<tbody><tr>
						<th>Name</th>
						<th>Attack ({$PlayerInfo.tech[0]}%)</th>
						<th>Hull ({$PlayerInfo.tech[1]}%)</th>
						<th>Shield ({$PlayerInfo.tech[2]}%)</th>
						<th>Amount</th>
					</tr>
					{foreach $Player.ships as $ShipID => $ShipData}
					                    					<tr>
						<td>{$LNG.shortNames.{$ShipID}}</td>
						<td>{$ShipData[1]|number}</td>
						<td>{$ShipData[2]|number}</td>
						<td>{$ShipData[3]|number}</td>
						<td>{$ShipData[0]|number} </td>
					</tr>
                    	{/foreach}
                    									</tbody></table>
					{elseif $RoundInfo > 1}<table class="combat">
					<tbody><tr>
						<th>Name</th>
						<th>Attack </th>
						<th>Hull </th>
						<th>Shield </th>
						<th>Amount</th>
					</tr>
								<tr>
						<td colspan="5"><span class="rouge">Destroyed</span></td>
					</tr>
						</tbody></table>
					{else}The defendant has no army on this planet.
						{/if}
			
            {/foreach}
  
	{/if}						
			
{/foreach}	
			<h3>Battle Report : </h3>
			
			{if $Raport.result == "a"}



				<span class="vert">{if isset($Info)}{$Info.0}{else} The Attacker(s){/if} won</span> <i>the military combat.</i><br>
				<span class="rouge">{if isset($Info)}{$Info.1}{else} The Defenders(s){/if} lost</span> <i>the military combat.</i>
				
				<!-- Si l'attaquant gagne et qu'il a volé des ressources -->
						<br><br>
			<b>{if isset($Info)}{$Info.0}{else} The Attacker(s){/if} retrieves the following resources :</b><br>
			{foreach $Raport.steal as $elementID => $amount}
				                    					- <span style="display : inline-block; width : 80px; text-align : left;">{$LNG.tech.$elementID} :</span> 
					<span style="display : inline-block; width : 120px; text-align : left;" class="orange">{$amount|number}</span><br>{/foreach}
{elseif $Raport.result == "r"}
<span class="rouge">{if isset($Info)}{$Info.0}{else} The Attacker(s){/if} lost</span> <i>the military combat.</i><br>
<span class="vert">{if isset($Info)}{$Info.1}{else} The Defenders(s){/if} won</span> <i>the military combat.</i>
{else}
<span class="orange">The battle that opposed {if isset($Info)}{$Info.0}{else} The Attacker(s){/if} vs {if isset($Info)}{$Info.1}{else} The Defenders(s){/if} ended in a draw</span>
{/if}


			<!-- Si le match est non nul -->
							
                
			<!-- Si le match est nul -->
	
			<!-- Si le défenseur gagne et qu'il a volé des remorqueurs -->
						
			<h3>Situation after the fight :</h3>
			{$LNG.sys_attacker_lostunits} {$Raport['units'][0]|number} {$LNG.sys_units}<br>
{$LNG.sys_defender_lostunits} {$Raport['units'][1]|number} {$LNG.sys_units}<br>
{$LNG.debree_field_1} {foreach $Raport.debris as $elementID => $amount}{$amount|number} {$LNG.tech.$elementID}{if ($amount@index + 2) == count($Raport.debris)} {$LNG.sys_and} {elseif !$amount@last}, {/if}{/foreach}{$LNG.debree_field_2}<br><br>
{if $Raport.mode == 1}
	{* Destruction *}
	{if $Raport.moon.moonDestroySuccess == -1}
		{* Attack not win *}
		{$LNG.sys_destruc_stop}<br>
	{else}
		{* Attack win *}
		{sprintf($LNG.sys_destruc_lune, "{$Raport.moon.moonDestroyChance}")}<br>{$LNG.sys_destruc_mess1}
		{if $Raport.moon.moonDestroySuccess == 1}
			{* Destroy success *}
			{$LNG.sys_destruc_reussi}
		{elseif $Raport.moon.moonDestroySuccess == 0}
			{* Destroy failed *}
			{$LNG.sys_destruc_null}			
		{/if}
		<br>
		{sprintf($LNG.sys_destruc_rip, "{$Raport.moon.fleetDestroyChance}")}
		{if $Raport.moon.fleetDestroySuccess == 1}
			{* Fleet destroyed *}
			<br>{$LNG.sys_destruc_echec}
		{/if}			
	{/if}
{else}
	{* Normal Attack *}
	
{/if}

{$Raport.additionalInfo}
			<div class="espace"></div>
		</div>

</div></div></div></div>                </div>
                
        

{/block} 