{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_explora_7}</h1><div class="onglet">
                    <ul>
                  <li><a href="?page=Explorations" title="{$LNG.ls_explora_1}">{$LNG.ls_explora_2}</a></li> 
                  <li><a href="?page=Explorations&mode=expoBusy" title="{$LNG.ls_explora_3}">{$LNG.ls_explora_4}</a></li>
                  <li><a href="?page=Explorations&mode=expoFound" title="{$LNG.ls_explora_5}">{$LNG.ls_explora_6}</a></li>    </ul>
          </div>
          <div id="div_exploration"><div id="exploration_information">
    <h2 class="titre_corps">Informations détaillées sur l'exploration</h2>
    <div class="illustration">
        <img src="/design/image/theme/defaut/exploration/categorie/{$imaget}">
        
               {* <a class="precedente" onclick="javascript:ActionMethode.ouvrirOnglet('div_exploration', 'onglet_page=information&amp;id_exploration=43495', 'page/exploration_information.php');">Précédente &gt;&gt;</a> *}
                    </div>
    
    <!-- On affiche toutes les informations en autre possession sur cette exploration -->
    <table>
        <tbody><tr>
            <td>Identifiant :</td>
            <td>
                Exploration #{$explorationID}
                            </td>
        </tr>

        <tr>
            <td>Statut de la mission :</td>
			{if $state != 1}
			<td class="vert">Terminée</td>
			{else}
            <td class="jaune">En cours d'exploration</td>
			{/if}
        </tr>
{if $state != 1}
          <tr>
            <td>Catégorie / Sous-catégorie :</td>
            <td class="vert">
               {$Cat} / {$SubCat} 
                          </td>
        </tr>
        {/if}
        <tr>
            <td>Type de fouille :</td>
            <td>« {$Speed} »</td>
        </tr>

        <tr>
            <td>Planètes concernées :</td>
            <td>
                {$start_planet_name} [{$start_system}:{$start_planet}] 
                <span class="orange">&gt;&gt;</span> {$end_planet_name}
            </td>
        </tr>

        <tr>
            <td>Heure de départ :</td>
            <td>{$start_time}</td>
        </tr>

        <tr>
            <td>Heure de retour prévue :</td>
            <td>{$emd_time}</td>
        </tr>
{if $state != 1}
         <tr>
            <td>Texte d'exploration :</td>
            <td style="line-height : 18px; text-align : justify; padding-top : 8px; padding-bottom : 8px;">
                Durant l'exploration de la jungle environnante, notre équipe s'est finalement fait traquer par une horde d’insectes volants, des sortes de libellules géantes et apparemment carnivores. Seuls vos scientifiques se sont émerveillés. La claire-voyance de votre commandant militaire à sûrement permit le salut de l’équipe et de ces scientifiques inconscients.
            </td>
        </tr>
		 {/if}
        <tr>
            <td>Equipe envoyée :</td>
            <td style="line-height : 18px; text-align : justify; padding-top : 8px; padding-bottom : 8px;">
                                
                                                                             {foreach $multiData as $messageID => $xb}           — <span class="orange">{$xb.Amount}</span> 
                            <b>x</b> {$xb.Name}<br>{/foreach}
                                                 

												
                                                                                                                    </td>
        </tr>
    </tbody></table>
            
    <a onclick="location.href='game.php?page=Explorations&mode=expoBusy';">Revenir sur la liste des explorations.</a>
</div></div></div>                    

{/block}