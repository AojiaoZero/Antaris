{block name="title" prepend}{$LNG.lm_technology}{/block}
{block name="content"}
<div id="page_contenu"><h1>Records</h1><div class="onglet" style="margin-bottom : 0px; padding-bottom : 0px;">
			<ul>
				<li><a href="?page=records&mode=rbuild" title="Bâtiments">Buildings</a></li>
				<li><a href="?page=records&mode=rtechs" title="Technologies">Technologies</a></li>
				<li><a href="?page=records&mode=rfleets" title="Appareils spécialisés">Specialized equipment</a></li>
				<li><a href="?page=records&mode=rdefense" title="Défenses">Defenses</a></li>
				<li><a href="?page=records&mode=rpopulation" title="Populations">Populations</a></li>
			</ul>
		  </div>
		<div class="sous_partie">
		 You can view on this part of the game a list of all the ingame records and the players that own those records.
		  </div>
		  
		  <div id="div_liste_requis">
		  
{foreach $researchList as $elementID => $elementRow}

		  
		  
			  <table style="width : 78%;">
			  
			 <tr>
					<td style="width : 47%; padding-left : 25px; padding-bottom : 15px;">{$LNG.tech.{$elementID}} : </td>
					{if !empty($elementRow)}
		
					<td style="width : 53%; padding-right : 25px; padding-bottom : 15px;">
					{foreach $elementRow as $user}
					{$user.username}{if !$user@last}<br>{/if}{/foreach}</td>
					<td>{$elementRow[0].level|number}</td>
					
		
	{/if}
				  </tr>{/foreach}</table></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}