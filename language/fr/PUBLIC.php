<?php

//General
$LNG['index']				= 'Accueil';
$LNG['register']			= 'S\'enregistrer';
$LNG['forum']				= 'Forum';
$LNG['send']				= 'Soumettre';
$LNG['menu_index']			= 'Page d\'Accueil'; 	 
$LNG['menu_news']			= 'News';	 
$LNG['menu_rules']			= 'R&egrave;gles'; 
$LNG['menu_agb']			= 'Termes et Conditions'; 
$LNG['menu_pranger']		= 'Bannis';
$LNG['menu_top100']			= 'Hall of Fame';	 
$LNG['menu_disclamer']		= 'Contacter un administrateur';	  
$LNG['registerReferral']		= 'Referencer par';	  
$LNG['uni_closed']			= '(offline)';
$LNG['validmail']			= 'VOUS DEVEZ UTILISER UN MAIL VALIDE POUR TERMINER VOTRE L\'INSCRIPTION';
	 
/* ------------------------------------------------------------------------------------------ */

//index.php
//case lostpassword
$LNG['lost_empty']			= 'Vous devez remplir tous les champs!';
$LNG['lost_not_exists']		= 'Aucun utilisateur ne peut être trouvée dans le cadre de cette adresse mail!';
$LNG['lost_mail_title']		= 'Nouveau mot de passe';
$LNG['mail_sended']				= 'Votre mot de passe a &eacute;t&eacute; envoy&eacute; avec succ&egrave;s!';
$LNG['server_infos']			= array(
	"Un jeu de strat&eacute;gie spatiale en temps r&eacute;el.",
    "Jouer avec des centaines d'utilisateurs.",
    "Pas de t&eacute;l&eacute;chargement, il faudra UNIQUEMENT d'un navigateur internet standard.",
    "Inscription gratuite",
);
$LNG['takeo']					= 'You could experience some difficultness to select the account you want with firefox. (You have to set the pointer in order to hide around 98% of the checkbox). If you couldnt manage to do it, Then use chrome to register with this mod. ';
$LNG['notakenover']	= 'Ce compte ne peu pas etre repris ( Possibiliter de tentative de hack}!';

$LNG['takeo']					= 'Il se peu que vous ayez quelques difficulter a choisir correctement le compte desiree sur firefox. (vous devez clicker sur le rang total du compte que vous desirez reprendre). Si vous utiliser CHROME ou IE, vous pouvez simplement clicker sur le checkbox. ';
//case default
$LNG['login_error_1']			= 'Nom d\'utilisateur / mot de passe incorrect !';
$LNG['login_error_2']			= 'Quelqu\'un s\'est connect&eacute; depuis un autre PC dans votre compte!';
$LNG['login_error_3']			= 'Votre session a expiré!';
$LNG['login_error_4']				= 'Une erreur externe s\'est produite, veulliez ressayer plus tard!';

$LNG['screenshots']				= 'Captures d\'&eacute;cran';
$LNG['universe']				= 'Univers';
$LNG['chose_a_uni']				= 'Choisissez un univers';
$LNG['universe']				= 'Univers';
$LNG['chose_a_uni']				= 'Choisissez un univers';
$LNG['registerSendComplete']		= ' <h1>Activez votre compte pour terminer</h1>
        <div style="text-align : center; padding : 10px 0px 20px 0px; font-size : 1.1em;" class="vert">
            Un e-mail a été envoyé à l\'adresse suivante : %s

            <div class="orange" style="padding-top : 5px; font-size : 0.9em;">
                SI VOUS N\'AVEZ PAS REÇU L\'EMAIL DE VALIDATION, VERIFIEZ VOTRE MAIL INDESIRABLE (SPAM).
            </div>
        </div>

        <div style="text-align : justify;">
           Votre compte a été créé. Cependant, il est nécessaire de l\'activer à partir de votre boîte a mail. 
            Une clé d\'activation a été envoyé à l\'adresse e-mail que vous avez entrée.
            Si vous ne avez pas reçu un message dans votre boîte de réception, vérifiez se il ne est pas dans votre courrier indésirable.
            <br><br>
            Vous avez 7 jours pour activer votre compte avant qu\'il ne soit supprimé définitivement.
        </div>';
$LNG['registerMailVertifyTitle']	= 'Activation de votre enregistrement sur le jeu: %s';
$LNG['registerMailVertifyError']	= 'Envoi du mail echouer a :: %s';

$LNG['registerMailCompleteTitle']	= 'Bienvenue sur %s!';
$LNG['registerWelcomePMSenderName']	= 'Administrateur';
$LNG['registerWelcomePMSubject']	= 'Bienvenue';
$LNG['registerWelcomePMText']		= 'Bienvenue sur %s!<br><br>

Je vous remercie de nous avoir rejoint et  j\'espère être de vous aider dans vos premiers pas. <br>

Sur la gauche, vous verrez le menu, qui vous aidera à contrôler le destin de votre empire galactique. <br>

Je `suis sûr que vous connaissez déjà le` aperçu `. Sous `Ressources` et `installations` vous pouvez construire les constructions dont vous avez besoin pour soutenir votre empire. Obtenez le meilleur départ en améliorant votre centrale solaire, de sorte que vous acquérez de l\'énergie.<br>

Par la suite, améliorer vos mines de métaux et cristaux pour commencer à produire les ressources nécessaires. Vous pouvez aussi jeter un oeil dans les menus, vous serez certainement en mesure de trouver votre chemin dans le jeu assez rapidement.';
$LNG['vertifyNoUserFound']			= 'Requete Invalide!';
$LNG['vertifyAdminMessage']			= 'L\'utilisateur "%s" est activer!';

//lostpassword
$LNG['passwordInfo']				= 'If you have forgotten your password, you must specify the user name and the E-Mail address that you have entered in your account.';
$LNG['passwordUsername']			= 'Nom d\'Utilisateur';
$LNG['passwordMail']				= 'E-Mail';
$LNG['passwordCaptcha']				= 'Code de Securiter';
$LNG['passwordSubmit']				= 'Envoyer';
$LNG['passwordErrorUsernameEmpty']	= 'Vous devez entrer un nom d\'utilisateur!';
$LNG['passwordErrorMailEmpty']		= 'Vous avez entrer un mail invalide!';
$LNG['passwordErrorUnknown']		= 'Aucun compte trouver avec ses informations.';
$LNG['passwordErrorOnePerDay']		= 'Vous avez deja demander un mail dans les 24 derniere heure, vous pourez faire une nouvelle demande dans 24h';

$LNG['passwordValidMailTitle']		= 'Oublie de votre mot de passe: %s';
$LNG['passwordValidMailSend']		= 'Vous receverez un mail vous disant comment proceder pour la suite.';

$LNG['passwordValidInValid']		= 'Requete Invalide!';
$LNG['passwordChangedMailSend']		= 'Vous allez recevoir un mail avec votre nouveau mot de passe.';
$LNG['passwordChangedMailTitle']	= 'Nouveau mot de passe: %s';

$LNG['passwordBack']				= 'Retour';
$LNG['passwordNext']				= 'Suivant';
//Impressum
$LNG['disclamerLabelAddress']		= 'Adresse:';
$LNG['disclamerLabelPhone']			= 'Nr. Telephone:';
$LNG['disclamerLabelMail']			= 'Email:';
$LNG['disclamerLabelNotice']		= 'Information';


/* ------------------------------------------------------------------------------------------ */

//lostpassword.tpl
$LNG['lost_pass_title']			= 'R&eacute;cup&eacute;rer mot de passe';

//index_body.tpl
$LNG['user']					= 'Pseudo';
$LNG['pass']					= 'Mot de passe';
$LNG['remember_pass']			= 'Connection automatique';
$LNG['lostpassword']			= 'Mot de passe oubli&eacute;?';
$LNG['welcome_to']				= 'Bienvenue &agrave;';
$LNG['server_description']		= 'DESCRIPTION';
$LNG['server_register']			= 'S\'il vous pla&icirc;t inscrivez-vous maintenant!';
$LNG['server_message']			= 'Inscrivez-vous et une nouvelle exp&eacute;rience passionnante vous attend dans le monde du';
$LNG['login']					= 'Login';
$LNG['disclamer']				= 'Contacter un administrateur';
$LNG['login_info']				= 'En me connectant j\'accepte les <a onclick="ajax(\'?page=rules&amp;\'+\'getajax=1&amp;\'+\'lang=%1$s\');" style="cursor:pointer;">RÃ¨gles</a> et le <a onclick="ajax(\'?page=agb&amp;\'+\'getajax=1&amp;\'+\'lang=%1$s\');" style="cursor:pointer;">Termes et Conditions</a>';

/* ------------------------------------------------------------------------------------------ */

//reg.php - Registrierung
$LNG['register_closed']				= 'Les inscriptions sont closes!';
$LNG['register_at']					= 'Inscrit &agrave; ';
$LNG['reg_mail_message_pass']		= 'Un pas de plus pour activer votre nom d\'utilisateur';
$LNG['reg_mail_reg_done']			= 'Bienvenue &agrave; %s!';
$LNG['invalid_mail_adress']			= 'Adresse e-mail invalide!<br>';
$LNG['empty_user_field']			= 'S\'il vous pla&icirc;t remplir tous les champs!<br>';
$LNG['password_lenght_error']		= 'Le mot de passe doit Ãªtre au moins 4 caract&egrave;res de long!<br>';
$LNG['user_field_no_alphanumeric']	= 'S\'il vous pla&icirc;t entrez votre pseudo avec des caract&egrave;res alphanum&eacute;riques UNIQUEMENT!<br>';
$LNG['user_field_no_space']			= 'Ne pas laisser le champs PSEUDO vide!<br>';
$LNG['planet_field_no']				= 'Vous devez entrer un nom de planète!';
$LNG['planet_field_no_alphanumeric']= 'S\'il vous pla&icirc;t entrez le nom de la plan&egrave;te avec des caract&egrave;res alphanum&eacute;riques UNIQUEMENT!<br>';
$LNG['planet_field_no_space']		= 'Ne pas laisser le champs NOM PLANETE vide!<br>';
$LNG['terms_and_conditions']		= 'Vous devez accepter <a href="index.php?page=agb">Termes et Conditions</a> et <a href="index.php?page=rules>Rules</a> s\il vous pla&icirc;t!<br>';
$LNG['user_already_exists']			= 'Le nom d\'utilisateur est d&eacute;j&agrave; pris!<br>';
$LNG['mail_already_exists']			= 'L\'adresse e-mail est d&eacute;j&agrave; utilis&eacute;e!<br>';
$LNG['wrong_captcha']				= 'Code de s&eacute;curit&eacute; est incorrect!<br>';
$LNG['different_passwords']			= 'Vous avez indiqu&eacute; 2 mots de passe diff&eacute;rents!<br>';
$LNG['different_mails']				= 'Vous avez indiqu&eacute; 2 adresses e-mail diff&eacute;rentes!<br>';
$LNG['welcome_message_from']		= 'Administrateur';
$LNG['welcome_message_sender']		= 'Administrateur';
$LNG['welcome_message_subject']		= 'Bienvenue';
$LNG['welcome_message_content']		= 'Bienvenue &agrave; %s!<br>Premi&egrave;re construire une &eacute;nergie solaire, parce que l\'&eacute;nergie est n&eacute;cessaire pour la production ult&eacute;rieure de mati&egrave;res premi&egrave;res. Pour la construire, faites un clic gauche dans le menu Â«bÃ¢timentÂ». Puis la construction du bÃ¢timent 4e &agrave; partir de la partie sup&eacute;rieure. L&agrave;, vous avez l\'&eacute;nergie, vous pouvez commencer &agrave; construire des mines. Retour au menu sur le bÃ¢timent et construire une mine de m&eacute;taux, puis &agrave; nouveau une mine de cristal. Afin d\'Ãªtre en mesure de construire des navires dont vous avez besoin d\'avoir d\'abord construit un chantier naval. Ce qui est n&eacute;cessaire pour que vous trouvez dans la technologie menu de gauche. L\'&eacute;quipe vous souhaite beaucoup de plaisir &agrave; explorer l\'univers!';
$LNG['newpass_smtp_email_error']	= '<br><br>Une erreur s\'est produite. Votre mot de passe est: ';
$LNG['reg_completed']				= 'Toute l\'&eacute;quipe vous remercie de votre inscription! Vous recevrez un email avec un lien d\'activation.';
$LNG['planet_already_exists']		= 'La position de la plan&egrave;te est d&eacute;j&agrave; occup&eacute;e! <br>';

//registry_form.tpl
$LNG['server_message_reg']			= 'Inscrivez-vous d&egrave;s maintenant et faire partie de';
$LNG['register_at_reg']				= 'Inscrit &agrave;';
$LNG['universe']						= 'Univers';
$LNG['registerUsername']					= 'Pseudo';
$LNG['registerPassword']					= 'Mot de passe';
$LNG['registerPasswordReplay']					= 'Confirmation mot de passe';
$LNG['registerEmail']					= 'Adresse e-mail';
$LNG['registerEmailReplay']					= 'Confirmation adresse e-mail';
$LNG['registerFacebookAccount']					= 'Connexion avec Facebook';
$LNG['registerLanguage']				= 'Langue';
$LNG['captcha_reg']					= 'Question de s&eacute;curit&eacute;';
$LNG['registerRules']	= 'Vous accepter avec ce present nos <a href="#">regles</a> de jeu';
$LNG['buttonRegister']				= 'Rejoignez Nous !';
$LNG['lostpwd']			= 'Mot de Passe Perdu?';
$LNG['captcha_reload']				= 'Nouveau CAPTCHA';
$LNG['captcha_get_audio']			= 'Chargement Son-CAPTCHA';
$LNG['user_active']                	= 'Utilisateur %s a &eacute;t&eacute; activ&eacute;!';



//Facebook Connect

$LNG['fb_perm']                	= 'AccÃ¨s interdit. %s besoins de tous les droits afin que vous puissiez vous connecter avec votre compte Facebook. \n Alternativement, vous pouvez vous connecter sans compte Facebook!';

//NEWS

$LNG['news_overview']			= "News";
$LNG['news_from']				= "Sur %s par %s";
$LNG['news_does_not_exist']		= "Pas de News disponibles!";

//Impressum

$LNG['disclamer']				= "Disclaimer";
$LNG['disclamer_name']			= "Pseudo";
$LNG['disclamer_adress']		= "Adresse";
$LNG['disclamer_tel']			= "TÃ©lÃ©phone:";
$LNG['disclamer_email']			= "Adresse E-mail";

// Traduction Française by Scofield06 - All rights reserved (C) 2011


//REGISTER

$LNG['registerErrorUniClosed']		= 'The registration is closed in this universe.!';
$LNG['registerErrorUsernameEmpty']	= 'You must enter a username!';
$LNG['registerErrorUsernameChar']	= 'Your username must consist in numbers, Letters, Spaces, _, -, . only!';
$LNG['registerErrorUsernameExist']	= 'The username is already taken!';
$LNG['registerErrorPasswordLength']	= 'The password must be at least 6 characters long!';
$LNG['registerErrorPasswordSame']	= 'Entering 2 different Passwords!';
$LNG['registerErrorMailEmpty']		= 'Vous devez entrer une adresse email!';
$LNG['registerErrorMailInvalid']	= 'Adresse email invalide!';
$LNG['registerErrorMailInvalid2']	= 'Nous n\'acceptons pas les adresses emails jetable';
$LNG['registerErrorMailSame']		= 'You have specified 2 different email addresses!';
$LNG['registerErrorMailExist']		= 'Cette adresse email est deja utiliser!';
$LNG['registerErrorRules']			= 'Vous devez accepter les regles!';
$LNG['registerErrorCaptcha']		= 'Le code de securite est incorrecte!';
$LNG['invalid_ip_adress']		= 'Multi Compte Detectee.';
$LNG['registerBack']				= 'Retour';
$LNG['registerNext']				= 'Suivant';

?>