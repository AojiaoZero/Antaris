{block name="title" prepend}{$LNG.siteTitleIndex}{/block}
{block name="content"}
<script type="text/javascript" src="/media/js/PagePresentation.js"></script>
 <!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_presentation">
    <!-- Le titre de la page et Javascript -->
    <script type="text/javascript">
        $(document).ready(function(){
            PagePresentation.initialiser('media/image/screens/screens.xml');
        });
		
    </script>

    
    <!-- Sous titre : Texte de présentation du jeu -->
    <h1 class="description">Fast « desciption » of the game</h1>
    <div class="description">
        <b>Antaris Legacy</b> is a management / massively multiplayer strategy browser based game on a science fiction universe entirely invented.<br /><br />

        Will you have enough fabric to make the fight by participating in major battles, explore the unknown, and build your own empire?
         Embark now in a science fiction universe without limits: conquer space and its unexplored lands, colonize many planets
         to expand your empire and increase your power, do upgrade your technologies and buildings, train your own army and fight for your space fleet
         Force your enemies with your allies or alone.<br /><br />

        You think you can compete with other nations to impose your ideology, your laws? Join the players already just waiting to do battle!<br /><br />

       Discover a unique space and ground game of its kind, where the warm and supportive community just waiting to grow and spend quality time with you.
    </div>
    
    
    <!-- Sous-titre : Les screenshoots du jeu -->
    <h1 class="titre_screen">Image presentation</h1>
    <div class="screen">
        <img class="chargement" src="media/image/chargement.gif" />
        <img class="visualiser" src="" />
        <img class="contour" src="media/image/contour_noir.png" />
        <div class="titre_image"></div>
        <img class="fleche gauche" src="media/image/fleche_gauche.png" onclick="javascript:PagePresentation.changerImage('precedent');"
             onmouseover="montre('View the previous image.');" onmouseout="cache('');" />
			 
        <img class="fleche droite" src="media/image/fleche_droite.png" onclick="javascript:PagePresentation.changerImage('suivant');" 
             onmouseover="montre('Display the next image.');" onmouseout="cache('');" />
    </div>
    
    <!-- Sous-titre : Compatiblité des navigateurs -->
    <h1>Prerequisites browsers internets</h1>
    <div class="navigateur_compatible">
        The game uses very recent programming languages (<i>in particular, CSS3, HTML5 and jQuery</i>), therefore, your web browser must be updated regularly
       to play in the best possible conditions. We strongly recommend using Mozilla Firefox or Google Chrome.<br /><br />
            
        <h2>Minimum System Requirements</h2>
        <table>
            <tr>
                <th class="logo">Logo</th>
                <th class="nom">Browser Name</th>
                <th class="version">Minimum version information update</th>
            </tr>
            <tr>
                <td class="logo"><img src="media/image/navigateur/firefox.png" title="Logo of Mozilla Firefox"></td>
                <td class="nom">Mozilla Firefox</td>
                <td class="version">
                    Version <span class="orange">4 and more</span>.<br />
                    Update via the <a href="http://www.mozilla.org/fr/firefox/fx/">Mozilla website</a>
                </td>
            </tr>
            <tr>
                <td class="logo"><img src="media/image/navigateur/chrome.png" title="Logo of Google Chrome"></td>
                <td class="nom">Google Chrome</td>
                <td class="version">
                    Version <span class="orange">5 and more</span>.<br />
                    Update via the <a href="http://www.google.com/intl/fr/chrome/browser/">Google Chrome website</a>
                </td>
            </tr>
            <tr>
                <td class="logo"><img src="media/image/navigateur/safari.png" title="Logo of Safari d'Apple"></td>
                <td class="nom">Safari d'Apple</td>
                <td class="version">
                    Version <span class="orange">4.* and more</span>.<br />
                    Update via the <a href="http://www.apple.com/fr/safari/">Safari website</a>
                </td>
            </tr>
            <tr>
                <td class="logo"><img src="media/image/navigateur/IE.png" title="Logo of Internet explorer"></td>
                <td class="nom">Internet Explorer</td>
                <td class="version">
                    Version <span class="orange">9 and more</span>.<br />
                    Update via the <a href="http://windows.microsoft.com/fr-fr/internet-explorer/download-ie">Internet Explorer website</a>
                </td>
            </tr>
        </table>
    </div>
</div></div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>


{/block}