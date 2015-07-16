{block name="title" prepend}{$LNG.lm_options}{/block}
{block name="content"}
<div id="page_contenu"><h1>{$LNG.ls_settings_1}</h1><div id="page_profil">	<div class="onglet" style="margin-bottom : 0px; padding-bottom : 0px;">		<ul>			

<li><a href="?page=settings&mode=psuedo" title="{$LNG.ls_settings_2}">{$LNG.ls_settings_2}</a></li>		
<li><a href="?page=settings&mode=personal" title="{$LNG.ls_settings_3}">{$LNG.ls_settings_3}</a></li>			
<li><a href="?page=settings&mode=avatar" title="{$LNG.ls_settings_4}">{$LNG.ls_settings_4}</a></li>			
<li><a href="?page=settings&mode=signature" title="{$LNG.ls_settings_5}">{$LNG.ls_settings_5}</a></li>			
<li><a href="?page=settings&mode=design" title="{$LNG.ls_settings_57}">{$LNG.ls_settings_57}</a></li>
</ul>
	<div class="onglet">		<ul>			
	
	<li><a href="?page=settings&mode=password" title="{$LNG.ls_settings_6}">{$LNG.ls_settings_6}</a></li>			
	<li><a href="?page=settings&mode=vmode" title="{$LNG.ls_settings_7}">{$LNG.ls_settings_7}</a></li>			
	<li><a href="?page=settings&mode=delete" title="{$LNG.ls_settings_8}">{$LNG.ls_settings_8}</a></li>		
	
	</ul>		</div>
	<div id="div_profil_onglet"><div class="categorie">
						<h2>{$LNG.ls_settings_37}</h2>
						{$LNG.ls_settings_38}
						
						{if $vmoded == 0 && $vuntil > $timuing}
						<form id="form_pause" method="post">
							<span class="rouge">{$LNG.ls_settings_39}.</span><br /> 
                            <span class="gris">{$LNG.ls_settings_40} {$ddates}..</span>	
						{elseif $vmoded == 0 && $vuntil < $timuing}
						<form id="form_pause" method="post" action="game.php?page=settings">
						<input type="hidden" name="mode" value="vmodeSend">
						<span class="vert">{$LNG.ls_settings_41}.</span><br /> 
                            <span class="gris">{$LNG.ls_settings_42} {$ddate}.</span>
							<input type="submit" iname="valid_form" value="Go to vacation" />
							{elseif $vmoded == 1 && $vuntil > $timuing}
							<form id="form_pause" method="post">
							<span class="rouge">{$LNG.ls_settings_43}.</span><br /> 
                            <span class="gris">{$LNG.ls_settings_44} {$ddates}.</span>	
							{elseif $vmoded == 1 && $vuntil < $timuing}
							<form id="form_pause" method="post" action="game.php?page=settings">
						<input type="hidden" name="mode" value="vmodeEnd">
							<span class="rouge">{$LNG.ls_settings_45}.</span><br /> 
                            <input type="submit" iname="valid_form" value="{$LNG.ls_settings_46}" />							
							{/if}
							
							
						</form>
					  </div>	</div></div></div> </div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}