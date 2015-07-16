{block name="title" prepend}Resume an account{/block}
{block name="content"}
   <!-- Le corps de la page -->
            <div id="corps"><div id="page_contenu"><noscript><meta http-equiv="refresh" content="0; url=index.php?page=nojs"></noscript><div id="page_reprise_compte">
    <!-- Le titre de la page et JavaScript -->
   
    
    <!-- Sous-titre : Reprise de compte -->
    <h1>Account recovery [Step 1/2]</h1>
    <div class="description">
        On Antaris Legacy, it is possible to take an account that has been inactive for more than 3 months and not paused or banned.
         Once you have selected your account from the list below, you will need to enter into form a new login
         to access this account. Recovery account will be validated when you click on the activation link sent by email.
        <br /><br />
        Some additional information :<br />
        &mdash;&nbsp;We strongly discourage the beginner to take account over.<br />
        &mdash;&nbsp;We recall that a person can only have one account per universe.<br />
    </div>
    
    <h2>Suspense accounts owner</h2>
    Select the desired account clicking the small basket on the right.
    <table class="liste_compte">
        <tr>
            <th>username</th>
            <th>Last activity</th>
            <th>Points</th>
            <th>Home planet</th>
            <th>Cart</th>
        </tr>
        {foreach name=RangeList item=RangeInfo from=$RangeList}
                    <tr>
                <td>
                    <img src="media/files/{$RangeInfo.avatar}" />
                    <span class="joueur">{$RangeInfo.name}</span>
                </td>
                <td>{$RangeInfo.onlinetimes}</td>
                <td><span class="orange">{$RangeInfo.points}</span> pts</td>
                <td>
                    <img src="media/image/planete.png" />
                    {$RangeInfo.planetname} [{$RangeInfo.galaxy}:{$RangeInfo.system}:{$RangeInfo.planet}]
                </td>
                <td><img src="media/image/panier.png" onclick="location.href='index.php?page=resume&mode=take&tid={$RangeInfo.id}';" />
				
				
				</td>
            </tr>
     {/foreach}
    
                   
                    </table>
    <span class="gris">Rankings accounts correspond to the last statistics update</span>
</div></div>            <!-- Fin du corps -->
            </div>
            <div class="espace"></div>
{/block}