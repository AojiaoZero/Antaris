{block name="title" prepend}{$LNG.fcm_info}{/block}
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
        <div id="page_contenu"><h1>Info</h1>
              <div class="texte"><span class="rouge">{$message}</span><br>
                         
                          <br><br><a onclick="history.go(-1)" title="Back to Portal">Return to the game portal.</a></div></div>                    <div class="bar inferieure"></div>
        </div>
                
        <!-- Cet élément « script » doit être obligatoirement en bas de la page -->
       
</body></html>

			
{/block}