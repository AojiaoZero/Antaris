{block name="title" prepend}Explorations{/block}
{block name="content"}
<script type="text/javascript">
var lgn = "{$LNG.ls_explora_23}";
var lgn2 = "{$LNG.ls_explora_24}";
var lgn3 = "{$LNG.ls_explora_25}";
var lgn4 = "{$LNG.ls_explora_30}";
var lgn5 = "{$LNG.ls_explora_31}";
var expeditons = "{$max_explore}";
</script>
<div id="page_contenu">      <h1>{$LNG.ls_explora_7}</h1><div class="onglet">
              <ul>
                  <li><a href="?page=Explorations" title="{$LNG.ls_explora_1}">{$LNG.ls_explora_2}</a></li> 
                  <li><a href="?page=Explorations&mode=expoBusy" title="{$LNG.ls_explora_3}">{$LNG.ls_explora_4}</a></li>
                  <li><a href="?page=Explorations&mode=expoFound" title="{$LNG.ls_explora_5}">{$LNG.ls_explora_6}</a></li>    </ul>
          </div>
          <div id="div_exploration">
        
<!-- Sous-titre de l'onglet : envoyer une nouvelle exploration -->
<h2 class="titre_corps">{$LNG.ls_explora_8}</h2>

<!-- Pour gérer le formulaire d'exploration -->
<div style="display: block;" id="exploration_formulaire">
          
    <!-- On affiche d'abord la première partie : PCP -->
    <div name="premiere_partie">
        <!-- Description de cette mission et du fonctionnement général -->
        <div name="description_exploration">
          {$LNG.ls_explora_9}
        </div>
		
		{if $teleport_portal == 0}
		<div style="margin-top : 20px;" class="rouge">{$LNG.ls_explora_17}</div>
		{else}

                      <!-- Affiche le panneau de contrôle du portail -->
            <div class="map">
                <img class="background" src="design/image/transparent.png" usemap="#map_PCP">
                <!-- Conteneur qui contient les coordonnées saisies -->
                <div style="top: 56px; left: 27px; background-position: 0px 0px;" onclick="javascript:PCPMethode.activerGlyphe(1);" onmouseout="javascript:PCPMethode.eteindreGlyphe(1);" onmouseover="javascript:PCPMethode.allumerGlyphe(1);" data-activer="0" data-num="1" class="glyphe"></div><div style="top: 56px; left: 87px; background-position: 49px 0px;" onclick="javascript:PCPMethode.activerGlyphe(2);" onmouseout="javascript:PCPMethode.eteindreGlyphe(2);" onmouseover="javascript:PCPMethode.allumerGlyphe(2);" data-activer="0" data-num="2" class="glyphe"></div><div style="top: 56px; left: 147px; background-position: 98px 0px;" onclick="javascript:PCPMethode.activerGlyphe(3);" onmouseout="javascript:PCPMethode.eteindreGlyphe(3);" onmouseover="javascript:PCPMethode.allumerGlyphe(3);" data-activer="0" data-num="3" class="glyphe"></div><div style="top: 56px; left: 207px; background-position: 147px 0px;" onclick="javascript:PCPMethode.activerGlyphe(4);" onmouseout="javascript:PCPMethode.eteindreGlyphe(4);" onmouseover="javascript:PCPMethode.allumerGlyphe(4);" data-activer="0" data-num="4" class="glyphe"></div><div style="top: 56px; left: 267px; background-position: 196px 0px;" onclick="javascript:PCPMethode.activerGlyphe(5);" onmouseout="javascript:PCPMethode.eteindreGlyphe(5);" onmouseover="javascript:PCPMethode.allumerGlyphe(5);" data-activer="0" data-num="5" class="glyphe"></div><div style="top: 56px; left: 327px; background-position: 245px 0px;" onclick="javascript:PCPMethode.activerGlyphe(6);" onmouseout="javascript:PCPMethode.eteindreGlyphe(6);" onmouseover="javascript:PCPMethode.allumerGlyphe(6);" data-activer="0" data-num="6" class="glyphe"></div><div style="top: 115px; left: 27px; background-position: 294px 0px;" onclick="javascript:PCPMethode.activerGlyphe(7);" onmouseout="javascript:PCPMethode.eteindreGlyphe(7);" onmouseover="javascript:PCPMethode.allumerGlyphe(7);" data-activer="0" data-num="7" class="glyphe"></div><div style="top: 115px; left: 87px; background-position: 343px 0px;" onclick="javascript:PCPMethode.activerGlyphe(8);" onmouseout="javascript:PCPMethode.eteindreGlyphe(8);" onmouseover="javascript:PCPMethode.allumerGlyphe(8);" data-activer="0" data-num="8" class="glyphe"></div><div style="top: 115px; left: 147px; background-position: 392px 0px;" onclick="javascript:PCPMethode.activerGlyphe(9);" onmouseout="javascript:PCPMethode.eteindreGlyphe(9);" onmouseover="javascript:PCPMethode.allumerGlyphe(9);" data-activer="0" data-num="9" class="glyphe"></div><div style="top: 115px; left: 207px; background-position: 441px 0px;" onclick="javascript:PCPMethode.activerGlyphe(10);" onmouseout="javascript:PCPMethode.eteindreGlyphe(10);" onmouseover="javascript:PCPMethode.allumerGlyphe(10);" data-activer="0" data-num="10" class="glyphe"></div><div style="top: 115px; left: 267px; background-position: 490px 0px;" onclick="javascript:PCPMethode.activerGlyphe(11);" onmouseout="javascript:PCPMethode.eteindreGlyphe(11);" onmouseover="javascript:PCPMethode.allumerGlyphe(11);" data-activer="0" data-num="11" class="glyphe"></div><div style="top: 115px; left: 327px; background-position: 539px 0px;" onclick="javascript:PCPMethode.activerGlyphe(12);" onmouseout="javascript:PCPMethode.eteindreGlyphe(12);" onmouseover="javascript:PCPMethode.allumerGlyphe(12);" data-activer="0" data-num="12" class="glyphe"></div><div style="top: 174px; left: 27px; background-position: 588px 0px;" onclick="javascript:PCPMethode.activerGlyphe(13);" onmouseout="javascript:PCPMethode.eteindreGlyphe(13);" onmouseover="javascript:PCPMethode.allumerGlyphe(13);" data-activer="0" data-num="13" class="glyphe"></div><div style="top: 174px; left: 87px; background-position: 637px 0px;" onclick="javascript:PCPMethode.activerGlyphe(14);" onmouseout="javascript:PCPMethode.eteindreGlyphe(14);" onmouseover="javascript:PCPMethode.allumerGlyphe(14);" data-activer="0" data-num="14" class="glyphe"></div><div style="top: 174px; left: 147px; background-position: 686px 0px;" onclick="javascript:PCPMethode.activerGlyphe(15);" onmouseout="javascript:PCPMethode.eteindreGlyphe(15);" onmouseover="javascript:PCPMethode.allumerGlyphe(15);" data-activer="0" data-num="15" class="glyphe"></div><div style="top: 174px; left: 207px; background-position: 735px 0px;" onclick="javascript:PCPMethode.activerGlyphe(16);" onmouseout="javascript:PCPMethode.eteindreGlyphe(16);" onmouseover="javascript:PCPMethode.allumerGlyphe(16);" data-activer="0" data-num="16" class="glyphe"></div><div style="top: 174px; left: 267px; background-position: 784px 0px;" onclick="javascript:PCPMethode.activerGlyphe(17);" onmouseout="javascript:PCPMethode.eteindreGlyphe(17);" onmouseover="javascript:PCPMethode.allumerGlyphe(17);" data-activer="0" data-num="17" class="glyphe"></div><div style="top: 174px; left: 327px; background-position: 833px 0px;" onclick="javascript:PCPMethode.activerGlyphe(18);" onmouseout="javascript:PCPMethode.eteindreGlyphe(18);" onmouseover="javascript:PCPMethode.allumerGlyphe(18);" data-activer="0" data-num="18" class="glyphe"></div><div style="top: 233px; left: 27px; background-position: 882px 0px;" onclick="javascript:PCPMethode.activerGlyphe(19);" onmouseout="javascript:PCPMethode.eteindreGlyphe(19);" onmouseover="javascript:PCPMethode.allumerGlyphe(19);" data-activer="0" data-num="19" class="glyphe"></div><div style="top: 233px; left: 87px; background-position: 931px 0px;" onclick="javascript:PCPMethode.activerGlyphe(20);" onmouseout="javascript:PCPMethode.eteindreGlyphe(20);" onmouseover="javascript:PCPMethode.allumerGlyphe(20);" data-activer="0" data-num="20" class="glyphe"></div><div style="top: 233px; left: 147px; background-position: 980px 0px;" onclick="javascript:PCPMethode.activerGlyphe(21);" onmouseout="javascript:PCPMethode.eteindreGlyphe(21);" onmouseover="javascript:PCPMethode.allumerGlyphe(21);" data-activer="0" data-num="21" class="glyphe"></div><div style="top: 233px; left: 207px; background-position: 1029px 0px;" onclick="javascript:PCPMethode.activerGlyphe(22);" onmouseout="javascript:PCPMethode.eteindreGlyphe(22);" onmouseover="javascript:PCPMethode.allumerGlyphe(22);" data-activer="0" data-num="22" class="glyphe"></div><div style="top: 233px; left: 267px; background-position: 1078px 0px;" onclick="javascript:PCPMethode.activerGlyphe(23);" onmouseout="javascript:PCPMethode.eteindreGlyphe(23);" onmouseover="javascript:PCPMethode.allumerGlyphe(23);" data-activer="0" data-num="23" class="glyphe"></div><div style="top: 233px; left: 327px; background-position: 1127px 0px;" onclick="javascript:PCPMethode.activerGlyphe(24);" onmouseout="javascript:PCPMethode.eteindreGlyphe(24);" onmouseover="javascript:PCPMethode.allumerGlyphe(24);" data-activer="0" data-num="24" class="glyphe"></div><div style="top: 292px; left: 27px; background-position: 1176px 0px;" onclick="javascript:PCPMethode.activerGlyphe(25);" onmouseout="javascript:PCPMethode.eteindreGlyphe(25);" onmouseover="javascript:PCPMethode.allumerGlyphe(25);" data-activer="0" data-num="25" class="glyphe"></div><div style="top: 292px; left: 87px; background-position: 1225px 0px;" onclick="javascript:PCPMethode.activerGlyphe(26);" onmouseout="javascript:PCPMethode.eteindreGlyphe(26);" onmouseover="javascript:PCPMethode.allumerGlyphe(26);" data-activer="0" data-num="26" class="glyphe"></div><div style="top: 292px; left: 147px; background-position: 1274px 0px;" onclick="javascript:PCPMethode.activerGlyphe(27);" onmouseout="javascript:PCPMethode.eteindreGlyphe(27);" onmouseover="javascript:PCPMethode.allumerGlyphe(27);" data-activer="0" data-num="27" class="glyphe"></div><div style="top: 292px; left: 207px; background-position: 1323px 0px;" onclick="javascript:PCPMethode.activerGlyphe(28);" onmouseout="javascript:PCPMethode.eteindreGlyphe(28);" onmouseover="javascript:PCPMethode.allumerGlyphe(28);" data-activer="0" data-num="28" class="glyphe"></div><div style="top: 292px; left: 267px; background-position: 1372px 0px;" onclick="javascript:PCPMethode.activerGlyphe(29);" onmouseout="javascript:PCPMethode.eteindreGlyphe(29);" onmouseover="javascript:PCPMethode.allumerGlyphe(29);" data-activer="0" data-num="29" class="glyphe"></div><div style="top: 292px; left: 327px; background-position: 1421px 0px;" onclick="javascript:PCPMethode.activerGlyphe(30);" onmouseout="javascript:PCPMethode.eteindreGlyphe(30);" onmouseover="javascript:PCPMethode.allumerGlyphe(30);" data-activer="0" data-num="30" class="glyphe"></div><div style="top: 351px; left: 27px; background-position: 1470px 0px;" onclick="javascript:PCPMethode.activerGlyphe(31);" onmouseout="javascript:PCPMethode.eteindreGlyphe(31);" onmouseover="javascript:PCPMethode.allumerGlyphe(31);" data-activer="0" data-num="31" class="glyphe"></div><div style="top: 351px; left: 87px; background-position: 1519px 0px;" onclick="javascript:PCPMethode.activerGlyphe(32);" onmouseout="javascript:PCPMethode.eteindreGlyphe(32);" onmouseover="javascript:PCPMethode.allumerGlyphe(32);" data-activer="0" data-num="32" class="glyphe"></div><div style="top: 351px; left: 147px; background-position: 1568px 0px;" onclick="javascript:PCPMethode.activerGlyphe(33);" onmouseout="javascript:PCPMethode.eteindreGlyphe(33);" onmouseover="javascript:PCPMethode.allumerGlyphe(33);" data-activer="0" data-num="33" class="glyphe"></div><div style="top: 351px; left: 207px; background-position: 1617px 0px;" onclick="javascript:PCPMethode.activerGlyphe(34);" onmouseout="javascript:PCPMethode.eteindreGlyphe(34);" onmouseover="javascript:PCPMethode.allumerGlyphe(34);" data-activer="0" data-num="34" class="glyphe"></div><div style="top: 351px; left: 267px; background-position: 1666px 0px;" onclick="javascript:PCPMethode.activerGlyphe(35);" onmouseout="javascript:PCPMethode.eteindreGlyphe(35);" onmouseover="javascript:PCPMethode.allumerGlyphe(35);" data-activer="0" data-num="35" class="glyphe"></div><div style="top: 351px; left: 327px; background-position: 1715px 0px;" onclick="javascript:PCPMethode.activerGlyphe(36);" onmouseout="javascript:PCPMethode.eteindreGlyphe(36);" onmouseover="javascript:PCPMethode.allumerGlyphe(36);" data-activer="0" data-num="36" class="glyphe"></div><div class="container_coordonnees"><div class="coordonnees no_glyphe"></div><div class="coordonnees no_glyphe"></div><div class="coordonnees no_glyphe"></div><div class="coordonnees no_glyphe"></div><div class="coordonnees no_glyphe"></div><div class="coordonnees no_glyphe"></div></div>

                <!-- Pour gérer le bouton d'activation du PCP (ce bouton n'est pas rectangle puisqu'il a une forme particulière, on doit le gérer via map) -->
                <map name="map_PCP">
                    <!-- Le bouton centrale du PCP -->
                    <area onclick="javascript:PCPMethode.lancerMission();" onmouseout="javascript:PCPMethode.eteindreBouton();" onmouseover="javascript:PCPMethode.allumerBouton();" shape="poly" alt="Bouton d'activation" href="#" coords="125,570, 140,552, 268,552, 282,570, 268,586, 140,586">
                </map>
            </div>

            <!-- Pour annuler la saisie des coordonnées -->
             <div name="action_PCP" style="text-align : center;">
                {$LNG.ls_explora_16}
            </div>
			{/if}
             </div>
  
    
    <!-- On affiche la deuxième partie : composer son équipe -->
    <div name="deuxieme_partie">
        <!-- Description rapide pour l'utilisateur -->
        <div name="description_exploration">
           {$LNG.ls_explora_10}
             {$LNG.ls_explora_11}
        </div>
      
        <!-- Pour gérer la page : on reprend le code pour les missions via le portail -->
        <div id="explorer_portail" class="formulaire_mission categorie">
            <!-- Formulaire pour composer l'équipe d'exploration -->
            <form id="form_explorer" method="post" action="game.php?page=Explorations&mode=sendExpo">
                <h2>{$LNG.ls_explora_12}</h2>
                <div name="description_mission">
                   {$LNG.ls_explora_13}
                </div>
                    
                <div name="conteneur_coordonnees">
                    <b>{$LNG.ls_explora_15} :</b>
                    <div class="container_coordonnees"></div>
                    <div id="reponse_ajax">
                        <span class="rouge">{$LNG.ls_explora_14}.</span>
                    </div>
                </div>
                <div class="espace"></div>
                 
                <div name="conteneur_champ">
                    <!-- Partie « population » du formulaire -->
                    <h3>Populations<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:PortailTeleportation.switchPartie(&quot;form_population&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                    <div id="form_population">
                        <!-- On affiche tous les champs pour les populations -->
                                     

                               {foreach $PopulationOnPlanet as $PopRow}
											<div class="population">
                            <img name="entite" src="styles/theme/gow/gebaeude/{$PopRow.id}.jpg">
                            <div class="conteneur_label">
                                <label for="population_{$PopRow.id}">{$LNG.tech.{$PopRow.id}} :</label>
                            </div>
							<div id="population{$PopRow.id}_value" style="display:none;">{$PopRow.count|number}</div>
                            <input onchange="checkExplorer();" onkeyup="checkExplorer();" class="entier" data-appelation="{$LNG.tech.{$PopRow.id}}" id="population{$PopRow.id}" name="population{$PopRow.id}" maxlength="14" value="0" type="text">
							

                            <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxPop('population{$PopRow.id}');checkExplorer();">
                        </div>
                             {/foreach}
                               
                                                <div class="espace"></div>
                    </div>
                        
                    <!-- Partie « appareil » du formulaire -->
                    <h3>Appareils spécialisés<img onmouseout="cache();" onmouseover="montre('Afficher/cacher cette partie du formulaire.');" onclick="javascript:PortailTeleportation.switchPartie(&quot;form_appareil&quot;);" src="media/ingame/image/mission/joystick.png" class="switch"></h3>
                    <div id="form_appareil">
                        <!-- On affiche tous les champs pour les appareils -->
                                   
                                                
                                              {foreach $FleetsOnPlanet as $FleetRow}

											  <div class="appareil">
                            <img name="entite" src="styles/theme/gow/gebaeude/{$FleetRow.id}.gif">
                            <div class="conteneur_label">
                                <label for="appareil_{$FleetRow.id}">{$LNG.tech.{$FleetRow.id}} :</label>
                            </div>
							<div id="ship{$FleetRow.id}_value" style="display:none;">{$FleetRow.count|number}</div>
                             <input class="entier" data-appelation="{$LNG.tech.{$FleetRow.id}}" id="ship{$FleetRow.id}" name="ship{$FleetRow.id}" maxlength="14" value="0" type="text">
                            <img name="maximum" src="media/ingame/image/mission/drapeau_bleu.png" onclick="javascript:maxShip('ship{$FleetRow.id}');checkExplorer();">
                        </div>
                             {/foreach}
                                                <div class="espace"></div>
                    </div>
                       
                    <!-- Partie « option » du formulaire -->
                    <h3 data-gerer_partie="false">Option sur l'exploration</h3>
                    <div id="form_type_fouille">
                        <div style="margin : 5px 20px 15px 20px; text-align : justify;">
                            {$LNG.ls_explora_18}
                        </div>
                      
                        <div class="type_fouille">
                            <label for="type_fouille">{$LNG.ls_explora_19} :</label>
                            <select id="type_fouille" name="type_fouille">
                                                                    <option value="1">{$LNG.ls_explora_20}</option>
                                                                    <option value="2">{$LNG.ls_explora_21}</option>
                                                                    <option value="3">{$LNG.ls_explora_22}</option>
                                                            </select>
                        </div>
                    </div>
                </div>
                        
                <!-- Pour gérer l'envoi du formulaire -->
                <div name="submit_formulaire">
                    <!-- Les coordonnées saisies par le joueur -->
                    <input id="coord_exploration" name="coord_exploration" value="" type="hidden">
                    
                    <!-- La clé d'encryptage et le bouton « submit » du formulaire -->
                   
                    <input id="valid_form" name="valid_form" value="Send the mission" type="submit" disabled="disabled">
                </div>
            </form>
        </div>
    </div>
</div></div></div>             
{/block}