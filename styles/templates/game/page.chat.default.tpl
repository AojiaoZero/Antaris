{block name="title" prepend}{$LNG.lm_chat}{/block}
{block name="content"}
<div id="page_contenu"><!-- Affichage du titre de la page en fonction du type du tchat -->
<h1>{$LNG.page_thcat_1}</h1>

<div id="page_tchat">
    <!-- Sous-titre : formulaire pour saisir un message -->
    <h2 class="titre_corps">{$LNG.page_thcat_2}</h2>
		
    
            <form id="form_tchat" action="javascript:submitChat('{$playerName}', '{$Alliance_tag}', '{$custom_color}');" method="post">
            <table>
                <tbody><tr>
                   <td>
                        <!-- Tous les boutons BBcode pour donner du style aux messages -->
                        <input class="bbcode" name="bbcode_gras" value="B" onclick="insertionBBcode('form_tchat', 'tchat_message', '<b>', '</b>');" type="button">
                        <input class="bbcode" name="bbcode_italique" value="I" onclick="insertionBBcode('form_tchat', 'tchat_message', '<i>', '</i>');" type="button">
                        <input class="bbcode" name="bbcode_souligne" value="U" onclick="insertionBBcode('form_tchat', 'tchat_message', '<u>', '</u>');" type="button">

                        {*<input class="bbcode" name="bbcode_lien" value="Link" onclick="insertionBBcode('form_tchat', 'tchat_message', '[url]', '[/url]');" type="button">
                        <input class="bbcode" name="bbcode_image" value="Image" onclick="insertionBBcode('form_tchat', 'tchat_message', '[img]', '[/img]');" type="button">*}
                    </td>
                    <td>
                        <!-- On affiche l'ensemble des couleurs BBcode pouvant être utilisé -->
                                                    <input class="bbcode_couleur fond_rouge" name="bbcode_rouge" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[rouge]', '[/rouge]');" type="button">
                                                    <input class="bbcode_couleur fond_orange" name="bbcode_orange" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[orange]', '[/orange]');" type="button">
                                                    <input class="bbcode_couleur fond_jaune" name="bbcode_jaune" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[jaune]', '[/jaune]');" type="button">
                                                    <input class="bbcode_couleur fond_chartreuse" name="bbcode_chartreuse" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[chartreuse]', '[/chartreuse]');" type="button">
                                                    <input class="bbcode_couleur fond_vert" name="bbcode_vert" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[vert]', '[/vert]');" type="button">
                                                    <input class="bbcode_couleur fond_cyan" name="bbcode_cyan" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[cyan]', '[/cyan]');" type="button">
                                                    <input class="bbcode_couleur fond_bleu" name="bbcode_bleu" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[bleu]', '[/bleu]');" type="button">
                                                    <input class="bbcode_couleur fond_violet" name="bbcode_violet" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[violet]', '[/violet]');" type="button">
                                                    <input class="bbcode_couleur fond_rose" name="bbcode_rose" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[rose]', '[/rose]');" type="button">
                                                    <input class="bbcode_couleur fond_gris" name="bbcode_gris" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[gris]', '[/gris]');" type="button">
                                                    <input class="bbcode_couleur fond_blanc" name="bbcode_blanc" value="" onclick="insertionBBcode('form_tchat', 'tchat_message', '[blanc]', '[/blanc]');" type="button">
                                            </td>
                    <td>
                        <!-- Le span ci-dessous contiendra la réponse du formulaire -->
                        <span id="reponse_formulaire"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- Le champ du formulaire où on saisit le message que l'on souhaite poster -->
                        <input id="tchat_message" name="tchat_message" placeholder="{$LNG.page_thcat_4}" maxlength="240" style="width : 100%;" value="" type="text">
                        
                        
                                             </td>
                    <td>
                        
                        <input name="submit_tchat" value="{$LNG.page_thcat_5}" type="submit">
                    </td>
                </tr>
            </tbody></table>
        </form>
    		
    <!-- Sous-titre : la liste des messages -->
    <h2 class="titre_corps" data-js="img_chargement">
        {$LNG.page_thcat_3} <img style="display: none;" src="/design/image/chargement_mini.gif">
    </h2>

    <!-- Conteneur qui possèdera la liste des message -->
    <div name="liste_message" id="liste_message" data-type_tchat="general">
	
	</div>




	

	
	</div>
</div>


<script type="text/javascript"> 
	refreshChat();
   setInterval("refreshChat()", 7000);
   $(document).ready(function(){
        Tchat.initialiser('general');
    });

         </script>  
{/block}