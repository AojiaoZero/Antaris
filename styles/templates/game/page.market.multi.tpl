{block name="title" prepend}{$LNG.ls_market_1}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_market_1}</h1><div class="onglet">
              <ul>
                  <li><a href="?page=market">{$LNG.ls_market_2}</a></li>
                  <li><a href="?page=market&mode=echange">{$LNG.ls_market_3}</a></li>
                  <li><a href="?page=market&mode=push" title="Push">{$LNG.ls_market_4}</a></li>
                  <li><a href="?page=market&mode=multi" title="Push">{$LNG.ls_market_5}</a></li> 
              </ul>
          </div><div id="div_commerce"><div id="liste_multi-compte" class="categorie">
            <h2>{$LNG.ls_market_22}</h2>
            <table>
                <tr>
                    <th>N°</th>
                    <th class="pseudo">{$LNG.ls_market_7}</th>
                    <th class="adresse_ip">{$LNG.ls_market_23}</th>
                    <th class="date_suppression">{$LNG.ls_market_24}</th>
                    <th>{$LNG.ls_market_21}</th>
                </tr>
				{foreach $multiData as $messageID => $xb}
				<tr>
                    <td>{$xb.multi_id}</td>
                    <td class="pseudo"><img src="/media/files/{$xb.avatar}" onclick="location.href='game.php?page=playerCard&id={$xb.multi_uid}';" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();">{$xb.multi_nickname} <span class="couleur_alliance"{$xb.multi_nickname_ally}</span></td>
                    <td class="adresse_ip">{$xb.multi_ip}</td>
                    <td class="date_suppression">{$xb.delete_date}</td>
                    <td> <img src="media/ingame/icon/profil.png" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();" onclick="location.href='game.php?page=playerCard&id={$xb.multi_uid}';">
                     <img src="media/ingame/icon/contact.png" onmouseover="montre('{$LNG.ls_click_2}');" onmouseout="cache();" onclick="location.href='game.php?page=messages&mode=write&id={$xb.multi_uid}';">
                </td>
                </tr>
				
				{foreachelse}
				<tr><td colspan="5" style="text-align : center;" class="vert">{$LNG.ls_market_25}.</td></tr> 
{/foreach}
				</table>
          </div>
		  
		  
		  <div class="legende_commerce gris">
            {$LNG.ls_market_26}
          </div><div id="liste_connexion" class="categorie">
            <h2>{$LNG.ls_market_31}</h2>
            <table>
                <tr>
                    <th class="date_connexion">{$LNG.ls_market_27}</th>
                    <th class="adresse_connexion">{$LNG.ls_market_23}</th>
                    <th class="navigateur">{$LNG.ls_market_28}</th>
                    <th class="systeme">{$LNG.ls_market_29}</th>
                </tr>
				{foreach $messageList as $messageID => $messageRow}
				<tr>
                  <td class="date_connexion">{$messageRow.date}</td>
                  <td class="adresse_ip">{$messageRow.ipaddress}</td>
                  <td class="navigateur">
                      <img src="design/image/navigateur/firefox.png" /> 
                      {$messageRow.browser} 
                      {*(<i>29.0</i>)*}
                  </td>
                  <td class="systeme">
                      {$messageRow.os} 
                      
                  </td>
              </tr>
	{/foreach}

			  </table>
          </div><div class="legende_commerce gris">
           {$LNG.ls_market_30}
          </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
