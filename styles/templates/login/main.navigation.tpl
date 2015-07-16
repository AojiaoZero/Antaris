  <div id="curseur" class="infobulle"></div>
        
        <!-- Le haut de la page : image d'Antaris Legacy -->
        <div id="header"></div>
        
        <!-- Pour afficher la version du jeu -->
        <div id="version_jeu"></div>

        <!-- Ensemble de la page -->
        <div id="ensemble">
            <div id="bar_navigation">
                <ul>  
                    <li>Antaris legacy : Portal</li>
                    <li>Home</li>
                </ul>
                <div class="icones">
                    <img src="/media/image/icone/couleur/bug.png" onclick="javascript:window.open('forum'); return false;" 
                         onmouseover="montre('Report a bug on forum.');" onmouseout="cache();" />
                    <img src="/media/image/icone/couleur/repondre.png" onclick="location.href='index.php?page=newsletter';" 
                         onmouseover="montre('Subscribe to our newsletter');" onmouseout="cache();" />
                    <img src="/media/image/icone/couleur/facebook.png" onclick="javascript:window.open('https://www.facebook.com'); return false;" 
                         onmouseover="montre('Go to our Facebook page');" onmouseout="cache();" />
                   
                </div>
            </div>
            
            <!-- Le menu à gauche -->
            <div id="menu">
                <h1>The Game [Sci-fi]</h1>
                <ul>
                    <li><a onclick="location.href='index.php';" title="Go to Antaris Legacy homepage.">Home</a></li>
                    <li><a onclick="location.href='index.php?page=about';" title="View a quick presentation of the game.">Presentation</a></li>
                    <li><a onclick="location.href='index.php?page=register';" title="Create your account immediately on Antaris Legacy.">Register</a></li>
                </ul>
                <h1>Community</h1>
                <ul>
                    <li><a onclick="location.href='index.php?page=rulez';" title="Read the rules before you start playing.">Rules of the game</a></li>
                    <li><a onclick="location.href='index.php?page=terms';" title="Read the terms of use of our services.">Terms and Conditions</a></li> 
                    <li><a href="forum" title="Access the community forum.">Forum</a></li>
                    <li><a onclick="location.href='index.php?page=disclamer';" title="Send an email to the site administrator.">Contact us</a></li>
                    <li><a onclick="location.href='index.php?page=legal';" title="View website disclaimer.">Imprint</a></li>
                </ul>

                <!-- Statistiques des univers -->
                <h1>Statistics</h1>
                           
                                                                            <ul>
                        <li>&mdash; 
                            <span style="cursor : help;" onmouseover="montre('&mdash; Open since 19 april 2015<br />&mdash; Version of the univers : <span class=\'jaune\'>1.1</span>');" onmouseout="cache();">Univers 
                                <span style="font-weight:bold;cursor:pointer;">Horizon :</span>
                            </span>
                        </li>
                        <li><img class="serveur" src="/media/image/icone/couleur/serveur_fluide.gif" />Status : <span class="vert">Fluid</span></li>
                        <li>Nb. registered : <span class="orange">{$users_amount}</span></li>
                        <li>Nb. connected : <span class="vert">{$onLine}</span></li>
                    </ul>
                                                                                    </div>
            
            <!-- Une petite fiche de proposition d'inscription -->
            <div id="inscription_rapide">
                <a class="bouton" href="index.php?page=register" title="Create your account immediately on Antaris Legacy.">Conquer</a>
                <div class="texte">
                    We are in 2196, your people just discovered an alien artifact allows both to travel through the different worlds of the universe...
                </div>
            </div>

            <!-- Lien pour revenir en haut de la page facilement -->
            <div id="retour_haut">
                <a href="#" title="To return to the top of the page.">Back to top</a>
            </div>