{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu">      <h1>Alliance</h1><div class="onglet">	<ul class="onglet">		
<li class="first"><a href="?page=alliance" title="Create its own alliance">Create its own alliance</a></li>
 <li class="last"><a href="?page=alliance&mode=search" title="Request a recruit">Request a recruit</a></li>	
 </ul>
 </div><div><div class="categorie">	<h2>Request recruitment</h2>	<div class="sous_partie">		Assistance in completing the form below ?<br>
							What to put in the field <b>TAG</b> : 
							<div class="sous_partie" style="margin-right : 10px;">
								Each alliance has a TAG which is somehow a symbol that contains between 2 and 6 characters and can identify an alliance when searching, wars, pacts and in our case, when applying for recruitment.<br><br>
								TAG is easy to identify because it is bracketed with a particular color. example : <span class="couleur_alliance">[Cylon]</span>.<br>
								To fill this form, enter simply "Cylon" If we take the previous example.
							</div>	</div>	
							
							<form action="game.php?page=alliance&amp;mode=apply" method="post">
							<table style="margin : 5px auto 10px auto; width : 80%;">			<tbody><tr>				<td style="text-align : left; width : 28%;"><label for="tag">Alliance Tag :</label></td>				<td style="text-align : left; width : 62%;"><input style="margin-left : 5px;" name="tag" maxlenght="6" size="8" value="" type="text"></td>			</tr>			<tr>				<td style="text-align : left; padding-top : 35px;"><label for="texte">Motivation :</label></td>				<td>					<table style="width : 100%; margin : 0px auto 10px auto;">						<tbody><tr>
												<td colspan="2" style="text-align : left;"><textarea id="texte" name="texte" rows="6" style="width : 100%;"></textarea></td>
											</tr>					</tbody></table>				</td>			</tr>			<tr>				<td colspan="2" style="text-align : center;">
										<input style="margin-top : 10px;"  name="valid_form_recruter" value="Send the request" type="submit">
									</td>			</tr>		</tbody></table>	</form></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}