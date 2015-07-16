{block name="title" prepend}{$LNG.siteTitleRegister}{/block}
{block name="content"}
<script type="text/javascript" src="/media/js/PageInscription.js"></script>
<script type="text/javascript" src="/media/js/register.js"></script>

<!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_inscription">
    <!-- Le titre de la page et JavaScript -->
   <script type="text/javascript">
        $(document).ready(function(){
		ApplicationMethode.modifierPageNavigation('Register now');
        });
		
    </script>

            <!-- Inscription avec un compte que l'on souhaite reprendre -->
                <h1>Choose your world</h1>
                
        <!-- On cache le choix de l'univers pour les reprises de compte -->
        <div class="choix_univers" >
            <em>Informations about our universe.</em>

            <div class="conteneur_univers"><!--
                                --><div class="univers " name="1" onclick="javascript:PageInscription.selectionnerUnivers('1');">
                    <div class="image">
                        <img src="media/image/univers_horizon.jpg" alt="Univers Horizon" />
                    </div>
                    <div class="description">
                        <div class="nom">Horizon </div>
                        <i>
                          &mdash; Open on 19 april 2015<br />
                          &mdash; no moons
                        </i>
                    </div>
                </div><!--
                               
                                
                           --></div>
        </div>
        
        <h1>Complete the registration form</h1>
        <div id="conteneur_formulaire">
            <!-- Reprise d'un compte inactif -->
                           To subscribe to Antaris Legacy, please provide the following information<br />
                Once registration is complete, you will receive an email that contains an account activation link.
                <br /><br />
                We also offer our community to <a name="lien_reprise" href="index.php?page=resume" title="Reprise de compte">resume an account</a>.
                        <br /><br />
            
            <!-- Le formulaire d'inscription sur l'univers -->
            <h2>Form</h2>
            All form fields below are mandatory.
            
            <form id="form_inscription" action="index.php?page=register" data-action="index.php?page=register" name="post" method="post">
			<input type="hidden" value="send" name="mode">
			<input type="hidden" value="{$externalAuth.account}" name="externalAuth[account]">
			<input type="hidden" value="{$externalAuth.method}" name="externalAuth[method]">
			<input type="hidden" value="{$referralData.id}" name="referralID">
            <input type="hidden" id="reglement" name="reglement" value="0" />
            <input type="hidden" id="condition" name="condition" value="0" />
            <input type="hidden" id="id_reprise" name="id_reprise" value="0" />
            <input type="hidden" id="univers" name="univers" value="1" />
                <div class="champ">
                    <label for="pseudo">Username :</label>
                    <input type="text" id="pseudo" name="username" onChange="verifPseudo(this.value)" onKeyUp="verifPseudo(this.value)" value="" />
                    <div id="pseudobox" class="info gris">Username to access your account.</div>
                </div>

                <div class="champ">
                    <label for="mdp">Password :</label>
                    <input type="password" id="mdp" name="password" onChange="passwordCheck(this.value);" onkeyup="passwordCheck(this.value);" value=""/>
                    <div id="check" class="info gris">The password to login.</div>
                </div>

                <div class="champ">
                    <label for="confirmation">Confirmation :</label>
                    <input type="password" id="confirmation" name="passwordReplay" onChange="checkPw(this.value)" onKeyUp="checkPw(this.value)" value="" />
                    <div id="passbox" class="info gris">Confirm password.</div>
                </div>

                <div class="champ">
                    <label for="email">Email address :</label>
                    <input type="email" id="email" name="email" onChange="verifMail(this.value)" onKeyUp="verifMail(this.value)" value="" />
                    <div id="mailbox" class="info gris">The email address of the account (owner).</div>
                </div>

                <div class="champ">
                    <label for="nom_planete">Planete name :</label>
                    <input type="text" id="nom_planete" name="nom_planete" onChange="verifHome(this.value)" onKeyUp="verifHome(this.value)" value="" />
                    <div id="home" class="info gris">The name of your home planet.</div>
                </div>

               
                <div class="champ">
                    <label for="captcha">Enter the code :</label>
                    <input type="text" id="captcha" name="captcha"  value="" />
                    <img name="captcha" src="?page=register&mode=getCode" />
                    
                    <div class="info gris">System to block registrations for bots.</div>
                </div>
                    
                <div class="accepter_regle">
                    <div onclick="javascript:PageInscription.changerCheckBox('reglement');" name="reglement" class="rouge">
                        <img src="media/image/refuser.png" alt="X">
                        I have read and I accept the <a href="index.php?page=rulez">rules of the game</a>.
                    </div>
                    <br>
                    <div onclick="javascript:PageInscription.changerCheckBox('condition');" name="condition" class="rouge">
                        <img src="media/image/refuser.png" alt="V">
                        I have read and agree to the <a href="index.php?page=terms">terms and conditions</a>.
                    </div>
                </div>

                <input type="submit" value="Register" />
                <input type="reset" value="Reset" />
            </form>
         </div>
     </div></div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>
{/block}

