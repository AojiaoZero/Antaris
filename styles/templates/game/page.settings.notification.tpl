{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_settings_1}</h1><div id="page_profil">	<div class="onglet" style="margin-bottom : 0px; padding-bottom : 0px;">		<ul>			

<li><a href="?page=settings&mode=psuedo" title="{$LNG.ls_settings_2}">{$LNG.ls_settings_2}</a></li>		
<li><a href="?page=settings&mode=personal" title="{$LNG.ls_settings_3}">{$LNG.ls_settings_3}</a></li>			
<li><a href="?page=settings&mode=avatar" title="{$LNG.ls_settings_4}">{$LNG.ls_settings_4}</a></li>			
<li><a href="?page=settings&mode=signature" title="{$LNG.ls_settings_5}">{$LNG.ls_settings_5}</a></li>			
<li><a href="?page=settings&mode=design" title="{$LNG.ls_settings_57}">{$LNG.ls_settings_57}</a></li>
</ul>
	<div class="onglet">		<ul>			
	
	<li><a href="?page=settings&mode=password" title="{$LNG.ls_settings_6}">{$LNG.ls_settings_6}</a></li>			
	<li><a href="?page=settings&mode=vmode" title="{$LNG.ls_settings_7}">{$LNG.ls_settings_7}</a></li>			
	<li><a href="?page=settings&mode=delete" title="{$LNG.ls_settings_8}">{$LNG.ls_settings_8}</a></li>		
	
	</ul>		</div>
	<div id="div_profil_onglet"><div class="categorie">
                        <h2>Changer votre paramètres de notification</h2>
                        Notifications are displayed only if you are logged into your account, and that the tab of your browser is active at the time the information reaches the command center of your empire. These notifications allow players to manage their account without constantly checking their control room or messaging. however, <span class="rouge">this system is beta</span> athen it is possible that there is a malfunction.<br /><br />
                        
                        You can, if you wish to disable some or all of the notifications through the form below.
                        
                        <form id="form_notification" method="post" action="javascript:ActionMethode.envoyerFormulaire('form_notification', 'div_profil_onglet', 'page/profil_onglet.php?onglet_page=9');"><div class="param_notification">
                                  <input type="checkbox" id="notification_messagerie" name="notification_messagerie"  />
                                  <label for="notification_messagerie" style="font-weight : normal; margin-left : 10px;">Notification message and private message alliance</label>
                              </div><div class="param_notification">
                                  <input type="checkbox" id="notification_attaque_subie" name="notification_attaque_subie"  />
                                  <label for="notification_attaque_subie" style="font-weight : normal; margin-left : 10px;">Notification of attack suffered by PDT and space</label>
                              </div><div class="param_notification">
                                  <input type="checkbox" id="notification_tchat" name="notification_tchat"  />
                                  <label for="notification_tchat" style="font-weight : normal; margin-left : 10px;">Notification whispering on chat</label>
                              </div><div class="param_notification">
                                  <input type="checkbox" id="notification_connexion" name="notification_connexion"  />
                                  <label for="notification_connexion" style="font-weight : normal; margin-left : 10px;">Connection notification of a direct ally</label>
                              </div><div class="param_notification">
                                  <input type="checkbox" id="notification_annonce" name="notification_annonce" checked="checked" />
                                  <label for="notification_annonce" style="font-weight : normal; margin-left : 10px;">Notification Announces Staff members</label>
                              </div><div class="param_notification">
                                  <input type="checkbox" id="notification_champ_force" name="notification_champ_force"  />
                                  <label for="notification_champ_force" style="font-weight : normal; margin-left : 10px;">Notification that indicates the deactivation of a force field</label>
                              </div>  <input type="submit" name="valid_notification" value="Save Settings" style="margin-top : 15px;" />  </form>
                      </div>	</div></div></div>       </div>              <!-- Fin du corps -->
            <div class="espace"></div>
{/block}