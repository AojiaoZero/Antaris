  </div>
            <div class="espace"></div> <!-- On affiche le copyright -->
            <div id="bar_copyright">
                
                <span name="temps_execution">{$total_time}</span> sec <span style="float:right;"><select onchange="window.open(this.options[this.selectedIndex].value,'_top')">
				
				
				<option {if $langen == 2}selected{/if} value="game.php?page=changelang&langs=fr">French</option><option value="game.php?page=changelang&langs=de" {if $langen == 3}selected{/if}>Deutsch</option><option value="game.php?page=changelang&langs=en" {if $langen == 1}selected{/if}>English</option></select></span>
            </div>

        <!-- Fin de l'ensemble -->
        </div>

		
    </body>
</html>

