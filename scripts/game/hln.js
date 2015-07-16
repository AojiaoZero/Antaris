function check(){
	var v = $('textarea#message').val();
	if(v.length<50){ 
	$('#response_action').html(lgn);
	}else if(v.length<255 && v.length>50) {
	$('#response_action').html(lgn1);
	$('#option_show').empty();
	$('#option_show').html(lgn3);
	$.getJSON("game.php?page=Hln&mode=hlnSend&message="+v, function(data)
	{
	});
}else if(v.length>255) {
	$('#response_action').html(lgn2);
}
}