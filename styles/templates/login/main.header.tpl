<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="{$lang}" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="{$lang}" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="{$lang}" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="{$lang}" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="{$lang}" class="no-js"> <!--<![endif]-->
 <head>
        <!-- Title de la page -->
        <title>{block name="title"} - {$gameName}{/block}</title>

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
        
        <meta name="viewport" content="width=device-width, maximum-scale=1"/>

        <!-- Fichier CSS et logo du site -->
        <!-- CSS utile : style_mozilla -->
        <link rel="stylesheet" media="screen" type="text/css" href="/media/style_mozilla.css" />
        <link rel="shortcut icon" type="image/x-icon" href="/design/image/favicon.png" />
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=ABeeZee|Electrolize">
          
        <!-- Les élements particuliers pour certains navigateurs : Mozilla/5.0 (Windows NT 6.3; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0 -->
                <!-- Fin des éléments particuliers -->

        <!-- Pour vérification du site via Google et pour l'HTML5 -->
		<script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
		<meta name="google-site-verification" content="fz71vSLYhblGA96Iw-4JxgvuxUvR3ev1IwX2xLC0OkE" />
        
        <!-- Fichiers JavaScript : Plugins -->
        <script type="text/javascript" src="/media/jquery-1.7.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/media/apprise.js"></script>
        <script type="text/javascript" src="/media/jquery.columnizer.js"></script>
        <script type="text/javascript" src="/media/js/AjaxMethode.js"></script>
        <script type="text/javascript" src="/media/js/GestionMethode.js"></script>
        <script type="text/javascript" src="/media/js/ActionMethode.js"></script>
        <script type="text/javascript" src="/media/js/ApplicationMethode.js"></script>
        <script type="text/javascript" src="/media/js/fonction_infobulle.js"></script>
       
        <!-- Fichiers JavaScript : Application -->
     

    <!-- Fin du head -->
    </head>
<body id="{$smarty.get.page|htmlspecialchars|default:'overview'}" class="{$bodyclass}">

