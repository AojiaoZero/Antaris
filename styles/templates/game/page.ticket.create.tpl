{block name="title" prepend}Support tickets{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_support}</h1><div class="onglet">
              <ul>
                 <li><a href="game.php?page=ticket&amp;mode=create" title="Create a new ticket">{$LNG.sup_new_ticket}</a></li>
                  <li><a href="?page=ticket&cmdd=open" title="see your open tickets">{$LNG.sup_open_ticket}</a></li>
                  <li><a href="?page=ticket&cmdd=close" title="see here all your closed tickets">{$LNG.sup_closed_ticket}</a></li>
              </ul>
          </div>

<div id="div_achat"><div id="achat_probleme" class="categorie">
            <h2>Help form: Describe the problem here</h2>
            {$LNG.sup_crea_text}


<form action="game.php?page=ticket&mode=send" method="post" id="form">
<input type="hidden" name="id" value="0"> 
                          <table>
                            <tbody><tr>
                              <td><b>{$LNG.ti_userna}</b></td>
                              <td>{$tusername} (<i>#{$ttid}</i>)</td>
                            </tr>
							<tr>
		<td style="width:30%"><label for="category">{$LNG.ti_category}</label></td>
		<td style="width:70%"><select id="category" name="category">{html_options options=$categoryList}</select></td>
	</tr>
                        <tr>
		<td><label for="subject">{$LNG.ti_subject}</label></td>
		<td><input class="validate[required]" type="text" id="subject" name="subject" size="40" maxlength="255"></td>
	</tr>
	<tr>
		<td><label for="message">{$LNG.ti_message}</label></td>
		<td><textarea class="validate[required]" id="message" name="message" row="60" cols="8" style="height:150px; width:600px;"></textarea></td>
	</tr>
                            <tr>
                                <td colspan="2">
                                    <input id="methode" name="methode" value="paypal" type="hidden">
                                    <input id="valid_form" name="valid_form" value="Send the request" type="submit">
                                </td>
                            </tr>
                        </tbody></table>
                  </form>	</div></div></div>                    <!-- Fin du corps -->
             <div class="espace"></div>
{/block}
{block name="script" append}
<script>
$(document).ready(function() {
$("#form").validationEngine('attach');
});
</script>
{/block}