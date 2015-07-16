{block name="title" prepend}Planet Hide{/block}
{block name="content"}
<div id="page_contenu"><h1>Planet Cloak</h1><div id="page_profil">	<div class="onglet" style="margin-bottom : 0px; padding-bottom : 0px;">		
	<div id="div_profil_onglet"><div class="categorie">
                        <h2>{$LNG.ls_pcloak_1} <span style="float:right;">{$darkmatter} <img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();"></span></h2>
                       {$LNG.ls_pcloak_2}<br /><br />
                                                
                     {if $showCountdown == 1}
		<center>{$LNG.ls_pcloak_3}: <span style="color:red;" class="countdown2"  secs="{$cloak_active_countdown}"></span></center>
		{elseif !empty($cloak_active)}
		
		<center>{$LNG.ls_pcloak_4}: <span style="color:red;" class="countdown2"  secs="{$cloak_active}"></span></center>
		{else}
						<form id="form_notification" method="post" action="?page=Planetcloak">
						<input type="hidden" name="mode" value="buy">
						
						<div class="param_notification">
                                  <input type="radio" id="notification_messagerie" name="planetcloak" value="one"  />
                                  <label for="notification_messagerie" style="font-weight : normal; margin-left : 10px;">{$LNG.ls_pcloak_5} (1 <img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();">)</label>
                              </div>
							  
							  <div class="param_notification">
                                  <input type="radio" id="notification_attaque_subie" name="planetcloak" value="seven"  />
                                  <label for="notification_attaque_subie" style="font-weight : normal; margin-left : 10px;">{$LNG.ls_pcloak_6} (3 <img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();">)</label>
                              </div> <input type="submit" name="valid_notification" value="{$LNG.ls_pcloak_7}" style="margin-top : 15px;" />  </form>{/if}



					 
							  
							  
							  
							  
                      </div>	</div></div></div>       </div>              <!-- Fin du corps -->
            <div class="espace"></div>
{/block}