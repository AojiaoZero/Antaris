{block name="title" prepend}{$LNG.lm_logout}{/block}
{block name="content"}
  <div id="curseur" class="infobulle"></div>
        
        <!-- Le haut de la page : image d'Antaris Legacy -->
        <div id="header"></div>
        
        <!-- Pour afficher la version de l'univers -->
        <div id="version_univers"></div>
        
                <div id="fenetre_information">
            <div class="bar superieure"></div>
        <div id="page_contenu"><h1>Disconnecting account</h1>
              <div class="texte"><span class="couleur_theme">You are disconnected from the account.</span><br>You will be redirected to the home page.<br><br>
                              Antaris Legacy wish you a good day. See you soon!</div></div>                    <div class="bar inferieure"></div>
        </div>
       
{/block}


{block name="script" append}
<script type="text/javascript">
    var second = 5;
	function Countdown(){
		if(second == 0)
			return;
			
		second--;
		$('#seconds').text(second);
	}
	window.setTimeout("window.location.href='./index.php'", 5000);
	window.setInterval("Countdown()", 1000);
</script>
{/block}