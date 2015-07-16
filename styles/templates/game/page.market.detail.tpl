{block name="title" prepend}{$LNG.ls_market_1}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_market_1}</h1><div class="onglet">
              <ul>
                  <li><a href="?page=market">{$LNG.ls_market_2}</a></li>
                  <li><a href="?page=market&mode=echange">{$LNG.ls_market_3}</a></li>
                  <li><a href="?page=market&mode=push" title="Push">{$LNG.ls_market_4}</a></li>
                  <li><a href="?page=market&mode=multi" title="Push">{$LNG.ls_market_5}</a></li> 
              </ul>
          </div><div id="div_commerce"><div id="liste_push" class="categorie">
                <h2>{$LNG.ls_market_41}</h2>
                <table class="detail_push">
                    <tbody><tr>
                        <th class="date_transaction">{$LNG.ls_market_42}</th>
                        <th class="information_transaction">{$LNG.ls_market_43}</th>
                        <th class="taux_transaction">{$LNG.ls_market_44}</th>
                    </tr><tr>
                              <td class="date_transaction">
                                  <b>{$LNG.ls_market_45}</b> {$times}<br>
                                  <b>{$LNG.ls_market_46}</b> {$times2} 
			
                                  
                              </td>
                              <td class="information_transaction">
                                  <span class="{$strongest}">{$myUsername}</span> 
                                  {$LNG.ls_market_47} <span class="orange">{$total}</span> {$LNG.lm_achat_units}.<br>
                                  <span class="{$strongestbis} ">{$otherUsername}</span> 
                                  {$LNG.ls_market_47} <span class="orange">{$totalNext}</span> {$LNG.lm_achat_units}.
                              </td>
                              <td class="taux_transaction">
                                  <span class="gris">{$LNG.ls_market_44} : {pretty_number(100-(100/$totals*$totalNexts))} %</span><br>
                                  <span class="{if 100-(100/$totals*$totalNexts) > 25}rouge{elseif 100-(100/$totals*$totalNexts) < -25}rouge{else}vert{/if}">{if 100-(100/$totals*$totalNexts) > 25}{$LNG.ls_market_48}{elseif 100-(100/$totals*$totalNexts) < -25}{$LNG.ls_market_48}{else}{$LNG.ls_market_53}{/if}.</span>
                              </td>
                            </tr></tbody></table>
                <a onclick="location.href='game.php?page=market&mode=push';">&lt;&lt; {$LNG.ls_market_49}</a>
              </div><div class="legende_commerce gris">
              {$LNG.ls_market_39}
          </div></div></div>      
{/block}

