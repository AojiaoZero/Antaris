var DecompteMethode = {
	/* -- Cette fonction permet de gÃ©rer dynamiquement les decomptes d'une page -- */
	gestion : function() {
		//-- L'instance Principal --
		var $this = this;
		
		$('.time_decompte').each(function(){
			var temps = $(this).attr('name');
			var id = $(this).attr('id');
		
			var trouve = false;
			for(var i = 0; i < $this.tab_decompte.length && trouve==false; i++)
				if(id == $this.tab_decompte[i]) trouve = true;
				
			if(!trouve){
				$this.tab_decompte.push(id);
				$this.actualiseDecompte(id, temps);
				GestionMethode.ecrireConsole('- On ajoute le compteur #' + id, 'log');
			}
			else 
				GestionMethode.ecrireConsole('- Le compteur #' + id + ' existe dÃ©jÃ .', 'attention');
		});
		
		$('.decompte_actualise').each(function(){
			var id = $(this).attr('id');
			var temps = Math.ceil($(this).attr('name'));
			
			var trouve = false;
			for(var i = 0; i < $this.tab_decompte.length && trouve==false; i++)
				if(id == $this.tab_decompte[i]) trouve = true;
				
			if(trouve) {
				clearTimeout($this.tab_decompte_val[id]);
				GestionMethode.detruireTabValeur(id, $this.tab_decompte);
				GestionMethode.detruireTabValeur(id, $this.tab_decompte_val);
			}
			
			if(temps > 0){
				if(trouve) 	GestionMethode.ecrireConsole('- Actualisation du compteur #' + id, 'attention');
				else		GestionMethode.ecrireConsole('- On ajoute le compteur #' + id, 'log');
				
				$this.tab_decompte.push(id);
				$this.actualiseDecompte(id, temps);
			}
			
			$(this).removeClass('decompte_actualise');
		});
	},
	
	/* -- Pour actualiser Ã  chaque seconde le dÃ©compte en javascript 
		- id_html = identifiant de l'Ã©lÃ©ment HTML
        - sec = le nombre de seconde pour le compte Ã  rebours -- */
	actualiseDecompte : function(id_html, sec){
		//-- L'instance Principal --
		var $this = this;
		
		if(document.getElementById(id_html) == null || document.getElementById(id_html) == '' || typeof(document.getElementById(id_html)) == 'undefined'){
			GestionMethode.detruireTabValeur(id_html, $this.tab_decompte);
			return false;
		}
		else {
			$('#' + id_html).text($this.format(sec--));
			var id_time = setTimeout(function() { $this.actualiseDecompte(id_html, sec); }, 1000);
			$this.tab_decompte_val[id_html] = id_time;
			return true;
		}
	},
	
	/* -- Pour afficher le temps dans un format hh:mm:ss Ã  partir du nombre de seconde 
		- nbSeconds = le nombre de seconde pour le compte Ã  rebours -- */
	format : function(nbSeconds) {
		var minutes = Math.floor(nbSeconds/60);
		
		if(nbSeconds <= 0)
			return 'TerminÃ©(e)';
		else {
			var secondes = Math.floor(nbSeconds % 60);
			var heures = Math.floor(minutes/60);
			minutes = minutes % 60;
			var jours = Math.floor(heures/24);
			heures = heures % 24;
			
			if(jours > 0)			return jours + 'j ' + heures + 'h ' + minutes + 'm ' + secondes + 's';
			else if(heures > 0)		return heures + 'h ' + minutes + 'm ' + secondes + 's';
			else if(minutes > 0)	return minutes + 'm ' + secondes + 's';
			else					return secondes + 's';
		}
	}
};

/* -- Les variables de la class DEcompteMethode :
	- tab_decompte = tableau contenant les identifiants des Ã©lÃ©ments HTML ayant un dÃ©compte Ã  afficher
	- tab_decompte_val = tableau contenant les identifiants des setTimeOut des dÃ©comptes -- */
DecompteMethode.tab_decompte = new Array();
DecompteMethode.tab_decompte_val = new Array();