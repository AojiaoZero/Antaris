{block name="title" prepend}Planet Jump{/block}
{block name="content"}

<form method="POST" action="game.php?page=jumpspecial&mode=dos" name="fleet_form" id="fleet_form"><table><tbody><tr><td colspan="2">Resources</td></tr><tr><td>Metal({$metal})<input name="ship_metal" id="ship_metal" value="{$metalll}" type="hidden"><input name="max" value="max" onclick="maximum('metal')" type="button"></td><td><input name="ress_metal" id="ress_metal" value="0" type="text"></td></tr><tr><td>Crystal({$crystal})<input name="ship_crystal" id="ship_crystal" value="{$crystalll}" type="hidden"><input name="max" value="max" onclick="maximum('crystal')" type="button"></td><td><input name="ress_crystal" id="ress_crystal" value="0" type="text"></td></tr><tr><td>Deuterium({$deuterium})<input name="ship_deuterium" id="ship_deuterium" value="{$deuteriummm}" type="hidden"><input name="max" value="max" onclick="maximum('deuterium')" type="button"></td><td><input name="ress_deuterium" id="ress_deuterium" value="0" type="text"></td></tr><tr><td>Ship</td><td>Count</td></tr>
{foreach $planetList.fleet as $elementID=> $fleetArray}
<tr><td>{$LNG.tech.$elementID}{foreach $fleetArray as $planetID=> $fleet}({$fleet|number}){/foreach}<input name="{$elementID}" id="{$elementID}" value="{$fleet}" type="hidden"><input name="max" value="max" onclick="maximum('{$elementID}')" type="button"></td><td><input name="ship_{$elementID}" id="ship_{$elementID}" value="0" type="text"></td></tr>{/foreach}
			<tr>
				<td>
					Get All
				</td>
			
				{*<td>
					<input value="Get ALL" id="ALL" name="ALL ships" onclick="maxships();" type="button">
				</td>*}
			</tr>
			<tr><td colspan="2">
			<input name="x1" id="x1" value="{$magaph}" type="hidden">
			<input name="x2" id="x2" type="hidden">
			<input value="JUMP" id="jump" name="jump" onclick="do_jump();" type="button"></td></tr></tbody></table></form>
			{/block}