{block name="title" prepend}{$LNG.lm_empire}{/block}
{block name="content"}
<body>
<div id="curseur" class="infobulle"></div>
<!-- Le haut de la page : image d'Antaris Legacy -->
<div id="header"></div>
<!-- Pour afficher la version de l'univers -->
<div id="version_univers"></div>
<div id="empire">
<div id="page_contenu"><style type="text/css">
body div#empire{ 
width : 470px; 
}
</style>
<!-- En-tête des colonnes : nom, image et slots de la planète -->

<table class="presentation">
<tr>
<td></td>
<!-- On parcours la liste des planètes -->
{foreach $planetList.name as $name}
<td>
<b>{$name} </b><br>
</td>
{/foreach}
<br />
<td style="vertical-align : bottom;"><b>TOTAL :</b></td>
</tr>
</table>
        

<!-- On affiche quelques informations sur les planètes du joueurs -->
<h2 class="titre_corps">{$LNG.ls_empire_1}</h2>
<table>
    <tr>
        <td>{$LNG.ls_empire_9} :</td>
                
        <!-- On parcours la liste des planètes -->
               {foreach $planetList.field as $field}                 
            <td><span class="orange">{$field.current}</span> / <span class="orange">{$field.max}</span></td>
			{/foreach}
                <td><span class="orange">0</span> / <span class="orange">163</span></td>
    </tr>
    <tr>
        <td>{$LNG.ls_empire_10} :</td>
        
        <!-- On parcours la liste des planètes -->
		
		{foreach $planetList.portal as $portal} 
                    <td>
                                    <span class="rouge">{$portal.Tportal}</span>
                            </td>
							{/foreach}
							
							
                <td><span class="orange">{$Tportalactive}</span> {$LNG.ls_empire_13}</td>
    </tr>
    <tr>
        <td>{$LNG.ls_empire_11} :</td>
        
        <!-- On parcours la liste des planètes -->
                   {foreach $planetList.force as $force}  <td>
                                    <span class="rouge">{$force.Forcefield}</span>
                            </td>{/foreach}
                <td><span class="orange">{$Forceactive}</span> {$LNG.ls_empire_13}</td>
    </tr>
    <tr>
        <td>{$LNG.ls_empire_12} :</td>
        
        <!-- On parcours la liste des planètes -->
                    {foreach $planetList.siege as $siege} <td>
                                    <span class="rouge">{$siege.Siege}</span>
                            </td>{/foreach}
                <td><span class="orange">{$Siegeactive}</span> {$LNG.ls_empire_13}</td>
    </tr>
</table>


<!-- On affiche pour chaque planète, les ressources qui sont actuellement dessus -->
<h2 class="titre_corps">{$LNG.ls_empire_2}</h2>


<table>
    <!-- On créé une nouvelle ligne dans le tableau pour chaque ressource -->
	
	{foreach $planetList.resource as $elementID => $resourceArray}
                            <tr>
              <!-- Nom de la ressource -->
              <td>{$LNG.tech.$elementID} :</td>

              <!-- On parcours la liste des planètes -->
			  {foreach $resourceArray as $planetID => $resource}
                                                  <td>
                      <span class="orange">{$resource|number}</span> 
                                        </td>
										{/foreach}
              
              <!-- Total de la ressource pour toutes les planètes -->
              <td class="orange">{array_sum($resourceArray)|number}</td>
        </tr>
		{/foreach}
    </table>


<!-- On affiche pour chaque planète, les ressources qui sont dans le bunker de la planète -->
<h2 class="titre_corps">{$LNG.ls_empire_3}</h2>
<table>
    <!-- On créé une nouvelle ligne dans le tableau pour chaque type de ressource -->
	{foreach $planetList.bunker as $elementID => $bunkerArray}
                    <tr>
              <!-- Nom du bunker à ressource -->
              <td>{$LNG.tech.$elementID} Bunker :</td>

              <!-- On parcours la liste des planètes -->
			   {foreach $bunkerArray as $planetID => $bunker}
                                                  <td>
                      <span class="orange">{$bunker|number}</span> 
                  </td>
				  {/foreach}
              
              <!-- Total du bunker par ressource pour toutes les planètes -->
              <td class="orange">{array_sum($bunkerArray)|number}</td>
        </tr>
             {/foreach}
    </table>


<!-- On affiche pour chaque planète, les niveaux des bâtiments -->
<h2 class="titre_corps">{$LNG.ls_empire_4}</h2>
<table>
    <!-- On créé une nouvelle ligne dans le tableau pour chaque bâtiment -->
	
	{foreach $planetList.build as $elementID => $buildArray}
	                        <tr>
            <!-- Nom du bâtiment -->
            <td>{$LNG.tech.$elementID} :</td>

            <!-- On parcours la liste des planètes -->
                  {foreach $buildArray as $planetID => $build}                                          
                <td>
                    <span class="orange">{$build|number}</span>
                                    </td>{/foreach}
                        
            <!-- Nombre de niveau au total pour ce bâtiment sur l'ensemble de l'empire -->
            <td class="orange">{array_sum($buildArray)|number}</td>
        </tr>
           {/foreach}               
    </table> 


<!-- On affiche pour chaque planète, les nombres d'appareils qui y a dessus actuellement -->
<h2 class="titre_corps">{$LNG.ls_empire_5}</h2>
<table>
    <!-- On créé une nouvelle ligne dans le tableau pour chaque appareil -->
                         
{foreach $planetList.fleet as $elementID => $fleetArray}						 
                            <tr>
            <!-- Nom de l'appareil -->
            <td>{$LNG.tech.$elementID} :</td>

            <!-- On parcours la liste des planètes -->
                                                            
              {foreach $fleetArray as $planetID => $fleet}  <td class="orange">{$fleet|number}</td>{/foreach}
            			
            <!-- Nombre d'appareil que le joueur possède sur l'ensemble de ses planètes -->
            <td class="orange">{array_sum($fleetArray)|number}</td>
        </tr>
             {/foreach}                 
    </table>


<!-- On affiche pour chaque planète, les nombres de défenses qui y a dessus actuellement -->
<h2 class="titre_corps">{$LNG.ls_empire_6}</h2>
<table>
    <!-- On créé une nouvelle ligne dans le tableau pour chaque défense -->
	
	{foreach $planetList.defense as $elementID => $fleetArray}
                            <tr>
            <!-- Nom de la défense -->
            <td>{$LNG.tech.$elementID} :</td>

            <!-- On parcours la liste des planètes -->
                                                            
               {foreach $fleetArray as $planetID => $fleet} <td class="orange">{$fleet|number}</td>{/foreach}    
            			
            <!-- Nombre de défense que le joueur possède sur l'ensemble de ses planètes -->
            <td class="orange">{array_sum($fleetArray)|number}</td>
        </tr>
                {/foreach}               
    </table>


<!-- On affiche pour chaque planète, les nombres de vaisseau qui y a dessus actuellement -->


<!-- On affiche pour chaque planète, les nombres de population qui y a dessus actuellement -->
<h2 class="titre_corps">{$LNG.ls_empire_7}</h2>
<table>
    <!-- On créé une nouvelle ligne dans le tableau pour chaque population -->
	{foreach $planetList.population as $elementID => $populationArray}
                            <tr>
            <!-- Nom de la population -->
            <td>{$LNG.tech.$elementID} :</td>

            <!-- On parcours la liste des planètes -->
                 {foreach $populationArray as $planetID => $population}                                           
                <td class="orange">{$population|number}</td>
            			{/foreach}     
            <!-- Nombre de population que le joueur possède sur l'ensemble de ses planètes -->
            <td class="orange">{array_sum($populationArray)|number}</td>
        </tr>
           {/foreach}               
    </table>



</div>                </div>
{/block}