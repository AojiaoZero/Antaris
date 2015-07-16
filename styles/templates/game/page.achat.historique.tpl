{block name="title" prepend}History{/block}
{block name="content"}
<div id="page_contenu"><h1>Credit Purchase(s)</h1><div class="onglet">
            <ul>
             <li><a href="?page=achat&mode=echange" title="{$LNG.lm_achat_exchange}">{$LNG.lm_achat_exchange}</a></li>
              <li><a href="?page=achat&mode=allopass" title="{$LNG.lm_achat_allo}">{$LNG.lm_achat_allo}</a></li>
              <li><a href="?page=achat&mode=paypal" title="{$LNG.lm_achat_paypal}">{$LNG.lm_achat_paypal}</a></li>
			   <li><a href="?page=achat&mode=paysafe" title="{$LNG.lm_achat_paysafe}">{$LNG.lm_achat_paysafe}</a></li>
              <li><a href="?page=achat&mode=historique" title="{$LNG.lm_achat_history}">{$LNG.lm_achat_history}</a></li> 
            </ul>
          </div><div id="div_achat"><div id="achat_historique" class="categorie">
			<h2>{$LNG.lm_achat_historytit}</h2>
			<div style="text-align : justify; padding : 5px 20px 10px 20px;">
				{$LNG.lm_achat_historytit1}
            </div>  <table>
                <tr>
                    <th class="date">{$LNG.lm_achat_paydate}</th>
                    <th class="id_transaction">{$LNG.lm_achat_paytrans}</th>
                    <th class="mode_paiement">{$LNG.lm_achat_payway}</th>
                    <th class="nb_credit">{$LNG.lm_achat_paycred}</th>
                    <th class="montant">{$LNG.lm_achat_paycost}</th>
                </tr>
				
				
				{if $messageList != ''}
				{foreach $messageList as $payID => $messageRow}
				 <tr>
                    <td class="date">{$messageRow.date}</td>
                    <td class="id_transaction">{$messageRow.pinCode}</td>
                    <td class="mode_paiement cyan">{if $messageRow.pinAprouved == 0}<img src="media/ingame/image/mission/horloge.png" onmouseout="cache();" onmouseover="montre('Waiting on aprouval.');">{/if} {$messageRow.pinType}</td>
                    <td class="nb_credit">{$messageRow.pinCredits} <img src="media/ingame/image/credit.png" onmouseover="montre('Credits logo');" onmouseout="cache();"></td>
                    <td class="montant"><span class="couleur_theme">{$messageRow.pinPrice}</span> €</td>
                </tr>
				{/foreach}
				{else}
				<tr><td colspan="5" style="text-align : center;" class="vert">You have not made any purchases with this account on Antaris Legacy.</td></tr>
				{/if}
				{if $messageList != ''}
				<tr class="total">
                <td colspan="3"></td>
                <td class="nb_credit">=&nbsp;{$messageRow.sum_pinCredits}&nbsp;<img src="media/ingame/image/credit.png" onmouseover="montre('Credits logo');" onmouseout="cache();"></td>
                <td class="montant">=&nbsp;{$messageRow.sum_pinPrice} €</td>
              </tr>{/if}

				</table></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}