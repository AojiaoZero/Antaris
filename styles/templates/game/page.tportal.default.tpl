{block name="title" prepend}{$LNG.ls_tporal_1}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_tporal_1}</h1>
          <div id="portail_teleportation"><!-- Template qui permet d'afficher le menu du portail de téléportation -->
<div name="menu_portail">
    <div name="contenu_texte">
        <h3>Description :</h3>
        <div class="description">
          {$LNG.ls_tporal_2}
           
              <br><br>
			  {if $showMessage == 1}
               - <span class="rouge">{$LNG.ls_tporal_3}</span>
			   {elseif $showMessage == 2}
               - <span class="vert">{$LNG.ls_tporal_4}</span><br>
			   - <span class="rouge">{$LNG.ls_tporal_5}</span>
			   {elseif $showMessage == 3}
               - <span class="vert">{$LNG.ls_tporal_4}</span><br>
			   - <span class="vert">{$LNG.ls_tporal_6}</span>
			   {/if}
            
        </div>

        
    <!-- Le portail de téléportation est bloqué -->
      {if $havePortal == 0}   <h3>{$LNG.ls_tporal_9} :</h3>
        <div class="portail_bloquer" style="text-align : left;">
            {$LNG.ls_tporal_7} :<br />
            
			<span class="{if $energy_tech < 6}rouge{else}vert{/if}">{$LNG.tech.113}, {$LNG.ls_tporal_10} 6 <i>({$energy_tech})</i></span><br /><span class="{if $control_room_tech < 5}rouge{else}vert{/if}">{$LNG.tech.141}, {$LNG.ls_tporal_10} 5 <i>({$control_room_tech})</i></span><br /><span class="{if $particul_tech < 4}rouge{else}vert{/if}">{$LNG.tech.143}, {$LNG.ls_tporal_10} 4 <i>({$particul_tech})</i></span><br />
        </div>{else}
		{if $tpanels == 1}
		   <h3>Missions :</h3>
        <div class="liste_mission">
            <ul>
                            <li><a onclick="location.href='game.php?page=Tportal&amp;mode=mission&amp;missionID=17';" title="Mission : {$LNG.type_missionbis.4}">{$LNG.type_missionbis.4}</a></li>	
                            <li><a onclick="location.href='game.php?page=Tportal&amp;mode=mission&amp;missionID=12';" title="Mission : {$LNG.type_missionbis.12}">{$LNG.type_missionbis.12}</a></li>	
                            <li><a onclick="location.href='game.php?page=Tportal&amp;mode=mission&amp;missionID=14';" title="Mission : {$LNG.type_missionbis.6}">{$LNG.type_missionbis.6}</a></li>	
                            <li><a onclick="location.href='game.php?page=Tportal&amp;mode=mission&amp;missionID=13';" title="Mission : {$LNG.type_missionbis.13}">{$LNG.type_missionbis.13}</a></li>	
                        </ul>
        </div>
		{/if}
{/if}
        
    <!-- sinon, si le portail est activé, on affiche la liste des missions si le portail est activé -->
        </div>    
</div>

<div name="information_portail">
    {$LNG.ls_tporal_8}.
</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}