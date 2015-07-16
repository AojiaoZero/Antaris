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
                <h1>Recovery of an account [Step 2/2]</h1>
        <div class="reprise">
            <em>Here is the account that you selected in the previous list.</em>
            <div class="conteneur_compte">
                <div class="compte">
                    <div class="image">
                        <img src="media/files/{$avatars}" />
                    </div>
                    <div class="description">
                        <div class="nom"><span class="cyan">{$namse}</span> &mdash; Horizon</div>
                        &mdash;  {$planetname} [{$galaxys}:{$systems}:{$planets}]<br />
                        &mdash; {$points} points
                    </div>
                </div>
            </div>
			
        </div>
                
        <!-- On cache le choix de l'univers pour les reprises de compte -->
        <div class="choix_univers" style="display : none;">
            <em>Informations about our universe.</em>

            <div class="conteneur_univers"><!--
                                --><div class="univers " name="horizon">
                    <div class="image">
                        <img src="media/image/univers_horizon.jpg" alt="Univers Horizon" />
                    </div>
                    <div class="description">
                        <div class="nom">Horizon </div>
                        <i>
                          &mdash; Open since 1 august 2014<br />
                          &mdash; Version of this univers : 1.1
                        </i>
                    </div>
                </div><!--
                                --><div class="univers " name="caliban">
                    <div class="image">
                        <img src="media/image/univers_caliban.jpg" alt="Univers Caliban" />
                    </div>
                    <div class="description">
                        <div class="nom">Caliban </div>
                        <i>
						  &mdash; no moons
                        </i>
                    </div>
                </div><!--
                                
                           --></div>
        </div>
        
        <h1>Complete the registration form</h1>
        <div id="conteneur_formulaire">
            <!-- Reprise d'un compte inactif -->
                          To recover this account, you must change nickname.</a>.
                        <br /><br />
            
            <!-- Le formulaire d'inscription sur l'univers -->
            <h2>Form</h2>
            All form fields below are mandatory.
              
            <form id="form_inscription" action="index.php?page=resume" name="post" data-action="index.php?page=resume" method="post">
			<input type="hidden" value="send" name="mode">
            <input type="hidden" id="reglement" name="reglement" value="0" />
            <input type="hidden" id="condition" name="condition" value="0" />
            <input type="hidden" id="id_repris" name="id_reprise" value="{$idc}" />
                <div class="champ">
                    <label for="pseudo"> New username :</label>
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

