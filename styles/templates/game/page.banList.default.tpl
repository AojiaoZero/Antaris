{block name="title" prepend}{$LNG.lm_banned}{/block}
{block name="content"}
<div id="page_contenu"><h1>Antaris Legacy {$LNG.lm_banned} List</h1><div class="onglet">
              <ul>
                 <li><a href="?page=banList&cmdd=temp" title="{$LNG.temp_banned}">{$LNG.temp_banned}</a></li>
                  <li><a href="?page=banList&cmdd=life" title="{$LNG.perm_banned}">{$LNG.perm_banned}</a></li>
                  <li><a href="?page=banList&cmdd=msg" title="{$LNG.perm_mesage}">{$LNG.perm_mesage}</a></li>
              </ul>
          </div>
          <div id="div_bunker"><!-- Sous titre de l'onglet -->
<h2 class="titre_corps">Detailed ban list</h2>

<div name="bunker_historique">
    <!-- Image d'illustration du bunker à ressources -->
    
    <!-- Paragraphe explicatif -->
    <p>
	   {$LNG.lm_banneddesc}
    </p>
    
    <!-- S'il y a des enregistrements d'historique -->
	
	
	 
        
    <table>
        <tr>
           <th>{$LNG.bn_from}</th>
		<th>{$LNG.bn_until}</th>
		<th>{$LNG.bn_player}</th>
		<th>{$LNG.bn_by}</th>
		<th>{$LNG.bn_reason}</th>
        </tr>
        
        <!-- On parcours tous les enregistrements -->
		
		
		{foreach $banList as $banRow}
                <tr>
            <td>{$banRow.from}</td>
		<td>{$banRow.to}</td>
		<td>{$banRow.player}</td>
		<td><a href="mailto:{$banRow.mail}" title="{$banRow.info}">{$banRow.admin}</a></td>
		<td>{$banRow.theme}</td>
        </tr>
		{/foreach}
		
            </table> 
		
		
    
    <!-- On affiche la pagination de la page -->
    
    </div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}
