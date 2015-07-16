{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_explora_7}</h1><div class="onglet">
                    <ul>
                  <li><a href="?page=Explorations" title="{$LNG.ls_explora_1}">{$LNG.ls_explora_2}</a></li> 
                  <li><a href="?page=Explorations&mode=expoBusy" title="{$LNG.ls_explora_3}">{$LNG.ls_explora_4}</a></li>
                  <li><a href="?page=Explorations&mode=expoFound" title="{$LNG.ls_explora_5}">{$LNG.ls_explora_6}</a></li>    </ul>
          </div>
          <div id="div_exploration"><!-- Script JavaScript qui initialise le tableau -->


<!-- On affiche une message de chargement pour attendre que le tableau soit chargé -->


<div style="display: block;" id="exploration_liste">
    <h2 class="titre_corps">Rechercher dans les 15 derniers jours d'explorations</h2>
    
    <!-- Un formulaire qui permet de rechercher une exploration par le biais de 3 critères -->
    <form id="form_recherche_exploration" method="post" action="javascript:Exploration.afficherListe();">
        <div class="champ">
            <label for="categorie">Catégorie de la mission :</label>
            <select id="categorie" name="categorie">
                <option value="0">Toutes</option>
                                    <option value="reussite">Réussite</option>
                                    <option value="neutre">Neutre</option>
                                    <option value="echec_PCP">Échec : PCP</option>
                                    <option value="echec">Échec</option>
                            </select>
        </div>
            
        <div class="champ">
            <label for="sous_categorie">Sous-catégorie :</label>
            <select id="sous_categorie" name="sous_categorie">
                <option value="0">Toutes</option>
                                    <option value="objet_rare">Objets rares</option>
                                    <option value="technologie">Découverte d'une technologie</option>
                                    <option value="offre_commerciale">Offre commerciale</option>
                                    <option value="ressource">Ressource</option>
                                    <option value="population">Population</option>
                                    <option value="appareil">Découverte d'appareil</option>
                                    <option value="antaris">Antaris</option>
                                    <option value="modulateur">Modulateur énergétique</option>
                                    <option value="special_noel">Joyeux noël</option>
                                    <option value="echec_total">Perte totale de l'équipe</option>
                                    <option value="echec_partiel">Perte partielle de l'équipe</option>
                            </select>
        </div>
            
        <!-- Pour valider le formulaire et afficher la liste -->
        <input value="Rechercher" type="submit">
    </form>

            
    <!-- La partie de la page qui contient la liste des explorations -->
    <h2 class="titre_corps">Liste des explorations correspondant à la recherche</h2>
    <div class="categorie">
        <h2>Résultat de la recherche</h2>
        
        <!-- Si le formulaire a été envoyé et qu'il retourne une réponse -->
                
        <div style="float : left; text-align : left; margin-left : 20px; width : 500px; height : 31px; line-height : 31px;">
            Votre recherche retourne exactement <span name="nombre_resultat" class="orange">{$GeExplorationsCount}</span> explorations pour votre compte.
        </div>
        <div style="float : right; text-align : right; margin-right : 20px;">
            <input class="neutre" onclick="location.href='game.php?page=Explorations';" value="Lancer une exploration" type="button">
        </div>
        <div class="espace"></div>
        
        <!-- On affiche les en-tête du tableau, le javascript se chargera du reste -->
        <table style="display: block;" name="liste_exploration">
            <tbody><tr>
                <th class="actions"></th>
                <th class="categorie">Catégorie</th>
                <th class="sous_categorie">Sous-catégorie</th>
                <th class="planetes">Planète départ &gt;&gt; Explorée</th>
                <th class="statut">Statut</th>
            </tr>
		{foreach $multiData as $messageID => $xb}
        <tr name="ajax">
		<td class="actions">
		<div><a onmouseout="cache();" onmouseover="montre('Afficher la description pour l\'exploration n°<b>{$messageID}</b>.');" onclick="location.href='game.php?page=Explorations&mode=details&explorationID={$messageID}';">
		<img src="design/image/jeu/icone/couleur/loupe.png"></a>
		</div>
		</td>
		{if $xb.state == 1}
		<td colspan="2">Votre équipe effectue l'exploration de la planète...</td>
		{else}
		<td class="categorie">{$xb.Cat}</td><td class="sous_categorie">{$xb.SubCat}</span></td>
		{/if}
		<td class="planetes">{$xb.start_planet_name} [{$xb.start_system}:{$xb.start_planet}] <span class="orange">&gt;&gt;</span> {$xb.end_planet_name}</td>
		
		<td class="statut">
		{if $xb.state == 1}
		<span data-temps="6914" data-id_decompte="exploration_{$messageID}" class="countdown2" secs="{$xb.emd_time}">{$xb.emd_time}</span><a onmouseout="cache();" onmouseover="montre('Pour annuler la mission d\'exploration n°<b>{$messageID}</b>.');" onclick="javascript: Exploration.annulerExploration('{$messageID}')"><img src="design/image/jeu/icone/couleur/rompre.png"></a>
		{else}
		<span class="vert">Terminée</span>
		{/if}
		</td>
		
		</tr>
		{/foreach}
		
		
		</tbody></table>
    </div>
</div></div></div>
{/block}