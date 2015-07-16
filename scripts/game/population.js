function totalite()
{
var p0 = $("#totalos_301").val();
var p1 = $("#totalos_302").val();
var p2 = $("#totalos_303").val();
var p3 = $("#totalos_304").val();
var p4 = $("#totalos_305").val();
var p5 = $("#totalos_306").val();
var p6 = $("#totalos_307").val();

var total = Math.round(Number(p0)+Number(p1)+Number(p2)+Number(p3)+Number(p4)+Number(p5)+Number(p6));
var unused = NumberGetHumanReadable(formationBis - total);
if (total > formationBis){
$('#valid_forming').prop('disabled', true);
$('#msg_affectation_prod').html('<span class="rouge">Your barracks do not produce enough training unit to make these changes.</span>');
} else {
$('#valid_forming').prop('disabled', false);
$('#msg_affectation_prod').html('<span class="vert">The form is properly filled. It remains '+unused+' unused training units.</span>');
}
	
} 
function calculation(id)
{
	var population = $("#population_"+id).val();
	var cost = 0;
	
	if(id == 301){
	cost = 1;}
	else if(id == 302){
	cost = 3;	}
	else if(id == 303){
	cost = 4;}
	else if(id == 304){
	cost = 50;	}
	else if(id == 305){
	cost = 20;	}
	else if(id == 306){
	cost = 12;	}
	else if(id == 307){
	cost = 44;	}
	
	var total_quantite = population * cost;
	$("#total_"+id).text(total_quantite);
	$("#totalos_"+id).val(total_quantite);
	totalite();
	

}

