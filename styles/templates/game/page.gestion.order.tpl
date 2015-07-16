{block name="title" prepend}{$LNG.page_gestion_1}{/block}
{block name="content"}
<div id="page_contenu">      <h1>{$LNG.page_gestion_1}</h1><div id="page_gestion">	<div class="categorie formulaire_ordre">		<h2>{$LNG.page_gestion_24}</h2>		{$LNG.page_gestion_25}.<br><br>
					
					<form id="form_classement" action="?page=gestion&mode=order" method="post">
					<table>	<tbody>
					{foreach $messageList as $messageID => $messageRow}

					<tr>
							<td style="text-align : left;"><label for="classement_549">{$messageRow.name} [{$messageRow.galaxy}:{$messageRow.system}:{$messageRow.planet}]</label></td>
							<td style="text-align : right;">
								
								<select id="classement_{$messageRow.orderID}" name="classement_{$messageRow.orderID}" onChange="this.form.submit();">	
								{for $x=1 to {$GetAll990}}
								<option value="{$x}" {if $messageRow.ordernumber == $x}selected="selected"{/if}>{$x}</option>		{/for}	</select>
								
							</td>
						</tr>		
						{/foreach}
						<tr>
							<td colspan="2"><input id="valid_classement" name="valid_classement" value="{$LNG.page_gestion_26}" type="submit"></td>
						</tr>	</tbody></table></form>		&gt;&gt; <a onclick="location.href='game.php?page=gestion';" title="{$LNG.page_gestion_27}">{$LNG.page_gestion_27}.</a><br>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}