function Production(name, action) {
$('#msgend').empty();
if(name === "metal_prod" && action === "decrease")
	{
		amount = metal_prod_old - 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount >=0){
		metal_prod_old = amount;
		$('#'+name+'').html(""+amount+"  %");
		$('#1_rpircent').html(""+amount+"  %");
		$('#7_rpircent').html(""+amount+"  %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#metalpircent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}
	else if(name === "metal_prod" && action === "increase")
	{
		amount = metal_prod_old + 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount <= 100){
		metal_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#1_rpircent').html(""+amount+" %");
		$('#7_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		
		$('#metalpircent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}
	
if(name === "crystal_prod" && action === "decrease")
	{
		amount = crystal_prod_old - 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount >=0){
		crystal_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#2_rpircent').html(""+amount+" %");
		$('#8_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#crystalpircent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}
	else if(name === "crystal_prod" && action === "increase")
	{
		amount = crystal_prod_old + 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount <= 100){
		crystal_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#2_rpircent').html(""+amount+" %");
		$('#8_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#crystalpircent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}

if(name === "deuterium_prod" && action === "decrease")
	{
		amount = deuterium_prod_old - 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount >=0){
		deuterium_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#3_rpircent').html(""+amount+" %");
		$('#9_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#deutpircent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}
	else if(name === "deuterium_prod" && action === "increase")
	{
		amount = deuterium_prod_old + 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount <= 100){
		deuterium_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#3_rpircent').html(""+amount+" %");
		$('#9_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#deutpircent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}

if(name === "elyrium_prod" && action === "decrease")
	{
		amount = elyrium_prod_old - 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount >=0){
		elyrium_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#48_rpircent').html(""+amount+" %");
		$('#11_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#elyriumpercent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}
	else if(name === "elyrium_prod" && action === "increase")
	{
		amount = elyrium_prod_old + 10;
		$.getJSON('game.php?page=resources&mode=send&name='+name+'&action='+action+'&amount='+amount, function(data) {
		});
		if (amount <= 100){
		elyrium_prod_old = amount;
		$('#'+name+'').html(""+amount+" %");
		$('#48_rpircent').html(""+amount+" %");
		$('#11_rpircent').html(""+amount+" %");
		var endwidth = amount * 2;
		var endwidth2 = 200 - amount * 2;
		$('#elyriumpercent').css({
    marginRight:''+endwidth2+'px',
    width:''+endwidth+'px'
	});
		}
	}
	
}