{block name="title" prepend}{$LNG.ls_tmanag_1}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_tmanag_1}</h1><div id="page_tour_gestion">	<div class="onglet">
				<ul>
					<li><a href="?page=Tower" title="{$LNG.ls_tmanag_2}">{$LNG.ls_tmanag_2}</a></li>
					{if $headquarters_antaris >= 1}<li><a href="?page=Tower&mode=siege" title="{$LNG.ls_tmanag_3}">{$LNG.ls_tmanag_3}</a></li>{/if}
					{if $antaris_headpost >= 1}<li><a href="?page=Tower&mode=outpost" title="{$LNG.ls_tmanag_4}">{$LNG.ls_tmanag_4}</a></li>{/if}
					<li><a href="?page=Tower&mode=portal" title="{$LNG.ls_tmanag_5}">{$LNG.ls_tmanag_5}</a></li>
					<li><a href="?page=Tower&mode=construct" title="{$LNG.ls_tmanag_6}">{$LNG.ls_tmanag_6}</a></li>
				</ul>
			</div>	<div id="onglet_tour_gestion"><div id="gestion_portail" class="categorie">
			<h2>{$LNG.ls_tmanag_18}</h2>
{if $allowPortal == 0}
			<div id="texte_portail">
					<b>{$LNG.ls_tmanag_19} :</b>
					<div style="padding-left : 20px; margin-bottom : 30px;"><span class="{if $energy_tech < 6}rouge{else}vert{/if}">{$LNG.tech.113}, {$LNG.ls_tporal_10} 6 <i>({$energy_tech})</i></span><br /><span class="{if $control_room_tech < 5}rouge{else}vert{/if}">{$LNG.tech.141}, {$LNG.ls_tporal_10} 5 <i>({$control_room_tech})</i></span><br /><span class="{if $particle_tech < 4}rouge{else}vert{/if}">{$LNG.tech.143}, {$LNG.ls_tporal_10} 4 <i>({$particle_tech})</i></span><br /></div>
					
					{$LNG.ls_tmanag_20}
					<div style="padding-left : 20px;">
						{$LNG.ls_tmanag_21}
					</div>
				</div>
				<div id="image_portail" class="desactiver"></div>
				
				{else}
					<div id="texte_portail">
					<h3>{$LNG.ls_tmanag_22} :</h3>
					{$LNG.ls_tmanag_23}
.<br>

{if $showMessagePortal == 0}
<form action="?page=Tower&mode=portal" method="post">
<input type="hidden" name="cmdd" value="portal">
<input class="neutre" value="{$LNG.ls_tmanag_24}" type="submit">
</form>	
{elseif $showMessagePortal == 1}
<span class="cyan">{$LNG.ls_tmanag_25} {$teleport_portal_timer} {$LNG.ls_tmanag_26}.</span>
{elseif $showMessagePortal == 2}
<form action="?page=Tower&mode=portal" method="post">
<input type="hidden" name="cmdd" value="desportal">
<input class="neutre" value="{$LNG.ls_tmanag_27} the portal" type="submit">
</form>	
{elseif $showMessagePortal == 3}
<span class="cyan">{$LNG.ls_tmanag_25} {$teleport_portal_timer} {$LNG.ls_tmanag_26}.</span>
{/if}

	<br>
					<h3>{$LNG.ls_tmanag_28} :</h3>
					{$LNG.ls_tmanag_29}.<br>


{if $showMessageForce == 0}
<form action="?page=Tower&mode=portal" method="post">
<input type="hidden" name="cmdd" value="force">
<input class="neutre" value="Activate the force field" type="submit">
</form>	
{elseif $showMessageForce == 1}
<span class="cyan">FF Activated : {$LNG.ls_tmanag_25} {$force_field_timer} {$LNG.ls_tmanag_26}.</span>
{elseif $showMessageForce == 2}
<span class="cyan">FF Desactivated : {$LNG.ls_tmanag_25} {$force_field_timer} {$LNG.ls_tmanag_26}.</span>
{/if}



	</div>
                <div id="image_portail" class="{if $force_field_timer_show > $TIMESTAMP}cdf_activer{elseif $teleport_portal == 1}activer{else}desactiver{/if}"></div>
				
				
				<div id="statut_portail">{if $teleport_portal == 0}<span class="rouge">{$LNG.ls_tporal_3}</span>{else}<span class="vert">{$LNG.ls_tporal_4}</span> <b>/</b>{if $force_field_timer_show < $TIMESTAMP} <span class="rouge">{$LNG.ls_tporal_5}</span>{else} <span class="vert">{$LNG.ls_tmanag_30} {$force_field_timer_end}.</span>{/if}
				{/if}
				</div>
				{/if}
				</div></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
cdf_activer
activer