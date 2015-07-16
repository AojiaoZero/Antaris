      <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
    <!-- Auteur(s) : DUBUFFET Thomas -->
    <!-- Site : Antaris Legacy -->
    <!-- Année : 2011 -->

    <!-- Debut du head -->
    <head>
        <!-- Title de la page -->
        <title>{block name="title"} - {$uni_name} - {$game_name}{/block}</title>

        <!-- Déclarations des balises meta -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Content-language" content="fr" />
        <meta name="author" content="Jeremy Baukens" />
        <meta name="copyright" content="Jeremy Baukens" />
        <meta name="description" content="Antaris Legacy is a game management / strategy massively multiplayer browser based on a science fiction universe entirely invented." />
        <meta name="keywords" content="antaris, legacy, antaris legacy, science, fiction, science-fiction, jeu, game, jeu navigateur" />
        <meta name="Expires" content="never" />
        <meta name="rating" content="Tous public" />
        <meta name="subject" content="Antaris Legacy is a management/strategy browser game." />

        <!-- Fichier CSS et logo du site -->
        <!-- CSS utile : style_mozilla -->
       <link rel="stylesheet" media="screen" type="text/css" href="./media/ingame/css/style_mozilla.css" />
        <link rel="stylesheet" media="screen" type="text/css" href="./media/ingame/css/scrollbar.css" />
        <link rel="stylesheet" media="screen" type="text/css" href="./media/ingame/css/alertify.core.css" />
        <link rel="shortcut icon" type="image/x-icon" href="design/image/favicon.png" />
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=ABeeZee|Electrolize">
		<style>
html { 
    background : #212433 url(./theme/fond.jpg) no-repeat top fixed; 
	-webkit-background-size : cover;
	-o-background-size : cover;
	-moz-background-size : cover;
	background-size : cover;
    behavior : url(/design/pie.htc);  
}

body div#version_univers {  background-image : url(./theme/version_univers.png); }
body div#version_beta {     background-image : url(./theme/version_beta.png); }
body div#header { background-image : url(./theme/header.png); }

@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) {
    body div#version_univers { display : none; }
    body div#version_beta { display : none; }
}
area {
display: none; }

</style>
         <script type="text/javascript" src="media/js/main_compresser.min.js"></script>
				<script type="text/javascript">
	var ServerTimezoneOffset = {$Offset};
	var serverTime 	= new Date({$date.0}, {$date.1 - 1}, {$date.2}, {$date.3}, {$date.4}, {$date.5});
	var startTime	= serverTime.getTime();
	var localTime 	= serverTime;
	var localTS 	= startTime;
	var Gamename	= document.title;
	var Ready		= "{$LNG.ready}";
	var Skin		= "{$dpath}";
	var Lang		= "{$lang}";
	var head_info	= "{$LNG.fcm_info}";
	var auth		= {$authlevel|default:'0'};
	var days 		= {$LNG.week_day|json|default:'[]'} 
	var months 		= {$LNG.months|json|default:'[]'} ;
	var tdformat	= "{$LNG.js_tdformat}";
	var queryString	= "{$queryString|escape:'javascript'}";
	var voterid     = {$userID};
	var voterl1		= "{$LNG.ls_ovbuild_8}"
	var voterl2		= "{$LNG.ls_ovbuild_9}"
	var aprise1		= "{$LNG.ls_answer_1}"
	var aprise2		= "{$LNG.ls_answer_2}"
	var aprise3		= "{$LNG.ls_click_4}"
	var aprise4		= "{$LNG.ls_galaxy_31}"

	setInterval(function() {
		serverTime.setSeconds(serverTime.getSeconds()+1);
	}, 1000);
	
	</script>
				
	{*<script type="text/javascript" src="./scripts/base/jquery.cookie.js"></script>*}
	<script type="text/javascript" src="./scripts/base/jquery.validationEngine.js"></script>
	<script type="text/javascript" src="./scripts/l18n/validationEngine/jquery.validationEngine-{$lang}.js"></script>
	

	
<script type="text/javascript" src="./scripts/base/tooltip.js"></script>
	
	<script type="text/javascript" src="./scripts/game/base.js"></script>
	{foreach item=scriptname from=$scripts}
	<script type="text/javascript" src="./scripts/game/{$scriptname}.js"></script>
	{/foreach}
	{block name="script"}{/block}
	<script type="text/javascript">
	$(function() {
		{$execscript}
	});
	</script>
   {* <script type="text/javascript">
	Checkmail();
	</script>*}
       
                
    <!-- Fin du head -->
    </head>
 <!-- Debut du body -->
    <body>

        <div id="curseur" class="infobulle"></div>
        
        <!-- Le haut de la page : image d'Antaris Legacy -->
        <div id="header"></div>
        
        <!-- Pour afficher la version de l'univers -->
        <div id="version_univers"></div>
        
                <!-- Ensemble de la page -->
        <div id="ensemble">
            <div id="bar_navigation">
                <ul>  
                    <li>Antaris Legacy : The game</li>
                    <li>Univers <span class="orange">Horizon</span></li>
                    <li>{block name="title"}{/block}</li>
                </ul>
				
				  <div class="icones">
                    <img src="media/ingame/image/bug.png" onclick="javascript:window.open('forum'); return false;" onmouseover="montre('{$LNG.ls_topnav_8}.');" onmouseout="cache();" data-nom="bug">
                    <img src="media/ingame/image/facebook.png" onclick="javascript:window.open('https://www.facebook.com'); return false;" onmouseover="montre('{$LNG.ls_topnav_9}');" onmouseout="cache();" data-nom="facebook">
                 
				 
                </div>
				
		
            </div>
