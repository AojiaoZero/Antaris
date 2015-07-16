{block name="title" prepend}Purchase{/block}
{block name="content"}
<script type="text/javascript">
var gain_metal = {$metal};
var gain_oro = {$crystal};
var gain_cristal = {$deuterium};
var gain_elyrium = {$elyrium};
var gain_mode_chaine = 15;
var gain_mode_rapide = 15;
var credits = {$darkmatter};
var lgn = "{$LNG.achat_error_1}";
var lgn2 = "{$LNG.achat_error_2}";
var lgn3 = "{$LNG.achat_error_3}";
</script>
<div id="page_contenu"><h1>Credit Purchase(s)</h1><div class="onglet">
            <ul>
               <li><a href="?page=achat&mode=echange" title="{$LNG.lm_achat_exchange}">{$LNG.lm_achat_exchange}</a></li>
              <li><a href="?page=achat&mode=allopass" title="{$LNG.lm_achat_allo}">{$LNG.lm_achat_allo}</a></li>
              <li><a href="?page=achat&mode=paypal" title="{$LNG.lm_achat_paypal}">{$LNG.lm_achat_paypal}</a></li>
			   <li><a href="?page=achat&mode=paysafe" title="{$LNG.lm_achat_paysafe}">{$LNG.lm_achat_paysafe}</a></li>
              <li><a href="?page=achat&mode=historique" title="{$LNG.lm_achat_history}">{$LNG.lm_achat_history}</a></li> 
            </ul>
          </div><div id="div_achat"><div id="achat_echange" class="categorie">
                  <h2>{$LNG.lm_achat_info}</h2>
                  <div id="nb_credit">
                      {$LNG.lm_achat_current} <b>{$darkmatter}</b>&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" />
                  </div>
                  <div id="information_paiement">
                      {$LNG.lm_achat_descachat}
                      <ul>
                          <li>{$LNG.lm_achat_option1}</li>
                          <li>{$LNG.lm_achat_option2}</li>
                          <li>{$LNG.lm_achat_option3} : "<a href="?page=achat&mode=allopass">{$LNG.lm_achat_option4}</a>".</li>
                      </ul>
                      - <b>Paypal :</b>
                      <ul>
                          <li>{$LNG.lm_achat_option5}.</li>
                          <li>{$LNG.lm_achat_option6}.</li>
                          <li>{$LNG.lm_achat_option7} : "<a href="?page=achat&mode=paypal">{$LNG.lm_achat_option8}</a>".</li>
                      </ul>
					    - <b>Paysafe Cards :</b>
                      <ul>
                          <li>{$LNG.lm_achat_option9}.</li>
                          <li>{$LNG.lm_achat_option10}.</li>
                          <li>{$LNG.lm_achat_option11}: "<a href="?page=achat&mode=paysafe">{$LNG.lm_achat_option12}</a>".</li>
                      </ul>
                  </div>
                  <div id="information_mode">
				  
                      {if $chain_active == 0}<span class="rouge">{$LNG.lm_achat_chain}.</span>
					  {else}<span class="vert">{$LNG.lm_achat_chain1} {$mode_chaine}.</span> {/if}<br />
					  
                      {if $fast_active == 0}<span class="rouge">{$LNG.lm_achat_fast}.</span>
					  {else}<span class="vert">{$LNG.lm_achat_fast1} {$mode_rapide}.</span> {/if}
					  
					  
                  </div>
              </div><div id="form_achat_echange" class="categorie">
                  <h2>{$LNG.lm_achat_form}</h2>
                  <form action="?page=Achat" methode="post">
				  <input type="hidden" name="page" value="Achat">
				  <input type="hidden" name="mode" value="send">
                      <table>
                          <tr>
                              <th class="nom">{$LNG.lm_achat_product}</th>
                              <th class="description">{$LNG.lm_achat_desc_pro}</th>
                              <th class="quantite">{$LNG.lm_achat_am}</th>
                              <th class="nb_credit">{$LNG.lm_achat_amcr}</th>
                              <th class="total">{$LNG.lm_achat_total}</th>
                          </tr>
						  
						  <tr>
                      <td class="nom">
                          <img src="media/ingame/image/metal.jpg" />
                          {$LNG.tech.901}
                      </td>
                      <td class="description">
                          {$LNG.lm_achat_purch} <span class="couleur_theme">{$prmetal}</span> 
                          u. {$LNG.tech.901}.
                      </td>
                      <td class="quantite">
                          <input type="text" class="entier" id="metal" name="metal" value="0" maxlength="3" onchange="calculation(1);" onkeyup="calculation(1);"/>
                      </td>
                      <td class="nb_credit">x&nbsp;1&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                      <td class="total">
                          <span id="total_metal" name="total_metal" class="couleur_theme">0</span>&nbsp;
                          {$LNG.lm_achat_units}
                      </td>
                  </tr>
				  
				  
				  <tr>
                      <td class="nom">
                          <img src="media/ingame/image/oro.jpg" />
                          {$LNG.tech.902}
                      </td>
                      <td class="description">
                          {$LNG.lm_achat_purch} <span class="couleur_theme">{$prcrystal}</span> 
                          u. {$LNG.tech.902}.
                      </td>
                      <td class="quantite">
                          <input type="text" class="entier" id="oro" name="oro" value="0" maxlength="3" onchange="calculation(1);" onkeyup="calculation(1);"/>
                      </td>
                      <td class="nb_credit">x&nbsp;1&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                      <td class="total">
                          <span id="total_oro" name="total_oro" class="couleur_theme">0</span>&nbsp;
                          {$LNG.lm_achat_units}
                      </td>
                  </tr>
				  
				  
				  
				  <tr>
                      <td class="nom">
                          <img src="media/ingame/image/cristal.jpg" />
                          {$LNG.tech.903}
                      </td>
                      <td class="description">
                          {$LNG.lm_achat_purch} <span class="couleur_theme">{$prdeuterium}</span> 
                          u. {$LNG.tech.903}.
                      </td>
                      <td class="quantite">
                          <input type="text" class="entier" id="cristal" name="cristal" value="0" maxlength="3" onchange="calculation(1);" onkeyup="calculation(1);"/>
                      </td>
                      <td class="nb_credit">x&nbsp;1&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                      <td class="total">
                          <span id="total_cristal" name="total_cristal" class="couleur_theme">0</span>&nbsp;
                          {$LNG.lm_achat_units}
                      </td>
                  </tr>
				  
				  <tr>
                      <td class="nom">
                          <img src="media/ingame/image/elyrium.jpg" />
                         {$LNG.tech.904}
                      </td>
                      <td class="description">
                          {$LNG.lm_achat_purch} <span class="couleur_theme">{$prelyrium}</span> 
                          u. {$LNG.tech.904}.
                      </td>
                      <td class="quantite">
                          <input type="text" class="entier" id="elyrium" name="elyrium" value="0" maxlength="3" onchange="calculation(1);" onkeyup="calculation(1);"/>
                      </td>
                      <td class="nb_credit">x&nbsp;1&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                      <td class="total">
                          <span id="total_elyrium" name="total_elyrium" class="couleur_theme">0</span>&nbsp;
                          {$LNG.lm_achat_units}
                      </td>
                  </tr>
				  
				  <tr>
                      <td class="nom">
                          <img src="media/ingame/image/mode_chaine.jpg" />
                          <span onmouseover="montre('{$LNG.lm_achat_option17}');" onmouseout="cache();">{$LNG.lm_achat_option13}<sup>(?)</sup></span>
                      </td>
                      <td class="description">
                          {$LNG.lm_achat_purch} <span class="couleur_theme">15</span> 
                          {$LNG.lm_achat_option15}
                      </td>
                      <td class="quantite">
                          <input type="text" class="entier" id="mode_chaine" name="mode_chaine" value="0" maxlength="3" onchange="calculation(1);" onkeyup="calculation(1);"/>
                      </td>
                      <td class="nb_credit">x&nbsp;1&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                      <td class="total">
                          <span id="total_mode_chaine" name="total_mode_chaine" class="couleur_theme">0</span>&nbsp;
                          {$LNG.lm_achat_days} 
                      </td> 
                  </tr>
				  
				  
				  <tr>
                      <td class="nom">
                          <img src="media/ingame/image/mode_rapide.jpg" />
                          <span onmouseover="montre('{$LNG.lm_achat_option18}');" onmouseout="cache();">{$LNG.lm_achat_option14}<sup>(?)</sup></span>
                      </td>
                      <td class="description">
                          {$LNG.lm_achat_purch} <span class="couleur_theme">15</span> 
                          {$LNG.lm_achat_option16}
                      </td>
                      <td class="quantite">
                          <input type="text" class="entier" id="mode_rapide" name="mode_rapide" value="0" maxlength="3" onchange="calculation(1);" onkeyup="calculation(1);"/>
                      </td>
                      <td class="nb_credit">x&nbsp;1&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                      <td class="total">
                          <span id="total_mode_rapide" name="total_mode_rapide" class="couleur_theme">0</span>&nbsp;
                          {$LNG.lm_achat_days}
                      </td>
                  </tr>           <tr class="total">
                              <td colspan="3"><div id="msg_echange"></div></td>
                              <td class="nb_credit">=&nbsp;<span id="total_quantite" name="total_quantite">0</span>&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('{$LNG.lm_achat_logo}');" onmouseout="cache();" /></td>
                              <td></td>
                          </tr>
                      </table>
                      <input type="submit" value="{$LNG.lm_achat_exchange}" />
                  </form>
              </div>
              
              <div class="legende_achat gris">
                  {$LNG.lm_achat_explanat}
              </div></div></div>                    <!-- Fin du corps -->
            
            <div class="espace"></div>
{/block}