{block name="title" prepend}{$LNG.ls_faq_13}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_faq_13}</h1>


{*<div class="onglet">	<ul>		<li><a onclick="javascript:ActionMethode.ouvrirOnglet('div_aide', 'onglet_page=recherche', 'page/aide_recherche.php');" title="Aide : Questions/réponses">Recherche : Questions/réponses</a></li> 		<li><a onclick="javascript:ActionMethode.ouvrirOnglet('div_aide', 'onglet_page=ajouter', 'page/aide_ajouter.php');" title="Faire une proposition">Faire une proposition</a></li> 	</ul></div>*}


<div id="div_aide">	
{*
<div id="recherche_aide" class="categorie">	


	<h2>Faire une recherche dans la FAQ</h2>		Ici, vous trouverez les réponses à vos questions les plus fréquentes. Cette page sera mise à jour avec<br /> 
						de nouvelles questions et leurs réponses à mesure que les infos du jeu seront dévoilées.<br />
						De plus, pour vous aider, vous pouvez consulter le guide d'utilisation se trouvant sur la salle de contrôle.<br /><br />		<form id="form_recherche" method="post" action="javascript:ActionMethode.envoyerFormulaire('form_recherche', 'reponse_aide', '/page/aide_recherche.php?action=ajax');">			<label for="recherche" style="margin-right : 20px;">Mots clés : </label>			<input type="text" id="recherche" name="recherche" style="width : 150px; margin-right : 20px;" />			<input type="submit" id="valid_recherche" name="valid_recherche" value="Rechercher" />		</form>	</div>	
						
						*}
						
						<div id="reponse_aide" class="categorie">		<h2>{$LNG.ls_faq_14}</h2>
						
						
						<h4 id="titre_93" onclick="javascript:Faq.afficherCacher(93);">	<span name="titre">■ {$LNG.ls_faq_1} ?</span>	</h4><div id="reponse_93" class="reponse_faq">{$LNG.ls_faq_2}</div><h4 id="titre_100" onclick="javascript:Faq.afficherCacher(100);">	<span name="titre">■ {$LNG.ls_faq_3} ? </span>	</h4><div id="reponse_100" class="reponse_faq">{$LNG.ls_faq_4}</div><h4 id="titre_102" onclick="javascript:Faq.afficherCacher(102);">	<span name="titre">■ {$LNG.ls_faq_5} ?</span>	</h4><div id="reponse_102" class="reponse_faq">{$LNG.ls_faq_6}</div><h4 id="titre_56" onclick="javascript:Faq.afficherCacher(56);">	<span name="titre">■ {$LNG.ls_faq_7} ?</span>	</h4><div id="reponse_56" class="reponse_faq">{$LNG.ls_faq_8}</div><h4 id="titre_68" onclick="javascript:Faq.afficherCacher(68);">	<span name="titre">■ {$LNG.ls_faq_9} ?</span>	</h4><div id="reponse_68" class="reponse_faq">{$LNG.ls_faq_10}</div><h4 id="titre_86" onclick="javascript:Faq.afficherCacher(86);">	<span name="titre">■ {$LNG.ls_faq_11} ?</span>	</h4><div id="reponse_86" class="reponse_faq">{$LNG.ls_faq_12}</div></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}