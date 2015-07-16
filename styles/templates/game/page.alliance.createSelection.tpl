{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page_contenu">
<h1>Ally</h1>

<div class="onglet">	
<ul class="onglet">		
<li class="first"><a href="?page=alliance" title="{$LNG.ls_alliance_1}">{$LNG.ls_alliance_1}</a></li>
 <li class="last"><a href="?page=alliance&mode=search" title="{$LNG.ls_alliance_2}">{$LNG.ls_alliance_2}</a></li>	
 </ul>
 
 </div>
 
 <div id="div_alliance">
 
 <div id="div_form_creer" class="categorie">

 <h2>{$LNG.ls_alliance_3}</h2>	
 
 <form id="form_creer" method="post" action="game.php?page=alliance&amp;mode=create&amp;action=send">		
 
{$LNG.ls_alliance_4}

 <table style="margin : 15px auto 10px auto; width : 60%;">		
 <tr>				
 <td style="text-align : left; width : 50%;">
 
 <label onmouseover="montre('{$LNG.ls_alliance_5}.');" onmouseout="cache();" for="nom">{$LNG.ls_alliance_6} <sup>(?)</sup> :</label>
 
 </td>				<td style="text-align : left; width : 50%;">
 
 
 <input type="text" id="nom" name="aname" maxlenght="25" size="25" value="" /></td>			</tr>		

 <tr>				<td style="text-align : left;"><label onmouseover="montre('{$LNG.ls_alliance_7}');" onmouseout="cache();" for="tag">TAG <sup>(?)</sup> :</label></td>				<td style="text-align : left;">
 
 <input type="text" id="tag" name="atag" maxlenght="6" size="8" value="" /></td>			</tr>			<tr>				<td colspan="2" style="text-align : center;">
<input style="margin-top : 10px;" type="submit" id="valid_form_creer" name="valid_form_creer" value="{$LNG.ls_alliance_8}" />
								</td>			</tr>		</table>	</form></div></div></div>                    <!-- Fin du corps -->
            
{/block}