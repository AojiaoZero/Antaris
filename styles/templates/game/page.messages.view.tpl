{block name="title" prepend}Messages{/block}
{block name="content"}
<form action="game.php?page=messages" method="post">
<input type="hidden" name="mode" value="action">
<input type="hidden" name="ajax" value="1">
<input type="hidden" name="messcat" value="{$MessID}">
<input type="hidden" name="side" value="{$page}">
<div id="page_contenu"><h1>Messagerie</h1>
          <div id="page_messagerie"><div id="affichage_onglet" class="categorie">
                 
                  <div class="etiquette"><span name="nb_message_nonlu" class="orange">{$MessageCountBis}</span> message(s) unread.</div>

                  <div class="retour_page">
                      << <a href="?page=messages">Back to Inbox</a>
                  </div>
                  <div class="action_onglet">
                      
                  </div>
                  <table class="liste_message">
                      <tr class="normal">
                          <th></th>
                          <th></th>
                          <th class="sujet_message">Subject of the message</th>
                          <th></th>
                          <th class="date_message">Date of receipt</th>
                          <th class="actions">Actions</th>
                      </tr>
					  
					  {foreach $MessageList as $Message}
					  <tr id="titre_message_{$Message.id}" class="normal">
                      <td class="avatar">
                          {if $MessID == 1} <img src="/media/files/{$Message.avatar}" onmouseover="montre('Click here to see the profile of this user.');" onmouseout="cache();" 
                               onclick="location.href='game.php?page=playerCard&id={$Message.from}';"  />{/if}
                      </td>
					  
                      <td class="conversation">
					  {if $MessID == 1}
                                   <img src="media/ingame/icon/conversation.png" onmouseover="montre('Show your conversation with that player.');" onmouseout="cache();"
                                         />
                             {/if}   </td>
                      <td class="sujet_message">
                          <span class="titre">
                              
                              Subject : <a onclick="javascript:Messagerie.afficherMessage('{$Message.id}', '1', '1');">{$Message.subject}</a>
                          </span><br />
                          {if $MessID == 2}<i>From</i> <a onclick="location.href='game.php?page=playerCard&id={$Message.from}';">{$Message.from}</a>{elseif $MessID == 1}<i>From</i> <a onclick="location.href='game.php?page=playerCard&id={$Message.from}';">{$Message.from}</a>{else}{$Message.from}{/if}
						  
                      </td>
                      <td class="checkbox">
					  {if $MessID != 999}<input name="messageID[{$Message.id}]" value="1" type="checkbox">{/if}
				</td>
                      <td class="date_message">{$Message.time}</td>    <td class="actions">
                          <img src="media/ingame/icon/sauvegarder.png" onmouseover="montre('Save this message.');" onmouseout="cache();"
                                        onclick="javascript:Messagerie.sauvegarderMessage('{$Message.id}', '1', '1');" />
                          <img src="media/ingame/icon/corbeille.png" onmouseover="montre('Delete this message.');" onmouseout="cache();"
                               onclick="msgDel({$Message.id}, {$Message.type}); Message.getMessages({$Message.type}); return false;" />
                      </td></tr>
                  <tr id="contenu_message_{$Message.id}" class="contenu_message no_display">
                      <td colspan="1"></td>
                      <td colspan="6">
                          <div {if $MessID == 0}name="espionnage"{/if}  {if $MessID == 1}class="bbcode"{/if} {if $MessID ==2}class="bbcode"{/if} class="conteneur_message">{$Message.text}</div>
                          <div class="barre_action">
						  {if $Message.type == 1 && $MessID != 999}
                             <a href="game.php?page=messages&mode=write&id={$Message.sender}" title="{$LNG.mg_answer_to} {strip_tags($Message.from)}">Answer</a>
                              {/if}
                          </div>
						  

		
                      </td>
                  </tr>   
{/foreach}



				  </table>    
				  {if $MessID != 999}
				  <div class="gestion_formulaire">    
                          <label for="action">Actions : </label>
                         <select name="actionBottom">
				
				<option value="deletemarked">{$LNG.mg_delete_marked}</option>
				<option value="deleteunmarked">{$LNG.mg_delete_unmarked}</option>
				<option value="deletetypeall">{$LNG.mg_delete_type_all}</option>
				<option value="deleteall">{$LNG.mg_delete_all}</option>
			</select>
                          <input type="submit" id="valid_form" name="submitBottom" value="Ok" />
                    </div>{/if}   </form>    
					  
					  
                  <div class="gestion_pagination">    </div>
              </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}