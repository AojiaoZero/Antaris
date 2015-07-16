{block name="content"}
 <div class="categorie" id="resulttable">
				<h2>Results <span id="info_resultat">in : <span class="orange">Planet names</span></span></h2>
				<div id="recherche_resultat">      <table class="joueur">
					<tbody><tr>
						
						<th>N°</th>
						<th class="pm">Home planet</th>
						<th class="pseudo">Username [Alliance]</th>
						<th>+/-</th>
						<th>Total Points</th>
						<th></th>
					</tr>
					
					{foreach $searchList as $searchRow}
<tr class="">
					<td class="classement">
						{$searchRow.rank}
					</td>
					<td class="pm">
						<img src="media/ingame/icon/planete.png" onmouseover="montre('Access the system ({$searchRow.system}) of your sensors.');" onmouseout="cache();" onclick="location.href='game.php?page=galaxy&amp;galaxy={$searchRow.galaxy}&amp;system={$searchRow.system}';" >
						{$searchRow.planetname} [{$searchRow.galaxy}:{$searchRow.system}:{$searchRow.planet}]
					</td>
					<td class="pseudo">
						<img src="/media/files/{$searchRow.avatar}" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();" onclick="location.href='game.php?page=playerCard&id={$searchRow.userid}';">
						<span class="joueur">{$searchRow.username}</span>
						<a onclick="location.href='game.php?page=alliance&amp;mode=info&amp;id={$searchRow.allyid}';" title="{$LNG.ls_click_3}" class="couleur_alliance">{if $searchRow.allyname != ''}[{$searchRow.allyname}]{/if}</a>
					</td>
					<td class="progression"><span class="vert">+2</span></td>
					<td class="points">
						<span class="couleur_theme">{$searchRow.total_points}</span> 
						<span style="font-size : 0.8em;">pts</span>
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