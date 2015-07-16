{block name="title" prepend}Purchase Error{/block}
{block name="content"}
<div id="page_contenu"><h1>Credit Purchase(s)</h1><div class="onglet">
             <ul>
               <li><a href="?page=achat&mode=echange" title="{$LNG.lm_achat_exchange}">{$LNG.lm_achat_exchange}</a></li>
              <li><a href="?page=achat&mode=allopass" title="{$LNG.lm_achat_allo}">{$LNG.lm_achat_allo}</a></li>
              <li><a href="?page=achat&mode=paypal" title="{$LNG.lm_achat_paypal}">{$LNG.lm_achat_paypal}</a></li>
			   <li><a href="?page=achat&mode=paysafe" title="{$LNG.lm_achat_paysafe}">{$LNG.lm_achat_paysafe}</a></li>
              <li><a href="?page=achat&mode=historique" title="{$LNG.lm_achat_history}">{$LNG.lm_achat_history}</a></li> 
            </ul>
          </div><div id="div_achat"><div id="achat_probleme" class="categorie">
		  



            <h2>{$LNG.lm_achat_problem_1}</h2>
            {$LNG.lm_achat_problem_2}.
			
			<form id="choisir_methode" action="?page=achat&mode=probleme" method="post">
                  <label for="methode">Payment Gateway :</label>
                  <select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
				  <option value="" disabled="disabled" selected="selected">Select</option>
                      <option value="?page=achat&mode=problemea">Allopass</option>
                      <option value="?page=achat&mode=problemep">Paypal</option>
                      <option value="?page=achat&mode=problemepp">PaysafeCard</option>
                  </select>
                  <input id="valid_form" name="valid_form" value="Select" style="display : inline-block;" type="submit">
              </form>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
			
	

			
{/block}

