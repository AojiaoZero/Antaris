{block name="title" prepend}{$LNG.lm_galaxy}{/block}
{block name="content"}
{for $planet=1 to 10}
{$currentPlanet = $GalaxyRows[$planet]}
{if $currentPlanet.debris}
<area hidden onmouseout="cache();" onmouseover="montre('Rubble in orbit :<br />                                        - Iron : <span class=orange>{$currentPlanet.debris.metal|number}</span> units<br />                                        - Gold : <span class=orange>{$currentPlanet.debris.crystal|number}</span> units<br />                                        - Crystal : <span class=orange>{$currentPlanet.debris.deuterium|number}</span> units');" onclick="javascript:doit(8, {$currentPlanet.planet.id});" {if $currentPlanet.planet.planetshow == 1}coords="266,338,36"{elseif $currentPlanet.planet.planetshow == 2}coords="666,338,36"{elseif $currentPlanet.planet.planetshow == 3}coords="146,259,36"{elseif $currentPlanet.planet.planetshow == 4}coords="112,107,36"{elseif $currentPlanet.planet.planetshow == 5}coords="444,120,36"{elseif $currentPlanet.planet.planetshow == 6}coords="620,190,36"{elseif $currentPlanet.planet.planetshow == 7}coords="497,397,36"{elseif $currentPlanet.planet.planetshow == 8}coords="674,257,36"{elseif $currentPlanet.planet.planetshow == 9}coords="297,175,36"{elseif $currentPlanet.planet.planetshow == 10}coords="370,400,36"{/if}   shape="circle" data-lien="$currentPlanet.planet.planetshow" name="champ_ruine">
	{/if}	
	{/for}
		{/block}