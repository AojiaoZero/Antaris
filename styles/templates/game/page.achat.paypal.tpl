{block name="title" prepend}Paypal{/block}
{block name="content"}
<div id="page_contenu"><h1>Credit Purchase(s)</h1><div class="onglet">
            <ul>
               <li><a href="?page=achat&mode=echange" title="{$LNG.lm_achat_exchange}">{$LNG.lm_achat_exchange}</a></li>
              <li><a href="?page=achat&mode=allopass" title="{$LNG.lm_achat_allo}">{$LNG.lm_achat_allo}</a></li>
              <li><a href="?page=achat&mode=paypal" title="{$LNG.lm_achat_paypal}">{$LNG.lm_achat_paypal}</a></li>
			   <li><a href="?page=achat&mode=paysafe" title="{$LNG.lm_achat_paysafe}">{$LNG.lm_achat_paysafe}</a></li>
              <li><a href="?page=achat&mode=historique" title="{$LNG.lm_achat_history}">{$LNG.lm_achat_history}</a></li> 
            </ul>
          </div><div id="div_achat"><div class="avertissement_achat categorie">
              <h2>{$LNG.lm_achat_vii}</h2>
           {$LNG.lm_achat_vii1} :<br />
              <ul>
                  <li>{$LNG.lm_achat_vii2}.</li>
                  <li>{$LNG.lm_achat_vii3}.</li>
				  
                  
              </ul>
            {$LNG.lm_achat_moreinfo}.
          </div>
		  {if $commandctr == 0}
		  <div id="achat_paypal" class="categorie">
              <h2>{$LNG.lm_achat_purpaypal}</h2><div style="text-align : justify; padding : 5px 20px 25px 20px;">
                  {$LNG.lm_achat_payprob}
                  <a href="?page=achat&amp;mode=probleme" style="text-decoration : underline;">{$LNG.lm_achat_compform}</a> {$LNG.lm_achat_compform1}.</span>
              </div>
              <form name="one" action="?page=paypal" method="post">
                  <label style="display : inline-block; font-weight : bold; margin-right : 20px;" for="montant">{$LNG.lm_achat_payamount} :</label>
                 

				<select id="montant" name="amount"><option value="1">1 credit(s) = 1,60€ (1,60/unit)</option><option value="5">5 credit(s) = 7,75€ (1,55/unit)</option><option value="10">10 credit(s) = 15,00€ (1,50/unit)</option><option value="20">20 credit(s) = 29,00€ (1,45/unit)</option><option value="40">40 credit(s) = 56,00€ (1,40/unit)</option><option value="80">80 credit(s) = 108,00€ (1,35/unit)</option>    </select>
                  <br /><br />
                  <input type="submit" value="{$LNG.lm_achat_paypbutton}" />
              </form></div>
			  {else}
			  
			  <div id="achat_paypal" class="categorie">
              <h2>{$LNG.lm_achat_purpaypal}</h2><div class="centre">
                          <span class="vert"><b>{$LNG.achat_succes_1}.</b><br><i>{$LNG.achat_succes_2}.</i></span><br><br>
                          <span style="display : inline-block; width : 200px; margin-right : 50px; font-weight : bold; text-align : left;">{$LNG.achat_succes_3} :</span>
                          <span style="display : inline-block; width : 250px; text-align : left;">{$pinCode}</span><br>
                          <span style="display : inline-block; width : 200px; margin-right : 50px; font-weight : bold; text-align : left;">{$LNG.achat_succes_4} :</span>
                          <span style="display : inline-block; width : 250px; text-align : left;">
                              <span class="cyan">{$pinCredits}</span> {$LNG.achat_succes_6} <b>{$pinPrice}</b>€
                          </span><br><br>
                          {$LNG.achat_succes_7}
                      </div></div>
			  
			  {/if}
			  </div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}