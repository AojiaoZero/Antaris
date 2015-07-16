<!-- Le menu à gauche -->
            <div id="menu">
                <h1>{$LNG.lm_title_1}</h1>
                <ul>
                    <li><a href="?page=overview" title="{$LNG.lm_expl_1}">{$LNG.lm_overview}</a></li>
                    <li><a href="?page=techtree" title="{$LNG.lm_expl_2}">{$LNG.lm_technology}</a></li>
                   <li><a href="?page=galaxy" title="{$LNG.lm_expl_3}">{$LNG.lm_galaxy}</a></li>
				    <li><a href="?page=fleetTable" title="{$LNG.lm_expl_4}">{$LNG.lm_fleet}</a></li>
                   {* <li><a href="?page=Tportal" title="{$LNG.lm_expl_5}">{$LNG.lm_tportal}</a></li>*}
                    <li><a href="?page=Tower" title="{$LNG.lm_expl_6}">{$LNG.lm_tmanagement}</a></li>
                   <li><a href="?page=Explorations" title="{$LNG.lm_expl_7}">{$LNG.lm_exploration}</a></li>
                </ul>
                <h1>{$LNG.lm_title_2}</h1>
                <ul>
                    <li><a href="?page=buildings&cmdd=build" title="{$LNG.lm_expl_8}">{$LNG.lm_buildings}</a></li>
                    <li><a href="?page=research" title="{$LNG.lm_expl_9}">{$LNG.lm_research}</a></li>
                    <li><a href="?page=shipyard&mode=fleet" title="{$LNG.lm_expl_10}">{$LNG.lm_shipshard}</a></li>
                    <li><a href="?page=defense" title="{$LNG.lm_expl_11}">{$LNG.lm_defenses}</a></li>
                    <li><a href="?page=population" title="{$LNG.lm_expl_12}">{$LNG.lm_population}</a></li>
                    {*<li><a href="?page=records" title="">Records</a></li>*}
                </ul>
                <h1>{$LNG.lm_title_3}</h1>
                <ul>
                    <li><a href="?page=search" title="{$LNG.lm_expl_13}">{$LNG.lm_search}</a></li>
                    <li><a href="?page=alliance" title="{$LNG.lm_expl_14}">{$LNG.lm_alliance}</a> / <a href="?page=market" title="{$LNG.lm_expl_15}">{$LNG.lm_market}</a></li>
                    <li><a href="?page=Bunker" title="{$LNG.lm_expl_16}">{$LNG.lm_bunker}</a> / <a href="?page=Bank" title="{$LNG.lm_expl_32}">{$LNG.lm_expl_33}</a> </li>
                    <li><a href="?page=resources" title="{$LNG.lm_expl_17}">{$LNG.lm_resources}</a></li>
                </ul>
				<h1>{$LNG.lm_title_4}</h1>
                <ul>
                    <li><a href="?page=Immunity" title="{$LNG.lm_expl_18}.">{$LNG.lm_immunity}</a></li>
                    <li><a href="?page=Planetcloak" title="{$LNG.lm_expl_19}.">{$LNG.lm_pcloak}</a> </li>
                    <li><a href="?page=Lottery" title="{$LNG.lm_expl_20}.">{$LNG.lm_lotto}</a></li>
                   {* <li> <a href="?page=Premium" title="Become a vip member of the community.">Premium</a></li> *}
                    <li> <a href="?page=Reward2" title="{$LNG.lm_expl_21}.">{$LNG.lm_redeem}</a></li>
                    <li> <a href="game.php?page=battleSimulator">{$LNG.lm_battlesim}</a></li>
                </ul>
                <h1>{$LNG.lm_title_5}</h1>
                <ul>
                    <li><a id="gotit" href="?page=messages" name="messagerie" {if $new_message > 0}class="orange"{/if} title="{$LNG.lm_expl_22}">{$LNG.lm_messages} {nocache}{if $new_message > 0}<span id="newmes"> (<span id="newmesnum" class="orange">{$new_message}</span>)</span>{/if}{/nocache}</a></li> 
                    <li><a href="?page=statistics" title="{$LNG.lm_expl_23}">{$LNG.lm_statistics}</a></li>
                    <li><a href="?page=settings" title="{$LNG.lm_expl_24}">{$LNG.lm_proset}</a></li>
                    <li><a href="?page=gestion" title="{$LNG.lm_expl_25}">{$LNG.lm_gestion}</a> </li>
                    <li><a id="gotit2" href="?page=Chat" name="tchat" title="Pour discuter avec d'autres joueurs de l'univers.">Tchat <span id="new_chat"> </span></a> </li>
					
                    <li><a href="?page=Achat" title="{$LNG.lm_expl_26}">{$LNG.lm_shop}</a></li>
                    <li><a href="?page=faq" title="{$LNG.ls_faq_13}">{$LNG.ls_faq_13}</a></li>
                    {*<li><a href="?page=Faq" title="For answers to your questions.">Help (FAQ)</a> /*} {*<<a href="?page=ticket" title="{$LNG.lm_expl_27}.">{$LNG.lm_support}</a></li>*}
                    <li><a href="?page=banList" title="{$LNG.lm_expl_28}.">{$LNG.lm_banned}</a></li>
                    <li><a href="?page=battleHall" title="{$LNG.lm_expl_29}">{$LNG.lm_topkb}</a></li>
                    <li><a data-ajax="0" href="forum" target="_blank">{$LNG.lm_forums}</a></li>
                    <li><a data-ajax="0" href="?page=logout" title="{$LNG.lm_expl_30}">{$LNG.lm_logout}</a></li>
                </ul>
                <h1>{$LNG.lm_title_6}</h1>
                <ul>
                    <li>Horizon : <span name="charge_serveur" class="vert">fluid</span></li>
                    <li>Time : <span class="servertime">{$servertime}</span></li>
                    <li><span name="nb_connecte" style="font-weight : bold;">{$online_users}</span> {$LNG.lm_connected}</li>
                </ul>
            </div>