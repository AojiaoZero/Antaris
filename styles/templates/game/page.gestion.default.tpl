{block name="title" prepend}{$LNG.page_gestion_1}{/block}
{block name="content"}
<div id="page_contenu">

<h1>{$LNG.page_gestion_1}</h1>

<div id="page_gestion">

{$LNG.page_gestion_2}<br /><br />


{foreach $messageList as $messageID => $messageRow}
<div class="categorie planete">	

<h2><span class="gris">{$LNG.page_gestion_3} :</span> {$messageRow.name} [{$messageRow.galaxy}:{$messageRow.system}:{$messageRow.planet}]</h2>	<div class="changer"><a href="#" onclick="location.href='game.php?page=overview&cp={$messageRow.plid}';">[{$LNG.page_gestion_4}]</a></div>	<div class="information">		<h4>Informations</h4> 		<img src="media/ingame/planet/{$messageRow.image}.jpg" alt="{$LNG.page_gestion_5}." />		{$LNG.ls_overview_9} : <span class="couleur_theme">{$messageRow.field_current}</span> / 
								<span class="couleur_theme">{$messageRow.field_max}</span><br />		<div class="classement " 
							 onclick="location.href='game.php?page=gestion&mode=order';" 
							 onmouseover="montre('{$LNG.page_gestion_6}.');" onmouseout="cache();">
								<div class="chiffre img-{$messageRow.number}"></div>
						</div>	</div>	<div class="ressource">		<h4>{$LNG.page_gestion_7}</h4>		<h3>{$LNG.page_gestion_8}</h3>		<table class="ressource">			<tr>				<td>{$LNG.tech.901} :</td>				<td>{$messageRow.gmetal}</td>				<td>({$messageRow.gmetalpircent}%)</td>			</tr>			<tr>				<td>{$LNG.tech.902} :</td>				<td>{$messageRow.gcrystal}</td>				<td>({$messageRow.gcrystalpircent}%)</td>			</tr>			<tr>				<td>{$LNG.tech.903} :</td>				<td>{$messageRow.gdeuterium}</td>				<td>({$messageRow.gdeuteriumpircent}%)</td>			</tr>			<tr>				<td>{$LNG.tech.904} :</td>				<td>{$messageRow.gelyrium}</td>				<td>({$messageRow.gelyriumpircent}%)</td>			</tr>			<tr>				<td>Energie :</td>				<td>{$messageRow.energy_used} / {$messageRow.energy}</td>				<td>({$messageRow.energypircent}%)</span></td>			</tr>		</table>		<h3>{$LNG.page_gestion_9}</h3>		<table class="production">			<tr>				<td>{$LNG.tech.901} :</td>				<td><span {if $messageRow.metal_mine_porcent >= 70}class="vert"{elseif $messageRow.metal_mine_porcent > 0}class="couleur_theme"{elseif $messageRow.metal_mine_porcent == 0}class="rouge"{/if}>{if $messageRow.metal_mine_porcent == 0}OFF{else}{$messageRow.metal_mine_porcent}%{/if}</span></td>	

						<td>{$LNG.tech.902} :</td>				<td><span {if $messageRow.crystal_mine_porcent >= 70}class="vert"{elseif $messageRow.crystal_mine_porcent > 0}class="couleur_theme"{elseif $messageRow.crystal_mine_porcent == 0}class="rouge"{/if}>{if $messageRow.crystal_mine_porcent == 0}OFF{else}{$messageRow.crystal_mine_porcent}%{/if}</span></td>		</tr>
						
						
						
						
						<tr>				<td>{$LNG.tech.903} :</td>				<td><span {if $messageRow.deuterium_sintetizer_porcent >= 70}class="vert"{elseif $messageRow.deuterium_sintetizer_porcent > 0}class="couleur_theme"{elseif $messageRow.deuterium_sintetizer_porcent == 0}class="rouge"{/if}>{if $messageRow.deuterium_sintetizer_porcent == 0}OFF{else}{$messageRow.deuterium_sintetizer_porcent}%{/if}</span></td>		


						<td>{$LNG.tech.904} :</td>				<td><span {if $messageRow.elyrium_mine_porcent >= 70}class="vert"{elseif $messageRow.elyrium_mine_porcent > 0}class="couleur_theme"{elseif $messageRow.elyrium_mine_porcent == 0}class="rouge"{/if}>{if $messageRow.elyrium_mine_porcent == 0}OFF{else}{$messageRow.elyrium_mine_porcent}%{/if}</span></td>			</tr>		</table>		
						
						
						<h3>{$LNG.page_gestion_19}</h3>		
						<div class="portail">
						- {$LNG.page_gestion_20} {if $messageRow.teleport_portal == 0}<span class="rouge">{$LNG.page_gestion_21}</span>{else}<span class="vert">{$LNG.ls_empire_13}</span>{/if}.
						<br>
						{if $messageRow.teleport_portal == 1}- {$LNG.page_gestion_22} {if $messageRow.force_field_timer < $timinger}<span class="rouge">{$LNG.page_gestion_21}</span>{else}<span class="vert">{$LNG.ls_empire_13}</span>{/if}{/if}
						
						
						
						</div>	</div>	<div class="construction">			<h4>{$LNG.page_gestion_10}</h4>			
						<h3>{$LNG.page_gestion_11}</h3>
						{if $messageRow.buildInfo.buildings}
<table style="width : 100%;"><tbody><tr>
						<td style="text-align : left;">
							<span style="cursor : help;" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$messageRow.buildInfo.buildings['id']]}</b> (<span class=\'orange\'>32</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                <li>Fer : <span class=\'orange\'>136 239 773</span> unités</li>                                            <li>Or : <span class=\'orange\'>61 307 898</span> unités</li>                                                                </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>Début du projet : 6 aout. 2014 à 15h18</li>        <li>Fin du projet : 28 aout. 2014 à 09h09</li>        <li>Temps du projet : <span class=\'orange\'>21j 17h 51m 26s</span></li>        <li>Accomplis : <span class=\'orange\'>43%</span></li>                            </ul></div>');" onmouseout="cache();">{$LNG.tech[$messageRow.buildInfo.buildings['id']]} (<span class="orange">{$messageRow.buildInfo.buildings['level']}</span>) :</span> 
						</td>
						<td style="text-align : right;">
							<span class="timer" data-time="{$messageRow.buildInfo.buildings['timeleft']}">{$messageRow.buildInfo.buildings['starttime']}</span>
						</td>
					</tr></tbody></table>{else}<i>{$LNG.page_gestion_13}</i>	{/if}			

					<h3>{$LNG.page_gestion_23}</h3>
						{if $messageRow.buildInfo.defense}
<table style="width : 100%;"><tbody><tr>
						<td style="text-align : left;">
							<span style="cursor : help;" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$messageRow.buildInfo.defense['id']]}</b> (<span class=\'orange\'>32</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                <li>Fer : <span class=\'orange\'>136 239 773</span> unités</li>                                            <li>Or : <span class=\'orange\'>61 307 898</span> unités</li>                                                                </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>Début du projet : 6 aout. 2014 à 15h18</li>        <li>Fin du projet : 28 aout. 2014 à 09h09</li>        <li>Temps du projet : <span class=\'orange\'>21j 17h 51m 26s</span></li>        <li>Accomplis : <span class=\'orange\'>43%</span></li>                            </ul></div>');" onmouseout="cache();">{$LNG.tech[$messageRow.buildInfo.defense['id']]} (<span class="orange">{$messageRow.buildInfo.defense['level']}</span>) :</span> 
						</td>
						<td style="text-align : right;">
							<span class="timer" data-time="{$messageRow.buildInfo.defense['timeleft']}">{$messageRow.buildInfo.defense['starttime']}</span>
						</td>
					</tr></tbody></table>{else}<i>{$LNG.page_gestion_14}.</i>	{/if}	
					
					
					
							<h3>{$LNG.page_gestion_15}</h3>
							{if $messageRow.buildInfo.fleet}
<table style="width : 100%;"><tbody><tr>
						<td style="text-align : left;">
							<span style="cursor : help;" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$messageRow.buildInfo.fleet['id']]}</b> (<span class=\'orange\'>32</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                <li>Fer : <span class=\'orange\'>136 239 773</span> unités</li>                                            <li>Or : <span class=\'orange\'>61 307 898</span> unités</li>                                                                </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>Début du projet : 6 aout. 2014 à 15h18</li>        <li>Fin du projet : 28 aout. 2014 à 09h09</li>        <li>Temps du projet : <span class=\'orange\'>21j 17h 51m 26s</span></li>        <li>Accomplis : <span class=\'orange\'>43%</span></li>                            </ul></div>');" onmouseout="cache();">{$LNG.tech[$messageRow.buildInfo.fleet['id']]} (<span class="orange">{$messageRow.buildInfo.fleet['level']}</span>) :</span> 
						</td>
						<td style="text-align : right;">
							<span class="timer" data-time="{$messageRow.buildInfo.fleet['timeleft']}">{$messageRow.buildInfo.fleet['starttime']}</span>
						</td>
					</tr></tbody></table>{else}<i>{$LNG.page_gestion_16}.</i>	{/if}	
					

						<h3>{$LNG.page_gestion_17}</h3>
						{if $messageRow.buildInfo.tech}
<table style="width : 100%;"><tbody><tr>
						<td style="text-align : left;">
							<span style="cursor : help;" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$messageRow.buildInfo.tech['id']]}</b> (<span class=\'orange\'>32</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                <li>Fer : <span class=\'orange\'>136 239 773</span> unités</li>                                            <li>Or : <span class=\'orange\'>61 307 898</span> unités</li>                                                                </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>Début du projet : 6 aout. 2014 à 15h18</li>        <li>Fin du projet : 28 aout. 2014 à 09h09</li>        <li>Temps du projet : <span class=\'orange\'>21j 17h 51m 26s</span></li>        <li>Accomplis : <span class=\'orange\'>43%</span></li>                            </ul></div>');" onmouseout="cache();">{$LNG.tech[$messageRow.buildInfo.tech['id']]} (<span class="orange">{$messageRow.buildInfo.tech['level']}</span>) :</span> 
						</td>
						<td style="text-align : right;">
							<span class="timer" data-time="{$messageRow.buildInfo.tech['timeleft']}">{$messageRow.buildInfo.tech['starttime']}</span>
						</td>
					</tr></tbody></table>{else}<i>{$LNG.page_gestion_18}.</i>	{/if}
						
						
							</div></div>{/foreach} </div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}