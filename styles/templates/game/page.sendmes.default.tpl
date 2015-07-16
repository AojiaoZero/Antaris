{block name="title" prepend}Send newsletter{/block}
{block name="content"}
<div id="page_contenu">      <h1>Message</h1><div class="onglet">	
 </div><div><div class="categorie">	<h2>Global Message</h2>
							
							<form action="game.php?page=SendMessage" method="post">
							<table style="margin : 5px auto 10px auto; width : 80%;">			<tbody>
							
							
							<tr>			

							<td style="text-align : left; width : 28%;"><label for="tag">Option :</label></td>				<td style="text-align : left; width : 62%;"><select name="type">
        <option value="1">Message</option>
        <option value="2">Email</option>
      </select></td>			</tr>	
							<tr>			

							<td style="text-align : left; width : 28%;"><label for="tag">Subject :</label></td>				<td style="text-align : left; width : 62%;"><input style="margin-left : 5px;" name="subject" maxlenght="6" size="8" value="" type="text"></td>			</tr>			<tr>				<td style="text-align : left; padding-top : 35px;"><label for="texte">Message :</label></td>				<td>					<table style="width : 100%; margin : 0px auto 10px auto;">						<tbody><tr>
												<td colspan="2" style="text-align : left;"><textarea id="texte" name="textArea" rows="6" style="width : 100%;"></textarea></td>
											</tr>					</tbody></table>				</td>			</tr>	

<tr>			

							<td style="text-align : left; width : 28%;"><label for="tag">Show as news :</label></td>				<td style="text-align : left; width : 62%;"><INPUT type=checkbox name="news" value="1"></td>			</tr>	

											<tr>				<td colspan="2" style="text-align : center;">
										<input style="margin-top : 10px;"  name="valid_form_recruter" onclick="check();" value="Send the request" type="submit">
									</td>			</tr>		</tbody></table>	</form></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}