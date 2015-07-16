{block name="title" prepend}{$LNG.siteTitleDisclamer}{/block}
{block name="content"}
   <!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_contact">
    <!-- Le titre de la page et JavaScript -->
	   <script type="text/javascript">
        $(document).ready(function(){
		ApplicationMethode.modifierPageNavigation('Contact us');
        });
		
    </script>
   


    <!-- Sous-titre : pour se connecter à un compte -->
    <h1>Send an email to the administrator</h1>
    <div class="description">
       You can contact the administrator of the « Antaris Legacy » through the form below site.
         Knowing that it is strictly forbidden to contact us for reasons related to the game itself, that is to say, bugs, complaints and requests for assistance.<br /><br />
        
        We remind our visitors and our players it is possible to ask for help and ask questions on the forum of our community.
         A member of our team will gladly answer your questions.<br /><br />
        
        <span class="orange">
		By filling out the form below, you take note that you will receive an email from « copy » from us.
         You also authorize safeguard your IP address for technical purposes.

		</span><br /><br />
        
        I want to go <a href="forum" title="Go to the forum Antaris Legacy.">to the forum</a> right now.
    </div>
    
    <!-- Affichage du formulaire pour changer de mot de passe -->
    <h2>Form to fill</h2>
            <form id="form_contact" action="index.php?page=disclamer&mode=send" method="post">
        <table>
            <tr class="champ">
                <td><label for="nom">Name :</label></td>
                <td><input type="text" id="nom" name="username" value="" maxlength="25" /></td>
            </tr>
            <tr class="champ">
                <td><label for="prenom">First name :</label></td>
                <td><input type="text" id="prenom" name="prenom" value="" maxlength="25" /></td>
            </tr>
            <tr class="champ">
                <td><label for="email">Email address :</label></td>
                <td><input type="email" id="email" name="email" value="" maxlength="100" /></td>
            </tr>
            <tr class="champ">
                <td><label for="sujet">Subject :</label></td>
                <td>
                    <select id="sujet" name="sujet">
                                                <option value="0" >Recruitment request</option>
                                                <option value="1" >Partnership Application</option>
                                                <option value="2" >Questions about purchases</option>
                                                <option value="3" >Problem when making a purchase</option>
                                                <option value="4" >Very urgent various problem</option>
                                                <option value="5" >Other</option>
                                            </select>
                </td>
            </tr>
            <tr class="texte_label">
                <td colspan="2"><label for="message">Please enter your message :</label></td>
            </tr>
            <tr class="texte_zone">
                <td colspan="2"><textarea id="message" name="message"></textarea></td>
            </tr>
        </table>
      
        <input type="submit" id="valid_form" name="valid_form" value="Send !" />
    </form>
    </div>
</div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>
{/block}