{block name="title" prepend}Immunity{/block}
{block name="content"}
<div id="page_contenu"><h1>Immunity</h1><div id="page_profil">	<div class="onglet" style="margin-bottom : 0px; padding-bottom : 0px;">		
	<div id="div_profil_onglet"><div class="categorie">
                        <h2>{$LNG.ls_immu_1} <span style="float:right;">{$darkmatter} <img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();"></span></h2>
                      {$LNG.ls_immu_2}.<br /><br />
                                                
                        {if $showCountdown == 1}
		<center>{$LNG.ls_pcloak_3}: <span style="color:red;" class="countdown2"  secs="{$immunity_active_cooldown}"></span></center>
		{elseif !empty($immunity_active)}
		
		<center>{$LNG.ls_immu_3}: <span style="color:red;" class="countdown2"  secs="{$immunity_active}"></span></center>
		{else}
						 <form id="form_notification" method="post" action="?page=Immunity">
						<input type="hidden" name="mode" value="buy">						
						<div class="param_notification">
						

                                  <input type="radio" id="notification_messagerie" name="immunity"  value="three"/>
                                  <label for="notification_messagerie" style="font-weight : normal; margin-left : 10px;">{$LNG.ls_immu_4} (1 <img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();">)</label>
                              </div><input type="submit" name="valid_notification" value="{$LNG.ls_pcloak_7}" style="margin-top : 15px;" />  </form>{/if}
                      </div>	</div></div></div>       </div>              <!-- Fin du corps -->
            <div class="espace"></div>
{/block}