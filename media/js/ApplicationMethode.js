var ApplicationMethode = {
	/* -- Pour initialiser l'application -- */
	initialiser : function() {
		var $this = ApplicationMethode;
        
        //-- Pour executer le javascript --
		ActionMethode.executionJavascript();
        
        //-- Autres fonctions Ã  appeler --
        $this.gererFicheRecrutement();
        
        //-- Pour vÃ©rifier la compatibilitÃ© du navigateur --
        if($.browser.msie && parseInt($.browser.version) < 9)
            apprise('<span class="rouge">Ce jeu ne fonctionne pas correctement avec la version de votre navigateur.</span><br />' +
					'Vous devez absolument mettre Ã  jour votre navigateur vers une version plus rÃ©cente.<br />', {'confirm' : true, 'maxWidthWindow' : 550});
	},
    
    /* -- Pour changer le nom de la page dans la barre de navigation -- */
    modifierPageNavigation : function(titre_page) {
        $('div#bar_navigation > ul li:last-child').text(titre_page);
    },
    
    /* -- Pour gÃ©rer l'affiche de inscription_rapide en dessous du menu -- */
    gererFicheRecrutement : function() {
        var $height_menu = $('div#menu').outerHeight(true) + 25;
        var $height_corps = $('div#corps').height();
        var $height_fiche = $('div#inscription_rapide').height();

        $('div#inscription_rapide').css({'display' : (($height_menu + $height_fiche > $height_corps || ActionMethode.page_principal != 'accueil') ? 'none' : 'block'), 'top' : $height_menu});
    },
    
    /*-- Pour gÃ©rer le div qui permet de revenir en haut de la page -- */
    gererRetourEnHaut : function($emplacement_scroll) {
        var $top_menu       = $('div#menu').offset().top;
        var $height_menu    = $('div#menu').outerHeight(true);
        var $top_initial    = $top_menu + $height_menu;
        var $height_fenetre = $(window).height();
        
        if($emplacement_scroll > $top_initial) 
            $('div#retour_haut').css({'display' : 'block', 'top' : Math.min($('div#corps').outerHeight(true), $emplacement_scroll - $top_menu + $height_fenetre)});
        else
            $('div#retour_haut').css({'display' : 'none', 'top' : $top_initial});
    }
};

/* -- Les variables de la class ApplicationMethode :
	- page_actif = vrai ou faux selon si l'utilisateur est sur l'onglet du navigateur  
	- google_analyse = Boolean pour savoir si on utilise d'analyse Google -- */
ApplicationMethode.page_actif = true;
ApplicationMethode.google_analyse = true;
ApplicationMethode.nom_domaine = '';