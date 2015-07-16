var PageRegle = {
    /**
     * Pour initialiser la page qui comporte des rÃ¨gles (rÃ¨glement du Jeu ou Conditions gÃ©nÃ©rales d'utilisation.
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    initialiser : function() {
        $this = PageRegle;
        
        //-- On rÃ©cupÃ©re dans un tableau le contenu du url avant et aprÃ¨s le Â« # Â»
        var $url = new String(document.location.href);
        var $tab_url =  $url.split('#');
        
        //-- On active le paragraphe dans le cas oÃ¹ il y a une ancre dans l'URL --
        if($tab_url.length > 1 && (/^paragraphe_/.test($tab_url[1])))
            $this.activerParagraphe($tab_url[1]);
          
        //-- Si le navigateur est Internet explorer avec une version infÃ©rieur Ã  10, on doit gÃ©rer les colonnes avec un plugin Jquery --
        if($.browser.msie && parseInt($.browser.version) < 10)
            $('div.sommaire').columnize({columns : 3});     
    },
    
    /**
     * Cette fonction permet de rendre trÃ¨s visible la bordure d'un paragraphe sÃ©lectionnÃ©.
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    activerParagraphe : function($id_paragraphe) {
        GestionMethode.ecrireConsole($id_paragraphe);
        
        $('div.paragraphe').removeClass('actif');
        $('h3#' + $id_paragraphe).next('div.paragraphe').addClass('actif');
    }
};