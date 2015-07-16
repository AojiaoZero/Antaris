{block name="title" prepend}{$LNG.lm_logout}{/block}
{block name="content"}


    <!-- Debut du body -->
    <body>
        <div id="curseur" class="infobulle"></div>
        
        <!-- Le haut de la page : image d'Antaris Legacy -->
        <div id="header"></div>
        
        <!-- Pour afficher la version de l'univers -->
        <div id="version_univers"></div>
        
                <div id="fenetre_information">
            <div class="bar superieure"></div>
        <div id="page_contenu"><h1>This account was deleted recently</h1>
              <div class="texte"><span class="rouge">The account with the username « {$username} » was deleted.</span><br>
                          <i>You are free to create a new account on Antaris Legacy.</i>
                          <br><br><a href="index.php" title="Back to Portal">Return to the game portal.</a></div></div>                    <div class="bar inferieure"></div>
        </div>
                
        <!-- Cet élément « script » doit être obligatoirement en bas de la page -->
        
</body></html>
{/block}