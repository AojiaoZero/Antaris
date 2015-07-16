$(function() {
	window.setInterval(function() {
		$('.fleets').each(function() {
			var s		= $(this).data('fleet-time') - (serverTime.getTime() - startTime) / 1000;
			if(s <= 0) {
				$(this).text('-');
			} else {
				$(this).text(GetRestTimeFormat(s));
			}
		})
	}, 1000);
});


var VaisseauEquipe={
afficherFormulaireCreation:function(){$("div#nouvelle_equipe a").css("display","none"),$("div#nouvelle_equipe form").css("display","block")},creerEquipe:function(){apprise(lgn,{maxWidthWindow:450,input:!0,widthInput:150},

function(e){ $.ajax({type:'POST', url: 'game.php?page=fleetTable&mode=managesend&planetname='+e, data:$('#form_creer_equipe').serialize(), success: function(response) {
    $('#form_creer_equipe').find('.form_result').html('test');
	 location.reload(); 
}}); }


)},supprimerEquipe:function(e){apprise(lgn1,{maxWidthWindow:450,confirm:!0},function(i){$.ajax({type:'POST', url: 'game.php?page=fleetTable&mode=managedelete&data='+e, success: function(response) {
    
	 location.reload(); 
}});})}
};



