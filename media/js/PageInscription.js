var PageInscription = {
    /**
     * Cette fonction sert Ã  initialiser la page d'inscription
     * @param string $id_univers l'identifiant de l'univers [optionnel]
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    initialiser : function($id_univers) {
        $this = PageInscription;
        
        //-- On rÃ©cupÃ©re dans un tableau les messages initiaux --
        $('form#form_inscription div.champ > input').each(function() {
            var $info = $(this).next('div.info');
            $this.tab_msg_initial[$(this).attr('name')] = $info.text();
        });
        
        //-- On sÃ©lectionne le premier univers dans la liste --
        if(typeof $id_univers == 'undefined') {
            $('div.choix_univers').find('div.univers:first').each(function() {
                $this.selectionnerUnivers($(this).attr('name'));
            });
        }
        else $this.selectionnerUnivers($id_univers);
        
        $this.evenement_gerer = false;
    },
    
    
    /**
     * Cette fonction est appelÃ©e une fois Ã  l'initialisation de la page afin de mettre en place la gestion des Ã©vÃ©nements javascript
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    gererEvenement : function() {
        $this = PageInscription;
        
        //-- On doit gÃ©rer l'Ã©vÃ©nement "clique" sur les univers --
        $('div.choix_univers').find('div.univers').each(function() {
            if(typeof $(this).attr('onclick') == 'undefined')
                 $(this).attr('onclick',  'javascript:PageInscription.selectionnerUnivers(\'' + $(this).attr('name') + '\');');
            else $(this).attr('onclick',  $(this).attr('onclick') + ' PageInscription.selectionnerUnivers(\'' + $(this).attr('name') + '\');');
        });
        
        //-- On doit gÃ©rer l'Ã©venement "clavier touche up" sur les champs du formulaire --
        $('form#form_inscription div.champ > input').each(function() {
            if(typeof $(this).attr('onkeyup') == 'undefined')
                 $(this).attr('onkeyup',  'javascript:PageInscription.verifierChamp(\'' + $(this).attr('name') + '\');');
            else $(this).attr('onkeyup',  $(this).attr('onkeyup') + ' PageInscription.verifierChamp(\'' + $(this).attr('name') + '\');');
            
            if(typeof $(this).attr('onchange') == 'undefined')
                 $(this).attr('onchange',  'javascript:PageInscription.verifierChamp(\'' + $(this).attr('name') + '\');');
            else $(this).attr('onchange',  $(this).attr('onchange') + ' PageInscription.verifierChamp(\'' + $(this).attr('name') + '\');');
        });
        
        //-- On doit gÃ©rer l'Ã©venement "clique" sur les checkbox personnalisÃ© --
        $('form#form_inscription div.accepter_regle').find('div[name="reglement"], div[name="condition"]').each(function(){
            $this.changerCheckBox($(this).attr('name'), $('form#form_inscription input[name="' + $(this).attr('name') + '"]').val());
            
            if(typeof $(this).attr('onclick') == 'undefined')
                 $(this).attr('onclick',  'javascript:PageInscription.changerCheckBox(\'' + $(this).attr('name') + '\');');
            else $(this).attr('onclick',  $(this).attr('onclick') + ' PageInscription.changerCheckBox(\'' + $(this).attr('name') + '\');');
        });
        
        //-- On doit gÃ©rer le fait que l'on peut rÃ©initialiser le formulaire --
        $('form#form_inscription input[type="reset"]').attr('onclick', 'javascript:PageInscription.reinitialiserFormulaire();');
        
        //-- On indique que les Ã©venements sont gÃ©rÃ©s --
        $this.evenement_gerer = true;
    },
    
    
    /**
     * On doit appeler cette fonction quand on sÃ©lectionne un univers. Elle permet le chargement du XML pour cet univers.
     * @param string $id_univers l'identifiant de l'univers
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    selectionnerUnivers : function($id_univers) {
        $this = PageInscription;
        
        //-- On charge la configuration (prÃ©-requis) de l'univers en question --
            //-- Message pour la console --
            
            $('div.choix_univers div.univers').removeClass('activer');
            $('div.choix_univers div.univers[name="' + $id_univers + '"]').addClass('activer');
            $('form#form_inscription input#univers').val($id_univers);
            
     
    },
    
    
    /**
     * Cette fonction est appelÃ©e Ã  chaque Ã©vÃ©nement javascript effectuÃ© sur un des champs du formulaire d'inscription.
     * Elle sert Ã  vÃ©rifier que le champ est correctement rempli selon les prÃ©-requis de l'univers en question.
     * @param string $nom_champ le nom du champ du formulaire
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    verifierChamp : function($nom_champ) {
        $this = PageInscription;
        
        if($nom_champ != 'code_acces' && $nom_champ != 'captcha') {
            //-- On rÃ©cupÃ©re l'Ã©lement HTML input (champ) ainsi que le div d'information juste aprÃ¨s --
            var $input    = $('form#form_inscription input[name="' + $nom_champ + '"]');
            var $info     = $input.next('div.info');

            //-- On vÃ©rifie que la valeur du input a Ã©tÃ© changÃ© --
            if($this.tab_value_precedent[$nom_champ] != $input.val()) {
                //-- On prÃ©pare deux variables pour traiter les informations --
                var $erreur = false, $msg_erreur = null;

                //-- On met un message de chargement --
                $info.removeClass('gris vert rouge').addClass('orange').html('VÃ©rification en cours...');

                //-- Si le champ du formulaire que l'on traite possÃ¨de des prÃ©-requis dans le XML --
                if(typeof $this.tab_requis[$nom_champ] != 'undefined') {
                    var $requis_champ = $this.tab_requis[$nom_champ];

                    //-- PrÃ©-requis : minimum et maximum de caractÃ¨re --
                    if(typeof $requis_champ['minimum'] != 'undefined' && ($requis_champ['minimum'] > $input.val().length || $requis_champ['maximum'] < $input.val().length)) {
                        $erreur = true;
                        $msg_erreur = $this.tab_requis[$nom_champ]['msg_taille'];
                    }

                    //-- PrÃ©-requis : doit respecter un regex --
                    else if(typeof $requis_champ['regex'] != 'undefined' && !(new RegExp($requis_champ['regex'], 'gi')).test($input.val())) {
                        $erreur = true;
                        $msg_erreur = $requis_champ['msg_regex'];
                    }
                }

                //-- Si le champ est la confirmation du mot de passe --
                if($nom_champ == 'confirmation' && $input.val() != $('input#mdp').val()) {
                    $erreur = true;
                    $msg_erreur = 'La confirmation du mot de passe est incorrecte.';
                }

                //-- Dans le cas, oÃ¹ il n'y pas eu encore d'erreur ET que le champ est soit le pseudo, soit l'adresse email --
                if(!$erreur && ($nom_champ == 'pseudo' || $nom_champ == 'email')) {
                    var $id_univers   = $('input#univers').val();
                    var $value_pseudo = $('input[name="pseudo"]').val();
                    var $value_email  = $('input[name="email"]').val();

                    //-- On efface le timeout eventuel --
                    clearTimeout($this.id_timeout[$nom_champ]);

                    //-- On met un dÃ©lai de 0,5 seconde avant de rappeler le fichier XML pour vÃ©rification --
                    $this.id_timeout[$nom_champ] = setTimeout(function() {
                        AjaxMethode.getDonneesXML('./page/xml/disponibilite.php', function(xml){
                            if($nom_champ == 'pseudo' && parseInt($(xml).find('disponible[champ="pseudo"]').text()) == 0) {
                                $erreur = true;
                                $msg_erreur = 'Ce pseudo est dÃ©jÃ  utilisÃ© par un joueur.';    
                            }   

                            else if($nom_champ == 'pseudo' && parseInt($(xml).find('liste_noire[champ="pseudo"]').text()) == 1) {
                                $erreur = true;
                                $msg_erreur = 'Ce pseudo ne peut pas Ãªtre utilisÃ© (liste noire).';    
                            }   

                            else if($nom_champ == 'email' && parseInt($(xml).find('disponible[champ="email"]').text()) == 0) {
                                $erreur = true;
                                $msg_erreur = 'Cette adresse email est dÃ©jÃ  utilisÃ©e.';    
                            } 

                            else if($nom_champ == 'email' && parseInt($(xml).find('liste_noire[champ="email"]').text()) == 1) {
                                $erreur = true;
                                $msg_erreur = 'Cette adresse email ne pas Ãªtre utilisÃ©e (liste noire).';    
                            } 

                            $this.afficherMessageRequis($input, $info, $nom_champ, $erreur, $msg_erreur);
                        }, 
                        'id_univers='+ $id_univers + '&value_pseudo=' + $value_pseudo + '&value_email=' + $value_email, 'POST');  
                    }, 500);
                }
                else
                    $this.afficherMessageRequis($input, $info, $nom_champ, $erreur, $msg_erreur);

                //-- On enregistre la valeur du input --
                $this.tab_value_precedent[$nom_champ] = $input.val();
            }
        }
    },
    
    
    /**
     * Cette fonction sert a Ã©crire le message d'aide pour remplir le formulaire d'inscription correctement
     * @param object $input l'Ã©lÃ©ment HTML correspondant Ã  l'input que l'on veut vÃ©rifier
     * @param object $info l'Ã©lÃ©ment HTML oÃ¹ l'on souhaite mettre les informations pour aider Ã  remplir ce champ
     * @param string $nom_champ le nom du champ input en question
     * @param bool $erreur pour savir si le champ est bien rempli
     * @param string $msg_erreur contient le message d'erreur Ã©ventuel
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    afficherMessageRequis : function($input, $info, $nom_champ, $erreur, $msg_erreur) {
        $this = PageInscription;
        
        //-- Si le champ est vide --
        if($input.val().length == 0) 
            $info.text($this.tab_msg_initial[$nom_champ]).removeClass('orange').addClass('gris');

        //-- Dans le cas oÃ¹ le champ possÃ¨de une erreur --
        else if($erreur)
            $info.text($msg_erreur).removeClass('orange').addClass('rouge');
          
        //-- Sinon, on indique Ã  l'utilisateur que tout est correct --
        else
            $info.html('<img src="design/image/icone/couleur/accepter.png" /> Ce champ est correctement rempli.').removeClass('orange').addClass('vert');
    },
  
    
    /**
     * Cette fonction permet de cocher ou dÃ©cocher le respect du reglement ou des conditions gÃ©nÃ©rales d'utilisation
     * @param string $nom_champ le nom duchamp (reglement ou condition)
     * @param int $value la valeur que l'on souhaite prendre au checkbox [optionnel]
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    changerCheckBox : function($nom_champ, $value) {
        $this = PageInscription;
        
        var $input_checkbox = $('form#form_inscription input[name="' + $nom_champ + '"]')
        var $div_checkbox   = $('form#form_inscription div.accepter_regle > div[name="' + $nom_champ + '"]');
        
        if(typeof $value == 'undefined')
           var $value = ((parseInt($input_checkbox.val()) == 0) ? 1 : 0);
        
        $input_checkbox.val($value);
        $div_checkbox.removeClass('vert').addClass((parseInt($input_checkbox.val()) == 1) ? 'vert' : 'rouge');
        $div_checkbox.children('img').attr('src', 'design/image/icone/couleur/' + ((parseInt($input_checkbox.val()) == 1) ? 'accepter' : 'refuser') + '.png');
    },
    
    
    /**
     * Cette fonction sert Ã  rÃ©initialiser les champs du formulaire
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    reinitialiserFormulaire : function() {
        $this = PageInscription;
        
        //-- On parcours l'ensemble des champs pour les vider et rÃ©initialiser --
        $('form#form_inscription div.champ > input').each(function(){
            $(this).attr('value', '');
            $this.verifierChamp($(this).attr('name'));
        });
        
        return false;
    },
    
    
    /**
     * Cette fonction charge le XML de l'univers que l'on a passÃ© en paramÃ¨tre. Une fois chargÃ©e, on intÃ©gre les prÃ©-requis dans le tableau
     * @param string $id_univers l'identifiant de l'univers
     * @param function callback_function la fonction que l'on appelle aprÃ¨s l'Ã©xecution de celle-ci
     * @author Thomas Dubuffet <thomas.dubuffet@free.fr>
     * @return void
     */
    chargerConfig : function($id_univers, callback_function) {
        //-- On rÃ©cupÃ©re le HTML avant de mettre un message de chargement --
        var $contenu_formulaire = $('div#conteneur_formulaire').html();
        
        //-- On affiche le message de chargement --
        $('div#conteneur_formulaire').html('<div id="chargement_ouvrirDiv"><img src="design/image/chargement.gif" alt="Chargement" />Chargement ...</div>');
                      
        AjaxMethode.getDonneesXML('/page/xml/champ_requis.php', function(xml){
            PageInscription.tab_requis = null;
            PageInscription.tab_requis = new Object();
            
            //-- On parcours l'ensemble des configurations --
            $(xml).find('config').each(function(){
                  var config = new Object();

                  //-- Si des tailles (en nombre de caractÃ¨re) sont spÃ©cifiÃ©es --
                  if(typeof $(this).find('taille') != 'undefined') {
                       //-- La taille minimum est renseignÃ© --
                       if($(this).find('taille').attr('minimum') != 'undefined')
                           config['minimum'] = $(this).find('taille').attr('minimum');

                       //-- La taille maximum est renseignÃ© --
                       if($(this).find('taille').attr('maximum') != 'undefined')
                           config['maximum'] = $(this).find('taille').attr('maximum'); 

                       //-- On rÃ©cupÃ©re le message d'erreur Ã©ventuel --
                       if($(this).find('taille').text() != 'undefined')
                           config['msg_taille'] = $(this).find('taille').text();    
                  }
                  
                  //-- Si un REGEX est spÃ©cifiÃ© dans les prÃ©-requis XML --
                  if(typeof $(this).find('regex_javascript') != 'undefined') {
                        //-- Pour rÃ©cupÃ©rer le regex (la chaine de caractÃ¨re de test) --
                       if($(this).find('regex_javascript').attr('valeur_test') != 'undefined')
                           config['regex'] = $(this).find('regex_javascript').attr('valeur_test');

                       //-- On rÃ©cupÃ©re le message d'erreur Ã©ventuel --
                       if($(this).find('regex_javascript').text() != 'undefined')
                           config['msg_regex'] = $(this).find('regex_javascript').text();  
                  }
                  
                  PageInscription.tab_requis[$(this).attr('nom')] = config;
            });
            
            $('div#conteneur_formulaire').html($contenu_formulaire);
            callback_function();

        }, 'id_univers=' + $id_univers);               
    }
};

PageInscription.tab_requis = new Object();
PageInscription.tab_msg_initial = new Object();
PageInscription.id_timeout = new Object();
PageInscription.tab_value_precedent = new Object();
PageInscription.evenement_gerer = false;