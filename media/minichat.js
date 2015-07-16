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
                document.getElementById('minichat').innerHTML = xhr.responseText; // Données textuelles récupérées
        }
};

xhr.open("POST", "minichat.php", true);
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.send(null);
}

function submitChat(userID, alliance)
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
xhr.send("ally="+alliance+"&user="+userID+"&message="+message);
document.getElementById('tchat_message').value = ""; // on vide le message sur la page

}

