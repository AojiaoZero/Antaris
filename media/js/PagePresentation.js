var PagePresentation = {
    /**
     * Pour initialiser la page de prÃ©sentation du jeu qui contient la description rapide mais surtout les screenshoots du jeu
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @param string $fichier_xml le chemin vers le fichier xml contenant les donnÃ©es sur les screens
     * @return void
     */
    initialiser : function($fichier_xml) {
        $this = PagePresentation;
        
        //-- On ouvre le fichier XML, pour rÃ©cupÃ©rer les donnÃ©es des screens --
        AjaxMethode.getDonneesXML($fichier_xml, function(data_xml){
            $this.liste_screen = null;
            $this.liste_screen = new Array();
            
            $(data_xml).find('screen').each(function() {
                $this.liste_screen[$(this).attr('numero')] = [$(this).text(), $(this).attr('nom')];
            });
            
            $this.image_courante = 1;
            $this.afficherImage();
        });
        
        //-- Quand la souris survole (enter) le screen, on affiche le titre de celui-ci --
        $('div.screen').mouseenter(function(){
            PagePresentation.informationImage('afficher');
        });
        
        //-- Quand la souris a terminÃ© de survoler le screen, on cache le titre de celui-ci --
        $('div.screen').mouseleave(function(){
            PagePresentation.informationImage('cacher');
        });
    }, 
    
    
    /**
     * Pour afficher l'image courante dans le navigateur de l'internaut. On affiche un message de chargement le temps de charger l'image.
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    afficherImage : function() {
        $this = PagePresentation;
        
        $('div#page_presentation img.visualiser').css('opacity', 0).attr('src', $this.liste_screen[$this.image_courante][0]);
        $('div#page_presentation div.screen > div.titre_image').html($this.liste_screen[$this.image_courante][1]);
        $('div#page_presentation img.visualiser').load(function(){
            $(this).css({'display' : 'block', 'opacity' : 1});
        });
      
    },
    
    
    /**
     * Cette fonction sert Ã  modifier le pointeur de l'image courante et Ã  afficher l'image sur l'Ã©cran de l'internaute.
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @param string $action une chaine de caractÃ¨re qui correspond Ã  Â« suivant Â» ou Â« precedent Â» selon l'image Ã  afficher.
     * @return void
     */
    changerImage : function($action) {
        $this = PagePresentation;
        
        //-- On change le pointage de l'image courante --
        if($action == 'precedent')
            $this.image_courante = ($this.image_courante == 1) ? $this.liste_screen.length-1 : $this.image_courante - 1;
        else
            $this.image_courante = ($this.image_courante == $this.liste_screen.length-1) ? 1 : $this.image_courante + 1;
          
        //-- Puis on affiche l'image --
        $this.afficherImage();
    },
    
    
    /**
     * Cette fonction sert Ã  afficher ou cacher le titre de l'image que l'on visionne.
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @param string $action une chaine de caractÃ¨re qui correspond Ã  Â« afficher Â» ou Â« cacher Â».
     * @return void
     */
    informationImage : function($action) {
        $this = PagePresentation;
        
        $('div#page_presentation div.screen > div.titre_image').css('display', (($action == 'afficher') ? 'block' : 'none'));
    }
  
};

PagePresentation.liste_screen = new Array();
PagePresentation.image_courante = 1;