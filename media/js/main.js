//-- Quand la page est chargÃ©e --     
$(document).ready(function(){
    ApplicationMethode.initialiser();
    
    //-- Pour gÃ©rer la scrollBar (revenir en haut) --
    $(document).scroll(function(){
        ApplicationMethode.gererRetourEnHaut($(this).scrollTop());
    });
});

//-- Onglet est dÃ©sactivÃ© --
window.onblur = function(){ 
	ApplicationMethode.page_actif = false; 
};

//-- Onglet est activÃ© --
window.onfocus = function(){
	ApplicationMethode.page_actif = true; 
};

//-- Retour dans l'historique --
window.onpopstate = function(event){
    if(event.state) {
        var tab_var = GestionMethode.recupererVariableUrl();
        var nom = tab_var[0]; var variable_get = tab_var[1];
        //-- Message dans la console --
        GestionMethode.ecrireConsole('Manipulation de l\'historique du navigateur onpopstate("' + nom + '", "' + variable_get + '");', 'attention');
        //-- On affiche la page sans remettre l'historique --
        ActionMethode.ouvrirPage(nom + '.php', variable_get, false);
    }
};

function montre(txt){var Obj;var Html;Obj=GetObjet('curseur');if(Obj){Html=txt;ObjWrite('curseur',Html);ObjShowAll('curseur',Mouse_X+Decal_X,Mouse_Y+Decal_Y,1000);bBulle=true;return(true);}
return(false);}
function cache(){ObjWrite('curseur',"&nbsp;");ObjHide('curseur');ObjMoveTo('curseur',0,0);bBulle=false;return(true);}