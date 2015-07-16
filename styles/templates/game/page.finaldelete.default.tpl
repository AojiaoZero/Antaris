{block name="title" prepend}Session End{/block}
{block name="content"}
  <div id="curseur" class="infobulle"></div>
        
        <!-- Le haut de la page : image d'Antaris Legacy -->
        <div id="header"></div>
        
        <!-- Pour afficher la version de l'univers -->
        <div id="version_univers"></div>
        
                <div id="fenetre_information">
            <div class="bar superieure"></div>
        <div id="page_contenu"><h1>End of the session</h1>
              <div class="texte"><span class="orange">The session has expired and you must be logged in to access this page.</span><br>
                                  <i>Please log in through the portal of Space Of Antaris.</i>
                                  <br><br><a href="http://spaceofantaris.com" title="Return to the portal">Return to the portal of the game.</a></div></div>                    <div class="bar inferieure"></div>
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