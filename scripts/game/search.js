function search(){

var name = $('#searchtext').val();
var type = $('#type').val();

if(name.length<3)
$('#recherche_resultat').html(lgn);
else
$.getJSON('game.php?page=search&mode=autocomplete&name='+name+'&type='+type, function(data) {
		
		$('#recherche_resultat').empty();
		$('#recherche_resultat').load('game.php?page=search&mode=result&search='+name+'&type='+type);
		
	});	

}


