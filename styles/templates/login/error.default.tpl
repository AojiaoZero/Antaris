{block name="title" prepend}{$LNG.fcm_info}{/block}
{block name="content"}
 <div id="corps"><div id="page_contenu"><div id="page_inscription">
    <!-- Le titre de la page et JavaScript -->
    <script type="text/javascript">
        $(document).ready(function(){
            ApplicationMethode.modifierPageNavigation('Information');
           
        });
    </script>

            <!-- Sous-titre : L'email vient d'être envoyé au joueur -->
       {$message}

    </div></div>    </div>  
            <div class="espace"></div>
{/block}