{block name="title" prepend}{$LNG.lm_chat}{/block}
{block name="content"}
<div id="page_contenu">      <h1>Base spatiale</h1><div class="onglet">
              <ul>
                  <li><a onclick="javascript:ActionMethode.ouvrirOnglet('div_vaisseau', 'onglet_page=normal', 'page/vaisseau_normal.php');" title="Afficher la liste de vos vaisseaux personnels">Liste de vos vaisseaux</a></li> 
                  <li><a onclick="javascript:ActionMethode.ouvrirOnglet('div_vaisseau', 'onglet_page=creer', 'page/vaisseau_creer.php');" title="Créer un nouveau modèle de vaisseau">Créer un nouveau modèle</a></li> 
                  <li><a onclick="javascript:ActionMethode.ouvrirOnglet('div_vaisseau', 'onglet_page=composant', 'page/vaisseau_composant.php');" title="Afficher le détail de chaque infrastructure/composant disponible">Liste des pièces</a></li> 
                  <li><a onclick="javascript:ActionMethode.ouvrirOnglet('div_vaisseau', 'onglet_page=equipe', 'page/vaisseau_equipe.php');" title="Gérer vos flottes pré-définies">Gestion des flottes</a></li> 
              </ul>
          </div>
          <div id="div_vaisseau">

		  <script type="text/javascript">
    $(document).ready(function(){ 
        VaisseauCreation.initialiser(); 
    });
</script>
<!-- Le message de chargement pour attendre que l'on charge les composants et les infrastructures en JSON -->


<!-- Le formulaire de création de modèle -->
<form style="display: block;" id="form_creation_vaisseau" method="post" action="javascript:ActionMethode.envoyerFormulaire('form_creation_vaisseau', 'div_vaisseau', 'page/vaisseau_creer.php?action=creerModele', true);">
    <!-- Sous-titre : Créer un nouveau modèle -->
    <h2 class="titre_corps">Créer un nouveau modèle de vaisseau</h2>
    <div class="previsualiser">
        <!-- Pour afficher l'image du modèle que l'on créé -->
        <img name="image_modele" src="/design/image/defaut_vaisseau.jpg">
        <img name="image_calque" src="/design/image/item_description_img.png">
        
        <!-- Tableau contenant tous les caractéristiques du modèle -->
        <table>
            <tbody><tr>
                <td colspan="6" name="nom" class="gris">
                    <span name="nom_modele">...</span>
                    [<span name="nom_infrastructrure">Chasseur</span> 
                      — Siège : <span name="siege_antaris"><span class="rouge">non</span></span> 
                      — Téléportation : <span name="systeme_teleportation"><span class="rouge">non</span></span>
                      — Hyperespace : <span name="hyperespace"><span class="rouge">non</span></span>]
                </td>
            </tr>
            <tr>
                <td>Fer :</td>
                <td name="fer">500</td>
                <td>Attaque :</td>
                <td name="attaque">0</td>
                <td>Vitesse :</td>
                <td name="vitesse">0%</td>
            </tr>
            <tr>
                <td>Or :</td>
                <td name="or">250</td>
                <td>Bouclier :</td>
                <td name="bouclier">0</td>
                <td>Maniabilité :</td>
                <td name="maniabilite">100%</td>
                
            </tr>
            <tr>
                <td>Cristal :</td>
                <td name="cristal">100</td>
                <td>Coque :</td>
                <td name="coque">0</td>
                <td>Temps :</td>
                <td name="temps">2m 0s</td>
            </tr>
            <tr>
                <td>Elyrium : </td>
                <td name="elyrium">50</td>
                <td>Fret :</td>
                <td name="fret">200</td>
                <td>Lanceur :</td>
                <td name="drone">0 drones</td>
            </tr>
        </tbody></table>
        <div class="espace"></div>
    </div>

    <!-- On affiche tous les sous-onglet pour les composants de divers type -->
    <div class="onglet">
        <ul>
            <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('description');" title="">Description</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('attaque');" title="">Armes</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('bouclier');" title="">Boucliers</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('coque');" title="">Coques</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('drone');" title="">Lance-drones</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('hangar');" title="">Hangars</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('vitesse');" title="">Réacteurs</a></li>
                        <li><a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('autre');" title="">Autres</a></li>
                    </ul>
    </div>

    <!-- Sous partie : indiquer le nom du modèle / choisir l'infrastructure et image -->
    <div name="sous_onglet_description" class="sous_onglet">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Nom et description du modèle</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table name="description">
                <!-- Le nom du modèle -->
                <tbody><tr>
                    <td>
                        <label for="nom">Nom du modèle :</label>
                        — Le nom de votre modèle doit avoir entre 5 et 25 caractères
                    </td>
                    <td><input onchange="javascript:VaisseauCreation.previsualiser();" onkeyup="javascript:VaisseauCreation.previsualiser();" name="nom" id="nom" type="text"></td>
                </tr>

                <!-- Le lien vers l'image -->
                <tr>
                    <td>
                        <label for="image">Lien vers une image :</label>
                        — Indiquer un lien vers une image internet pour illustrer ce modèle
                    </td>
                    <td>
                        <input name="image" id="image" onchange="javascript:VaisseauCreation.changerImage(); VaisseauCreation.previsualiser();" onkeyup="javascript:VaisseauCreation.changerImage(); VaisseauCreation.previsualiser();" type="text">
                        <a onclick="javascript:VaisseauCreation.ouvrirSousOnglet('liste_image');" title=""><img src="/design/image/jeu/icone/couleur/image.png"></a>
                    </td>
                </tr>

                <!-- L'infrastructure du modèle -->
                <tr>
                    <td>
                        <label for="id_infrastructure">Choisir l'infrastructure :</label>
                        — Les composants que l'on peut installer varie selon l'infrastructure
                    </td>
                    <td>
                      <select name="id_infrastructure" id="id_infrastructure" onchange="VaisseauCreation.selectionnerInfrastructure();">
                                                            <option value="1">Chasseur</option>
                                                            <option value="2">Intercepteur</option>
                                                            <option value="3">Transporteur</option>
                                                            <option value="4">Escorteur</option>
                                                            <option value="5">Navette</option>
                                                            <option value="6">Corvette</option>
                                                            <option value="7">Croiseur</option>
                                                            <option value="8">Croiseur lourd</option>
                                                            <option value="9">Destroyer</option>
                                                    </select>
                    </td>
                </tr>
            </tbody></table>
        </div>
    </div>
                        
    <!-- Sous partie : liste de toutes les images de modèle que l'on propose aux joueurs -->
    <div name="sous_onglet_liste_image" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des images proposées pour votre modèle</h2>
        
        <i>Veuillez cliquer sur l'image souhaité pour votre modèle.</i>
        <div class="conteneur">
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/1.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/1.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/2.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/2.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/3.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/3.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/4.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/4.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/5.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/5.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/6.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/6.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/7.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/7.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/8.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/8.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/9.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/9.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/10.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/10.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/11.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/11.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/12.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/12.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/13.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/13.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/14.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/14.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/15.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/15.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/16.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/16.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/17.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/17.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/18.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/18.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/19.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/19.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/20.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/20.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/21.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/21.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/22.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/22.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/23.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/23.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/24.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/24.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/25.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/25.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/26.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/26.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/27.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/27.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/28.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/28.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/29.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/29.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/30.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/30.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/31.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/31.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/32.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/32.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/33.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/33.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/34.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/34.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/35.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/35.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/36.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/36.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/37.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/37.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/38.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/38.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/39.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/39.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/40.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/40.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/41.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/41.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/42.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/42.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/43.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/43.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/44.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/44.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/45.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/45.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/46.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/46.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/47.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/47.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/48.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/48.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/49.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/49.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/50.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/50.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/51.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/51.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/52.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/52.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/53.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/53.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/54.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/54.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/55.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/55.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/56.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/56.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/57.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/57.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/58.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/58.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/59.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/59.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                            <div class="choisir_image">
                   <img src="/design/image/jeu/vaisseau/60.jpg" onclick="javascript:VaisseauCreation.selectionnerImage('/design/image/jeu/vaisseau/60.jpg');" onmouseover="montre('Sélectionner cette image pour votre modèle.');" onmouseout="cache();">
                </div>
                        <div class="espace"></div>
        </div>
    </div>

            
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_attaque" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Armes »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                      <tbody><tr>
                        <td>
                            <label for="composant_1">
                                                                Station de tir 
                                :
                            </label>
                            <div class="unite"><span class="orange">100</span> de fer</div>
                            <div class="unite"><span class="orange">50</span> d'or</div>
                            <div class="unite"><span class="orange">20</span> de cristal</div>
                            <div class="unite"><span class="orange">0</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: inline-block;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_1', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_1', 'onkeyup');" class="composant entier" id="composant_1" name="composant_1" data-id_composant="1" value="0" type="text">
                                                    </td>
                        <td>
                            <span class="couleur_theme">10</span>                             d'attaque<br>
                            <span class="rouge">2</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_2">
                                                                Canon à ions 
                                  :
                            </label>
                            <div class="unite"><span class="orange">500</span> de fer</div>
                            <div class="unite"><span class="orange">200</span> d'or</div>
                            <div class="unite"><span class="orange">100</span> de cristal</div>
                            <div class="unite"><span class="orange">0</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: inline-block;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_2', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_2', 'onkeyup');" class="composant entier" id="composant_2" name="composant_2" data-id_composant="2" value="0" type="text">
                                                    </td>
                        <td>
                            <span class="couleur_theme">80</span>                             d'attaque<br>
                            <span class="rouge">5</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_3">
                                                                Missile IEM 
                                :
                            </label>
                            <div class="unite"><span class="orange">1 000</span> de fer</div>
                            <div class="unite"><span class="orange">500</span> d'or</div>
                            <div class="unite"><span class="orange">250</span> de cristal</div>
                            <div class="unite"><span class="orange">50</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: inline-block;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_3', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_3', 'onkeyup');" class="composant entier" id="composant_3" name="composant_3" data-id_composant="3" value="0" type="text">
                                                    </td>
                        <td>
                            <span class="couleur_theme">250</span>                             d'attaque<br>
                            <span class="rouge">10</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_4">
                                                                Canon à plasma 
                                :
                            </label>
                            <div class="unite"><span class="orange">1 500</span> de fer</div>
                            <div class="unite"><span class="orange">1 000</span> d'or</div>
                            <div class="unite"><span class="orange">400</span> de cristal</div>
                            <div class="unite"><span class="orange">150</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_4', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_4', 'onkeyup');" class="composant entier" id="composant_4" name="composant_4" data-id_composant="4" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="4">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">600</span>                             d'attaque<br>
                            <span class="rouge">20</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_5">
                                                                Rayon plasma 
                                :
                            </label>
                            <div class="unite"><span class="orange">4 000</span> de fer</div>
                            <div class="unite"><span class="orange">2 500</span> d'or</div>
                            <div class="unite"><span class="orange">1 000</span> de cristal</div>
                            <div class="unite"><span class="orange">250</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_5', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_5', 'onkeyup');" class="composant entier" id="composant_5" name="composant_5" data-id_composant="5" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="5">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">2 000</span>                             d'attaque<br>
                            <span class="rouge">50</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_6">
                                                                Disrupteur 
                                :
                            </label>
                            <div class="unite"><span class="orange">10 000</span> de fer</div>
                            <div class="unite"><span class="orange">6 000</span> d'or</div>
                            <div class="unite"><span class="orange">2 500</span> de cristal</div>
                            <div class="unite"><span class="orange">400</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_6', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_6', 'onkeyup');" class="composant entier" id="composant_6" name="composant_6" data-id_composant="6" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="6">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">7 500</span>                             d'attaque<br>
                            <span class="rouge">100</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_7">
                                                                Canon des Antaris 
                                :
                            </label>
                            <div class="unite"><span class="orange">25 000</span> de fer</div>
                            <div class="unite"><span class="orange">15 000</span> d'or</div>
                            <div class="unite"><span class="orange">8 000</span> de cristal</div>
                            <div class="unite"><span class="orange">1 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_7', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_7', 'onkeyup');" class="composant entier" id="composant_7" name="composant_7" data-id_composant="7" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="7">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">25 000</span>                             d'attaque<br>
                            <span class="rouge">200</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_8">
                                                                Rayon Antaris 
                                :
                            </label>
                            <div class="unite"><span class="orange">35 000</span> de fer</div>
                            <div class="unite"><span class="orange">22 500</span> d'or</div>
                            <div class="unite"><span class="orange">12 500</span> de cristal</div>
                            <div class="unite"><span class="orange">1 500</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_8', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_8', 'onkeyup');" class="composant entier" id="composant_8" name="composant_8" data-id_composant="8" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="8">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">47 500</span>                             d'attaque<br>
                            <span class="rouge">400</span> u. de fret
                        </td>
                    </tr>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      </tbody></table>
        </div>
    </div>
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_bouclier" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Boucliers »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              <tbody><tr>
                        <td>
                            <label for="composant_13">
                                                                Petit bouclier 
                                :
                            </label>
                            <div class="unite"><span class="orange">250</span> de fer</div>
                            <div class="unite"><span class="orange">100</span> d'or</div>
                            <div class="unite"><span class="orange">175</span> de cristal</div>
                            <div class="unite"><span class="orange">25</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: inline-block;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_13', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_13', 'onkeyup');" class="composant entier" id="composant_13" name="composant_13" data-id_composant="13" value="0" type="text">
                                                    </td>
                        <td>
                            <span class="couleur_theme">65</span>                             de bouclier<br>
                            <span class="rouge">4</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_14">
                                                                Grand bouclier 
                                :
                            </label>
                            <div class="unite"><span class="orange">400</span> de fer</div>
                            <div class="unite"><span class="orange">200</span> d'or</div>
                            <div class="unite"><span class="orange">425</span> de cristal</div>
                            <div class="unite"><span class="orange">100</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_14', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_14', 'onkeyup');" class="composant entier" id="composant_14" name="composant_14" data-id_composant="14" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="14">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">350</span>                             de bouclier<br>
                            <span class="rouge">8</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_15">
                                                                Bouclier des Antaris 
                                :
                            </label>
                            <div class="unite"><span class="orange">1 000</span> de fer</div>
                            <div class="unite"><span class="orange">650</span> d'or</div>
                            <div class="unite"><span class="orange">950</span> de cristal</div>
                            <div class="unite"><span class="orange">250</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_15', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_15', 'onkeyup');" class="composant entier" id="composant_15" name="composant_15" data-id_composant="15" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="15">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">1 200</span>                             de bouclier<br>
                            <span class="rouge">14</span> u. de fret
                        </td>
                    </tr>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        </tbody></table>
        </div>
    </div>
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_coque" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Coques »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                                                                                                                                                                                                                                                                                                      <tbody><tr>
                        <td>
                            <label for="composant_9">
                                                                Coque à petit densité 
                                :
                            </label>
                            <div class="unite"><span class="orange">250</span> de fer</div>
                            <div class="unite"><span class="orange">100</span> d'or</div>
                            <div class="unite"><span class="orange">10</span> de cristal</div>
                            <div class="unite"><span class="orange">20</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: inline-block;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_9', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_9', 'onkeyup');" class="composant entier" id="composant_9" name="composant_9" data-id_composant="9" value="0" type="text">
                                                    </td>
                        <td>
                            <span class="couleur_theme">60</span>                             de coque<br>
                            <span class="rouge">4</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_10">
                                                                Coque à densité moyenne 
                                :
                            </label>
                            <div class="unite"><span class="orange">750</span> de fer</div>
                            <div class="unite"><span class="orange">300</span> d'or</div>
                            <div class="unite"><span class="orange">150</span> de cristal</div>
                            <div class="unite"><span class="orange">175</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_10', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_10', 'onkeyup');" class="composant entier" id="composant_10" name="composant_10" data-id_composant="10" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="10">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">450</span>                             de coque<br>
                            <span class="rouge">10</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_11">
                                                                Coque à grande densité 
                                :
                            </label>
                            <div class="unite"><span class="orange">1 000</span> de fer</div>
                            <div class="unite"><span class="orange">400</span> d'or</div>
                            <div class="unite"><span class="orange">250</span> de cristal</div>
                            <div class="unite"><span class="orange">350</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_11', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_11', 'onkeyup');" class="composant entier" id="composant_11" name="composant_11" data-id_composant="11" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="11">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">1 000</span>                             de coque<br>
                            <span class="rouge">15</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_12">
                                                                Coque des Antaris 
                                :
                            </label>
                            <div class="unite"><span class="orange">2 000</span> de fer</div>
                            <div class="unite"><span class="orange">800</span> d'or</div>
                            <div class="unite"><span class="orange">500</span> de cristal</div>
                            <div class="unite"><span class="orange">500</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_12', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_12', 'onkeyup');" class="composant entier" id="composant_12" name="composant_12" data-id_composant="12" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="12">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">3 000</span>                             de coque<br>
                            <span class="rouge">30</span> u. de fret
                        </td>
                    </tr>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              </tbody></table>
        </div>
    </div>
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_drone" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Lance-drones »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              <tbody><tr>
                        <td>
                            <label for="composant_29">
                                                                Lance-drone à cadence faible 
                                  :
                            </label>
                            <div class="unite"><span class="orange">240 000</span> de fer</div>
                            <div class="unite"><span class="orange">180 000</span> d'or</div>
                            <div class="unite"><span class="orange">150 000</span> de cristal</div>
                            <div class="unite"><span class="orange">75 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_29', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_29', 'onkeyup');" class="composant entier" id="composant_29" name="composant_29" data-id_composant="29" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="29">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">1</span>                             drone(s)<br>
                            <span class="rouge">1 200</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_30">
                                                                Lance-drone à cadence moyenne 
                                :
                            </label>
                            <div class="unite"><span class="orange">600 000</span> de fer</div>
                            <div class="unite"><span class="orange">450 000</span> d'or</div>
                            <div class="unite"><span class="orange">300 000</span> de cristal</div>
                            <div class="unite"><span class="orange">120 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_30', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_30', 'onkeyup');" class="composant entier" id="composant_30" name="composant_30" data-id_composant="30" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="30">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">4</span>                             drone(s)<br>
                            <span class="rouge">4 800</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_31">
                                                                Lance-drone à cadence rapide 
                                                                    <span class="help rouge" onmouseover="montre('<b>Ce composant est bloqué :</b><br /><span class=\'vert\'>Avant-poste Antaris, au niveau 3 <i>(4)</i></span><br /><span class=\'vert\'>Siège des Antaris, au niveau 8 <i>(11)</i></span><br /><span class=\'vert\'>Maîtrise de l\'énergie, au niveau 20 <i>(20)</i></span><br /><span class=\'rouge\'>Connaissance des particules, au niveau 20 <i>(18)</i></span><br /><span class=\'vert\'>Connaissance des Antaris, au niveau 16 <i>(18)</i></span><br /><span class=\'rouge\'>Systèmes d\'armement, au niveau 20 <i>(19)</i></span><br />');" onmouseout="cache();">(B)</span>
                                :
                            </label>
                            <div class="unite"><span class="orange">1 050 000</span> de fer</div>
                            <div class="unite"><span class="orange">600 000</span> d'or</div>
                            <div class="unite"><span class="orange">412 500</span> de cristal</div>
                            <div class="unite"><span class="orange">210 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_31', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_31', 'onkeyup');" class="composant entier" id="composant_31" name="composant_31" data-id_composant="31" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="31">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">10</span>                             drone(s)<br>
                            <span class="rouge">12 000</span> u. de fret
                        </td>
                    </tr>
                                                                                                                                                                                                                        </tbody></table>
        </div>
    </div>
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_hangar" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Hangars »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <tbody><tr>
                        <td>
                            <label for="composant_32">
                                                                Hangar à chasseur 
                                :
                            </label>
                            <div class="unite"><span class="orange">20 000</span> de fer</div>
                            <div class="unite"><span class="orange">15 000</span> d'or</div>
                            <div class="unite"><span class="orange">4 000</span> de cristal</div>
                            <div class="unite"><span class="orange">6 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_32', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_32', 'onkeyup');" class="composant entier" id="composant_32" name="composant_32" data-id_composant="32" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="32">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">10</span>                             place(s)<br>
                            <span class="rouge">1 500</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_33">
                                                                Hangar à intercepteur 
                                :
                            </label>
                            <div class="unite"><span class="orange">60 000</span> de fer</div>
                            <div class="unite"><span class="orange">35 000</span> d'or</div>
                            <div class="unite"><span class="orange">8 000</span> de cristal</div>
                            <div class="unite"><span class="orange">12 500</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_33', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_33', 'onkeyup');" class="composant entier" id="composant_33" name="composant_33" data-id_composant="33" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="33">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">5</span>                             place(s)<br>
                            <span class="rouge">9 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_34">
                                                                Hangar à transporteur 
                                :
                            </label>
                            <div class="unite"><span class="orange">135 000</span> de fer</div>
                            <div class="unite"><span class="orange">75 000</span> d'or</div>
                            <div class="unite"><span class="orange">20 000</span> de cristal</div>
                            <div class="unite"><span class="orange">30 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_34', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_34', 'onkeyup');" class="composant entier" id="composant_34" name="composant_34" data-id_composant="34" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="34">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">2</span>                             place(s)<br>
                            <span class="rouge">15 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_35">
                                                                Hangar à escorteur 
                                :
                            </label>
                            <div class="unite"><span class="orange">145 000</span> de fer</div>
                            <div class="unite"><span class="orange">80 000</span> d'or</div>
                            <div class="unite"><span class="orange">25 000</span> de cristal</div>
                            <div class="unite"><span class="orange">32 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_35', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_35', 'onkeyup');" class="composant entier" id="composant_35" name="composant_35" data-id_composant="35" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="35">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">2</span>                             place(s)<br>
                            <span class="rouge">60 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_36">
                                                                Hangar à navette 
                                :
                            </label>
                            <div class="unite"><span class="orange">220 000</span> de fer</div>
                            <div class="unite"><span class="orange">120 000</span> d'or</div>
                            <div class="unite"><span class="orange">42 000</span> de cristal</div>
                            <div class="unite"><span class="orange">40 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_36', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_36', 'onkeyup');" class="composant entier" id="composant_36" name="composant_36" data-id_composant="36" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="36">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">1</span>                             place(s)<br>
                            <span class="rouge">115 000</span> u. de fret
                        </td>
                    </tr>
                                              </tbody></table>
        </div>
    </div>
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_vitesse" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Réacteurs »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <tbody><tr>
                        <td>
                            <label for="composant_16">
                                                                Turboréacteur 
                                :
                            </label>
                            <div class="unite"><span class="orange">750</span> de fer</div>
                            <div class="unite"><span class="orange">500</span> d'or</div>
                            <div class="unite"><span class="orange">300</span> de cristal</div>
                            <div class="unite"><span class="orange">0</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: inline-block;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_16', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_16', 'onkeyup');" class="composant entier" id="composant_16" name="composant_16" data-id_composant="16" value="0" type="text">
                                                    </td>
                        <td>
                            <span class="couleur_theme">5</span>                             de poussée<br>
                            <span class="rouge">20</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_17">
                                                                Statoréacteur 
                                :
                            </label>
                            <div class="unite"><span class="orange">1 500</span> de fer</div>
                            <div class="unite"><span class="orange">1 000</span> d'or</div>
                            <div class="unite"><span class="orange">600</span> de cristal</div>
                            <div class="unite"><span class="orange">0</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_17', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_17', 'onkeyup');" class="composant entier" id="composant_17" name="composant_17" data-id_composant="17" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="17">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">150</span>                             de poussée<br>
                            <span class="rouge">50</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_18">
                                                                Propulseur à propergol 
                                :
                            </label>
                            <div class="unite"><span class="orange">2 500</span> de fer</div>
                            <div class="unite"><span class="orange">1 750</span> d'or</div>
                            <div class="unite"><span class="orange">1 000</span> de cristal</div>
                            <div class="unite"><span class="orange">250</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_18', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_18', 'onkeyup');" class="composant entier" id="composant_18" name="composant_18" data-id_composant="18" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="18">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">300</span>                             de poussée<br>
                            <span class="rouge">100</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_19">
                                                                Propulseur hybride 
                                :
                            </label>
                            <div class="unite"><span class="orange">6 000</span> de fer</div>
                            <div class="unite"><span class="orange">4 000</span> d'or</div>
                            <div class="unite"><span class="orange">2 500</span> de cristal</div>
                            <div class="unite"><span class="orange">300</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_19', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_19', 'onkeyup');" class="composant entier" id="composant_19" name="composant_19" data-id_composant="19" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="19">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">750</span>                             de poussée<br>
                            <span class="rouge">300</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_20">
                                                                Propulseur ionique 
                                :
                            </label>
                            <div class="unite"><span class="orange">8 500</span> de fer</div>
                            <div class="unite"><span class="orange">6 000</span> d'or</div>
                            <div class="unite"><span class="orange">4 000</span> de cristal</div>
                            <div class="unite"><span class="orange">500</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_20', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_20', 'onkeyup');" class="composant entier" id="composant_20" name="composant_20" data-id_composant="20" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="20">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">1 650</span>                             de poussée<br>
                            <span class="rouge">750</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_21">
                                                                Propulseur photonique 
                                :
                            </label>
                            <div class="unite"><span class="orange">12 500</span> de fer</div>
                            <div class="unite"><span class="orange">10 000</span> d'or</div>
                            <div class="unite"><span class="orange">7 500</span> de cristal</div>
                            <div class="unite"><span class="orange">1 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_21', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_21', 'onkeyup');" class="composant entier" id="composant_21" name="composant_21" data-id_composant="21" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="21">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">2 000</span>                             de poussée<br>
                            <span class="rouge">2 800</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_22">
                                                                Propulseur nucléaire thermique 
                                :
                            </label>
                            <div class="unite"><span class="orange">20 000</span> de fer</div>
                            <div class="unite"><span class="orange">15 000</span> d'or</div>
                            <div class="unite"><span class="orange">10 000</span> de cristal</div>
                            <div class="unite"><span class="orange">5 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_22', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_22', 'onkeyup');" class="composant entier" id="composant_22" name="composant_22" data-id_composant="22" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="22">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">4 000</span>                             de poussée<br>
                            <span class="rouge">8 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_23">
                                                                Réacteur à antimatière 
                                :
                            </label>
                            <div class="unite"><span class="orange">45 000</span> de fer</div>
                            <div class="unite"><span class="orange">30 000</span> d'or</div>
                            <div class="unite"><span class="orange">20 000</span> de cristal</div>
                            <div class="unite"><span class="orange">30 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_23', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_23', 'onkeyup');" class="composant entier" id="composant_23" name="composant_23" data-id_composant="23" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="23">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">13 000</span>                             de poussée<br>
                            <span class="rouge">16 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_24">
                                <span class="help cyan" onmouseover="montre('Moteur ayant la technologie « Hyperespace ».');" onmouseout="cache();">[H+]</span>                                 Moteur à hyperespace 
                                :
                            </label>
                            <div class="unite"><span class="orange">130 000</span> de fer</div>
                            <div class="unite"><span class="orange">100 000</span> d'or</div>
                            <div class="unite"><span class="orange">75 000</span> de cristal</div>
                            <div class="unite"><span class="orange">75 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_24', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_24', 'onkeyup');" class="composant entier" id="composant_24" name="composant_24" data-id_composant="24" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="24">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">32 000</span>                             de poussée<br>
                            <span class="rouge">60 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_25">
                                <span class="help cyan" onmouseover="montre('Moteur ayant la technologie « Hyperespace ».');" onmouseout="cache();">[H+]</span>                                 Moteur VSL 
                                :
                            </label>
                            <div class="unite"><span class="orange">160 000</span> de fer</div>
                            <div class="unite"><span class="orange">125 000</span> d'or</div>
                            <div class="unite"><span class="orange">120 000</span> de cristal</div>
                            <div class="unite"><span class="orange">90 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_25', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_25', 'onkeyup');" class="composant entier" id="composant_25" name="composant_25" data-id_composant="25" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="25">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">45 000</span>                             de poussée<br>
                            <span class="rouge">95 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_26">
                                <span class="help cyan" onmouseover="montre('Moteur ayant la technologie « Hyperespace ».');" onmouseout="cache();">[H+]</span>                                 Moteur VSL amélioré 
                                                                    <span class="help rouge" onmouseover="montre('<b>Ce composant est bloqué :</b><br /><span class=\'vert\'>Maîtrise de l\'énergie, au niveau 20 <i>(20)</i></span><br /><span class=\'vert\'>Maîtrise du sub-espace, au niveau 18 <i>(18)</i></span><br /><span class=\'vert\'>Connaissance des Antaris, au niveau 16 <i>(18)</i></span><br /><span class=\'rouge\'>Hypernavigation, au niveau 18 <i>(16)</i></span><br /><span class=\'vert\'>Connaissance des particules, au niveau 18 <i>(18)</i></span><br />');" onmouseout="cache();">(B)</span>
                                :
                            </label>
                            <div class="unite"><span class="orange">250 000</span> de fer</div>
                            <div class="unite"><span class="orange">215 000</span> d'or</div>
                            <div class="unite"><span class="orange">155 000</span> de cristal</div>
                            <div class="unite"><span class="orange">125 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" onchange="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_26', 'onchange');" onkeyup="javascript:VaisseauCreation.previsualiser(); InputMethode.gererChamp('composant_26', 'onkeyup');" class="composant entier" id="composant_26" name="composant_26" data-id_composant="26" value="0" type="text"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="26">Incompatible</div>
                                                    </td>
                        <td>
                            <span class="couleur_theme">60 000</span>                             de poussée<br>
                            <span class="rouge">125 000</span> u. de fret
                        </td>
                    </tr>
                                                                                                                                                                                                                                                                                                                                                                                                  </tbody></table>
        </div>
    </div>
        <!-- Sous partie : pour afficher chaque sous-onglet -->
    <div name="sous_onglet_autre" class="sous_onglet" style="display : none;">
        <!-- Le titre de cet sous-onglet -->
        <h2 class="titre_corps">Liste des composants « Autres »</h2>

        <div style="margin : 10px -20px 15px -20px;">
            <table>
                <!-- On liste l'ensemble des composants de cet onglet -->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <tbody><tr>
                        <td>
                            <label for="composant_27">
                                                                Installation du siège des Antaris 
                                :
                            </label>
                            <div class="unite"><span class="orange">2 000 000</span> de fer</div>
                            <div class="unite"><span class="orange">3 000 000</span> d'or</div>
                            <div class="unite"><span class="orange">2 500 000</span> de cristal</div>
                            <div class="unite"><span class="orange">800 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" value="0" onchange="javascript:VaisseauCreation.previsualiser();" onkeyup="javascript:VaisseauCreation.previsualiser();" class="composant" id="composant_27" name="composant_27" data-id_composant="27" type="checkbox"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="27">Incompatible</div>
                                                    </td>
                        <td>
                                                        +50% de bouclier<br>
                            <span class="rouge">40 000</span> u. de fret
                        </td>
                    </tr>
                                                                        <tr>
                        <td>
                            <label for="composant_28">
                                                                Système de téléportation 
                                :
                            </label>
                            <div class="unite"><span class="orange">25 000</span> de fer</div>
                            <div class="unite"><span class="orange">50 000</span> d'or</div>
                            <div class="unite"><span class="orange">30 000</span> de cristal</div>
                            <div class="unite"><span class="orange">20 000</span> d'elyrium</div>
                        </td>
                        <td>
                                                            <input style="display: none;" value="0" onchange="javascript:VaisseauCreation.previsualiser();" onkeyup="javascript:VaisseauCreation.previsualiser();" class="composant" id="composant_28" name="composant_28" data-id_composant="28" type="checkbox"><div onmouseout="cache();" onmouseover="montre('Ce composant est incompatible avec cette infrastructure.');" class="incompatible rouge" data-association="28">Incompatible</div>
                                                    </td>
                        <td>
                                                        75% téléportation<br>
                            <span class="rouge">1 000</span> u. de fret
                        </td>
                    </tr>
                                                                                                                                                                                                                                                                                                                              </tbody></table>
        </div>
    </div>
        
    
    <!-- Sous-titre : pour vérifier la validité du formulaire -->
    <h2 class="titre_corps">Valider la création de ce modèle</h2>
    <div id="msg_verifier_modele" class="gris">  <span class="rouge">Le nom du modèle doit avoir entre 5 et 25 caractères inclus.</span></div>
    
    <!-- Pour valider la création de ce nouveau modèle -->
    <div id="bouton_formulaire">
        <input name="valid_creation" id="valid_creation" value="Créer ce modèle" type="submit">
    </div>
    <div class="espace"></div>
</form></div></div>  
{/block}       