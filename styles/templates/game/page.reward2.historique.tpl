{block name="title" prepend}Voucher history{/block}
{block name="content"}
<div id="page_contenu"><h1>Voucher log book</h1><div class="onglet">
                  <ul>
                 <li><a href="?page=Reward2" title="{$LNG.lm_redeem_2}">{$LNG.lm_redeem_1}</a></li>
                  <li><a href="?page=Reward2&mode=historique" title="{$LNG.lm_redeem_3}">{$LNG.lm_redeem_4}</a></li>
              </ul>
          </div>
          <div id="div_bunker"><!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.lm_redeem_10}</h2>

<div name="bunker_historique">
    <!-- Image d'illustration du bunker à ressources -->
    <img name="illustration" src="media/image/voucher.jpg" />
    
    <!-- Paragraphe explicatif -->
    <p>
      {$LNG.lm_redeem_11}
    </p>
    
    <!-- S'il y a des enregistrements d'historique -->
	
	{if $messageList == ''}
	 <div style="margin : 20px auto 0px auto;">{$LNG.lm_redeem_12}</div>
	 {/if}
	 
	 
        {if $messageList != ''}
    <table>
        <tr>
            <th class="logo"></th>
            <th class="date_operation">{$LNG.lm_redeem_13}</th>
            <th class="date_operation">{$LNG.lm_redeem_14}</th>
            <th class="description">{$LNG.lm_redeem_15}</th>
        </tr>
        
        <!-- On parcours tous les enregistrements -->
		
		
		{foreach $messageList as $messageID => $messageRow}
                <tr>
            <td class="logo"></td>
            <td class="date_operation">{$messageRow.rewardCode}</td>
            <td class="date_operation">{$messageRow.date}</td>
            <td class="description">{$messageRow.rewardPrice}</td>
        </tr>
		{/foreach}
		
            </table> 
		
		{/if}
    
    <!-- On affiche la pagination de la page -->
    
    </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
