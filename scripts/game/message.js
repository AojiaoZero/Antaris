var Messagerie={afficherMessage:function(e,s,a){var t=$("tr#contenu_message_"+e),i=$("tr#titre_message_"+e);t.hasClass("no_display")?(t.removeClass("no_display").addClass("display"),i.removeClass("no_display").addClass("display"),$("tr#titre_message_"+e+" > td.sujet_message img").length>0&&($("tr#titre_message_"+e+" > td.sujet_message img").remove(),Messagerie.actualiseNombreMessageNonLu("retirer",1))):t.hasClass("display")&&(t.removeClass("display").addClass("no_display"),i.removeClass("display").addClass("no_display"))}};


