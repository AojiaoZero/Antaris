{block name="title" prepend}{$LNG.fcm_info}{/block}
{block name="content"}
 <script>
	  $(function(){
		$("#paypal_form").submit();
	  });
	  </script>
<div id="page_contenu"><h1>{$LNG.fcm_info}</h1><div id="div_achat">    <div class="categorie">
                <form method="post" id="paypal_form" name="paypal_form" action="https://www.paypal.com/cgi-bin/webscr">
	  {foreach from=$fields item=i key=k}
		{$i.text}
	  {/foreach}
               <h3>Your request is being processed and you will be redirected to the PayPal site.</h3>
			   
			   <br>This process takes 5 seconds. If you are not redirected automatically ...<br><br>After Payment do no forget to hit the BACK BUTTON ,it will deposit the DM to your account....<br><br><input type="submit" value="CLICK here">
              </div>
              </div></div>       </form>             <!-- Fin du corps -->
            <div class="espace"></div>
{/block}


