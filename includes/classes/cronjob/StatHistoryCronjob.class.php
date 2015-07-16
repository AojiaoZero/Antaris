<?php

class StatHistoryCronjob
{
	function run()
	{
		require_once(ROOT_PATH.'includes/classes/class.statbuilder.php');
		$stat			= new Statbuilder();
		$result			= $stat->MakeStats();
		Config::update(array(
			'stat_last_update'	=> TIMESTAMP			
		));
		$Data = $GLOBALS['DATABASE']->query("SELECT id_owner, universe, tech_points, build_points, defs_points, fleet_points, popu_points, total_points, total_rank FROM ".STATPOINTS." WHERE stat_type = 1;");
		$InsertData = array();
		
		while($i	= $GLOBALS['DATABASE']->fetch_array($Data))
		{
			$InsertData[] = "('".$i['id_owner']."','".TIMESTAMP."','".$i['universe']."','".$i['build_points']."','".$i['tech_points']."','".$i['defs_points']."','".$i['fleet_points']."','".$i['popu_points']."','".$i['total_points']."','".$i['total_rank']."')";
		}
		$InsertSQL = "TRUNCATE ".STATHISTORY.";INSERT INTO ".STATHISTORY." (`id_owner` ,`time` ,`universe` ,`history_build_points` ,`history_tech_points` ,`history_defs_points` ,`history_fleet_points`, `history_popu_points` , `history_total_points`, `history_total_rank`) VALUES ".implode(',',$InsertData).";";
		$GLOBALS['DATABASE']->multi_query($InsertSQL);
	}
}