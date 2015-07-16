{block name="title" prepend}{$LNG.ls_tmanag_1}{/block}
{block name="content"}
<script type="text/javascript">
 $("#nb_technicie").val().replace(/[^[0-9]|\.]/g, '');
 $("#nb_scientifiqu").val().replace(/[^[0-9]|\.]/g, '');
 
 </script>
<div id="page_contenu"><h1>{$LNG.ls_tmanag_1}</h1><div id="page_tour_gestion">	<div class="onglet">
				<ul>
					<li><a href="?page=Tower" title="{$LNG.ls_tmanag_2}">{$LNG.ls_tmanag_2}</a></li>
					{if $headquarters_antaris >= 1}<li><a href="?page=Tower&mode=siege" title="{$LNG.ls_tmanag_3}">{$LNG.ls_tmanag_3}</a></li>{/if}
					{if $antaris_headpost >= 1}<li><a href="?page=Tower&mode=outpost" title="{$LNG.ls_tmanag_4}">{$LNG.ls_tmanag_4}</a></li>{/if}
					<li><a href="?page=Tower&mode=portal" title="{$LNG.ls_tmanag_5}">{$LNG.ls_tmanag_5}</a></li>
					<li><a href="?page=Tower&mode=construct" title="{$LNG.ls_tmanag_6}">{$LNG.ls_tmanag_6}</a></li>
				</ul>
			</div>	<div id="onglet_tour_gestion"><div id="affectation_population" class="categorie">
			<h2>{$LNG.ls_tmanag_31}</h2>
			<div class="explication">
				{$LNG.ls_tmanag_32}
				<div class="margin_liste">
					{$LNG.ls_tmanag_33}
				</div>
				{$LNG.ls_tmanag_34}
			</div>
			
			<div class="conteneur_form">	
			
			<h3>{$LNG.ls_tmanag_35}</h3>
			
			{if $robot_factory < 1}
			<span class="rouge">{$LNG.ls_tmanag_36}</span>
			{else}
				<div class="prelude_form">
					{$LNG.ls_tmanag_37} <span class="couleur_theme">{$robot_factory}</span>.<br>
					- {$LNG.ls_tmanag_38} <span class="orange">{$technicien}</span> {$LNG.tech.302}
						<b> - </b>{$LNG.ls_tmanag_39} : <span class="vert">{$technician_used}</span> / <b>{$MaxUsine}</b><br>
					- {$LNG.ls_tmanag_40} <b>{$reduce_build}</b>%.
				</div>
				<form id="form_technicien" method="post" action="?page=Tower&mode=construct">
				<input type="hidden" name="cmdd" value="technic">
				<input type="hidden" name="former_amount" value="{$technician_used_bis}">
					<label for="nb_technicien">{$LNG.ls_tmanag_41} : </label>
					<input id="nb_technicie" name="nb_technicien" class="entier" maxlength="10" value="{$technician_used}" type="text">
					<input id="valid_form" name="valid_form" value="{$LNG.ls_tmanag_42}" type="submit">
				</form>
{/if}
			<h3>{$LNG.ls_tmanag_43}</h3>
			
			{if $laboratory < 1}
			<span class="rouge">{$LNG.ls_tmanag_44}</span>	
			{else}
			<div class="prelude_form">
					{$LNG.ls_tmanag_45} <span class="couleur_theme">{$laboratory}</span><br>
					- {$LNG.ls_tmanag_38} <span class="orange">{$scientist}</span> {$LNG.tech.303}
						<b> - </b>{$LNG.ls_tmanag_46}: <span class="vert">{$scientis_used}</span> / <b>{$MaxUsine2}</b><br>
					- {$LNG.ls_tmanag_47} <b>{$reduce_tech}</b>%.
				</div>
				<form id="form_scientifique" method="post" action="?page=Tower&mode=construct">
				<input type="hidden" name="former_amount" value="{$scientis_used_bis}">
				<input type="hidden" name="cmdd" value="sience">
					<label for="nb_scientifique">{$LNG.ls_tmanag_48} : </label>
					<input id="nb_scientifiqu" name="nb_scientifique" class="entier" maxlength="10" value="{$scientis_used}" type="text">
					<input id="valid_form" name="valid_form" value="{$LNG.ls_tmanag_42}" type="submit">
				</form>	
			{/if}
			
			</div>
		  </div>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}