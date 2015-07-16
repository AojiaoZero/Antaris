{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.lm_alliance}</h1>
<div class="onglet">
<ul>		

	<li><a href="?page=alliance" title="{$LNG.ls_alliance_26}">{$LNG.ls_alliance_25}</a></li>
	{if $rights.ADMIN}<li><a href="?page=alliance&mode=admin" title="{$LNG.ls_alliance_27}">{$LNG.ls_alliance_27}</a></li>{/if}
	<li><a href="?page=alliance&mode=pactes" title="{$LNG.ls_alliance_29}">{$LNG.ls_alliance_28}</a></li>	
	{*{if $rights.ADMIN}<li><a title="Management wars">War <span class="blanc">(0)</span></a></li>{/if}*}
	{if $rights.RANKS}<li><a href="?page=alliance&mode=ranksissue" title="{$LNG.ls_alliance_30}">{$LNG.ls_alliance_31}</a></li>		{/if}
	{if $rights.MANAGEAPPLY}<li><a href="?page=alliance&mode=recruitAlly" title="{$LNG.ls_alliance_33}t">{$LNG.ls_alliance_32}</a></li>	{/if}	
	{if $rights.MEMBERLIST}<li><a href="?page=alliance&mode=memberList" title="{$LNG.ls_alliance_35}">{$LNG.ls_alliance_34}</a></li>		{/if}
	{if $rights.ROUNDMAIL}<li><a href="?page=alliance&mode=circular" title="{$LNG.ls_alliance_37}">{$LNG.ls_alliance_36}</a></li>	{/if}
	{if $rights.ADMIN}<li><a href="?page=alliance&mode=leaveAlly" title="{$LNG.ls_alliance_38}">{$LNG.ls_alliance_39}</a></li>{else}<li><a href="?page=alliance&mode=close" title="{$LNG.ls_alliance_38}">{$LNG.ls_alliance_40}</a></li>	{/if}
	</ul></div>
	
	<div id="div_alliance"><div class="categorie">	<h2>{$LNG.ls_alliance_48} ?</h2>	<div id="div_msg_action"></div>	<div class="sous_partie" style="margin-right : 15px;">		{$LNG.ls_alliance_49}<br />	</div>	<label style="display : inline-block; margin-right : 20px;">{$LNG.ls_alliance_32} : </label>	

{if ($ally_request_notallow == 1)}<a href="game.php?page=alliance&mode=recruitAlly&amp;action=yes&idd={$ally_idd}" class="recrutement rouge">{$LNG.ls_answer_2}</a>{else}<a href="game.php?page=alliance&mode=recruitAlly&amp;action=no&idd={$ally_idd}" class="recrutement vert">{$LNG.ls_answer_1}</a>{/if}

</div>


<div class="categorie">	<h2>{$LNG.ls_alliance_50}</h2>	{$LNG.ls_alliance_51} <b>{$ApplyCount}</b> {$LNG.ls_alliance_52}.	<br><br>
						
						
						{if $messageList != ''}
						<div class="sous_partie"><u>{$LNG.ls_alliance_53} :</u></div>		<table style="border-bottom : 2px solid black; padding-bottom : 5px;">			<tbody>
						
						{foreach $messageList as $messageID => $messageRow}
						<tr>				<td style="text-align : center; width : 8%; vertical-align : middle;">
											<img class="arrondi" src="/media/files/{$messageRow.avatar}" style="width : 35px; height : 35px; cursor : pointer;" onclick="" onmouseover="montre('{$LNG.ls_click_1} !');" onmouseout="cache();">				</td>				<td style="text-align : left; width : 30%; vertical-align : middle;">
											<b>{$LNG.ti_userna} :</b> {$messageRow.username}<br>
											{if $messageRow.onlinetimet < 4}<span class="vert">{$LNG.al_memberlist_on}</span>{elseif $messageRow.onlinetimet <= 15}<span class="jaune">{$messageRow.onlinetimet} {$LNG.al_memberlist_min}</span>{else}<span class="rouge">{$LNG.al_memberlist_off}</span>{/if} {$messageRow.onlinetime}
										</td>				<td style="text-align : left; width : 24%; vertical-align : middle;">
											<b>Points : </b><span class="couleur_theme">{$messageRow.total_points}</span><br>
											<b>{$LNG.ls_alliance_31} : </b><span class="couleur_theme">{$messageRow.total_rank}</span> / 653
										</td>				<td style="text-align : left; width : 28%; vertical-align : middle;">
											<b>{$LNG.ls_alliance_54} :</b><br>{$messageRow.appy_time}
										</td>				<td style="text-align : left; width : 10%; vertical-align : middle;">
											<a href="game.php?page=alliance&amp;mode=admin&amp;action=sendAnswerToApply&amp;id={$messageID}&answer=yes" class="vert">{$LNG.ls_alliance_55}</a> <br>
											<a href="game.php?page=alliance&amp;mode=admin&amp;action=sendAnswerToApply&amp;id={$messageID}&answer=no"class="rouge">{$LNG.ls_alliance_56}</a>
										</td>			</tr>			<tr>				<td colspan="5" style="text-align : center;">					<div id="moins_affichage_{$messageID}" style="display: block;">
												<a onclick="ActionMethode.echangeAffichage('moins_affichage_{$messageID}'); 
												ActionMethode.echangeAffichage('plus_affichage_{$messageID}');">{$LNG.ls_alliance_59}.</a>
											</div>					<div id="plus_affichage_{$messageID}" style="border-top: 1px solid black; padding-top: 5px; margin: 0px 10px 5px; text-align: justify; display: none;">
												<b>{$LNG.ls_alliance_57} </b>
												(<a onclick="ActionMethode.echangeAffichage('moins_affichage_{$messageID}'); 
												ActionMethode.echangeAffichage('plus_affichage_{$messageID}');">{$LNG.ls_alliance_58}.</a>) <b>:</b><br>
												{$messageRow.text}
											</div>				</td>			</tr>	
{/foreach}{/if}
											</tbody></table></div>

</div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
