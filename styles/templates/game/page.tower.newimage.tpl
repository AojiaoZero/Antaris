{block name="title" prepend}{$LNG.ls_tmanag_1}{/block}
{block name="content"}

<div id="page_contenu">      <h1>{$LNG.ls_tmanag_1}</h1><div id="page_tour_gestion">	<div class="onglet">
				<ul>
					<li><a href="?page=Tower" title="{$LNG.ls_tmanag_2}">{$LNG.ls_tmanag_2}</a></li>
					{if $headquarters_antaris >= 1}<li><a href="?page=Tower&mode=siege" title="{$LNG.ls_tmanag_3}">{$LNG.ls_tmanag_3}</a></li>{/if}
					{if $antaris_headpost >= 1}<li><a href="?page=Tower&mode=outpost" title="{$LNG.ls_tmanag_4}">{$LNG.ls_tmanag_4}</a></li>{/if}
					<li><a href="?page=Tower&mode=portal" title="{$LNG.ls_tmanag_5}">{$LNG.ls_tmanag_5}</a></li>
					<li><a href="?page=Tower&mode=construct" title="{$LNG.ls_tmanag_6}">{$LNG.ls_tmanag_6}</a></li>
				</ul>
			</div>	<div id="onglet_tour_gestion"><div id="general_planete" class="formulaire_image categorie">
						<h2>{$LNG.ls_tmanag_49} :</h2>
						{$LNG.ls_tmanag_50}.<br>
						<div id="reponse_ajax"></div><br><div class="choisir_image">
                                <img onclick="updateImage(34);" src="media/ingame/planet/34.jpg" title="Select this image : 34.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(41);" src="media/ingame/planet/41.jpg" title="Select this image : 41.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(18);" src="media/ingame/planet/18.jpg" title="Select this image : 18.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(32);" src="media/ingame/planet/32.jpg" title="Select this image : 32.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(26);" src="media/ingame/planet/26.jpg" title="Select this image : 26.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(21);" src="media/ingame/planet/21.jpg" title="Select this image : 21.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(28);" src="media/ingame/planet/28.jpg" title="Select this image : 28.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(14);" src="media/ingame/planet/14.jpg" title="Select this image : 14.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(4);" src="media/ingame/planet/4.jpg" title="Select this image : 4.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(17);" src="media/ingame/planet/17.jpg" title="Select this image : 17.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(42);" src="media/ingame/planet/42.jpg" title="Select this image : 42.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(30);" src="media/ingame/planet/30.jpg" title="Select this image : 30.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(8);" src="media/ingame/planet/8.jpg" title="Select this image : 8.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(12);" src="media/ingame/planet/12.jpg" title="Select this image : 12.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(44);" src="media/ingame/planet/44.jpg" title="Select this image : 44.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(10);" src="media/ingame/planet/10.jpg" title="Select this image : 10.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(19);" src="media/ingame/planet/19.jpg" title="Select this image : 19.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(36);" src="media/ingame/planet/36.jpg" title="Select this image : 36.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(43);" src="media/ingame/planet/43.jpg" title="Select this image : 43.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(27);" src="media/ingame/planet/27.jpg" title="Select this image : 27.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(9);" src="media/ingame/planet/9.jpg" title="Select this image : 9.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(37);" src="media/ingame/planet/37.jpg" title="Select this image : 37.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(38);" src="media/ingame/planet/38.jpg" title="Select this image : 38.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(35);" src="media/ingame/planet/35.jpg" title="Select this image : 35.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(3);" src="media/ingame/planet/3.jpg" title="Select this image : 3.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(5);" src="media/ingame/planet/5.jpg" title="Select this image : 5.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(24);" src="media/ingame/planet/24.jpg" title="Select this image : 24.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(6);" src="media/ingame/planet/6.jpg" title="Select this image : 6.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(31);" src="media/ingame/planet/31.jpg" title="Select this image : 31.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(22);" src="media/ingame/planet/22.jpg" title="Select this image : 22.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(7);" src="media/ingame/planet/7.jpg" title="Select this image : 7.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(23);" src="media/ingame/planet/23.jpg" title="Select this image : 23.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(33);" src="media/ingame/planet/33.jpg" title="Select this image : 33.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(13);" src="media/ingame/planet/13.jpg" title="Select this image : 13.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(2);" src="media/ingame/planet/2.jpg" title="Select this image : 2.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(1);" src="media/ingame/planet/1.jpg" title="Select this image : 1.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(11);" src="media/ingame/planet/11.jpg" title="Select this image : 11.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(25);" src="media/ingame/planet/25.jpg" title="Select this image : 25.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(39);" src="media/ingame/planet/39.jpg" title="Select this image : 39.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(40);" src="media/ingame/planet/40.jpg" title="Select this image : 40.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(16);" src="media/ingame/planet/16.jpg" title="Select this image : 16.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(20);" src="media/ingame/planet/20.jpg" title="Select this image : 20.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(15);" src="media/ingame/planet/15.jpg" title="Select this image : 15.jpg"></div><div class="choisir_image">
                                <img onclick="updateImage(29);" src="media/ingame/planet/29.jpg" title="Select this image : 29.jpg"></div>	<div class="espace"></div>
					  </div></div></div></div>                    <!-- Fin du corps -->
            <div class="espace"></div>
{/block}