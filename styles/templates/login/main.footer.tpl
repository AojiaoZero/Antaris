  <!-- On affiche le copyright -->
            <div id="bar_copyright">
                <span id="temps_exec_page">{$total_time}</span> sec
				
				
		
            </div>
        
        <!-- Fin de l'ensemble -->
        </div>
    </body>
</html>
<div id="dialog" style="display:none;"></div>
		<script>
  (function(i,s,o,g,r,a,m){ i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ 
  (i[r].q=i[r].q||[]).push(arguments) },i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
   })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', '[YOUR GA]', 'auto');
  ga('send', 'pageview');

</script>
<script>
var LoginConfig = {
	'isMultiUniverse': {$isMultiUniverse|json},
	'referralEnable' : {$referralEnable|json},
	'basePath' : {$basepath|json}
};
</script>

</body>
</html>