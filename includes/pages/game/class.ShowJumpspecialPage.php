<?php


class ShowJumpspecialPage extends AbstractPage
{
    public static $requireModule = 0;
    
    function __construct()
    {
        parent::__construct();
    }
	
	function dos()
    {
    global  $USER, $PLANET, $LNG, $LANG,$CONF,$UNI;
	
	$x1   = $_POST['x1'];
	$x2   = $_POST['x2'];
	$ship_metal   = $_POST['ship_metal'];
	$ship_crystal   = $_POST['ship_crystal'];
	$ship_deuterium   = $_POST['ship_deuterium'];
	
	if($USER['darkmatter'] < 15000){
	$this->sendJSON(array('error' => true, 'message' => 'You dont have enough darkmatter'));
	}else{
	$USER['darkmatter'] -= 15000;
	$GLOBALS['DATABASE']->multi_query("UPDATE ".PLANETS." SET metal = metal - ".$ship_metal.", crystal = crystal - ".$ship_crystal.", deuterium = deuterium - ".$ship_deuterium." WHERE `id` = '".$x1."'; UPDATE ".PLANETS." SET metal = metal + ".$ship_metal.", crystal = crystal + ".$ship_crystal.", deuterium = deuterium + ".$ship_deuterium." WHERE `id` = '".$x2."' ");
	$this->sendJSON(array('error' => false, 'message' => 'OK'));
	}
 
    }
	
	
    function ajax()
    {
    global  $USER, $PLANET, $LNG, $LANG,$CONF,$UNI,$resource,$reslist;
	
	$PlanetRess = new ResourceUpdate();
	$PlanetRess->CalcResource();
	$PlanetRess->SavePlanetToDb();
	$this->setWindow('ajax');
	$pid   = HTTP::_GP('pid', 0);
	$PlanetsRAW = $GLOBALS['DATABASE']->query("SELECT * FROM ".PLANETS." WHERE id = '".$pid."';");
	$PLANETS	= array($PLANET);
	while($CPLANET = $GLOBALS['DATABASE']->fetch_array($PlanetsRAW))
	{
	foreach($reslist['fleet'] as $elementID) {
	if($CPLANET[$resource[$elementID]] > 0){
	$planetList['fleet'][$elementID][$CPLANET['id']]	= $CPLANET[$resource[$elementID]];
	}
	}
	}			
		
	
			
	$sur = $GLOBALS['DATABASE']->uniquequery("SELECT id, metal, crystal, deuterium FROM ".PLANETS." where `id` = '".$pid."';");
	
    $this->tplObj->assign_vars(array(
	'planetList' => $planetList,
	'metal' => pretty_number($sur['metal']),
	'metalll' => $sur['metal'],
	'crystal' => pretty_number($sur['crystal']),
	'crystalll' => $sur['crystal'],
	'deuterium' => pretty_number($sur['deuterium']),
	'deuteriummm' => $sur['deuterium'],
	'magaph' => $sur['id'],
    ));
    $this->display('page.planetjumpload.default.tpl');
    }
	
	
    function show()
    {
    global  $USER, $PLANET, $LNG, $LANG,$CONF,$UNI;
	$PlanetRess = new ResourceUpdate();
	$PlanetRess->CalcResource();
	$PlanetRess->SavePlanetToDb();
    $this->tplObj->assign_vars(array(
    ));
    $this->display('page.planetjump.default.tpl');
    }
}
?>