{block name="title" prepend}Support tickets{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_support}</h1><div class="onglet">
              <ul>
                 <li><a href="game.php?page=ticket&amp;mode=create" title="Create a new ticket">{$LNG.sup_new_ticket}</a></li>
                  <li><a href="?page=ticket&cmdd=open" title="see your open tickets">{$LNG.sup_open_ticket}</a></li>
                  <li><a href="?page=ticket&cmdd=close" title="see here all your closed tickets">{$LNG.sup_closed_ticket}</a></li>
              </ul>
          </div>
          <div id="div_bunker"><!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.sup_ticket_list}</h2>

<div name="bunker_transaction">
    
    <!-- Paragraphe explicatif -->
    <p>
	{$LNG.sup_desc}
        
    </p>
    
    <!-- Si le formulaire a été envoyé par le joueur -->
        
    <!-- Formulaire à remplir pour effectuer des actions auprès du bunker -->
   
        <table>
            <tr>
               <th>{$LNG.ti_id}</th>
		<th>{$LNG.ti_subject}</th>
		<th>{$LNG.ti_answers}</th>
		<th>{$LNG.ti_date}</th>
		<th>{$LNG.ti_status}</th>
            </tr>

            <!-- On parcours les quatres ressources du jeu -->
			
			{foreach $ticketList as $TicketID => $TicketInfo}	
	<tr>
		<td><a href="game.php?page=ticket&amp;mode=view&amp;id={$TicketID}">#{$TicketID}</a></td>
		<td><a href="game.php?page=ticket&amp;mode=view&amp;id={$TicketID}">{$TicketInfo.subject}</a></td>
		<td>{$TicketInfo.answer - 1}</td>
		<td>{$TicketInfo.time}</td>
		<td>{if $TicketInfo.status == 0}<span style="color:green">{$LNG.ti_status_open}</span>{elseif $TicketInfo.status == 1}<span style="color:orange">{$LNG.ti_status_answer}</span>{else}<span style="color:red">{$LNG.ti_status_closed}</span>{/if}</td>
	</tr>
	{/foreach}
                    
        </table>
        
        
     
       
                
  
</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
