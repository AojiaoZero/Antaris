{block name="title" prepend}{$LNG.write_message}{/block}
{block name="content"}
<div id="page_contenu">      <h1>Messagerie</h1>
          <div id="page_messagerie"><div class="retour_page">
                  &lt;&lt; <a href="?page=messages">Back to Inbox</a>
              </div>
              <div class="action_onglet">
                  
              </div><h2 class="titre_corps">Answer to <span class="orange">{$OwnerRecord.username}</span> via private message</h2>
			  <div id="ecrire_message" class="categorie">
              <h2>Formulaire pour écrire un message privé</h2>
			  <form id="form_ecrire_message" action="game.php?page=messages&mode=send" method="post">
			  <input type="hidden" name="id" value="{$id}">
                  <table>
                      <tbody><tr class="message_prive">
                                  <td colspan="2">
                                      <label for="pseudo">Name :</label>
                                      <input id="pseudo" name="pseudo" value="{$OwnerRecord.username}" type="text" disabled>
                                     
                                  </td>
                              </tr>
                      <tr class="sujet">
                          <td colspan="2">
                              <label for="sujet">Subject : </label>
                              <input id="subject" name="subject" value="{if !empty($subject)}{$subject}{else}{$LNG.mg_no_subject}{/if}" type="text">
                          </td>
                      </tr>

                      <tr class="message">
                          <td colspan="2"><textarea placeholder="Enter message here" id="texte" name="texte" rows="6"></textarea></td>
                      </tr>
                      <tr class="validation">
                          <td colspan="2">
                             <input name="valid_form" value="Send" type="submit">
                          </td>
                      </tr>
                  </tbody></table>
              </form>
			  
			  
             </div></div>     </div>               <!-- Fin du corps -->

{/block}
