{block name="title" prepend}{$LNG.ls_tmanag_1}{/block}
{block name="content"}
 <script type="text/javascript">
var towername1		= "{$LNG.ls_ovbuild_13}"
var towername2		= "{$LNG.ls_ovbuild_14}"
	</script>
<div id="page_contenu"><h1>{$LNG.ls_tmanag_1}</h1><div id="page_tour_gestion">	<div class="onglet">
				<ul>
					<li><a href="?page=Tower" title="{$LNG.ls_tmanag_2}">{$LNG.ls_tmanag_2}</a></li>
					{if $headquarters_antaris >= 1}<li><a href="?page=Tower&mode=siege" title="{$LNG.ls_tmanag_3}">{$LNG.ls_tmanag_3}</a></li>{/if}
					{if $antaris_headpost >= 1}<li><a href="?page=Tower&mode=outpost" title="{$LNG.ls_tmanag_4}">{$LNG.ls_tmanag_4}</a></li>{/if}
					<li><a href="?page=Tower&mode=portal" title="{$LNG.ls_tmanag_5}">{$LNG.ls_tmanag_5}</a></li>
					<li><a href="?page=Tower&mode=construct" title="{$LNG.ls_tmanag_6}">{$LNG.ls_tmanag_6}</a></li>
				</ul>
			</div>	<div id="onglet_tour_gestion"><div id="general_planete" class="categorie">
				<h2>{$LNG.ls_tmanag_7}</h2>
				
				
				<div class="image_planete">
					<img onclick="location.href='game.php?page=Tower&mode=newimage';" src="media/ingame/planet/{$planetimage}.jpg" />
					<div class="nom_planete">{$namer}</div>
				</div>
				
				<div class="explication">
					<h3>{$LNG.ls_tmanag_8} :</h3>
					{$LNG.ls_tmanag_9} :<br />
					<div class="margin_liste">
						{$LNG.ls_tmanag_10}
					</div>
					
					<h3>{$LNG.ls_tmanag_11} :</h3>
					<div class="margin_liste">
						<label>{$LNG.ls_tmanag_12} :</label>
							P2P-383<br />
						<label>{$LNG.ls_tmanag_13} :</label>
							[{$galaxy}:{$system}:{$planet}]<br />
						<label>{$LNG.ls_tmanag_14} :</label>
							[190:383:67]
					</div>
					
					<h3>Action(s) :</h3>
					<div class="margin_liste">
						- <a onclick="javascript:TourGestion.modifierNomPlanete('{$namer}', '{$planetidd}');">{$LNG.ls_tmanag_15}.</a><br />
						{if $allowDelete == 1}- {$LNG.ls_tmanag_16}.
						{else}
						- <a href="?page=Tower&mode=delete&planetid={$planetidd}">{$LNG.ls_tmanag_17}.</a>
					
						{/if}
					</div>
				</div>
			  </div>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}