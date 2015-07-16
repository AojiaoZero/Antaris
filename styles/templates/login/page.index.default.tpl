{block name="title" prepend}{$LNG.siteTitleIndex}{/block}
{block name="content"}
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
    <!-- Auteur(s) : DUBUFFET Thomas -->
    <!-- Site : Antaris Legacy -->
    <!-- Début du projet : octobre 2011 -->
    <!-- Dernière mise à jour du portail : juin 2013 -->


      
                
            <!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_accueil">
    <!-- Le titre de la page et JavaScript -->

	<script type="text/javascript">
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
</script>
    <!-- Sous-titre : pour se connecter à un compte -->
    <h1>Connect to a universe</h1>
    <div class="fond_login">
      
	 <form id="login" name="login" action="index.php?page=login" data-action="index.php?page=login" method="post">
            <label for="univers">Univers :</label>
            <select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>

            <input type="text" id="pseudo" name="username" maxlength="20" placeholder="Username" />
            <input type="password" id="mdp" name="password" maxlength="32" placeholder="Password" />

            <input type="submit" id="valid_form" name="valid_form" value="Play !" />
        </form>
		
		
        <div class="mdp_perdu">
            <a href="index.php?page=LostPassword" title="To recover a lost password.">Forgot Password?</a>
        </div>
    </div>

    <!-- Sous-titre : image d'illustration d'actualité -->
    <h1 class="titre_illustration">Welcome to a new world of Science Fiction !</h1>
            <img class="illustration" src="/media/image_annonce/sortie_horizon_num2.jpg" alt="" />
        


    <!-- Sous-titre : pour afficher la dernière nouvelle -->
    <h1 class="titre_actualite">Latest Antaris Legacy news</h1>
    
    <!-- Pour gérer l'affichage des actualités -->
    <div id="actualite">
              
{foreach $newsList as $newsRow}
			  <!-- Un article -->
        <div id="article_num_{$newsRow.id}" class="article {if $newsRow.Rank == 1}display{else}no_display{/if}">
            <div class="titre">{$newsRow.title}!</div>
            <div class="dateheure">{$newsRow.date}</div>
            
            <div class="texte">
                <div class="guillemet ouvrir">&laquo;</div>
                <div class="guillemet fermer">&raquo;</div>

                
        {$newsRow.text}
            
    
                
                 <div class="auteur">Written by {$newsRow.from}</div>
            </div>
        </div>
                <!-- Un article -->
				{/foreach}
				
       
              
               
        <div class="gestion_pagination">
		
		<span class="titre">Articles :</span>
		{foreach $newsList as $newsRow}
		<a name="{$newsRow.id}" class="activer" onclick="javascript:PageAccueil.afficherArticle({$newsRow.id});">{$newsRow.id}</a>
		{/foreach}
		</div>
    </div>
    
</div>
</div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>
            
          
{/block}
{block name="script" append}
<script>{if $code}alert({$code|json});{/if}</script>
{/block}