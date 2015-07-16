{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu">      <h1>Alliance</h1><div class="onglet">	<ul class="onglet">		
<li class="first"><a href="?page=alliance" title="{$LNG.ls_alliance_1}">{$LNG.ls_alliance_1}</a></li>
 <li class="last"><a href="?page=alliance&mode=search" title="{$LNG.ls_alliance_2}">{$LNG.ls_alliance_2}</a></li>	
 </ul>
 </div><div><div class="categorie">	<h2>{$LNG.ls_alliance_9}</h2>	<div class="sous_partie">		{$LNG.ls_alliance_10}<br>
							{$LNG.ls_alliance_11} : 
							<div class="sous_partie" style="margin-right : 10px;">
								{$LNG.ls_alliance_12}<br><br>
								{$LNG.ls_alliance_13} : <span class="couleur_alliance">[Cylon]</span>.<br>
								{$LNG.ls_alliance_14}
							</div>	</div>	
							
							<form action="game.php?page=alliance&amp;mode=apply" method="post">
							<table style="margin : 5px auto 10px auto; width : 80%;">			<tbody><tr>				<td style="text-align : left; width : 28%;"><label for="tag">{$LNG.ls_alliance_15} :</label></td>				<td style="text-align : left; width : 62%;"><input style="margin-left : 5px;" name="tag" maxlenght="6" size="8" value="" type="text"></td>			</tr>			<tr>				<td style="text-align : left; padding-top : 35px;"><label for="texte">{$LNG.ls_alliance_16} :</label></td>				<td>					<table style="width : 100%; margin : 0px auto 10px auto;">						<tbody><tr>
												<td colspan="2" style="text-align : left;"><textarea id="texte" name="texte" rows="6" style="width : 100%;"></textarea></td>
											</tr>					</tbody></table>				</td>			</tr>			<tr>				<td colspan="2" style="text-align : center;">
										<input style="margin-top : 10px;"  name="valid_form_recruter" value="{$LNG.ls_alliance_17}" type="submit">
									</td>			</tr>		</tbody></table>	</form></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}