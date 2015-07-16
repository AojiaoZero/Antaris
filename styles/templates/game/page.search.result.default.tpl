{block name="content"}
 <div class="categorie" id="resulttable">
				<h2>Results <span id="info_resultat">in : <span class="orange">Usernames</span> </span></h2>
				<div id="recherche_resultat">      <table class="joueur">
					<tbody><tr>
						<th>N°</th>
						<th class="pseudo">Username [Ally]</th>
						<th>+/-</th>
						<th>Total points</th>
						<th class="pm">Home planet</th>
						<th></th>
					</tr>
					
					{foreach $searchList as $searchRow}
 <tr class="{if $searchRow.userid == 1}its_me{/if}">
					<td class="classement">
						{$searchRow.rank}
					</td>
					<td class="pseudo">
						<img src="/media/files/{$searchRow.avatar}" width="24px" height="24px" onclick="location.href='game.php?page=PlayerCard&id={$searchRow.userid}';" onmouseover="montre('{$LNG.ls_click_1}');" >
						<span class="joueur"><span class="">{$searchRow.username}</span> {if $searchRow.allyname}<a href="game.php?page=alliance&amp;mode=info&amp;id={$searchRow.allyid}"><span class="couleur_alliance">[{$searchRow.allyname}]</span></a>{else}{/if}</span>
						
					</td>
					<td class="progression"><span class="vert">+1</span></td>
					<td class="points">
						<span class="couleur_theme">{$searchRow.total_points}</span> 
						pts
					</td>
					<td class="pm">
						<img src="media/ingame/icon/planete.png" onclick="location.href='game.php?page=galaxy&amp;galaxy={$searchRow.galaxy}&amp;system={$searchRow.system}';"  onmouseover="montre('Access the system ({$searchRow.system}) of your sensors.');" onmouseout="cache();">
						{$searchRow.planetname}
						{if $searchRow.planetcloak > $searchRow.timer}[*:***:**] 
		{else}[{$searchRow.galaxy}:{$searchRow.system}:{$searchRow.planet}]{/if}
					</td>
					<td class="actions">
						<img src="media/ingame/icon/profil.png" onclick="location.href='game.php?page=playerCard&id={$searchRow.userid}';" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();"
							  />
						<img src="media/ingame/icon/contact.png" onclick="location.href='game.php?page=messages&mode=write&id={$searchRow.userid}';" onmouseover="montre('{$LNG.ls_click_2}');" onmouseout="cache();"
							  />  
					</td>
				</tr>
				{/foreach}
				
				</tbody></table></div>
			  </div>   
{/block}