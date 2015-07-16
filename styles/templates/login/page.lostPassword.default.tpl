{block name="title" prepend}{$LNG.siteTitleLostPassword}{/block}
{block name="content"}
 <!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_mdp_perdu">
    <!-- Le titre de la page et JavaScript -->
    <script type="text/javascript">
        $(document).ready(function(){
            ApplicationMethode.modifierPageNavigation('Forgot Password');
        });
    </script>


    <!-- Sous-titre : pour se connecter à un compte -->
    <h1>I forgot my password</h1>
    <div class="description">
       
If you have lost your password to access your account, you must complete the form below.
         The email address entered is that of your account. Without this email address, it is impossible to recover your password.<br /><br />
        
        Once the form is validated, an email will automatically be sent to your mailbox. This email will contain the new password to authenticate your account. Using this form, you accept therefore receive an email from our services.<br /><br />
        
        I want to <a href="index.php" title="Back to login page.">return to the login form</a>.
    </div>
    
    <!-- Affichage du formulaire pour changer de mot de passe -->
    <h2>Form to fill</h2>
            <form id="form_mdp_perdu" action="index.php?page=lostPassword" method="post" data-action="index.php?page=lostPassword">
<input type="hidden" value="send" name="mode">
        <div class="champ">
            <label for="univers">Univers :</label>
            <div class="conteneur_input">
  
				<select name="uni" id="universe" class="changeAction">{html_options options=$universeSelect selected=$UNI}</select>
            </div>
        </div>
            
        <div class="champ">
            <label for="pseudo">Username :</label>
            <div class="conteneur_input">
                <input type="text" id="username" name="username" maxlength="20" value="" />
            </div>
        </div>
            
        <div class="champ">
            <label for="email">Email address :</label>
            <div class="conteneur_input">
                <input type="email" id="email" name="email" maxlength="100" value="" />
            </div>
        </div>
            
        <input type="submit" id="valid_form" name="valid_form" value="Send !" />
    </form>
    </div>
</div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>
{/block}
{block name="script" append}
{if $recaptchaEnable}
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
<script type="text/javascript">
var RecaptchaOptions = {
	lang : '{$lang}',
};

var recaptchaPublicKey = "{$recaptchaPublicKey}";

Recaptcha.create(recaptchaPublicKey, 'display_captcha', {
	theme: 'custom',
	tabindex: '6',
	custom_theme_widget: 'display_captcha'
});

</script>
{/if}
{/block}