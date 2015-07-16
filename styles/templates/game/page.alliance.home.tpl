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
	
	<div id="div_alliance">
	
	<div class="categorie">	
	
	<h2>{$LNG.ls_alliance_102}</h2>

	<div style="text-align : center; margin : 0px auto 10px auto;">	</div>
	<div style="float : left; width : 47%; margin : 0px 10px 10px 10px;">	

	<h3>{$LNG.lm_title_6}</h3>	
	<table>			
	<tr>			
	<td style="text-align : left; font-weight : bold; width : 150px;">{$LNG.ls_alliance_6} :</td>	
	<td style="text-align : left;">{$ally_name}</td>		
	</tr>		
	<tr>		
	<td style="text-align : left; font-weight : bold;">TAG :</td>	
	<td style="text-align : left;" class="couleur_alliance">[{$ally_tag}]</td>		
	</tr>		
	<tr>			
	<td style="text-align : left; font-weight : bold;">{$LNG.ls_alliance_103} :</td>	
	<td style="text-align : left;">
								<a  onclick="location.href='game.php?page=playerCard&id={$ally_owner2}';">
									{$ally_owner}</a>
							</td>		
							</tr>		
							<tr>		
							<td style="text-align : left; font-weight : bold;">{$LNG.ls_alliance_104} :</td>	
							<td style="text-align : left;">{$ally_register_time}</td>	
							</tr>		
							<tr>			
							<td style="text-align : left; font-weight : bold;">{$LNG.ls_alliance_32} :</td>				<td style="text-align : left;">{$recruit_on}</td>		
							</tr>		</table>	</div>	<div style="float : left; width : 47%; margin : 0px 10px 10px 10px;">		<h3>{$LNG.lm_statistics}</h3>		<table>			<tr>				<td style="text-align : left; font-weight : bold; width : 150px;">{$LNG.ls_alliance_109} :</td>				<td style="text-align : left;"><span class="couleur_theme">{$ally_members}</span> <span style="font-size : 0.8em;">{$LNG.ls_alliance_107}</span></td>			</tr>			<tr>				<td style="text-align : left; font-weight : bold;">{$LNG.ls_overview_33} :</td>				<td style="text-align : left;"><span class="couleur_theme">{$total_rank}</span> / {$allyCount}</td>			</tr>			<tr>				<td style="text-align : left; font-weight : bold;">{$LNG.ls_alliance_90} :</td>				<td style="text-align : left;"><span class="couleur_theme">{$total_points}</span> <span style="font-size : 0.8em;">pts</span></td>			</tr>			<tr>				<td style="text-align : left; font-weight : bold;">{$LNG.ls_alliance_108} :</td>				<td style="text-align : left;"><span class="couleur_theme">{$total_points_average}</span> <span style="font-size : 0.8em;">pts</span></td>			</tr>		</table>	</div>	<div class="espace"></div>	<div style="text-align : left; margin : 0px 10px 10px 10px;">		<h3><span onmouseover="montre('{$LNG.ls_alliance_110}');" onmouseout="cache();">DEFCON <sup>(?)</sup></span></h3>		<div class="centre">			<b>Level {$defcon} : </b> 
							<span class="cyan">{$defcontext}</span>		</div>	</div></div><div class="categorie">	<h2>{$LNG.ls_alliance_106}</h2>	<div class="centre" style="margin-bottom : 10px;">{if $ally_description}{$ally_description}{else}{$LNG.al_description_message}{/if}</div></div><div class="categorie">	<h2>{$LNG.ls_alliance_111}</h2>	<div class="centre" style="margin-bottom : 10px;">{$ally_text}</div></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}