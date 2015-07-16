<?php
header("Content-Type: text/html; charset=iso-8859-1"); // On crée un header qui formate la page en texte
mysql_connect("localhost", "antarisl_thisis", "EJceRpJcPv3181"); // On ouvre une connexion à la base de données avec nos identifiants
mysql_select_db("antarisl_ingame"); // On selectionne la base qui contient notre table pour le chat
if (isset($_POST['message']))  // Si on reçoit des données via une méthode POST
{
    if(!empty($_POST['message'])) // Et si leur valeur n'est ni NULL, ni vide
    {
	$message = mysql_real_escape_string(utf8_decode($_POST['message']));
        
        mysql_query("INSERT INTO uni1_minichat (pseudo,message,timestamp) VALUES('pseudo', '".$message."', '".time()."')");
    }
}
$reponse = mysql_query("SELECT * FROM uni1_minichat");
while($val = mysql_fetch_array($reponse))
{
	echo '<div data-id_message="933321" name="message"> <div name="avatar"><img onclick="javascript:Tchat.action("chuchoter", "Klorel");" onmouseover="montre("<b>Cliquez ici pour chuchoter avec Klorel :</b><br />                                                        <i>Il est possible d`envoyer un message uniquement à Klorel<br />via le tchat par le biais cette fonction.</i>");" onmouseout="cache();" src="/media/avatar/mini_340.png?1427911237"></div><div name="information"><span onclick="javascript:Tchat.action("adresser", "Klorel");" name="pseudo">Klorel</span><a onclick="javascript:ActionMethode.ouvrirPagePrincipale("alliance.php", "tag=EMG");" onmouseover="montre("Afficher la description de cette alliance.");" onmouseout="cache();" class="couleur_alliance"> [EMG]</a><span name="date_heure">Le 01/04 à 20:32:57</span></div><div name="texte"><span style="color : #FF6600" class="bbcode">Vend OR <img class="smiley" src="design/image/smiley/heureux.png" alt=":)"></span></div><div class="espace"></div></div>';
}
 
// On affiche les messages de notre chat ici
 
mysql_close(); // On ferme la connexion de notre base de données
?>