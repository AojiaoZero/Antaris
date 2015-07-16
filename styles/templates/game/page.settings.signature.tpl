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
	<div id="div_profil_onglet"><div id="signature_compte" class="categorie">
						<h2>{$LNG.ls_settings_27}</h2>
						{$LNG.ls_settings_28}
						
						<img src="userpic.php?id={$userID}" alt="" width="590" height="95" id="userpic">
						<div class="lien_signature">
							<u>{$LNG.ls_settings_29} : </u>
							<p>{$smarty.const.PROTOCOL}{$smarty.const.HTTP_HOST}{$smarty.const.HTTP_ROOT}{if $ref_active}index.php?ref={$userid}{/if}</p>
							<u>{$LNG.ls_settings_30} : </u>
							<p>{$smarty.const.PROTOCOL}{$smarty.const.HTTP_HOST}{$smarty.const.HTTP_ROOT}{if $ref_active}userpic.php?id={$userid}{/if}</p>
							
							
							
						</div>
					  </div>	</div></div></div>     </div>                <!-- Fin du corps -->
            <div class="espace"></div>
{/block}