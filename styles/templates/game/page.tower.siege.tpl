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
			</div>	<div id="onglet_tour_gestion"><div id="alimentation_siege" class="categorie">
					<h2>Power seat Antaris</h2>
					
					<div id="texte_siege">
						{$LNG.ls_tmanag_58}
                        <br>
						{if $showMessage ==0}
						<span class="rouge">{$LNG.ls_tmanag_59}.</span>
						{else}
						<span class="vert">{$LNG.ls_tmanag_60} {$siege_timer}.</span>
						{/if}
					</div>
					{if $siege_timer_time < $timing}
					<div id="choix_alimentation">
						<form id="form_choix_alimentation" method="post" action="">
							<label for="methode" class="margin_droite">{$LNG.ls_tmanag_61} :</label>
							<select id="methode" name="methode" class="margin_droite">
								<option value="reactor">Elyrium reactor</option>
								<option value="modulator">Energy modulator</option>
							</select>
							<input type="submit" id="valid_form" name="valid_form" value="Enter" />
						</form>
					  </div>
					  {else}
					  <div id="etat_alimentation">
						<h3>{$LNG.ls_tmanag_62} : </h3><div class="etat_unite">
							<div class="nom_appareil">Elyrium reactor(s) n°1 :</div>
							<div class="barre_pourcentage" style="width : 200px; margin-right : 0px;"></div>
							<div class="texte_pourcentage">100%</div>
							<div class="action">
								<span class="vert">{$LNG.ls_tmanag_63}</span>
							</div><div class="espace"></div>
						  </div><br></div>
				{/if}	  </div>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}