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
	
	
	<div id="div_profil_onglet">
					  <div id="avatar_compte" class="categorie">
						<h2>{$LNG.ls_settings_23}</h2>
						<div class="avatar">
							<img src="/media/files/{$avatar}" alt="L'avatar du joueur : {$usernamea}" />
						</div>
						<div class="information">
							{$LNG.ls_settings_24}
							<div style="text-align : center; padding-top : 15px;">
									<h3>{$LNG.ls_settings_25} :</h3>
							<div id="upload_avatar">
							 <form id="form_telechargement" enctype="multipart/form-data" action="?page=settings&mode=avatar" method="post"
								<div id="upload_message">Select an image via the button ...</div>
								<input name="fichier" type="file" id="fichier_a_uploader" />
								<input type="hidden" name="MAX_FILE_SIZE" value="800" />
								<input type="submit" name="submit" value="{$LNG.ls_settings_26}" />
								<div class="espace"></div>
								<div id="upload_queue"></div>
							</div>
							</form>


						
							</div>
						</div>
					  </div>	</div></div>    </div>                <!-- Fin du corps -->
            <div class="espace"></div>
{/block}