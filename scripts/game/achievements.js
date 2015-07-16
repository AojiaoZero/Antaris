function ShowContent(value) {	
var onediv = value;
var divs=["mission_contenu_1","mission_contenu_2","mission_contenu_3","mission_contenu_4","mission_contenu_5","mission_contenu_6","mission_contenu_7","mission_contenu_8","mission_contenu_9","mission_contenu_10","mission_contenu_11","mission_contenu_12","mission_contenu_13","mission_contenu_14"];
for (var i=0;i<divs.length;i++)
  {
  if (onediv != document.getElementById(divs[i]))
    {
    document.getElementById(divs[i]).style.display='none';
    }
  }

 $(onediv).show();
}