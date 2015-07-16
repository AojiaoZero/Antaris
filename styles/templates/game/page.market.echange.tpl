{block name="title" prepend}{$LNG.ls_market_1}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_market_1}</h1><div class="onglet">
              <ul>
                  <li><a href="?page=market">{$LNG.ls_market_2}</a></li>
                  <li><a href="?page=market&mode=echange">{$LNG.ls_market_3}</a></li>
                  <li><a href="?page=market&mode=push" title="Push">{$LNG.ls_market_4}</a></li>
                  <li><a href="?page=market&mode=multi" title="Push">{$LNG.ls_market_5}</a></li> 
              </ul>
          </div><div id="div_commerce"><div id="liste_echange" class="categorie">
            <h2>{$LNG.ls_market_32} ({$GeTransportCount})</h2>
            <table>
                <tr class="normal">
                    <th>{$LNG.ls_achivement_7}</th>
                    <th class="pseudo">{$LNG.ls_market_7}</th>
                    <th class="date_echange">{$LNG.lm_redeem_14}</th>
                    <th class="valeur_echange">{$LNG.ls_market_33}</th>
                    <th></th>
                </tr>
				
				<tr class="normal">
				{foreach $multiData as $messageID => $xb}
				<tr class="normal">
                      <td class="statut">
                          <span class="badge_commerce {$xb.status}">{$xb.statusbis}</span>
                      </td>
                      <td class="pseudo">
                          <img src="/media/files/{$xb.avatar}" onmouseover="montre('{$LNG.ls_click_1}');" onmouseout="cache();" onclick="location.href='game.php?page=playerCard&id={$xb.infouser}';">
                            <span class="joueur {$xb.strongest}">{$xb.change_nick}</span>
                            <a onclick="" title="{$LNG.ls_click_3}" class="couleur_alliance">{$xb.nickname_ally}</a>
                      </td>
                      <td class="date_echange">
                          {$xb.timeoftransport}
                      </td>
                      <td class="valeur_echange">
                          <span class="couleur_theme">{$xb.push}</span> 
                          <span style="font-size : 0.9em;">{$LNG.lm_achat_units}</span>
                      </td>
                      <td class="actions">
                          <img src="design/image/jeu/icone/couleur/aide.png" onmouseover="montre('Cliquez ici, pour afficher le détail de cet échange.');" onmouseout="cache();" onclick="javascript:Commerce.afficherDetailEchange('{$messageID}');">
                      </td>
                    </tr>
                    <tr id="detail_echange_{$messageID}" class="detail_echange no_display">
                      <td colspan="5"> <div class="item_echange">
                          <h3>{$LNG.lm_resources} :</h3>{if $xb.metal != 0}- {$LNG.tech.901} : <span class="couleur_theme">{$xb.metal}</span><br>{/if}{if $xb.crystal != 0}- {$LNG.tech.902} : <span class="couleur_theme">{$xb.crystal}</span><br>{/if}{if $xb.deuterium != 0}- {$LNG.tech.903} : <span class="couleur_theme">{$xb.deuterium}</span><br>{/if}{if $xb.elyrium != 0}- {$LNG.tech.904} : <span class="couleur_theme">{$xb.elyrium}</span><br>{/if}
						  
						  {if $xb.metal == 0 && $xb.crystal == 0 && $xb.deuterium == 0 && $xb.elyrium == 0}
						  <i>Aucune resources</i>{/if}
						  </div> 
                       
                        <div class="item_echange">
                          <h3>{$LNG.lm_population} :</h3>
						  {if $xb.population301 != 0}- {$LNG.tech.301} : <span class="couleur_theme">{$xb.population301}</span><br>{/if}{if $xb.population302 != 0}- {$LNG.tech.302} : <span class="couleur_theme">{$xb.population302}</span><br>{/if}{if $xb.population303 != 0}- {$LNG.tech.303} : <span class="couleur_theme">{$xb.population303}</span><br>{/if}{if $xb.population304 != 0}- {$LNG.tech.304} : <span class="couleur_theme">{$xb.population304}</span><br>{/if}{if $xb.population305 != 0}- {$LNG.tech.305} : <span class="couleur_theme">{$xb.population305}</span><br>{/if}{if $xb.population306 != 0}- {$LNG.tech.306} : <span class="couleur_theme">{$xb.population306}</span><br>{/if}{if $xb.population307 != 0}- {$LNG.tech.307} : <span class="couleur_theme">{$xb.population307}</span><br>{/if}
						  {if $xb.population301 == 0 && $xb.population302 == 0 && $xb.population303 == 0 && $xb.population304 == 0 && $xb.population305 == 0 && $xb.population306 == 0 && $xb.population307 == 0}
						  <i>Aucune population</i>{/if}</div></td>
                    </tr>
				{foreachelse}
				<td colspan="5" style="text-align : center;" class="vert">{$LNG.ls_market_34}</td>
				{/foreach}
				
				</tr>  </table></div>
          <div class="legende_commerce gris">
              <b>{$LNG.lm_title_6} :</b><br />
              - {$LNG.ls_market_35}<br /> 
              - {$LNG.ls_market_36}
          </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
