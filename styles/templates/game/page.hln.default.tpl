{block name="title" prepend}{$LNG.ls_feed_1}{/block}
{block name="content"}
<script type="text/javascript">
var lgn = '{$LNG.ls_feed_23}';
var lgn1 = '{$LNG.ls_feed_24}';
var lgn2 = '{$LNG.ls_feed_25}';
var lgn3 = '{$LNG.ls_feed_21}';
</script>
<div id="page_contenu"><h1>{$LNG.ls_feed_2}</h1>

<div id="fil_actualite">
    <div id="response_action"></div>
        
    <!-- Paragraphe qui explique le fonctionnement du fil d'actualité et indique les règles -->
    <h2 class="titre_corps">{$LNG.ls_feed_3}</h2>
    <div name="explication">

		
		{$LNG.ls_feed_4}
		 
        <ul>
            <li>{$LNG.ls_feed_5}</li>
            <li>{$LNG.ls_feed_6}</li>
            <li>{$LNG.ls_feed_7}</li>
            <li>{$LNG.ls_feed_8}</li>
            <li>{$LNG.ls_feed_9}</li>
            
        </ul>
        
        {$LNG.ls_feed_10}.
    </div>
    
    
    <!-- Formulaire qui sert à ajouter une annonce ou lien d'annulation pour annuler l'annonce -->
    <h2 class="titre_corps">{$LNG.ls_feed_11}</h2>
    
	<div id="option_show">
	{if $ShowText == 0}
	<form id="form_message" action="javascript:check();" method="post"> 
                    <!-- Formulaire qui permet d'ajoute une annonace -->
            {$LNG.ls_feed_12} - <span name="nb_caractere">0</span> {$LNG.ls_feed_13}.
            <div name="formulaire">
                <textarea name="message" id="message" onchange="javascript:SalleDeControle.nombreCaractereNews();" onkeyup="javascript:SalleDeControle.nombreCaractereNews();"></textarea>
                <input type="submit" name="valid_form" value="{$LNG.ls_feed_14}" />
            </div>
            </form>
			{elseif $ShowText == 1}
			<span class="orange">{$LNG.ls_feed_21}</span> {*- <a onclick="javascript:ActionMethode.ouvrirLien(\'page_contenu\', \'page/fil_actualite.php\', \'action=supprimer&amp;id_joueur=1111\');">Annuler votre demande de diffusion</a>*}
			{elseif $ShowText == 2}
			<span class="orange">{$LNG.ls_feed_22}</span>
			{/if}
</div>
    
    <!-- Liste des annonces qui sont diffusés par les joueurs de l'univers -->
    <h2 class="titre_corps">{$LNG.ls_feed_15}</h2>
    
            <!-- Message à afficher selon le statut du joueur : membre du staff ou non -->
                                              <i>{$LNG.ls_feed_16}.</i>
        <table>
            <tr>
                <th class="pseudo">{$LNG.ls_feed_17}</th>
                <th class="date">{$LNG.ls_feed_18}</th>
                <th class="message">{$LNG.ls_feed_19}</th>

                
                            </tr>

            <!-- On parcours l'ensemble des annonces pour les afficher en sachant que les membres du Staff peut : valider, supprimer et éditer -->
                      
{foreach $messageList as $messageID => $messageRow}
					  <tr name="annonce_6">
                <td class="pseudo">{$messageRow.username}</td>
                <td class="date">{$messageRow.date}</td>
                <td class="message">
                    {$messageRow.message}

                    
                                    </td>

                
                            </tr>
							{foreachelse}
				<tr><td colspan="5" style="text-align : center;" class="vert">{$LNG.ls_feed_20}</td></tr> 
				{/foreach}
                      
                    </table>
    </div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}