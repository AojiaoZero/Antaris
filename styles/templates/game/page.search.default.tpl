{block name="title" prepend}{$LNG.lm_search}{/block}
{block name="content"}
<script type="text/javascript">
var lgn = '{$LNG.search_error_1}';
</script>

<div id="page_contenu">
<h1>Search <span id="loading" style="display:none;">{$LNG.sh_loading}</span></h1>
			  <div class="categorie">
				<h2>{$LNG.sh_search_in_the_universe}</h2>
			



					<label for="recherche" style="margin-right : 7px;">Search : </label>
						<input type="text" id="searchtext" name="searchtext" style="width : 100px; margin-right : 20px;" />
					<label for="type" style="margin-right : 7px;">for : </label>
					
					{html_options options=$modeSelector name="type" id="type"}
					
					
					
					{*<label for="trier" style="margin-right : 7px;">Classer : </label>
						<select id="trier" name="trier" style="width : 120px; margin-right : 20px;">
							<option value="point">Points général</option>
							<option value="pseudo">Pseudo du joueur</option>
						</select>*}
					
					<input type="submit" id="valid_form" onclick="search();" name="valid_form" value="Show" />
				
				
				
				
				
			  </div>
			
			<div id="recherche_resultat">{$LNG.ls_search_1}	</div>
				</div>
				

		
			  
{/block}