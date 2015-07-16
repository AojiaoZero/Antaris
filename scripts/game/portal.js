function CheckTargetPortal()
{
	kolo	= (typeof data.ships[208] == "object") ? 1 : 0;
	var targetGalaxy = document.getElementsByName("galaxy")[0].value;
	var targetSystem = document.getElementsByName("system")[0].value;
	var targetPlanet = document.getElementsByName("planet")[0].value;
	var targetmissions = document.getElementsByName("target_mission")[0].value;
	
	$.getJSON('game.php?page=Tportal&mode=checkTarget&galaxy='+targetGalaxy+'&system='+targetSystem+'&planet='+targetPlanet+'&planet_type=1&lang='+Lang+'&mission='+missions+'&kolo='+kolo, function(data) {
		
		if(data == "OK") {
			document.getElementById('form').submit();
		} 
		else {
			$('#reponse_ajax1').html("<span class=rouge>"+data+"</span>");
		}
	});
	return false;
}

function setTarget(galaxy, solarsystem, planet, type) {
	document.getElementsByName("galaxy")[0].value = galaxy;
	document.getElementsByName("system")[0].value = solarsystem;
	document.getElementsByName("planet")[0].value = planet;
	document.getElementsByName("type")[0].value = type;
}

function maxPop(id) {
	if (document.getElementsByName(id)[0]) {
		var amount = document.getElementById(id + "_value").innerHTML;
		document.getElementsByName(id)[0].value = amount.replace(/\./g, "");
	}
	updateVars();
}

function updateVars()
{

}