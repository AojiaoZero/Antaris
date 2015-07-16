//  -----------------------------------------------------------
var DOM = (document.getElementById ? true : false);
var IE  = (document.all && !DOM ? true : false);
var NS4 = (document.layers ? true : false);
var NAV_OK   = ( DOM || IE || NS4);
var NETSCAPE = (navigator.appName == "Netscape");
var Mouse_X;        // Position X en Cours de la Mouse
var Mouse_Y;        // Position Y en Cours de la Mouse
var TopIndex = 1;   // Z-Index interne
var Decal_X  = 5;   // DÃ©calage X entre Pointeur Mouse et Bulle
var Decal_Y  = 5;   // DÃ©calage Y entre Pointeur Mouse et Bulle
var bBulle= false;  // Flag Affichage de la Bulle
//---------------------
function GetObjet(div_){
  if( DOM) return document.getElementById(div_);
  if( IE)  return document.all[div_];
  if( NS4) return document.layers[div_];
}
//---------------------
function GetStyle(div_){
  return (NS4 ? GetObjet(div_) : GetObjet(div_).style);
}
//---------------------
function ObjHide( div_){
  var Obj = null;
  if( div_){
    Obj = GetStyle( div_);
    if( Obj){
      Obj.visibility= "hidden";
    }
  }
  return(true);
}
//-------------------------
function ObjShow( div_, z_){
  var Obj = null;
  if( div_){
    Obj = GetStyle( div_);
    if( Obj){
      Obj.visibility = "visible";
      if( arguments[1] != null)
        Obj.zIndex = z_;
      else
        Obj.zIndex = TopIndex++;
    }
  }
  return(true);
}
//-----------------------------
function ObjWrite( div_, html_){
  var Obj;
  Obj = GetObjet( div_);
  if( Obj) with( Obj){
    if( !NS4){
      innerHTML = html_;
    }
    else{
      document.open();
      document.write( html_);
      document.close();
    }
  }
}
//-------------------------------
function ObjMoveTo( div_, x_, y_){
  var Obj = null;
  var Arg = arguments;
  if( div_){
    Obj = GetStyle( div_);
    if( Obj){
      if( Arg[1] != null) Obj.left = x_ +"px";
      if( Arg[2] != null) Obj.top  = y_ +"px";
    }
  }
}
//------------------------------------

function ObjShowAll( div_, x_, y_, z_){
  var Obj = GetObjet( div_);
  var DocRef;
  var MaxX, MaxY;
  var Top,  Left;
  var Haut, Larg;
  var SavY = y_;
  var SavX = x_;

  if( Obj){
    //-- RÃ©cup. dimension fenÃªtre et DIV
    if( NETSCAPE){
      with( window){
        Left = pageXOffset;
        Top  = pageYOffset;
        MaxX = innerWidth;
        MaxY = innerHeight;
        if( MaxX > document.width)  MaxX = document.width;
        if( MaxY > document.height) MaxY = document.height;
        MaxX += Left;
        MaxY += Top;
      }
      if( NS4){
        Larg = Obj.clip.width;
        Haut = Obj.clip.height;
      }
      else{
        Larg = Obj.offsetWidth;
        Haut = Obj.offsetHeight;
      }
    }
    else{
      if( document.documentElement && document.documentElement.clientWidth)
        DocRef = document.documentElement;
      else
        DocRef = document.body;

      with( DocRef){
        Left = scrollLeft;
        Top  = scrollTop;
        MaxX = Left + clientWidth;
        MaxY = Top  + clientHeight;
      }

      Larg = Obj.scrollWidth;
      Haut = Obj.scrollHeight;
    }
    //-- RÃ©ajuste dimension fenÃªtre
    MaxX -= Larg;
    MaxY -= Haut;

    //-- Application Bornage
    if( x_ > MaxX) x_ = MaxX;
    if( x_ < Left) x_ = Left;
    if( y_ > MaxY) y_ = MaxY;
    if( y_ < Top)  y_ = Top;

    //-- si en bas On rÃ©ajuste
    //-- pour que la bulle ne prenne pas le focus
    if( y_== MaxY){
      var DeltaY = MaxY -SavY;
      y_ = MaxY - DeltaY -Haut -2*Decal_Y;
    }
    if( x_== MaxX){
      var DeltaX = MaxX -SavX;
      x_ = MaxX - DeltaX -Larg -2*Decal_X;
    }

    //-- On place la Bulle
    ObjMoveTo( div_, x_, y_);
    ObjShow( div_, z_);
  }
}

//------------------------
function montre(txt){
 var Obj;
 var Html;
 Obj = GetObjet('curseur');
 if( Obj){
    Html = txt;
  ObjWrite  ('curseur', Html);
  ObjShowAll('curseur', Mouse_X +Decal_X, Mouse_Y +Decal_Y, 1000);
  bBulle= true;
  return( true);
 }
 return(false);
}

//------------------
function cache(){
  ObjWrite ('curseur', "&nbsp;");
  ObjHide  ('curseur');
  ObjMoveTo('curseur', 0, 0);
  bBulle= false;
  return(true);
}

//------------------------------------
function WhereMouse(e){
  var DocRef;

  if( NETSCAPE){
    Mouse_X = e.pageX;
    Mouse_Y = e.pageY;
  }
  else{
    if( document.documentElement && document.documentElement.clientWidth)
      DocRef = document.documentElement;
    else
      DocRef = document.body;

    Mouse_X = event.clientX +DocRef.scrollLeft;
    Mouse_Y = event.clientY +DocRef.scrollTop;
  }
  //-- La bulle est affichÃ©e on la MOVE
  if( bBulle)
    ObjShowAll('curseur', Mouse_X +Decal_X, Mouse_Y +Decal_Y, 1000);
}

//== INITIALISATION ==================================
//-- Capture Souris events ---------------------------
if( NETSCAPE)
  window.addEventListener(Event.MOUSEMOVE, WhereMouse, false);
document.onmousemove = WhereMouse;