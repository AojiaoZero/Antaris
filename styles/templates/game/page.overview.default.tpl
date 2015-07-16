{block name="title" prepend}{$LNG.lm_overview}{/block}
{block name="script" append}{/block}
{block name="content"}

     <script type="text/javascript">
$(document).ready(function()
{
	window.setInterval(function() {
		$('.fleets').each(function() {
			var s		= $(this).data('fleet-time') - (serverTime.getTime() - startTime) / 1000;
			if(s <= 0) {
				$(this).text('-');
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		})
	}, 1000);
	
	window.setInterval(function() {
		$('.decompte_actualise').each(function() {
			var s		= $(this).data('time') - (serverTime.getTime() - startTime) / 1000;
			if(s == 0) {
				window.location.href = "game.php?page=overview";
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		});
	}, 1000);
});
var fleetreturnxd		= "{$LNG.ls_ovbuild_10}"
var fleetreturnxd1		= "{$LNG.ls_ovbuild_11}"
var fleetreturnxd2		= "{$LNG.ls_ovbuild_12}"
</script>	 
                     
  


<div id="page_contenu">
                                            
<h1>{$LNG.ls_overview_40}</h1>
<div id="salle_de_controle">
    
    <div name="couverture" data-nom_univers="horizon">
        <!-- En haut à droite : affiche deux liens vers des pages qui permettent d'aider les débutants : guide et mission -->
       <div name="aide_debutant">
            <a href="?page=achievements" onmouseover="montre('{$LNG.ls_overview_37}');" onmouseout="cache();">{$LNG.ls_overview_38}</a><br />
            
        </div> 
 <!-- En haut à gauche : DEFCON de l'alliance du joueur -->
 
 {if $GeTransportCount != 0}
 <div name="situation_irreguliere" class="rouge">
            <span onmouseover="montre('&nbsp;{$LNG.ls_push_1}');" onmouseout="cache();" style="cursor : help;">{$LNG.ls_push_2}</span>
        </div>
 {elseif $userally != 0}
        <div name="defcon_alliance" class="cyan">
            <span onmouseover="montre('&nbsp;DEFCON : {$defcontext}');" 
                  onmouseout="cache();" style="cursor : help;">{$LNG.ls_overview_36} <b>level {$defcon}</b></span>
        </div>
             {/if} 
			 
			 
        <!-- Bandeau noir avec les informations sur le compte -->
        <div name="bandeau_noir">
            <!-- Détail du compte : pseudo, tag alliance, points, classement et progression -->
            <div name="information_joueur">
                <img name="avatar_joueur" src="/media/files/{$avatar}" />

                <div name="pseudo">
                    {$username} {if $userally != 0}<span class="couleur_alliance">

    [{$ally_tag}]

</span>{/if}<!--
                    -->                </div>

                <div name="statistique">
                                                            
                    {$LNG.ls_overview_34} : <a href="javascript:SalleDeControle.toggleStatistique();" onmouseout="cache();"
                                        onmouseover="montre('{$LNG.ls_overview_35}.');">{$totalP}</a> pts 
                    <div data-js="stat_progression" >{if $cokies == 'false'}&mdash; 
                         {$postalP} pts{/if}</span>
                                            </div><br />
                    
                    {$LNG.ls_overview_33} :  {$userRank} / {$userTotal} 
                    <div data-js="stat_progression" >{if $cokies == 'false'}&mdash; 
                          {$postal} {$LNG.ls_overview_39}{/if}</span>
                                            </div><br />
                </div>
            </div>

            <!-- Détail de l'alliance si le joueur en possède une : nom, points et classement -->
          

{if $allyID == 0}
		  <div {if $cokies == 'false'} style="display: block;"{else}style="display: none;"{/if} name="information_alliance" >
                                    <div name="sans_alliance">
                        {$LNG.ls_overview_32}<br />
                        <a href="?page=alliance">{$LNG.ls_overview_31}</a>
                    </div>
                            </div>
							{else}
							<div {if $cokies == 'false'} style="display: block;"{else}style="display: none;"{/if} name="information_alliance">
                                    
                    <div name="nom">
                        <a href="?page=alliance" onmouseover="montre('{$LNG.ls_overview_29}');" onmouseout="cache();">{$LNG.ls_overview_30} {$ally_name}</a>
                    </div>
                    <div name="statistique">
                        {$ally_points} pts with {$ally_members} membre(s)<br>
                        {$LNG.ls_overview_28} : {$ally_rank} / {$Total_alliance} 
                    </div>
                            </div>
							{/if}
					
							
           
            <!-- Le détails des points pour les statistiques du compte -->
            <div {if $cokies == 'true'} style="display: block;"{else}style="display: none;"{/if} name="detail_statistique" ><!--
                --><div class="element">{$LNG.ls_overview_27} :    <span class="orange">{$totalBuild}</span> pts</div><!--
                --><div class="element">{$LNG.ls_overview_26} :    <span class="orange">{$totalFleet}</span> pts</div><!--
                --><div class="element">{$LNG.ls_overview_25} : <span class="orange">{$totalResearch}</span> pts</div><!--
                --><div class="element">{$LNG.ls_overview_24} :     <span class="orange">{$totalDefense}</span> pts</div><!--
                --><div class="element">{$LNG.ls_overview_23} :  <span class="orange">{$totalPopu}</span> pts</div><!--
            --></div>
			
        </div>
            
        <!-- Bandeau de « news » qui défile sous le bandeau noir ci-dessus : toute l'actualité du serveur -->
        <div name="bandeau_news" onmouseover="SalleDeControle.pauseBandeauNews();" onmouseout="SalleDeControle.reprendreBandeauNews();">
            <ul data-js="defilement">
                               
							   <li name="numero_auto_1">{$LNG.ls_overview_22}</li>
								<li name="numero_auto_2">{$LNG.ls_bank_43} : 
                                          <span class="taux {if $taxe_metal < 0}rouge{else}vert{/if}">{if $taxe_metal > 0}+{/if}{$taxe_metal} %</span> {$LNG.ls_bank_44}, 
                                          <span class="taux {if $taxe_crystal < 0}rouge{else}vert{/if}">{if $taxe_crystal > 0}+{/if}{$taxe_crystal} %</span> {$LNG.ls_bank_45},
                                          <span class="taux {if $taxe_deuterium < 0}rouge{else}vert{/if}">{if $taxe_deuterium > 0}+{/if}{$taxe_deuterium} %</span> {$LNG.ls_bank_46} 
                                          <span class="taux {if $taxe_elyrium < 0}rouge{else}vert{/if}">{if $taxe_elyrium > 0}+{/if}{$taxe_elyrium} %</span> {$LNG.ls_bank_47}</li>		 
                             {foreach from=$AllFeeds item=i key=k}
                                <li name="numero_{$i.feedID}">{$i.message} </li>{/foreach}
                            </ul>
        </div>
            
        <!-- Nous mettons sur le logo « Live news », un lien cliquable permettant d'écrire une news -->
        <div name="logo_news" onclick="window.location.replace('?page=Hln')"
             onmouseover="montre('{$LNG.ls_overview_21}');" onmouseout="cache();"></div>
    </div>
     
            
    
    {if $fleetCount == 0}
    
   <h2 class="titre_corps">
        <img src="media/ingame/image/strategie.png" />
        {$LNG.ls_overview_18}
    </h2>
    <div name="liste_flotte" class="categorie_speciale">
                    <!-- Il n'y a pas de flotte de détecté dans les capteurs -->
            <div style="padding : 10px 0px;" class="vert">{$LNG.ls_overview_19}.</div>
            </div>
			
			{else}
			
			<h2 class="titre_corps">
        <img src="media/ingame/image/strategie.png" />
       {$LNG.ls_overview_18}
    </h2>
    <div name="liste_flotte" class="categorie_speciale">
                    <!-- Il y a au moins une flottes de détecté -->
            <div style="padding : 10px 0px;" class="rouge" id="fleetcallresponse">
                                    {$LNG.ls_overview_16} <b>{$fleetCount}</b> {$LNG.ls_overview_17}
                            </div>
            
 {foreach $fleets as $index => $fleet}                           
<!-- Affichage de la flotte n°{$fleet.fleetID} -->
<div name="flotte" data-id_flotte="{$fleet.fleetID}" data-mission="{$fleet.mission}" data-statut="{if $fleet.fleetmes ==0}{$LNG.ls_ovbuild_15}{else}{$LNG.ls_ovbuild_16}{/if}">
    <!-- Affiche les informations principales sur la flotte -->
    <div name="information_principale">
        <div name="mission">
            <!-- Nom de la mission ainsi que le temps restant avant l'accomplissement de celle-ci -->
            <!--<img src="media/ingame/image/mission.png" /> -->
            <span class="{if $fleet.missioncolor == 1}rouge{elseif $fleet.missioncolor == 3}chartreuse{elseif $fleet.missioncolor == 4}orange{elseif $fleet.missioncolor == 6}violet{elseif $fleet.missioncolor == 8}marron{elseif $fleet.missioncolor == 12}cyan{/if}">{$fleet.mission}</span>
             — 
            <span id="fleettime_{$fleet.fleetID}" class="fleets" data-fleet-end-time="{$fleet.returntime}" data-fleet-time="{$fleet.resttime}">{pretty_fly_time({$fleet.resttime})}</span>
					
		
                    </div><!--
        --><div name="trajet">
            <!-- Parcours que la flotte doit effectuer : nom des planètes ainsi que les pseudos des joueurs concernés -->
            <img src="media/ingame/image/planete.png">
      <!-- Planète et joueur de départ -->
                {$fleet.text}
                    </div><!--
        --><div name="detail">
            <!-- Affiche les informations suivantes : le nombre de vaisseau et le sens du trajet : « aller » ou « retour » -->
            <span onclick="javascript:SalleDeControle.afficherInformationFlotte({$fleet.fleetID});" style="cursor : pointer;" onmouseover="montre('Afficher/cacher les informations « secondaires » de cette flotte.');" onmouseout="cache();">
                <img src="media/ingame/image/info.png">
                                     
                            </span> 
                                          &nbsp;—&nbsp;<span class="{if $fleet.fleetmes ==0}cyan{else}rouge{/if}">{if $fleet.fleetmes ==0}{$LNG.ls_ovbuild_15}{else}{$LNG.ls_ovbuild_16}{/if}</span>            
                           {if $fleet.fleetmes ==0}
						   <!-- Lien qui permet au joueur de demander le retour de sa flotte -->
                <a onclick="javascript:SalleDeControle.faireRetourFlotte('{$fleet.fleetID}')" onmouseover="montre('{$LNG.ls_detailflo_4}');" onmouseout="cache();"><img src="media/ingame/image/fleche_ronde.png"></a>{/if}
                    </div>
    </div> 



	
    <!-- Affiche les informations secondaires sur la flotte -->
	{if $fleet.fleetOwner == $userID}
    <div style="display: none;" name="information_secondaire">
        
                <div class="partie">
            <h3>{$LNG.ls_detailflo_1} :</h3>                       
            {$fleet.fleetMission}<br>
            {$LNG.ls_detailflo_2} :                              {if $fleet.fleetmes ==0}{$LNG.ls_ovbuild_15}{else}{$LNG.ls_ovbuild_16}{/if}<br>                       
                            <!-- Lien qui permet au joueur de demander le retour de sa flotte -->
                {if $fleet.fleetmes ==0}<a onclick="javascript:SalleDeControle.faireRetourFlotte('{$fleet.fleetID}')" onmouseover="montre('{$LNG.ls_detailflo_4}');" onmouseout="cache();">&gt;&gt; {$LNG.ls_detailflo_3}</a>{/if}<br>
                    </div>                               
                <div class="partie">
            <h3>{$LNG.ls_detailflo_5} :</h3>       
                            {$LNG.ls_detailflo_6} : <span class="orange">{$fleet.fleetAmount}</span> {$LNG.lm_achat_units}<br>
                            {$LNG.ls_detailflo_7} : <span class="orange">0</span> {$LNG.lm_achat_units}
                    </div>
                <div class="partie">
            <h3>{$LNG.ls_detailflo_8} :</h3>
                            {$LNG.ls_detailflo_9} {$fleet.fleetStart}<br>
                            {$LNG.ls_detailflo_10} {$fleet.fleetStay}
                            <br>{$LNG.ls_detailflo_11} {$fleet.fleetEnd}
                    </div>
                <div class="partie">
            <h3>{$LNG.ls_detailflo_12} :</h3>
            {$LNG.ls_detailflo_13} : <span class="orange">24</span> {$LNG.lm_achat_units}
                            <br>{$LNG.ls_detailflo_14} : <span class="orange">24</span> {$LNG.lm_achat_units}
                    </div>
                <div class="partie">
            <h3>{$LNG.ls_detailflo_15} :</h3>
            
            {$LNG.ls_detailflo_16} : <span class="orange">600</span> {$LNG.lm_achat_units}<br>
                            {$LNG.ls_detailflo_17} {$fleet.fleetNameStart} [{$fleet.fleetStartSys}:{$fleet.fleetStartPla}]<br>
                {$LNG.ls_detailflo_18} {$fleet.fleetNameEnd} [{$fleet.fleetEndSys}:{$fleet.fleetEndPla}]
                    </div>
            </div>                                                                                       
			{else}
			<div style="display: none;" name="information_secondaire">
        
                <div class="partie">
            <h3>{$LNG.ls_detailflo_1} :</h3>

            {$fleet.fleetMission}<br>
            {$LNG.ls_detailflo_2} :                              Aller<br>
           
                    </div>
                <div class="partie">
            <h3>{$LNG.ls_detailflo_8} :</h3>
            {$LNG.ls_detailflo_10} {$fleet.fleetStay}
 </div>
<div class="partie">
            <h3>{$LNG.ls_detailflo_15} :</h3>
            
            {$LNG.ls_detailflo_16} : <span class="orange">600</span> {$LNG.lm_achat_units}<br>
                            {$LNG.ls_detailflo_17} {$fleet.fleetNameStart} [{$fleet.fleetStartSys}:{$fleet.fleetStartPla}]<br>
                {$LNG.ls_detailflo_18} {$fleet.fleetNameEnd} [{$fleet.fleetEndSys}:{$fleet.fleetEndPla}]
                    </div>
            </div>

			{/if}
			
</div>
{/foreach}
          </div>           
    
    {/if}
     <h2 class="titre_corps">
        <img src="media/ingame/image/maison.png" />
        {$LNG.ls_overview_15} {$planetname} [{$galaxy}:{$system}:{$planet}]
    </h2>
    <div name="planete_information" class="categorie_speciale"><!--
        {if $overmessage == 0}
       --><div name="liste_construction"> 
 
                            <h3>{$LNG.ls_overview_14} :</h3>
                {$LNG.ls_overview_13}.<br />
                
                <h3>{$LNG.ls_overview_12} :</h3>
                
{$LNG.ls_overview_11}
                    </div><!-- 
					{else}
					--><div name="liste_construction"> 


 <!-- On indique le titre selon le type d'entité -->
 {if $buildInfo.buildings}
                            <h3>1 building(s) under construction or demolition :</h3>
                                        
                    <!-- Affiche la liste des construction pour ce type d'entité -->
                                                            <div name="construction"><!--
                        --><img src="styles/theme/gow/gebaeude/{$buildInfo.buildings['id']}.jpg" /><!--
                        --><div name="nom">
                                                            
                             <span  onmouseout="cache();" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$buildInfo.buildings['id']]}</b> (<span class=\'orange\'>{$buildInfo.buildings['level']}</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'> {foreach $buildInfo.buildings['price'] as $RessID => $RessAmount}<li>{$LNG.tech.{$RessID}} : <span class=\'orange\'>{$RessAmount|number}</span> {$LNG.lm_achat_units}</li> {/foreach}         </ul>                <b>{$LNG.ls_ovbuild_3} :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>{$LNG.ls_ovbuild_5} : {$buildInfo.buildings['starttimeego']}</li>        <li>{$LNG.ls_ovbuild_6} : {$buildInfo.buildings['endtime']}</li>        <li>{$LNG.ls_ovbuild_4} : <span class=\'orange\'>{$buildInfo.buildings['elementime']}</span></li>        <li>{$LNG.ls_ovbuild_7} : <span class=\'orange\'>{$buildInfo.buildings['percenting']}%</span></li>                            </ul></div>');" style="cursor : help;">{$LNG.tech[$buildInfo.buildings['id']]}</span>
                             (<span class="orange">{$buildInfo.buildings['level']}</span>) :
                        </div><!--
                        --><div name="compteur" class="decompte_actualise"
                                data-time="{$buildInfo.buildings['timeleft']}">{$buildInfo.buildings['starttime']}</div><!--
                    --></div>  
                         {/if}   


 {if $buildInfo.tech}
                            <h3>1 technology (s) developing :</h3>
                                        
                    <!-- Affiche la liste des construction pour ce type d'entité -->
                                                            <div name="construction"><!--
                        --><img src="styles/theme/gow/gebaeude/{$buildInfo.tech['id']}.jpg" /><!--
                        --><div name="nom">
                                                            
                             <span onmouseout="cache();" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Development - {$LNG.tech[$buildInfo.tech['id']]}</b> (<span class=\'orange\'>{$buildInfo.tech['level']}</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'> {foreach $buildInfo.tech['price'] as $RessID => $RessAmount}<li>{$LNG.tech.{$RessID}} : <span class=\'orange\'>{$RessAmount|number}</span> {$LNG.lm_achat_units}</li> {/foreach}         </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>{$LNG.ls_ovbuild_5} : {$buildInfo.tech['starttimeego']}</li>        <li>{$LNG.ls_ovbuild_6} : {$buildInfo.tech['endtime']}</li>        <li>{$LNG.ls_ovbuild_4} : <span class=\'orange\'>{$buildInfo.tech['elementime']}</span></li>        <li>{$LNG.ls_ovbuild_7} : <span class=\'orange\'>{$buildInfo.tech['percenting']}%</span></li>                            </ul></div>');" style="cursor : help;">{$LNG.tech[$buildInfo.tech['id']]}</span>
                             (<span class="orange">{$buildInfo.tech['level']}</span>) :
                        </div><!--
                        --><div name="compteur" class="decompte_actualise"
                                data-time="{$buildInfo.tech['timeleft']}">{$buildInfo.tech['starttime']}</div><!--
                    --></div>
                         {/if}  						 
  

 {if $buildInfo.fleet}
                            <h3>1 fleets developing :</h3>
                                        
                    <!-- Affiche la liste des construction pour ce type d'entité -->
                                                            <div name="construction"><!--
                        --><img src="styles/theme/gow/gebaeude/{$buildInfo.fleet['id']}.gif" /><!--
                        --><div name="nom">
                                                            
                             <span onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$buildInfo.fleet['id']]}</b> (<span class=\'orange\'>{$buildInfo.fleet['level']}</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                {foreach $buildInfo.fleet['price'] as $RessID => $RessAmount}<li>{$LNG.tech.{$RessID}} : <span class=\'orange\'>{pretty_number($RessAmount*$buildInfo.fleet['level'])}</span> {$LNG.lm_achat_units}</li> {/foreach}                                            </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>{$LNG.ls_ovbuild_1} : {$buildInfo.fleet['timelefts']}</li>        <li>{$LNG.ls_ovbuild_2} : {$buildInfo.fleet['endtime']}</li>            </ul></div>');" onmouseout="cache();" style="cursor : help;">{$LNG.tech[$buildInfo.fleet['id']]}</span>
                             (<span class="orange">{$buildInfo.fleet['level']}</span>) :
                        </div><!--
                        --><div name="compteur" class="decompte_actualise"
                                data-time="{$buildInfo.fleet['timeleft']}">{$buildInfo.fleet['starttime']}</div><!--
                    --></div>
                         {/if}  

                  {if $buildInfo.defense}
                            <h3>1 defense developing :</h3>
                                        
                    <!-- Affiche la liste des construction pour ce type d'entité -->
                                                            <div name="construction"><!--
                        --><img src="styles/theme/gow/gebaeude/{$buildInfo.defense['id']}.gif" /><!--
                        --><div name="nom">
                                                            
                             <span onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech[$buildInfo.defense['id']]}</b> (<span class=\'orange\'>{$buildInfo.defense['level']}</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                {foreach $buildInfo.defense['price'] as $RessID => $RessAmount}<li>{$LNG.tech.{$RessID}} : <span class=\'orange\'>{pretty_number($RessAmount*$buildInfo.defense['level'])}</span> {$LNG.lm_achat_units}</li> {/foreach}                                            </ul>                <b>{$LNG.ls_ovbuild_3} :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>{$LNG.ls_ovbuild_1} : {$buildInfo.defense['timelefts']}</li>        <li>{$LNG.ls_ovbuild_2} : {$buildInfo.defense['endtime']}</li>            </ul></div>');" onmouseout="cache();" style="cursor : help;">{$LNG.tech[$buildInfo.defense['id']]}</span>
                             (<span class="orange">{$buildInfo.defense['level']}</span>) :
                        </div><!--
                        --><div name="compteur" class="decompte_actualise"
                                data-time="{$buildInfo.defense['timeleft']}">{$buildInfo.defense['starttime']}</div><!--
                    --></div>
                         {/if}                                       
            
                    </div><!--
					
					{/if}
					

        --><div name="planete">
            <!-- Nom de la planète actuelle -->
            <span name="nom" onmouseover="montre('Name of your site : P6X-766');" onmouseout="cache();">
               {$planetname} [{$galaxy}:{$system}:{$planet}]
            </span><br />
            
            <!-- Indique à l'utilisateur le nombre de slots restants sur cette planète -->
            <span onmouseover="montre('{$LNG.ls_overview_10}.');" onmouseout="cache();" style="cursor : help;">
                {$LNG.ls_overview_9} : {$planet_field_current} / {$planet_field_max}
            </span>
            
                                                            
            <p>
                <!-- Information sur le portail : activer ou désactiver -->
                {$LNG.ls_overview_8} : 
                 
                    <span class="{if $teleport_portal == 0}rouge{else}vert{/if}">{if $teleport_portal == 0}{$LNG.ls_overview_5}{else}{$LNG.ls_overview_6}{/if}</span><br />  
                                
                <!-- Information sur le champ de force du portail : activer ou désactiver -->
                {$LNG.ls_overview_7} : 
                 
                    <span class="{if $force_field < $trem}rouge{else}vert{/if}">{if $force_field < $trem}{$LNG.ls_overview_5}{else}{$LNG.ls_overview_6}{/if}</span><br />  
                            </p>
            
            <p>
                <!-- Information sur le siège des Antaris : activer ou désactiver -->
                {$LNG.ls_overview_4} : 
                                    <span class="{if $siege_active < $TIMESTM}rouge{else}vert{/if}">{if $siege_active < $TIMESTM}{$LNG.ls_overview_5}{else}{$LNG.ls_overview_6}{/if}</span><br />
                                
                <!-- Information sur l'avant poste des Antaris : nombre de drones -->
                {$LNG.ls_overview_42} : 
                <a class="orange" onmouseover="montre('{$LNG.ls_overview_41}');" onmouseout="cache();"
                   >0</a> drones
            </p>
            
            <p>
                <!-- Lien vers la page qui permet de modifier la planète ou de l'abandonner -->
                <a href="?page=Tower" onmouseout="cache();"
                   onmouseover="montre('{$LNG.ls_overview_2}.');">{$LNG.ls_overview_3}</a>
            </p>
        </div><!--
        
    --></div>
    
    
    
    
    {if $GetAll99 < 1}
            <h2 class="titre_corps">
            <img src="media/ingame/image/aide.png" />
            {$LNG.ls_overview_20}
        </h2>
        
        <!-- Si le joueur ne possède que sa planète mére, on lui affiche quelques conseils et explications -->
        <div name="aide_empire" class="categorie_speciale">
          {$LNG.ls_overview_1}
        </div>
		
		{else}
		     <h2 class="titre_corps">
            <img src="media/ingame/image/globe.png" />
            {$LNG.ls_overview_45} ({$GetAll99})
        </h2>
       <!-- Affiche l'ensemble des planète de l'empire avec une scrollbar horizontal -->
        <div name="liste_planete" class="categorie_speciale"><!--
		{foreach from=$AllPlanetsBis item=i key=k}
                    --><div name="planete">
                <div name="illustration">
                    <!-- Image de la planète -->
                    <img src="media/ingame/planet/{$i.planet}.jpg" onmouseover="montre('{$LNG.ls_overview_44}');" onmouseout="cache();" 
                         onclick="location.href='game.php?page=overview&cp={$i.id}';" />
                
                    <!-- Slots restant sur le slot total de la planète -->
                    <div name="slot" onmouseover="montre('{$LNG.ls_overview_43}');" onmouseout="cache();" >
                        {$i.field_current} / {$i.field_max}
                    </div>
                </div>
                
                <!-- Nom de la planète et ressources -->
                <div name="information">
                    <a onclick="location.href='game.php?page=overview&cp={$i.id}';" class="nom_planete">{$i.name} [{$i.galaxy}:{$i.system}:{$i.planet}]</a><br />

                                        {$LNG.tech.901} : <span {if $i.metal >= $i.metal_max}class="rouge"{/if}>{pretty_number($i.metal)}</span><br />
                                        {$LNG.tech.902} : <span {if $i.crystal >= $i.crystal_max}class="rouge"{/if}>{pretty_number($i.crystal)}</span><br />
                                        {$LNG.tech.903} : <span {if $i.deuterium >= $i.deuterium_max}class="rouge"{/if}>{pretty_number($i.deuterium)}</span><br />
										{$LNG.tech.904} : <span {if $i.elyrium >= $i.elyrium_max}class="rouge"{/if}>{pretty_number($i.elyrium)}</span><br />
                                       
                                    </div>
            </div><!--{/foreach}
                        --></div>
        

		
		{/if} 
		 
        
</div>
        
<script type="text/javascript">
    $(document).ready(function(){
        SalleDeControle.initialiser(); 
    });
</script></div>                    <!-- Fin du corps -->
           
            
          
{/block}