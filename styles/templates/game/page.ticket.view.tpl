 {block name="title" prepend}Support tickets{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_support}</h1><div class="onglet">
               <ul>
                 <li><a href="game.php?page=ticket&amp;mode=create" title="Create a new ticket">{$LNG.sup_new_ticket}</a></li>
                  <li><a href="?page=ticket&cmdd=open" title="see your open tickets">{$LNG.sup_open_ticket}</a></li>
                  <li><a href="?page=ticket&cmdd=close" title="see here all your closed tickets">{$LNG.sup_closed_ticket}</a></li>
              </ul>
          </div>

          <div id="page_messagerie">
		  <h2 class="titre_corps">Answer on the ticket</h2>
		  {if $status != 2}
		  <form action="game.php?page=ticket&mode=send" method="post" id="form">
<input type="hidden" name="id" value="{$ticketID}">
                  <table style="width : 90%; margin : 0px auto; margin-top : 5px;">
                    <tbody><tr>
                      <td style="width : 80%;">
					  <textarea class="validate[required]" id="message" name="message" style="height : 60px; width : 100%;"></textarea></td>
                      <td style="width : 20%; text-align : right;"><input name="valid_form" value="Send" type="submit"></td>
                    </tr>
                  </tbody></table>
              </form>
			  {else}<span class="rouge">This ticket is closed by the Administrator of the game ! Open a new ticket to request help !</span>{/if}
			  
			  
			  <h2 class="titre_corps"></h2>
              <div id="conversation_mp">
			  
			  
			  {foreach $answerList as $answerID => $answerRow}	
			  <div class="item_message {if $answerRow.ownerName == $trusername}destinataire{else}expediteur{/if} ">
                      <div class="information">
                          <img src="/media/files/{$avatar}" onmouseover="montre('Click here to see the profile of this user.');" onmouseout="cache();" onclick="location.href='game.php?page=PlayerCard&id={$answerRow.ownerID}';">
                          <div class="titre">
                              <span class="sujet">Subject : {$answerRow.subject}</span><br>
                             <span style="sous_titre"><i>From</i> <a onclick="location.href='game.php?page=PlayerCard&id={$answerRow.ownerID}';">{$answerRow.ownerName}</a> .</span>
                          </div>
                          <div class="time_message">
                              Send the {$answerRow.time}
                          </div>
                          
                      </div>
                      <div class="contenu_message bbcode">
                          {$answerRow.message}
                      </div>
                  </div>
				  {/foreach}
				  
				  
				  
				  </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
{block name="script" append}
<script>
$(document).ready(function() {
	$("#form").validationEngine('attach');
});
</script>
{/block}