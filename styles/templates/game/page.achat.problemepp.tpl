{block name="title" prepend}Allopass purchase error{/block}
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
            {$LNG.lm_achat_problem_13}
			
			<form method="post">         
                          <table>
                            <tbody><tr>
                              <td><b>{$LNG.lm_achat_problem_4} :</b></td>
                              <td>{$pusername} (<i>#{$paid}</i>)</td>
                            </tr>
                            <tr>
                                <td><label for="code_allopass">Pin Code</label> <i>{$LNG.lm_achat_problem_12}</i> <b>:</b></td>
                                <td><input id="code0" name="code0" maxlength="4" size="4" type="text">-<input id="code1" name="code1" maxlength="4" size="4" type="text">-<input id="code2" name="code2" maxlength="4" size="4" type="text">-<input id="code3" name="code3" maxlength="4" size="4" type="text"></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input id="valid_form" name="valid_form" value="{$LNG.lm_achat_problem_9}" type="submit">
                                </td>
                            </tr>
                          </tbody></table>
                      </form>	</div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}