{block name="title" prepend}Space Center{/block}
{block name="content"}
<div id="page_contenu"><h1>Space Center</h1>
          <div id="centre_spatial"><!-- Template qui permet d'afficher le menu du centre spatial -->
<div name="menu_centre_spatial">
    <div name="contenu_texte">
        <h3>Description :</h3>
        <div class="description">
           To enlarge and expand your empire, it is very important to build a fleet of different types of vessels,
            from simple hunter flagship. Through your vessels, dominate the galaxy ! 
        </div>

        <!-- On affiche la liste des missions que l'on peut effectuer via le centre spatial -->
        <h3>Missions :</h3>
        <div class="liste_mission">
            <ul>
                            <li><a onclick="location.href='game.php?page=fleetTable&target_mission=4';" title="Mission : Deploy resources and / or equipment">Deploy resources and / or equipment</a></li>	
                            <li><a onclick="location.href='game.php?page=fleetTable&target_mission=3';" title="Mission : Transport resources and / or equipment">Transport resources and / or equipment</a></li>	
                            <li><a onclick="location.href='game.php?page=fleetTable&target_mission=7';" title="Mission : Colonize an uninhabited planet">Colonize an uninhabited planet</a></li>	
                            <li><a onclick="location.href='game.php?page=fleetTable';" title="Mission : Contact a people to negotiate a pact">Contact a people to negotiate a pact</a></li>	
                            <li><a onclick="location.href='game.php?page=fleetTable&target_mission=8';" title="Mission : Recycle a debris field">Recycle a debris field</a></li>	
                            <li><a onclick="location.href='game.php?page=fleetTable&target_mission=6';" title="Mission : Probe a planet">Probe a planet</a></li>	
                            <li><a onclick="location.href='game.php?page=fleetTable&target_mission=1';" title="Mission : Attack a planet">Attack a planet</a></li>	
                        </ul>
        </div>
    </div>    
</div>

<div name="information_portail">
    To perform missions in the space center, you must have at least one vessel. 
</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}