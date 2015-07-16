{block name="title" prepend}{$LNG.ls_bank_1}{/block}
{block name="content"}
<div id="page_contenu">      <h1>{$LNG.ls_bank_1}</h1><div class="onglet">
              <ul>
                  <li><a href="game.php?page=bank" title="{$LNG.ls_bank_2}">{$LNG.ls_bank_3}</a></li>
                  <li><a href="game.php?page=bank&mode=evolution" title="{$LNG.ls_bank_4}">{$LNG.ls_bank_5}</a></li>
                  <li><a href="game.php?page=bank&mode=transaction" title="{$LNG.ls_bank_6}">{$LNG.ls_bank_7}</a></li> 
              </ul>
          </div><div id="banque"><!-- Sous titre de l'onglet -->
<h2 class="titre_corps">{$LNG.ls_bank_8}</h2>

<div name="histoire_confederation">
    <!-- Image d'illustration de la banque -->
    <img name="illustration" src="design/image/banque.jpg">
    
    <!-- Paragraphe explicatif de la civilisation -->
    <p>
        {$LNG.ls_bank_9}
    </p>
</div></div></div>        
{/block}
