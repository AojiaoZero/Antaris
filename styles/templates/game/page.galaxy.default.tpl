{block name="title" prepend}{$LNG.lm_galaxy}{/block}
{block name="content"}
<div id="page_contenu">      
<script type="text/javascript">
var errormest = "{$LNG.fleet_ajax_13}";
</script>
<!-- Titre de la page -->
<h1>{$LNG.lm_galaxy}</h1>

<!-- L'élément HTML qui contient tous les éléments des capteurs -->
<div id="capteur_intrastellaire">
    <!-- Formulaire pour changer de système solaire -->
	<form action="?page=galaxy" method="post" id="form_capteur">
	<input type="hidden" id="auto" value="dr">
	
        <!-- Bouton pour afficher le système précédent -->
        <div class="conteneur_bouton precedent">
            <input class="neutre" value="<< {$LNG.ls_galaxy_1}" onclick="galaxy_submit('systemLeft')" type="button">
		</div>
      
        <!-- Changer de système manuellement -->
        <div class="conteneur_champ">
            <label for="manuellement_systeme">{$LNG.gl_solar_system} : </label>
            <input  id="manuellement_systeme" name="system" class="entier" size="5" maxlenght="7" value="{$system}" type="text">
            <input name="valid_form" value="{$LNG.ls_galaxy_3} !" type="submit">
        </div>
      
        <!-- Bouton pour afficher le système suivant -->
        <div class="conteneur_bouton suivant">
            <input class="neutre" value="{$LNG.ls_galaxy_2} >>" onclick="galaxy_submit('systemRight')" type="button">
		</div>
        <div class="espace"></div>
    </form>
    
    <!-- Le conteneur de la map -->
    <div class="map">
        <!-- Background des capteurs intrastellaires -->
        <img class="background" onclick="javascript:annulerFromage({$system});" src="design/image/transparent.png" usemap="#map_capteur">
        <!-- Image du soleil pour ce système solaire -->
        <img style="display: block;" name="soleil" src="design/image/theme/defaut/capteur/soleil.png">
        

        <!-- La MAP -->
		<map name="map_capteur">
		{for $planet=1 to $max_planets}
		{if !isset($GalaxyRows[$planet])}
        <img {if $planet ==1}style="left: 243px; top: 320px;"{elseif $planet == 2}style="left: 645px; top: 320px;"{elseif $planet == 3}style="left: 124px; top: 239px;"{elseif $planet == 4}style="left: 90px; top: 87px;"{elseif $planet == 5}style="left: 422px; top: 100px;"{elseif $planet == 6}style="left: 598px; top: 170px;"{elseif $planet == 7}style="left: 475px; top: 380px;"{elseif $planet == 8}style="left: 653px; top: 238px;"{elseif $planet == 9}style="left: 275px; top: 157px;"{elseif $planet == 10}style="left: 347px; top: 382px;"{/if} src="design/image/theme/defaut/capteur/planete_libre.png" data-lien="{$planet}" name="planete">
		<div id="info_{$planet}" {if $planet ==1}style="top: 318px; right: 501px; display: block;" class="gauche libre"{elseif $planet == 2}style="top: 318px; right: 99px; display: block;" class="gauche libre"{elseif $planet == 3}style="top: 237px; left: 124px; display: block;" class="droite libre"{elseif $planet == 4}style="top: 85px; left: 90px; display: block;" class="droite libre"{elseif $planet == 5}style="top: 98px; left: 422px; display: block;" class="droite libre"{elseif $planet == 6}style="top: 168px; right: 146px; display: block;" class="gauche libre"{elseif $planet == 7}style="top: 378px; left: 475px; display: block;" class="droite libre"{elseif $planet == 8}style="top: 236px; right: 91px; display: block;" class="gauche libre"{elseif $planet == 9}style="top: 155px; right: 469px; display: block;" class="gauche libre"{elseif $planet == 10}style="top: 380px; right: 397px; display: block;" class="gauche libre"{/if} data-lien="{$planet}" name="bulle_planete">{$LNG.ls_galaxy_4}</div>
		<div id="fromage_{$planet}" {if $planet == 1}style="left: 206px; top: 283px; display: none;"{elseif $planet == 2}style="left: 608px; top: 283px; display: none;"{elseif $planet == 3}style="left: 87px; top: 202px; display: none;"{elseif $planet == 4}style="left: 53px; top: 50px; display: none;"{elseif $planet == 5}style="left: 385px; top: 63px; display: none;"{elseif $planet == 6}style="left: 561px; top: 133px; display: none;"{elseif $planet == 7}style="left: 438px; top: 343px; display: none;"{elseif $planet == 8}style="left: 616px; top: 201px; display: none;"{elseif $planet == 9}style="left: 238px; top: 120px; display: none;"{elseif $planet == 10}style="left: 310px; top: 345px; display: none;"{/if} class="libre" data-lien="{$planet}" name="action_fromage"></div>
		<area onclick="javascript:createFromageEmpty(fromage_{$planet}, {$system}, {$planet});" {if $planet == 1}coords="256,333,13"{elseif $planet == 2}coords="658,333,13"{elseif $planet == 3}coords="137,252,13"{elseif $planet == 4}coords="103,100,13"{elseif $planet == 5}coords="435,113,13"{elseif $planet == 6}coords="611,183,13"{elseif $planet == 7}coords="488,393,13"{elseif $planet == 8}coords="666,251,13"{elseif $planet == 9}coords="288,170,13"{elseif $planet == 10}coords="360,395,13"{/if}  shape="circle" data-lien="{$planet}" name="planete">
		
		{*
		{elseif $GalaxyRows[$planet] === false}
		 <img {if $planet == 1}style="left: 243px; top: 320px;"{elseif $planet == 2}style="left: 645px; top: 320px;"{elseif $planet == 3}style="left: 124px; top: 239px;"{elseif $planet == 4}style="left: 90px; top: 87px;"{elseif $planet == 5}style="left: 422px; top: 100px;"{elseif $planet == 6}style="left: 598px; top: 170px;"{elseif $planet == 7}style="left: 475px; top: 380px;"{elseif $planet == 8}style="left: 653px; top: 238px;"{elseif $planet == 9}style="left: 275px; top: 157px;"{elseif $planet == 10}style="left: 347px; top: 382px;"{/if} src="design/image/theme/defaut/capteur/planete_libre.png" data-lien="{$planet}" name="planete">
		<div id="info_{$planet}" {if $planet == 1}style="top: 318px; right: 501px; display: block;" class="gauche libre"{elseif $planet == 2}style="top: 318px; right: 99px; display: block;" class="gauche libre"{elseif $planet == 3}style="top: 237px; left: 124px; display: block;" class="droite libre"{elseif $planet == 4}style="top: 85px; left: 90px; display: block;" class="droite libre"{elseif $planet == 5}style="top: 98px; left: 422px; display: block;" class="droite libre"{elseif $planet == 6}style="top: 168px; right: 146px; display: block;" class="gauche libre"{elseif $planet == 7}style="top: 378px; left: 475px; display: block;" class="droite libre"{elseif $planet == 8}style="top: 236px; right: 91px; display: block;" class="gauche libre"{elseif $planet == 9}style="top: 155px; right: 469px; display: block;" class="gauche libre"{elseif $planet == 10}style="top: 380px; right: 397px; display: block;" class="gauche libre"{/if} data-lien="{$planet}" name="bulle_planete">Destroyed</div>
		<div id="fromage_{$planet}" {if $planet == 1}style="left: 206px; top: 283px; display: none;"{elseif $planet == 2}style="left: 608px; top: 283px; display: none;"{elseif $planet == 3}style="left: 87px; top: 202px; display: none;"{elseif $planet == 4}style="left: 53px; top: 50px; display: none;"{elseif $planet == 5}style="left: 385px; top: 63px; display: none;"{elseif $planet == 6}style="left: 561px; top: 133px; display: none;"{elseif $planet == 7}style="left: 438px; top: 343px; display: none;"{elseif $planet == 8}style="left: 616px; top: 201px; display: none;"{elseif $planet == 9}style="left: 238px; top: 120px; display: none;"{elseif $planet == 10}style="left: 310px; top: 345px; display: none;"{/if} class="libre" data-lien="{$planet}" name="action_fromage"></div>
		<area onclick="javascript:createFromage(fromage_{$planet});" {if $planet == 1}coords="256,333,13"{elseif $planet == 2}coords="658,333,13"{elseif $planet == 3}coords="137,252,13"{elseif $planet == 4}coords="103,100,13"{elseif $planet == 5}coords="435,113,13"{elseif $planet == 6}coords="611,183,13"{elseif $planet == 7}coords="488,393,13"{elseif $planet == 8}coords="666,251,13"{elseif $planet == 9}coords="288,170,13"{elseif $planet == 10}coords="360,395,13"{/if}  shape="circle" data-lien="{$planet}" name="planete">
		<area onmouseout="cache();" onmouseover="javascript:Capteur.afficherInformationPlanete({$planet}); montre('Colonize this planet');" onclick="javascript:doitColo(7, {$galaxy},{$system},{$planet});" {if $planet == 1}coords="206,333,213,358,231,376,256,383,281,376,299,358,306,333"{elseif $planet == 2}coords="608,333,615,358,633,376,658,383,683,376,701,358,708,333"{elseif $planet == 3}coords="87,252,94,277,112,295,137,302,162,295,180,277,187,252"{elseif $planet == 4}coords="53,100,60,125,78,143,103,150,128,143,146,125,153,100"{elseif $planet == 5}coords="385,113,392,138,410,156,435,163,460,156,478,138,485,113"{elseif $planet == 6}coords="561,183,568,208,586,226,611,233,636,226,654,208,661,183"{elseif $planet == 7}coords="438,393,445,418,463,436,488,443,513,436,531,418,538,393"{elseif $planet == 8}coords="616,251,623,276,641,294,666,301,691,294,709,276,716,251"{elseif $planet == 9}coords="238,170,245,195,263,213,288,220,313,213,331,195,338,170"{elseif $planet == 10}coords="310,395,317,420,335,438,360,445,385,438,403,420,410,395"{/if}  shape="poly" data-lien="{$planet}" name="action_fromage">
		<area onmouseout="cache();" onmouseover="javascript:Capteur.afficherInformationPlanete({$planet}); montre('Start a ground exploration');" onclick="location.href='?page=Explorations';" {if $planet == 1}coords="206,333,213,308,231,290,256,283,281,290,299,308,306,333"{elseif $planet == 2}coords="608,333,615,308,633,290,658,283,683,290,701,308,708,333"{elseif $planet == 3}coords="87,252,94,227,112,209,137,202,162,209,180,227,187,252"{elseif $planet == 4}coords="53,100,60,75,78,57,103,50,128,57,146,75,153,100"{elseif $planet == 5}coords="385,113,392,88,410,70,435,63,460,70,478,88,485,113"{elseif $planet == 6}coords="561,183,568,158,586,140,611,133,636,140,654,158,661,183"{elseif $planet == 7}coords="438,393,445,368,463,350,488,343,513,350,531,368,538,393"{elseif $planet == 8}coords="616,251,623,226,641,208,666,201,691,208,709,226,716,251"{elseif $planet == 9}coords="238,170,245,145,263,127,288,120,313,127,331,145,338,170"{elseif $planet == 10}coords="310,395,317,370,335,352,360,345,385,352,403,370,410,395"{/if}  shape="poly" data-lien="{$planet}" name="action_fromage">*}
		
		{else}
		{$currentPlanet = $GalaxyRows[$planet]}
		<img {if $planet == 1}style="left: 243px; top: 320px;"{elseif $planet == 2}style="left: 645px; top: 320px;"{elseif $planet == 3}style="left: 124px; top: 239px;"{elseif $planet == 4}style="left: 90px; top: 87px;"{elseif $planet == 5}style="left: 422px; top: 100px;"{elseif $planet == 6}style="left: 598px; top: 170px;"{elseif $planet == 7}style="left: 475px; top: 380px;"{elseif $planet == 8}style="left: 653px; top: 238px;"{elseif $planet == 9}style="left: 275px; top: 157px;"{elseif $planet == 10}style="left: 347px; top: 382px;"{/if} src="design/image/theme/defaut/capteur/planete_occuper.png" data-lien="{$planet}" name="planete">
		
		<div id="info_{$planet}" {if $planet == 1}style="top: 318px; right: 501px; display: block;" class="gauche occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 2}style="top: 318px; right: 99px; display: block;" class="gauche occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 3}style="top: 237px; left: 124px; display: block;" class="droite occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 4}style="top: 85px; left: 90px; display: block;" class="droite occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 5}style="top: 98px; left: 422px; display: block;" class="droite occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 6}style="top: 168px; right: 146px; display: block;" class="gauche occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 7}style="top: 378px; left: 475px; display: block;" class="droite occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 8}style="top: 236px; right: 91px; display: block;" class="gauche occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 9}style="top: 155px; right: 469px; display: block;" class="gauche occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{elseif $planet == 10}style="top: 380px; right: 397px; display: block;" class="gauche occuper {foreach $currentPlanet.user.class as $class}{$class}{/foreach}"{/if} data-lien="{$planet}" name="bulle_planete">{$currentPlanet.user.username} {if $currentPlanet.alliance}<span class="couleur_alliance">[{$currentPlanet.alliance.tag}]</span>{/if}</div>
		
		<div id="fromage_{$planet}" {if $planet == 1}style="left: 206px; top: 283px; display: none;"{elseif $planet == 2}style="left: 608px; top: 283px; display: none;"{elseif $planet == 3}style="left: 87px; top: 202px; display: none;"{elseif $planet == 4}style="left: 53px; top: 50px; display: none;"{elseif $planet == 5}style="left: 385px; top: 63px; display: none;"{elseif $planet == 6}style="left: 561px; top: 133px; display: none;"{elseif $planet == 7}style="left: 438px; top: 343px; display: none;"{elseif $planet == 8}style="left: 616px; top: 201px; display: none;"{elseif $planet == 9}style="left: 238px; top: 120px; display: none;"{elseif $planet == 10}style="left: 310px; top: 345px; display: none;"{/if} class="occuper" data-lien="{$planet}" name="action_fromage"></div>
		{if $currentPlanet.debris}
		
		<img {if $planet == 1}style="top: 296px; right: 478px;"{elseif $planet == 2}style="top: 296px; right: 78px;"{elseif $planet == 3}style="top: 216px; right: 598px;"{elseif $planet == 4}style="top: 65px; right: 632px;"{elseif $planet == 5}style="top: 78px; right: 300px;"{elseif $planet == 6}style="top: 147px; right: 124px;"{elseif $planet == 7}style="top: 355px; right: 248px;"{elseif $planet == 8}style="top: 215px; right: 70px;"{elseif $planet == 9}style="top: 133px; right: 447px;"{elseif $planet == 10}style="top: 358px; right: 375px;"{/if} src="design/image/theme/defaut/capteur/cdr.png" data-lien="1" name="champ_ruine">
		{/if}
		{if $currentPlanet.planet.id_owner != 9999}
		<area onmouseover="javascript:afficherInformationPlanete({$currentPlanet.planet.id});" onmouseout="javascript:cacherInformationPlanete();" onclick="javascript:createFromage(fromage_{$planet}, {$currentPlanet.planet.planetshow}, {$system}, {$planet});" {if $planet == 1}coords="256,333,13"{elseif $planet == 2}coords="658,333,13"{elseif $planet == 3}coords="137,252,13"{elseif $planet == 4}coords="103,100,13"{elseif $planet == 5}coords="435,113,13"{elseif $planet == 6}coords="611,183,13"{elseif $planet == 7}coords="488,393,13"{elseif $planet == 8}coords="666,251,13"{elseif $planet == 9}coords="288,170,13"{elseif $planet == 10}coords="360,395,13"{/if}  shape="circle" data-lien="{$planet}" name="planete">{/if}
		<div id="call_correct_file_{$planet}">
		{if $currentPlanet.debris}
		<area onmouseout="cache();" onmouseover="montre('Rubble in orbit :<br />                                        - Iron : <span class=orange>{$currentPlanet.debris.metal|number}</span> units<br />                                        - Gold : <span class=orange>{$currentPlanet.debris.crystal|number}</span> units<br />                                        - Crystal : <span class=orange>{$currentPlanet.debris.deuterium|number}</span> units');" onclick="javascript:doit(8, {$currentPlanet.planet.id},0);" {if $planet == 1}coords="266,338,36"{elseif $planet == 2}coords="666,338,36"{elseif $planet == 3}coords="146,259,36"{elseif $planet == 4}coords="112,107,36"{elseif $planet == 5}coords="444,120,36"{elseif $planet == 6}coords="620,190,36"{elseif $planet == 7}coords="497,397,36"{elseif $planet == 8}coords="674,257,36"{elseif $planet == 9}coords="297,175,36"{elseif $planet == 10}coords="370,400,36"{/if}   shape="circle" data-lien="1" name="champ_ruine">
		{/if}
</div>
		{/if}
		<div id="call_correct_empty"></div>
		{/for}
		
		
		
		<div id="legende" style="display:none;" onclick="javascript:annulerFenetre(legende);" name="fenetre_action_fond">
		<div name="fenetre_action"><h2 class="titre_corps">{$LNG.ls_galaxy_7}</h2><p> {$LNG.ls_galaxy_8}</p><ul class="signification_couleur"><li><span class="vert">{$LNG.ls_galaxy_9}</span>  : {$LNG.ls_galaxy_10}</li><li><span class="rouge">{$LNG.ls_galaxy_11}</span>  : {$LNG.ls_galaxy_12}</li><li><span class="jaune">{$LNG.ls_galaxy_13}</span>  : {$LNG.ls_galaxy_14}</li><li><span class="cyan">{$LNG.ls_galaxy_15}</span>  : {$LNG.ls_galaxy_16}</li><li><span class="bleu">{$LNG.ls_galaxy_17}</span>  : {$LNG.ls_galaxy_18}</li><li><span class="violet">{$LNG.ls_galaxy_19}</span>  : {$LNG.ls_galaxy_20}</li><li><span class="gris">{$LNG.ls_galaxy_21}</span> <span class="rouge">(B)</span> : {$LNG.ls_galaxy_22}</li><li><span class="jaune">{$LNG.ls_galaxy_13}</span> <span class="rouge">(DEL)</span> : {$LNG.ls_galaxy_23}</li></ul><form><input onclick="javascript:annulerFenetre(legende);" class="neutre" value="{$LNG.ls_galaxy_24}" type="button"></form></div></div>
		
		
		</map>
		
		
		
		
		
		
        
        <!-- Barre d'information du haut -->
        <div class="barre_information haut">
            <img name="aide_legende" src="design/image/jeu/icone/couleur/aide.png" onclick="javascript:afficherFenetreLegende(legende);" onmouseout="cache();" onmouseover="montre('{$LNG.ls_galaxy_6}')">
           <table>
                <tbody><tr>
                    <td name="systeme">{$LNG.gl_solar_system} : {$system}</td>
                    <td id="selected_position" name="position"></td>
                    <td id="selected_planetname" name="nom_planete"></td>
                </tr>
            </tbody></table>
        </div>
      
        <!-- Barre d'information du bas -->
        <div class="barre_information bas">
            <table>
                <tbody><tr>
                    <td id="selected_username" name="pseudo_joueur"></td>
                    <td id="selected_pointuser" name="point_joueur"></td>
                    <td id="selected_rankuser" name="classement_joueur"></td>
                </tr>
            </tbody></table>
        </div>
		<div class="" style="display:none;" id="reponse_action"></div>
		<div id="start_attack" name="start_attack"></div>
    </div>
    
    <span class="gris">
       {$LNG.ls_galaxy_5}
    </span>
</div></div>                   
{/block}