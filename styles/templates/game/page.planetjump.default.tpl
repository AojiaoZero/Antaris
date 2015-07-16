{block name="title" prepend}Planet Jump{/block}
{block name="content"}

<script>
function do_jump(){
			$.ajax({    
			type: "POST",     
			url: "game.php?page=jumpspecial&mode=dos",     
			data: $("#fleet_form").serialize(),     
			success: function(data) {
				
				data    = $.parseJSON(data);	   
				if(data.error === false) {                  
					if(data.message == 'OK') {                       
						$("#fleet_table").empty();
						$("#fleet_table").html("Your fleet jumped succesfully").css({ 'color':'#EE0000' });
						
					}   
				} else {                              
	var errormes = '';                       
	$.each(data.message, function(i, mes) {   
	errormes        += mes[1]+"\n";           
	});                                     
	
	alert(errormes);                     
	}	 
	} 
    }); 
	return false;
	}
	

function maximum(x){
	if(x == 'metal'){
		$("#ress_metal").val($("#ship_metal").val().replace(/\./g, ''));
	}else if(x == 'crystal'){
		$("#ress_crystal").val($("#ship_crystal").val().replace(/\./g, ''));
	}else if(x == 'deuterium'){
		$("#ress_deuterium").val($("#ship_deuterium").val().replace(/\./g, ''));
	}else{
		$("#ship_"+x).val($("#"+x).val().replace(/\./g, ''));
	}
}

function maxships(){
	maximum('metal');
	maximum('crystal');
	maximum('deuterium');
	maximum('202');
	maximum('203');
	maximum('204');
	maximum('205');
	maximum('206');
	maximum('207');
	maximum('208');
	maximum('209');
	maximum('210');
	maximum('211');
	maximum('212');
	maximum('213');
	maximum('214');
	maximum('215');
	maximum('216');
	maximum('217');
	maximum('218');
	maximum('219');
	maximum('220');
	maximum('221');
	maximum('222');
	maximum('224');
	maximum('229');
	
}

$(document).ready(function() {
	$('#dest').change(function(){
		//function to get the fleet from a planet
		$('#fleet_table').empty();
		$('#fleet_table').load("game.php?page=jumpspecial&mode=ajax&pid="+$(this).val());
	});
	$('#dest2').change(function(){
		if($('#dest').val() <=0){
			alert('First select FROM tab');
			$("select[name='dest2'] option:[value=null]").attr('selected',true);
		}else{
			$('#x2').val($(this).val());
		}
		
	});
	$('#reset').click(function(){
		$.ajax({    
			type: "POST",     
			url: "game.php?page=jumpspecial&mode=reset",     
			success: function(data) {		
				data    = $.parseJSON(data);	   
				if(data.error === false) {                  
					if(data.message == 'OK') {                       
						$("#timer").html("Ready Now"); 
					}   
				} else {                              
	var errormes = '';                       
	$.each(data.message, function(i, mes) {   
	errormes        += mes[1]+"\n";           
	});                                     
	
	alert(errormes);                     
	}	 
	} 
    }); 
	return false;
	});
	
});
</script>

<div id="content">
<table>
	<tbody><tr>
			<th colspan="3" class="center" style="white-space:nowrap;"><font color="#4495D0" size="2"><b>Planet Jump</b></font></th>
		</tr>
	
	<tr>
		<td colspan="2">
			<font color="#4495D0">Planet Jump is a feature that enables you to jump all of your fleet and resources from planet to planet.<br>This feature costs <font color="#EE0000">15.000 <font color="#4495D0">Dark Matter.</font><br>

		</font></font></td>
	</tr>
	<tr>
		<td><font color="#4495D0">From</font></td><td><font color="#4495D0">To</font></td>
	</tr>
	<tr>
		<td>
			<select name="dest" id="dest">
				<option value="0">---</option>
										{html_options options=$PlanetSelect}
							</select>
		</td>
		
			<td>
						<select name="dest2" id="dest2">
			<option value="null">---</option>
										{html_options options=$PlanetSelect}
							</select>
					</td>
					
					
	{*	<td>
						<font color="#4495D0">You do not have any planet in the "Planet Jump" Range</font>
					</td> *}
	</tr>
	<tr>
		<td colspan="2">
			<div id="fleet_table">
			<font color="#4495D0">Please select the planet FROM first</font>
			</div>
			
			
			
		</td>
	</tr>
	
</tbody></table>
</div>
{/block}
