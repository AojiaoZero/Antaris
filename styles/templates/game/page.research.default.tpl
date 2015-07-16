{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
<div id="page_contenu">	<h1>Technologies</h1><div class="onglet">	<ul>	

<li><a onclick="location.href='game.php?page=research&cmdd=physik';" title="Afficher les technologies de l'onglet : Theoretical Physics">Theoretical Physics</a></li> 	
<li><a onclick="location.href='game.php?page=research&cmdd=space';"title="Afficher les technologies de l'onglet : Space research">Space research</a></li>		
<li><a onclick="location.href='game.php?page=research&cmdd=militar';" title="Display Technology tab : Military research">Military research</a></li>	

</ul></div>



  {if !empty($Queue)}
		  <h2 class="titre_corps">List of research under construction</h2>
		  
		  
		  <div id="div_liste_construction">
		  {foreach $Queue as $List}
		{$ID = $List.element}
		  <table style="width : 65%;">
		  
		  <tr>
						<td style="text-align : left;">
						{if isset($ResearchList[$List.element])}
				{$CQueue = $ResearchList[$List.element]}
				{/if}
							<span style="cursor : help;" onmouseover="montre('<div style=\'min-width : 250px;\'>                <b>Construction - {$LNG.tech.{$ID}}</b> (<span class=\'orange\'>{$List.level}</span>) <b>:</b>                    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                                <li>Fer : <span class=\'orange\'>600</span> unités</li>                                            <li>Or : <span class=\'orange\'>450</span> unités</li>                                            <li>Cristal : <span class=\'orange\'>75</span> unités</li>                                            </ul>                <b>Informations temporelles :</b>    <ul style=\'text-align : left; margin : 0px; padding : 5px 5px 5px 20px;\'>                        <li>Début du projet : 11 juin. 2014 à 21h41</li>        <li>Fin du projet : 11 juin. 2014 à 21h56</li>        <li>Temps du projet : <span class=\'orange\'>15m 0s</span></li>        <li>Accomplis : <span class=\'orange\'>75%</span></li>                            </ul></div>');" onmouseout="cache();">{$LNG.tech.{$ID}} (<span class="orange">{$List.level}</span>) :</span> 
						</td>
						<td style="text-align : right;">
							Time remaining: 
							{if $List@first}
							<span id="progressbar" data-time="{$List.resttime}"><span id="time" data-time="{$List.time}"></span> - <a onclick="javascript:ActionMethode.ouvrirPopUp('annuler_construction_bat_{$ID}');" title="Cancel the construction">Cancel</a></span> 

					
							 {else}
							 <span class="timer" data-time="{$List.endtime}">{$List.display}</span>
							 - <a onclick="location.href='game.php?page=research&mode=Remove&listid={$List@iteration}';" title="Cancel the construction">Remove</a> 
							
							 {/if}
						</td>
					</tr></table>
					
					{if $List@first}
					<div id="annuler_construction_bat_{$ID}" class="popup_texte">
							<h1>Cancel construction of a research </h1> <p> you confirm the cancellation of the following research: {$LNG.tech.{$ID}} <br />?
									</p>
								<div class="sous_partie">
									You will receive the following resources by performing this action :
									<div class="sous_partie" style="padding-top : 0px;">- 450 unités de fer<br />- 337 unités d'or<br />- 56 unités de cristal<br />- 11 unités d'énergie / heure<br />
									</div>
									Cancellation time: Instantaneous.
								</div>
								<div class="centre">
						
				<form action="" method="post">
										<input style="margin-right : 8px;" type="button" value="Comfirm" onclick="location.href='game.php?page=research&mode=cancel';" />
										
										
										<input style="margin-left : 8px;" type="button" value="Cancel" onclick="javascript:ActionMethode.fermerPopUp();" />
									</form>
									
								</div></div>{/if}{/foreach}</div>
								
								
								{/if}
								
								
								
<div id="div_liste_batiment"><h2 class="titre_corps">Tab : {$Tab}</h2>
								
								
								
								
								
					{foreach $ResearchList as $ID => $Element}			
								<!-- On débute l'item bâtiment -->
<div class="item">
    <!-- On affiche le nom du bâtiment dans un lien qui redirige vers la description de celui-ci -->
    <div class="titre">
        <a onclick="location.href='game.php?page=information&id={$ID}';"
           class="titre_contour">{$LNG.tech.{$ID}}</a>
    </div>
    
    <!-- Pour afficher l'image avec une information bulle quand on survole qui permet de connaître le prix et la description du bâtiment -->
    <div class="image">
        <img src="/styles/theme/gow/gebaeude/{$ID}.jpg" alt="Image Building : {$LNG.tech.{$ID}}" 
             onmouseover="montre('<!-- Les informations sur le bâtiment : prix et description --><div class=\'description_bulle\'>    <!-- On affiche le nom du bâtiment et le niveau -->    <h2>{$LNG.tech.{$ID}} (<span class=\'blanc\'>{$Element.level}</span>)</h2>    <table>        <tr>            <td colspan=\'2\'><h3>Next level (n°{$Element.level + 1}) :</h3></td>            <td><h3>Description :</h3></td>        </tr>        <tr>            <!-- On affiche le prix en ressource et énergie ainsi que le temps de construction -->            <td>  {foreach $Element.costRessources as $RessID => $RessAmount}              {$LNG.tech.{$RessID}} :<br />      {/foreach}                                                   <br />                {$LNG.fgf_time} :            </td>            <td>                {foreach $Element.costRessources as $RessID => $RessAmount} <span class=\'{if $Element.costOverflow[$RessID] == 0}vert{else}rouge{/if}\'> {$RessAmount|number}</span><br />      {/foreach}                                                         <br />                {$Element.elementTime|time}            </td>                        <!-- On affiche la description du bâtiment -->            <td>{$LNG.shortDescription.{$ID}}</td>        </tr>        <tr>            <td colspan=\'3\' class=\'gris\' style=\'padding-top : 10px; text-align : center;\'>                Construction time expressed varies with the activation of headquarters Antaris.            </td>        </tr>    </table><div>');" onmouseout="cache();" />
    </div>
    
    <!-- Permet de savoir si le bâtiment est constructible -->
    <div class="action">
        {if !$Element.techacc}
	
			   
		
			   <span class="rouge" onmouseover="montre('<b>To unlock this technology :</b><div style=\'padding : 3px 0px 0px 15px;\'>{foreach from=$Element.AllTech item=i key=k}<span class=\'rouge\'>{$LNG.tech.{$i.requireID}} lvl.  {$i.requireLevel} {*<i>(0)</i>*}</span><br /> {/foreach}</div>');" onmouseout="cache();" style="cursor : help;"><b>Blocked</b></span>
		
		 
		
		
		
   {elseif $Element.maxLevel == $Element.levelToBuild}
                    <span class="rouge">{$LNG.bd_maxlevel}</span>
		{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
						<span class="rouge">{$LNG.bd_working}</span>
					{else}
					<form action="game.php?page=research" method="post" class="build_form">
							<input type="hidden" name="cmd" value="insert">
							<input type="hidden" name="tech" value="{$ID}">
							<input type="hidden" name="cmdd" value="{$mode}">
							<button type="submit" class="build_submit">{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}</button>
						</form>
	
							
							
							
					{/if}
        	
    </div>
    
    <!-- On affiche le niveau actuel du bâtiment dans un rond orange -->
    <div class="nombre">{$Element.level}</div>
</div>


{/foreach}







<div class="espace"></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}