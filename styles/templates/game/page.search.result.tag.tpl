{block name="content"}
 <div class="categorie" id="resulttable">
				<h2>Results <span id="info_resultat">in : <span class="orange">Alliance tags</span> </span></h2>
				<div id="recherche_resultat">      <table class="joueur">
					<tbody><tr>
						<th>N°</th>
						<th class="nom">Name of the ally [Tag]</th>
						<th>Total points</th>
						<th>Recruitement</th>
						<th class="fondateur">Owner</th>
						<th></th>
					</tr>
					
					{foreach $searchList as $searchRow}
<tr class="its_me">
					<td class="classement">
						76
					</td>
					<td class="nom">
						<span class="nom">{$searchRow.allyname}</span>
						<a onclick="location.href='game.php?page=alliance&amp;mode=info&amp;tag={$searchRow.allytag}';" title="{$LNG.ls_click_3}" class="couleur_alliance">[{$searchRow.allytag}]</a>
					</td>
					<td class="valeur_champ">
						<span class="couleur_theme">{$searchRow.allypoints}</span> 
						<span style="font-size : 0.8em;">pts
					</span></td>
					<td class="recrutement">
					{if $searchRow.ally_request_notallow == 0}
					<span class="rouge">{$LNG.ls_answer_2}</span></td>
					{else}
					<span class="vert">{$LNG.ls_answer_1}</span></td>
					{/if}
					<td class="fondateur">
						<img src="media/ingame/icon/profil.png" onclick="location.href='game.php?page=playerCard&id={$searchRow.allyowners}';" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();">
						{$searchRow.allyowner}
					</td>
					<td class="actions">
						<img src="media/ingame/icon/rapport.png" onmouseover="montre('{$LNG.ls_click_3}');" onmouseout="cache();" onclick="location.href='game.php?page=alliance&amp;mode=info&amp;tag={$searchRow.allytag}';">
						
					</td>
				</tr>
				{/foreach}
				
				</tbody></table></div>
			  </div>   
{/block} 