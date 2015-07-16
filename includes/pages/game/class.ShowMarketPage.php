<?php

class ShowMarketPage extends AbstractPage
{
            
	function __construct() 
	{
		parent::__construct();
	}
	
	function show(){
		global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	
		$BuddyListResult	= $GLOBALS['DATABASE']->query("SELECT 
		a.sender, a.state, a.time, a.id as buddyid, 
		b.id, b.username, b.avatar, b.onlinetime, b.galaxy, b.system, b.planet, b.ally_id,
		c.ally_name, c.ally_tag,
		d.text
		FROM (".BUDDY." as a, ".USERS." as b) 
		LEFT JOIN ".ALLIANCE." as c ON c.id = b.ally_id
		LEFT JOIN ".BUDDY_REQUEST." as d ON a.id = d.id
		WHERE 
		(a.sender = ".$USER['id']." AND a.owner = b.id AND a.state = 0) OR 
		(a.owner = ".$USER['id']." AND a.sender = b.id AND a.state = 0);");
		
		$BuddyListResult1	= $GLOBALS['DATABASE']->query("SELECT 
		a.sender, a.state, a.time, a.id as buddyid, 
		b.id, b.username, b.avatar, b.onlinetime, b.galaxy, b.system, b.planet, b.ally_id,
		c.ally_name, c.ally_tag,
		d.text
		FROM (".BUDDY." as a, ".USERS." as b) 
		LEFT JOIN ".ALLIANCE." as c ON c.id = b.ally_id
		LEFT JOIN ".BUDDY_REQUEST." as d ON a.id = d.id
		WHERE 
		(a.sender = ".$USER['id']." AND a.owner = b.id AND a.state = 1) OR 
		(a.owner = ".$USER['id']." AND a.sender = b.id AND a.state = 1);");
		
		$BuddyListResult2	= $GLOBALS['DATABASE']->query("SELECT 
		a.sender, a.state, a.time, a.id as buddyid, 
		b.id, b.username, b.avatar, b.onlinetime, b.galaxy, b.system, b.planet, b.ally_id,
		c.ally_name, c.ally_tag,
		d.text
		FROM (".BUDDY." as a, ".USERS." as b) 
		LEFT JOIN ".ALLIANCE." as c ON c.id = b.ally_id
		LEFT JOIN ".BUDDY_REQUEST." as d ON a.id = d.id
		WHERE 
		(a.sender = ".$USER['id']." AND a.owner = b.id AND a.state = 2) OR 
		(a.owner = ".$USER['id']." AND a.sender = b.id AND a.state = 2);");
				
		$myRequestList		= array();
		$otherRequestList	= array();
		$myBuddyList		= array();	
		$myRequestList1		= array();
		$otherRequestList1	= array();
		$myBuddyList1		= array();	
		$myRequestList2		= array();
		$otherRequestList2	= array();
		$myBuddyList2		= array();	
		
		while($BuddyList = $GLOBALS['DATABASE']->fetch_array($BuddyListResult))
		{
			
	
				$BuddyList['onlinetime']			= 'Inconnue';
				$BuddyList['signtime']			= date('d/m/Y H:i:s', $BuddyList['time']);
				$BuddyList['rank']			= $this->getUserRank($BuddyList['id']);
				$myBuddyList[$BuddyList['buddyid']]	= $BuddyList;
			
		}
		
		while($BuddyList1 = $GLOBALS['DATABASE']->fetch_array($BuddyListResult1))
		{
			
				$BuddyList1['onlinetime']			= floor((TIMESTAMP - $BuddyList1['onlinetime']) / 60);
				$BuddyList1['signtime']			= date('d/m/Y H:i:s', $BuddyList1['time']);
				$BuddyList1['rank']			= $this->getUserRank($BuddyList1['id']);
				$myBuddyList1[$BuddyList1['buddyid']]	= $BuddyList1;
			
		}
		
		while($BuddyList2 = $GLOBALS['DATABASE']->fetch_array($BuddyListResult2))
		{
			
				$BuddyList2['onlinetime']			= floor((TIMESTAMP - $BuddyList2['onlinetime']) / 60);
				$myBuddyList2[$BuddyList2['buddyid']]	= $BuddyList2;
				$BuddyList2['rank']			= $this->getUserRank($BuddyList2['id']);
				$myBuddyList2['signtime']			= date('d/m/Y H:i:s', $myBuddyList2['time']);
			
		}
		
		$GLOBALS['DATABASE']->free_result($BuddyListResult);
		$multiData = array();
		$sender	= $GLOBALS['DATABASE']->query("SELECT owner_1, owner_2 FROM ".DIPLO." WHERE accept = '1';");
		while($xb = $GLOBALS['DATABASE']->fetch_array($sender)){
		$Statement = 0;
		if($xb['owner_1'] == $USER['ally_id']){
		$Statement = $xb['owner_2'];
		}else{
		$Statement = $xb['owner_1'];	
		}
		
		$sender	= $GLOBALS['DATABASE']->query("SELECT id FROM ".USERS." WHERE ally_id = ".$Statement.";");
		while($xb = $GLOBALS['DATABASE']->fetch_array($sender)){
		$multiData[$xb['id']]	= array(
		'change_nick'		=> $this->getUsername($xb['id']),
		'avatar'		=> $this->getAvataris($xb['id']),
		'allyid'		=> $Statement,
		'nickname_ally'		=> '['.$this->getAllianceTag($Statement).']',
		);	
		}
		}
		
		
		$this->tplObj->assign_vars(array(	
			'myBuddyList'		=> $myBuddyList,
			'multiData'		=> $multiData,
			
			'myBuddyList1'		=> $myBuddyList1,
			
			'myBuddyList2'		=> $myBuddyList2,
			
		));
		
		$this->display("page.market.default.tpl");
	}
	
	function accept()
	{
		global $USER, $LNG;
		
		$id	= HTTP::_GP('id', 0);
				
		$GLOBALS['DATABASE']->query("UPDATE ".BUDDY." SET state = 1, time = ".(TIMESTAMP)." WHERE id = ".$id.";");		
		$sender	= $GLOBALS['DATABASE']->getFirstRow("SELECT sender, owner FROM ".BUDDY." WHERE id = ".$id.";");
		$message = ' <div style="text-align : justify;">
        '.$LNG['ls_market_55'].' '.$this->getUsername($sender['owner']).' <span class="orange">[testt]</span> '.$LNG['ls_market_56'].' '.$this->getUsername($sender['sender']).'. <span class="vert">'.$LNG['ls_market_57'].'</span>, 
        '.$LNG['ls_market_58'].' :
	</div>
    
	<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
        '.sprintf($LNG['ls_market_59'], $sender['owner']).'
		
	</div>

	<div class="explication_utilisateur">
		'.$LNG['ls_market_60'].'
	</div>';
		
		//SendSimpleMessage($sender['sender'], $USER['id'], TIMESTAMP, 4, $USER['username'], $LNG['bu_accepted_request_title'], sprintf($LNG['bu_accepted_request_body'], $sender['username'], $USER['username']));
		SendSimpleMessage($sender['sender'], $USER['id'], TIMESTAMP, 7, $USER['username'], $LNG['bu_accepted_request_title'], $message);
		
		$this->redirectTo("game.php?page=market");
	}
	
	function end()
	{
		global $USER, $LNG;
		
		$id	= HTTP::_GP('id', 0);
				
		$GLOBALS['DATABASE']->query("UPDATE ".BUDDY." SET state = 2, time = ".(TIMESTAMP)." WHERE id = ".$id.";");		
		$sender	= $GLOBALS['DATABASE']->getFirstRow("SELECT sender, owner FROM ".BUDDY." WHERE id = ".$id.";");
		$xx = $sender['sender'];
		if($USER['id'] == $sender['sender']){
		$xx = $sender['owner'];	
		}
		$message = '  <div style="text-align : justify;">
        '.$LNG['ls_market_55'].' '.$this->getUsername($USER['id']).' <span class="orange">[testt]</span> '.$LNG['ls_market_63'].' '.$this->getUsername($xx).' '.$LNG['ls_market_64'].'. 
        '.$LNG['ls_market_65'].' :
	</div>
    
	<div class="citation">
        <div class="guillemet ouvrir">«</div>
        <div class="guillemet fermer">»</div>
        
		 '.$LNG['ls_market_61'].'
	</div>

	<div class="explication_utilisateur">
		'.$LNG['ls_market_62'].'
	</div>';
		
		//SendSimpleMessage($sender['sender'], $USER['id'], TIMESTAMP, 4, $USER['username'], $LNG['bu_accepted_request_title'], sprintf($LNG['bu_accepted_request_body'], $sender['username'], $USER['username']));
		SendSimpleMessage($sender['sender'], $USER['id'], TIMESTAMP, 7, $USER['username'], $LNG['bu_rejected_request_title'], $message);
		SendSimpleMessage($owner['owner'], $USER['id'], TIMESTAMP, 7, $USER['username'], $LNG['bu_rejected_request_title'], $message);
		
		$this->redirectTo("game.php?page=market");
	}
	
	function echange(){
		global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
		$multiData = array();
		$GeTransport = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_transport_player` WHERE senderID = ".$USER['id']." OR receiverID = ".$USER['id'].";");
		$GeTransportCount =$GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM `uni1_transport_player` WHERE senderID = ".$USER['id']." OR receiverID = ".$USER['id'].";");
		while($xb = $GLOBALS['DATABASE']->fetch_array($GeTransport)){
		$Statement = 0;
		if($xb['senderID'] == $USER['id']){
		$Statement = $xb['receiverID'];
		}else{
		$Statement = $xb['senderID'];	
		}
		$getuserAlly = $GLOBALS['DATABASE']->query("SELECT ally_id FROM `uni1_users` WHERE id = ".$Statement.";");
		$getuserAlly = $GLOBALS['DATABASE']->fetch_array($getuserAlly);
		
		$multiData[$xb['transportID']]	= array(
			'change_nick'		=> $xb['senderID'] == $USER['id'] ? $this->getUsername($xb['receiverID']) : $this->getUsername($xb['senderID']),
			'avatar'		=> $xb['senderID'] == $USER['id'] ? $this->getAvataris($xb['receiverID']) : $this->getAvataris($xb['senderID']),
			'timeoftransport'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], ($xb['time'])), $USER['timezone']),
			'push'		=> pretty_number($xb['push']),
			'nickname_ally'		=> $getuserAlly['ally_id'] != 0 ? '['.$this->getAllianceTag($getuserAlly['ally_id'].']') : '',
			'status'		=> $xb['senderID'] == $USER['id'] ? 'expedition' : 'reception',
			'statusbis'		=> $xb['senderID'] == $USER['id'] ? $LNG['ls_answer_3'] : $LNG['ls_answer_4'],
			'strongest'		=> $xb['strongest'] == $USER['id'] ? 'vert' : 'rouge',
			'infouser'		=> $xb['senderID'] == $USER['id'] ? $xb['receiverID'] : $xb['senderID'],
			'metal'		=> pretty_number($xb['resource_metal']),
			'crystal'		=> pretty_number($xb['resource_crystal']),
			'deuterium'		=> pretty_number($xb['resource_deuterium']),
			'elyrium'		=> pretty_number($xb['resource_elyrium']),
			'population301'		=> pretty_number($xb['population301']),
			'population302'		=> pretty_number($xb['population302']),
			'population303'		=> pretty_number($xb['population303']),
			'population304'		=> pretty_number($xb['population304']),
			'population305'		=> pretty_number($xb['population305']),
			'population306'		=> pretty_number($xb['population306']),
			'population307'		=> pretty_number($xb['population307']),
		);
		}
		$this->tplObj->loadscript('commerce.js');
		$this->tplObj->assign_vars(
		array(
        'multiData' => $multiData,                                
        'GeTransportCount' => pretty_number($GeTransportCount),                                
                                        )
		);
		$this->display("page.market.echange.tpl");
	}
	
	function converter(){
		global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	
		$this->tplObj->assign_vars(
				array(
                                
                                        )
		);
		$this->display("page.market.converter.tpl");
	} 
	
	function detail(){
	global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
	$id	= HTTP::_GP('id', 0);
	$GeTransport = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_transport_player` WHERE transportID = ".$id.";");
	while($xb = $GLOBALS['DATABASE']->fetch_array($GeTransport)){
	$Statement = 0;
	if($xb['senderID'] == $USER['id']){
	$Statement = $xb['receiverID'];
	}else{
	$Statement = $xb['senderID'];	
	}
	$times = str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], ($xb['time'])), $USER['timezone']);
	$times2 = str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], ($xb['time'] + 48*3600)), $USER['timezone']);
	$Statement = 0;
	$StatementBis = 0;
	if($xb['senderID'] == $USER['id']){
	$Statement = $xb['receiverID'];
	$StatementBis = $xb['senderID'];
	}else{
	$Statement = $xb['senderID'];	
	$StatementBis = $xb['receiverID'];	
	}
	$timing		= $xb['time'];
	$myUsername		= $this->getUsername($StatementBis);
    $otherUsername		= $this->getUsername($Statement);
	$strongest		= $xb['strongest'] == $StatementBis ? 'rouge' : 'vert';
	$strongestbis		= $xb['strongest'] == $StatementBis ? 'vert' : 'rouge';
	}
	

	$GeTotalSend = $GLOBALS['DATABASE']->query("SELECT SUM(resource_metal) as total_metal, SUM(resource_crystal) as total_crystal, SUM(resource_deuterium) as total_deuterium, SUM(resource_elyrium) as total_elyrium, SUM(population301) as total_301, SUM(population302) as total_302, SUM(population303) as total_303, SUM(population304) as total_304, SUM(population305) as total_305, SUM(population306) as total_306, SUM(population307) as total_307  FROM `uni1_transport_player` WHERE senderID = ".$USER['id']." AND receiverID = ".$Statement." AND time >= ".$timing." AND time <= ".($timing + 48*3600).";");
	$GeTotalSendNext = $GLOBALS['DATABASE']->query("SELECT SUM(resource_metal) as total_metal, SUM(resource_crystal) as total_crystal, SUM(resource_deuterium) as total_deuterium, SUM(resource_elyrium) as total_elyrium, SUM(population301) as total_301, SUM(population302) as total_302, SUM(population303) as total_303, SUM(population304) as total_304, SUM(population305) as total_305, SUM(population306) as total_306, SUM(population307) as total_307  FROM `uni1_transport_player` WHERE senderID = ".$Statement." AND receiverID = ".$USER['id']." AND time >= ".$timing." AND time <= ".($timing + 48*3600).";");
	$total  = $GLOBALS['DATABASE']->fetch_array($GeTotalSend);
	$totalNext  = $GLOBALS['DATABASE']->fetch_array($GeTotalSendNext);
	$INFORS = $total['total_metal'] + $total['total_crystal']*2 + $total['total_deuterium']*3 + $total['total_elyrium']*4 + $total['total_301']*20 + $total['total_302']*60 + $total['total_303']*80 + $total['total_304']*1000 + $total['total_305']*400 + $total['total_306']*240 + $total['total_307']*880;
	$INFORST = $totalNext['total_metal'] + $totalNext['total_crystal']*2 + $totalNext['total_deuterium']*3 + $totalNext['total_elyrium']*4 + $totalNext['total_301']*20 + $totalNext['total_302']*60 + $totalNext['total_303']*80 + $totalNext['total_304']*1000 + $totalNext['total_305']*400 + $totalNext['total_306']*240 + $totalNext['total_307']*880;
	$this->tplObj->assign_vars(
	array(
	'totals'		=> $INFORS == 0 ? 1 : $INFORS ,                           
	'totalNexts'		=> $INFORST == 0 ? 1 : $INFORST,      
	
    'myUsername'		=> $myUsername,
    'otherUsername'		=> $otherUsername,
	'strongest'		=> $strongest,
	'strongestbis'		=> $strongestbis,
    'times'		=> $times,
	'times2'		=> $times2,                           
	'total'		=> pretty_number($total['total_metal'] + $total['total_crystal']*2 + $total['total_deuterium']*3 + $total['total_elyrium']*4 + $total['total_301']*20 + $total['total_302']*60 + $total['total_303']*80 + $total['total_304']*1000 + $total['total_305']*400 + $total['total_306']*240 + $total['total_307']*880),                           
	'totalNext'		=> pretty_number($totalNext['total_metal'] + $totalNext['total_crystal']*2 + $totalNext['total_deuterium']*3 + $totalNext['total_elyrium']*4 + $totalNext['total_301']*20 + $totalNext['total_302']*60 + $totalNext['total_303']*80 + $totalNext['total_304']*1000 + $totalNext['total_305']*400 + $totalNext['total_306']*240 + $totalNext['total_307']*880),                           
    ));
	$this->display("page.market.detail.tpl");
	} 
	
	function push(){
		global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
		$multiData = array();
		$GeTransport = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_transport_player` WHERE senderID = ".$USER['id']." AND legal = 1 OR receiverID = ".$USER['id']." AND legal = 1;");
		while($xb = $GLOBALS['DATABASE']->fetch_array($GeTransport)){
		$Statement = 0;
		if($xb['senderID'] == $USER['id']){
		$Statement = $xb['receiverID'];
		}else{
		$Statement = $xb['senderID'];	
		}
		$timing		= $xb['time'];
		$GeTotalSend = $GLOBALS['DATABASE']->query("SELECT SUM(resource_metal) as total_metal, SUM(resource_crystal) as total_crystal, SUM(resource_deuterium) as total_deuterium, SUM(resource_elyrium) as total_elyrium, SUM(population301) as total_301, SUM(population302) as total_302, SUM(population303) as total_303, SUM(population304) as total_304, SUM(population305) as total_305, SUM(population306) as total_306, SUM(population307) as total_307  FROM `uni1_transport_player` WHERE senderID = ".$USER['id']." AND receiverID = ".$Statement." AND time >= ".$timing." AND time <= ".($timing + 48*3600).";");
		$GeTotalSendNext = $GLOBALS['DATABASE']->query("SELECT SUM(resource_metal) as total_metal, SUM(resource_crystal) as total_crystal, SUM(resource_deuterium) as total_deuterium, SUM(resource_elyrium) as total_elyrium, SUM(population301) as total_301, SUM(population302) as total_302, SUM(population303) as total_303, SUM(population304) as total_304, SUM(population305) as total_305, SUM(population306) as total_306, SUM(population307) as total_307  FROM `uni1_transport_player` WHERE senderID = ".$Statement." AND receiverID = ".$USER['id']." AND time >= ".$timing." AND time <= ".($timing + 48*3600).";");
		$total  = $GLOBALS['DATABASE']->fetch_array($GeTotalSend);
		$totalNext  = $GLOBALS['DATABASE']->fetch_array($GeTotalSendNext);
		$totals		= $total['total_metal'] + $total['total_crystal']*2 + $total['total_deuterium']*3 + $total['total_elyrium']*4 + $total['total_301']*20 + $total['total_302']*60 + $total['total_303']*80 + $total['total_304']*1000 + $total['total_305']*400 + $total['total_306']*240 + $total['total_307']*880;                           
		$totalNexts		= $totalNext['total_metal'] + $totalNext['total_crystal']*2 + $totalNext['total_deuterium']*3 + $totalNext['total_elyrium']*4 + $totalNext['total_301']*20 + $totalNext['total_302']*60 + $totalNext['total_303']*80 + $totalNext['total_304']*1000 + $totalNext['total_305']*400 + $totalNext['total_306']*240 + $totalNext['total_307']*880;
		
		$totals = $totals;
		if($totals == 0){
		$totals = 1;
		}
		
		if (100-(100/$totals*$totalNexts) < 25 && 100-(100/$totals*$totalNexts) >=0){
		$GLOBALS['DATABASE']->query("UPDATE uni1_transport_player SET `legal` = '1', `delete` = '".(TIMESTAMP + 24*3600)."' WHERE transportID = ".$xb['transportID'].";");	
		}elseif (100-(100/$totals*$totalNexts) > -25 && 100-(100/$totals*$totalNexts) <=0){
		$GLOBALS['DATABASE']->query("UPDATE uni1_transport_player SET `legal` = '1', `delete` = '".(TIMESTAMP + 24*3600)."' WHERE transportID = ".$xb['transportID'].";");		
		}
		$getuserAlly = $GLOBALS['DATABASE']->query("SELECT ally_id FROM `uni1_users` WHERE id = ".$Statement.";");
		$getuserAlly = $GLOBALS['DATABASE']->fetch_array($getuserAlly);
		$multiData[$xb['transportID']]	= array(
		'change_nick'		=> $xb['senderID'] == $USER['id'] ? $this->getUsername($xb['receiverID']) : $this->getUsername($xb['senderID']),
		'avatar'		=> $xb['senderID'] == $USER['id'] ? $this->getAvataris($xb['receiverID']) : $this->getAvataris($xb['senderID']),
		'nickname_ally'		=> $getuserAlly['ally_id'] != 0 ? '['.$this->getAllianceTag($getuserAlly['ally_id'].']') : '',
		'infouser'		=> $xb['senderID'] == $USER['id'] ? $xb['receiverID'] : $xb['senderID'],
		'strongest'		=> $xb['strongest'] == $USER['id'] ? 'vert' : 'rouge',
		'totals'		=> $totals == 0 ? 1 : $totals,
		'totalNexts'		=> $totalNexts == 0 ? 1 : $totalNexts,
		);	
		}
		
		
		
		$this->tplObj->assign_vars(
				array(
            'multiData' => $multiData,                       
                                        )
		);
		$this->display("page.market.push.tpl");
	}
	  
		function multi(){
		global $USER, $PLANET, $LNG, $UNI, $CONF,$resource,$pricelist;
		$GetIp = $GLOBALS['DATABASE']->query("SELECT DISTINCT ipaddress FROM `uni1_iplog` WHERE userID = ".$USER['id'].";");
		$message = '';
		$multiData = array();
		$messageList = array();
		while($xy = $GLOBALS['DATABASE']->fetch_array($GetIp)){
		$multi_sniffer = isset($xy['ipaddress']) ? $xy['ipaddress'] : ''; 
		}
		
		if(isset($multi_sniffer)){
		$GetendIp = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_iplog` WHERE userID != ".$USER['id']." AND ipaddress = '".$multi_sniffer."';");
		while($xb = $GLOBALS['DATABASE']->fetch_array($GetendIp)){
		$getuserAlly = $GLOBALS['DATABASE']->query("SELECT ally_id FROM `uni1_users` WHERE id = ".$xb['userID'].";");
		$getuserAlly = $GLOBALS['DATABASE']->fetch_array($getuserAlly);
		
		
		$multiData[$xb['logID']]	= array(
			'multi_nickname'		=> $this->getUsername($xb['userID']),
			'avatar'		=> $this->getAvataris($xb['userID']),
			'multi_nickname_ally'		=> $getuserAlly['ally_id'] != 0 ? '['.$this->getAllianceTag($getuserAlly['ally_id'].']') : '',
			'multi_id'		=> $xb['logID'],
			'multi_ip'		=> $xb['ipaddress'],
			'multi_uid'		=> $xb['userID'],
			'delete_date'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], ($xb['timestamp'] + 7*24*60*60)), $USER['timezone']),
		);
		}
		}
		$GetAll = $GLOBALS['DATABASE']->query("SELECT * FROM `uni1_iplog` WHERE userID = ".$USER['id']." ORDER BY timestamp desc LIMIT 15 ;");
		if($GLOBALS['DATABASE']->numRows($GetAll)>0){
		while($messageRow = $GLOBALS['DATABASE']->fetch_array($GetAll))
		{
		$messageList[$messageRow['logID']]	= array(
			'ipaddress'		=> $messageRow['ipaddress'],
			'date'		=> str_replace(' ', '&nbsp;', _date($LNG['php_tdformat'], $messageRow['timestamp']), $USER['timezone']),
			'browser'		=> $messageRow['browser'],
			'os'		=> $messageRow['os'],
		);
	}	
	}
	
		$this->tplObj->assign_vars(
		array(
        'messageList' => $messageList,                   
        'multiData' => $multiData,                   
         ));
		$this->display("page.market.multi.tpl");
	}
	
	
	}
	
	
