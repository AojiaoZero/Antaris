{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_explora_7}</h1><div class="onglet">
                <ul>
                  <li><a href="?page=Explorations" title="{$LNG.ls_explora_1}">{$LNG.ls_explora_2}</a></li> 
                  <li><a href="?page=Explorations&mode=expoBusy" title="{$LNG.ls_explora_3}">{$LNG.ls_explora_4}</a></li>
                  <li><a href="?page=Explorations&mode=expoFound" title="{$LNG.ls_explora_5}">{$LNG.ls_explora_6}</a></li>    </ul>
          </div>
          <div id="div_exploration"><h2 class="titre_corps">{$LNG.ls_explora_28}</h2><div style="text-align : justify; width : 100%;">
              {$LNG.ls_explora_29}
          </div> 
		  
		  {foreach $itemsList as $ID => $Element}		
		  <!-- On débute l'item objet -->
<div class="item grand">
    <!-- On affiche le nom de l'objet rare dans un lien qui redirige vers la description de celui-ci -->
    <div class="titre">
        <a onclick="location.href='game.php?page=information&id={$ID}';" 
           class="titre_contour">{$LNG.tech.{$ID}}</a>
    </div>
    
    <!-- Pour afficher l'image avec une information bulle quand on survole qui permet de connaître la description de l'objet -->
    <div class="image">
        <img src="/styles/theme/gow/gebaeude/{$ID}.jpg" alt="{$LNG.tech.{$ID}}" 
             onmouseover="montre('<!-- Les informations sur l\'objet : description et effet --><div class=\'description_bulle\'>    <!-- On affiche le nom de l\'objet rare -->    <h2>{$LNG.tech.{$ID}} (<span class=\'blanc\'>{$Element.level}   </span>)</h2>        <!-- La description de l\'objet -->    <h3>Description :</h3>    <div style=\'text-align : justify; padding-left : 15px; margin-bottom : 15px;\'>    {$LNG.shortDescription.{$ID}}    <br /><span class=\'orange\'>[Show the description to read all]</span>    </div>        <!-- L\'effet de cet objet rare -->    <h3>Effet :</h3>    <div style=\'text-align : justify; padding-left : 15px;\'>        {$LNG.gameeffect.{$ID}}   </div><div>');" onmouseout="cache();" />
    </div>
    
    <!-- Permet de savoir si l'objet est constructible -->
    <div class="action">
                    <span class="rouge">Indisponible</span>
            </div>
    
    <!-- On affiche le nomdre d'unité pour cet objet dans un degradé noir -->
    <div class="nombre">{$Element.level}</div>
</div>
{/foreach}


<div class="espace"></div>

</div>

</div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}