<div id="statistique_resultat"><table class="joueur">
					<tr>
						<th>N°</th>
						<th class="pseudo">{$LNG.ls_market_7}</th>
						<th>+/-</th>
						<th>{$LNG.ls_alliance_90}</th>
						<th class="pm">{$LNG.pl_homeplanet}</th>
						<th></th>
					</tr>
					
					
					{foreach name=RangeList item=RangeInfo from=$RangeList}
					<tr class="">
					<td class="classement">
						{if $RangeInfo.rank == 1}
						<img src="media/ingame/icon/trophee_1.png" />
						{elseif $RangeInfo.rank == 2}
						<img src="media/ingame/icon/trophee_2.png" />
						{elseif $RangeInfo.rank == 3}
						<img src="media/ingame/icon/trophee_3.png" />
						{else}{$RangeInfo.rank}{/if}
						
					</td>
					<td class="pseudo">
						<img src="/media/files/{$RangeInfo.avatar}" onclick="location.href='game.php?page=PlayerCard&id={$RangeInfo.id}';" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();" 
							   />
						<span class="joueur"><span class="{foreach $RangeInfo.class as $color}{$color}{/foreach}">{$RangeInfo.name}</span></span>
						<a 
								title="Afficher la page de l'alliance" class="couleur_alliance">{if $RangeInfo.allyid != 0}<a href="game.php?page=alliance&amp;mode=info&amp;id={$RangeInfo.allyid}" class="couleur_alliance">
								
								{if $RangeInfo.allyid == $CUser_ally}[{$RangeInfo.allytag}]</span>{else}[{$RangeInfo.allytag}]{/if}</a>{else}{/if}</a>
					</td>
					<td class="progression">{if $RangeInfo.ranking == 0}<span class="orange">0</span>{elseif $RangeInfo.ranking < 0}<span class="rouge">{$RangeInfo.ranking}</span>{elseif $RangeInfo.ranking > 0}<span class="vert">+{$RangeInfo.ranking}</span>{/if}</td>
					<td class="points">
						<span class="couleur_theme">{$RangeInfo.points}</span> 
						pts
					</td>
					<td class="pm">
					<a onclick="location.href='game.php?page=galaxy&amp;galaxy={$RangeInfo.galaxy}&amp;system={$RangeInfo.system}';">
						<img src="media/ingame/icon/planete.png" onmouseover="montre('Access the system ({$RangeInfo.system}) of your sensors.');" onmouseout="cache();"
							   /></a>
						{$RangeInfo.planetname} [{$RangeInfo.galaxy}:{$RangeInfo.system}:{$RangeInfo.planet}]
					</td>
					<td class="actions">
						<img src="media/ingame/icon/profil.png" onclick="location.href='game.php?page=playerCard&id={$RangeInfo.id}';" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();"
							  />
						<img src="media/ingame/icon/contact.png" onclick="location.href='game.php?page=messages&mode=write&id={$RangeInfo.id}';" onmouseover="montre('{$LNG.ls_click_2}');" onmouseout="cache();"
							  /> 
							 
					</td>
				</tr>
				{/foreach}
				
				</table>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>