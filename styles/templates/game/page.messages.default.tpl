{block name="title" prepend}{$LNG.lm_messages}{/block}
{block name="content"}
<div id="page_contenu"><h1>Messaging</h1>
          <div id="page_messagerie"><div id="boite_reception" class="categorie">
                  <h2>Inbox <span id="loading" style="display:none;"> ({$LNG.loading})</span></h2> 
                  <table>
                    <tr>
                        <th class="nom_onglet">Tab name</th>
                        <th class="nouveau"></th>
                        <th class="nb_message">Nb. message</th>
                    </tr>
					
					
					{foreach $CategoryList as $CategoryID => $CategoryRow}
					<tr>
                    <td class="nom_onglet">
                        <img src="media/ingame/icon/{$CategoryID}.png" />
                        <a style="word-wrap: break-word;" class="{$CategoryRow.color}"><a href="game.php?page=messages&mode=view&messcat={$CategoryID}"  class="{$CategoryRow.color}">{$LNG.mg_type.{$CategoryID}}</a>
                    </td>
	
                    <td class="nouveau">{if $CategoryRow.unread > 0}
					
    <img src="media/ingame/icon/nouveau.png"></img>{/if}</td>
                    <td class="nb_message {$CategoryRow.color}" style="word-wrap: break-word;" >
                        <span id="unread_{$CategoryID}">{$CategoryRow.unread}</span>/<span id="total_{$CategoryID}">{$CategoryRow.total}</span></td>
                  </tr>
				  {/foreach}



				  </table>
                  
              </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
{block name="script" append}
{if !empty($category)}
<script>$(function() {
	Message.getMessages({$category}, {$side});
})</script>
{/if}
{/block}