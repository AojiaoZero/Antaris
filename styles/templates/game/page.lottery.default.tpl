{block name="title" prepend}Credit Lottery{/block}
{block name="content"}
<div id="page_contenu"><h1>Lottery</h1>
          <div id="div_bunker"><!-- Sous titre de l'onglet -->

<div name="bunker_historique">
    <!-- Image d'illustration du bunker à ressources -->
    <img name="illustration" src="media/image/lotto.jpg" />
    
    <!-- Paragraphe explicatif -->
    <p>
      {$LNG.lm_lotto_1}
    </p>
      <form method="POST">
   <select size="1" name="tickets">
   <option value="1">1 Ticket</option>
   </select>
   <input class="buttonbau greenbau" type="submit" value="{$LNG.lm_lotto_8}" name="Buy">
</form>
    <!-- S'il y a des enregistrements d'historique -->
	
	 
   {$user_lists}
			

			{$winners}
		
    
    <!-- On affiche la pagination de la page -->
    
    </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
