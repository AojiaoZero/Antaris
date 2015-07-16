function actionChat(e,a){if("undefined"==typeof a)var a=null;var t=null;switch(e){case"annonce":t="/annonce message";break;case"chuchoter":t="/chuchoter "+a+" ";break;case"adresser":t="@"+a+" : ";break;case"muter":t="/bannir pseudo h=nb_heure";break;case"demuter":t="/bannir pseudo h=0";break;case"suppr_message_joueur":t="/supprimer joueur pseudo";break;case"suppr_message_general":t="/supprimer normal";break;case"suppr_message_chuchotement":t="/supprimer chuchotement"}"undefined"!=typeof t&&null!==t&&$('div#page_tchat form#form_tchat input[name="tchat_message"]').attr("value",t).focus()}


var Tchat={ajouterMessage:function(){ActionMethode.envoyerFormulaire("form_tchat","reponse_formulaire","page/tchat.php?onglet_page="+Tchat.onglet+"&action=ajouter_message",!1,function(){$('form#form_tchat input[name="tchat_message"]').val(null),GestionMethode.ajouterActualisation(setTimeout(function(){$("span#reponse_formulaire").empty()},2e3))})},creerElementMessage:function(e){var a=$("<div>",{name:"message","data-id_message":e.id_message}).append($("<div>",{name:"avatar"})).append($("<div>",{name:"information"})).append($("<div>",{name:"texte"})).append($("<div>",{"class":"espace"}));a.find('div[name="avatar"]').html($("<img>",{src:e.expediteur.avatar,onmouseout:"cache();",onmouseover:"montre('"+e.bulles.avatar+"');",onclick:"javascript:Tchat.action('chuchoter', '"+e.expediteur.pseudo+"');"})),a.find('div[name="information"]').append($("<span>",{name:"pseudo",onclick:"javascript:Tchat.action('adresser', '"+e.expediteur.pseudo+"');"}).html(e.expediteur.pseudo)).append($("<span>",{name:"date_heure"}).html("Le "+e.date_heure)),a.find('div[name="texte"]').append($("<span>",{"class":"bbcode",style:"color : #"+e.expediteur.couleur}).html(e.texte)),null!=e.id_destinataire?(a.addClass("msg_chuchotement"),a.find('div[name="texte"] span.bbcode').prepend($("<span>",{"class":"pseudo_chuchotement"}).html("> "+e.destinataire.pseudo+" : ")),a.find('div[name="texte"]').attr({onmouseover:"montre('"+e.bulles.chuchotement+"');",onmouseout:"cache();"})):"annonce"==e.type&&(a.addClass("msg_annonce"),a.find('div[name="texte"] span.bbcode').prepend('<strong><psan class="rouge">[Annonce]</span></strong> '));var t=a.find('div[name="information"] span[name="pseudo"]');return e.expediteur.staff?t.after($("<span>",{"class":"jaune",style:"font-weight : bold; cursor : help;",onmouseout:"cache();",onmouseover:"montre('"+e.bulles.membre_staff+"');"}).text(" [Staff]")):e.expediteur.tag_alliance.length>0&&t.after($("<a>",{"class":"couleur_alliance",onmouseout:"cache();",onmouseover:"montre('Afficher la description de cette alliance.');",onclick:"javascript:ActionMethode.ouvrirPagePrincipale('alliance.php', 'tag="+e.expediteur.tag_alliance+"');"}).text(" ["+e.expediteur.tag_alliance+"]")),a},ordonnerMessage:function(e,a){return e.id_message==a.id_message?0:e.id_message>a.id_message?1:-1},actualiser:function(){Tchat.actualisation||(Tchat.actualisation=!0,$('h2[data-js="img_chargement"] img').show(),AjaxMethode.getDonneesJSON("page/requete_json.php",function(e){var a=$('div#page_tchat div[name="liste_message"] .mCSB_container'),t={timestamp:0,id:0};"undefined"!=typeof e.recharger_tchat&&e.recharger_tchat?(a.html(AjaxMethode.element_chargement),Tchat.id_dernier_message[Tchat.onglet]=0,Tchat.actualisation=!1,Tchat.actualiser()):(e=$(e).sort(Tchat.ordonnerMessage),$.each(e,function(e,a){a.timestamp>t.timestamp&&(t.id=parseInt(a.id_message),t.timestamp=parseInt(a.timestamp))}),0==parseInt(Tchat.id_dernier_message[Tchat.onglet])&&(t.id>0?a.empty():a.html("<i>Il n'y a pas de message actuellement sur ce tchat.</i>")),t.id>0&&(Tchat.id_dernier_message[Tchat.onglet]=t.id,$.each(e,function(e,t){0==$('div#page_tchat div[name="liste_message"] div[data-id_message="'+t.id_message+'"]').length&&a.prepend(Tchat.creerElementMessage(t))})),$('div#page_tchat div[name="liste_message"]').mCustomScrollbar("update"),Tchat.actualisation=!1,$('h2[data-js="img_chargement"] img').hide())},"obtenir=liste_message_tchat&securite_cle="+ApplicationMethode.getSecuriteCle()+"&type_tchat="+Tchat.onglet+"&page_actif="+ApplicationMethode.page_actif+"&id_dernier="+Tchat.id_dernier_message[Tchat.onglet]))},action:function(e,a){if("undefined"==typeof a)var a=null;var t=null;switch(e){case"annonce":t="/annonce message";break;case"chuchoter":t="/chuchoter "+a+" ";break;case"adresser":t="@"+a+" : ";break;case"muter":t="/bannir pseudo h=nb_heure";break;case"demuter":t="/bannir pseudo h=0";break;case"suppr_message_joueur":t="/supprimer joueur pseudo";break;case"suppr_message_general":t="/supprimer normal";break;case"suppr_message_chuchotement":t="/supprimer chuchotement";break;case"changer_mode_espionnage":CookieMethode.inverserBoolean("tchat-espion_chuchotement"),ActionMethode.ouvrirPagePrincipale("tchat.php","onglet_page="+Tchat.onglet_page)}"undefined"!=typeof t&&null!==t&&$('div#page_tchat form#form_tchat input[name="tchat_message"]').attr("value",t).focus()},initialiser:function(e){Tchat.id_dernier_message[Tchat.onglet]=0,Tchat.onglet=e,$('div#page_tchat div[name="liste_message"]').mCustomScrollbar({scrollInertia:0,mouseWheelPixels:100,scrollButtons:{enable:!0}}),$('div#page_tchat form#form_tchat input[name="tchat_message"]').focus()}};Tchat.actualisation=!1,Tchat.onglet="general",Tchat.id_dernier_message={general:0,alliance:0};

function getXMLHttpRequest() {
	var xhr = null;
	
	if (window.XMLHttpRequest || window.ActiveXObject) {
		if (window.ActiveXObject) {
			try {
				xhr = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
		} else {
			xhr = new XMLHttpRequest(); 
		}
	} else {
		alert("Votre navigateur ne supporte pas l'objet XMLHTTPRequest...");
		return null;
	}
	
	return xhr;
}


function refreshChat()
{
var xhr = getXMLHttpRequest();
xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0)) {
                document.getElementById('liste_message').innerHTML = xhr.responseText; // Données textuelles récupérées
        }
};

xhr.open("GET", "minichat.php", true);
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.send(null);
}

function submitChat(userID, alliance, color)
{
var xhr = getXMLHttpRequest();
var message = encodeURIComponent(document.getElementById('tchat_message').value);

xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 0)) {
                document.getElementById('minichat').innerHTML = xhr.responseText; // Données textuelles récupérées
        }
};

xhr.open("POST", "minichat.php", true);
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.send("ally="+alliance+"&user="+userID+"&message="+message+"&color="+color);
document.getElementById('tchat_message').value = ""; // on vide le message sur la page

}
