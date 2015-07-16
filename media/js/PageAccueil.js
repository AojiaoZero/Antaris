var PageAccueil = {
    /**
     * Cette fonction permet de lancer le formulaire de connexion pour accÃ©der Ã  un compte d'un univers
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @param string $nom_domaine le nom de domaine du site
     * @return void
     */
    formulaireConnexion : function() {
        var $form   = $('div#page_accueil form#form_se_connecter');
        var $option = $form.find('select#univers').find('option:selected');

        $form.attr('action', 'http://' + $option.val() + '.' + ApplicationMethode.nom_domaine);
    },
    
    /**
     * Cette fonction sert Ã  afficher un article en particulier dans le flux d'actualitÃ© 
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @param int $num_page le numÃ©ro de page Ã  afficher
     * @return void
     */
     afficherArticle : function(num_page) {
        $('div#actualite div.article').css('display', 'none');
        $('div#actualite div#article_num_' + num_page).css('display', 'block');
        
        $('div#actualite div.gestion_pagination > a').removeClass('activer');
        $('div#actualite div.gestion_pagination > a[name="' + num_page + '"]').addClass('activer');
     }
};