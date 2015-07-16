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
			</div>	<div id="onglet_tour_gestion">  <div id="avant_poste_ancien" class="categorie">
				<h2>{$LNG.ls_tmanag_55}</h2>
				<div class="explication">
					{$LNG.ls_tmanag_56}.
					<div class="margin_liste">
						{$LNG.ls_tmanag_57}
					</div>
					Le niveau <span class="couleur_theme">6</span> de votre avant-poste Antaris, 
					vous permet d'activer <span class="vert">380</span> drone(s).
				</div>
			
				<div class="conteneur_form">		<h3>Affectation des drones de défense</h3>
					<div class="prelude_form">
						- Vous avez <span class="orange">0</span> drone(s) désactivé(s).
							<b> - </b>Nombre de drones activés : <span class="vert">0</span> / <b>380</b><br>
					</div>
					<form id="form_drone" method="post" action="javascript:ActionMethode.envoyerFormulaire('form_drone', 'onglet_tour_gestion', 'page/tour_gestion_avant_poste.php');">
						<label for="nb_drone">Nombre de drone activé : </label>
						<input onchange="javascript:InputMethode.gererChamp('nb_drone', 'onchange');" onkeyup="javascript:InputMethode.gererChamp('nb_drone', 'onkeyup');" id="nb_drone" name="nb_drone" class="entier" maxlength="10" value="0" type="text">
						<input name="securite_cle" value="BCu2OC7ZD0prkb_0OsPSqfErB8Y2Ir6aCt5L0D2HXFgddVgzFmF__hfT2G0Q18AOQ2vs2TL25fk4SGXgM9QJxQ" type="hidden">
						<input id="valid_form" name="valid_form" value="Modifier" type="submit">
					</form>	</div>
			  </div></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}