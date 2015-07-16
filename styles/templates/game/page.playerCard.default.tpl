{block name="title" prepend}{$LNG.lm_playercard}{/block}
{block name="content"}
<div id="page_contenu"><h1>Profil</h1><div class="categorie">	<h2>Public profil of <span class="couleur_theme">{$name}</h2>	<table style="margin : 0px auto; width : 100%;"> 		<tr>			<td style="width : 22%; padding-top : 10px; vertical-align : top; text-align : center;">				<img class="arrondi" src="/media/files/{$avatar}" style="height : 100px; width : 100px;" /><br />
							<h3 style="padding-left : 10px;">Ranking :</h3>				<span style="font-size : 2em; text-align : center; width : 7%; vertical-align : middle;">
								<span style="color : rgba(255, 255, 255, 0.8); text-shadow : 0px 1px 0px rgba(155, 155, 155, 0.8);">{$total_rank}</span> 					<sup style="font-size : 0.4em; vertical-align : super;">th</sup>
								<span style="font-size : 0.5em;">(<span class="orange">0</span>)</span>				</span>			</td>			<td style="width : 39%;">				<h3>Player</h3>				<span style="display : inline-block; font-weight : bold; width : 70px; text-align : left;">Nick : </span>
							<span style="display : inline-block; text-align : right; width : 170px;">
								<span style="font-size : 1.2em;"><span class="{foreach $class as $color}{$color}{/foreach}">{$name}</span></span>
							</span><br />				<span style="display : inline-block; font-weight : bold; width : 70px; text-align : left;">Alliance : </span>
								
								
								{if $allyname}
								
								
								<span style="display : inline-block; text-align : right; width : 170px;">
									<i>{$allyname}</i> 
									<a onclick="parent.location = 'game.php?page=alliance&amp;mode=info&amp;id={$allyid}';return false;" class="couleur_alliance">[{$allytag}]</a>
								</span>				
								
								{else}<span style="display : inline-block; text-align : right; width : 170px;">
									<i>-</i> 
									<a class="couleur_alliance"></a>
								</span>				{/if}
								<span style="display : inline-block; font-weight : bold; width : 100px; text-align : left;">Home planet : </span>
								
								
								
								
							<span style="display : inline-block; text-align : right; width : 140px;">
								{$homeplanet} [{$galaxy}:{$system}:{$planet}]
							</span>				<h3>Personal data</h3>				<span style="display : inline-block; font-weight : bold; width : 120px; text-align : left;">Date of birth : </span>
							<span style="display : inline-block; text-align : right; width : 120px;">
								{if $date_of_birth == 0}-{else}{$date_of_birth}{/if}
							</span><br />				<span style="display : inline-block; font-weight : bold; width : 50px; text-align : left;">Sexe : </span>
							<span style="display : inline-block; text-align : right; width : 190px;">
								<span class="cyan">{if !$sexe}Undefined{elseif $sexe == 1}Man{elseif $sexe == 2}Woman{/if}</span>
							</span>				<h3>Various information</h3>				<span style="display : inline-block; font-weight : bold; width : 110px;; text-align : left;">Register date : </span>
							<span style="display : inline-block; text-align : right; width : 130px;">
								{$ddates}
							</span><br />			</td>			<td style="width : 39%;">				<h3>General points</h3>				<span style="display : inline-block; font-weight : bold; width : 120px; text-align : left;">General points : </span>
							<span style="display : inline-block; text-align : right; width : 120px;">
								<span class="couleur_theme">{$total_points}</span> pts
							</span><br />				<h3>Detailed statistics</h3>				<span style="display : inline-block; font-weight : bold; width : 90px; text-align : left;">Buildings : </span>
							<span style="display : inline-block; text-align : right; width : 110px;">
								<span class="couleur_theme">{$build_points}</span> pts
							</span>
							<span style="display : inline-block; text-align : right; width : 40px; font-size : 0.9em;">
								(41%)
							</span><br />				<span style="display : inline-block; font-weight : bold; width : 90px; text-align : left;">Research : </span>
							<span style="display : inline-block; text-align : right; width : 110px;">
								<span class="couleur_theme">{$tech_points}</span> pts
							</span>
							<span style="display : inline-block; text-align : right; width : 40px; font-size : 0.9em;">
								(33%)
							</span><br />				<span style="display : inline-block; font-weight : bold; width : 90px; text-align : left;">Ships : </span>
							<span style="display : inline-block; text-align : right; width : 110px;">
								<span class="couleur_theme">{$fleet_points}</span> pts
							</span>
							<span style="display : inline-block; text-align : right; width : 40px; font-size : 0.9em;">
								(8%)
							</span><br />				<span style="display : inline-block; font-weight : bold; width : 90px; text-align : left;">Defense : </span>
							<span style="display : inline-block; text-align : right; width : 110px;">
								<span class="couleur_theme">{$defs_points}</span> pts
							</span>
							<span style="display : inline-block; text-align : right; width : 40px; font-size : 0.9em;">
								(0%)
							</span><br />				<span style="display : inline-block; font-weight : bold; width : 90px; text-align : left;">Population : </span>
							<span style="display : inline-block; text-align : right; width : 110px;">
								<span class="couleur_theme">{$pop_points}</span> pts
							</span>
							<span style="display : inline-block; text-align : right; width : 40px; font-size : 0.9em;">
								(6%)
							</span><br />			</td> 		</tr> 		
							
							
							<tr>			<td colspan="3" style="text-align : center; padding-top : 35px;">				<a onclick="location.href='game.php?page=messages&mode=write&id={$id}';">
								Send a message to {$name}</a>			{if $allyname}	 / <a onclick="location.href='game.php?page=alliance&amp;mode=info&amp;id={$allyid}';">
									See the description of the Alliance</a>	{/if}		</td> 		</tr>	</table></div>
									
									{* 
									<div class="categorie">	<h2>View the profile of another player</h2>	<form id="form_profil_public" action="" method="get">		<i>Please enter a username of another player in the form below to view its profile.</i><br /><br />		<label style="margin-right : 20px;">Username :</label>		<input style="margin-right : 20px;" type="text" id="pseudo" name="pseudo" maxlength="20" size="20" />		<input type="submit" id="valid_form_profil_public" name="valid_form_profil_public" value="View profile" />	</form></div>*}</div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}