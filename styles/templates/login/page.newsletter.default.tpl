{block name="title" prepend}Newsletter{/block}
{block name="content"}
  <!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_newsletter">
    <h1>NewsLetter</h1>
  
    <!-- Image d'illustration pour la newsletter -->
    <img src="/media/image/newsletter.png" /><!--
                 
    --><div name="description">
        <!-- Texte de description sur le fonctionnement de la newsletter -->
        Antaris Legacy newsletter is an information document sent exceptionally to all persons who are registered. When you register on one of our universe game, you are automatically registered to our newsletter.
        <br /><br />
        However, you also have the opportunity to join it, without needing to make a registration at one of our universe. To do this, simply
         enter your email address in the form below.
    </div>
    
    
            <!-- Affichage du formulaire pour adhérer à la newsletter du jeu -->
        <h2>Form for membership</h2>
        <form id="form_adherer_newsletter" action="index.php?page=newsletter" method="post">
            <div name="autorisation">
                By entering your email address below, you give permission to Antaris Legacy save your email address and send letters on it. Pursuant to Belgium law, each of our letters contain a unsubscription link.

                
                            </div>
							{$message}

            <div class="champ">
                <label for="email">Email address :</label>
                <div class="conteneur_input">
                    <input type="email" id="email" name="email" maxlength="100" value="" />
                </div>
            </div>

            <input type="submit" id="valid_form" name="valid_form" value="Join !" />
        </form>
    </div></div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>
{/block}