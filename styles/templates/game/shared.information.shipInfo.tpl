  <h2 class="titre_corps">{$LNG.ls_ovbuild_19}</h2>
                <table class="caracteristique_technologie">
                  <tbody><tr>
                    <th style="min-width : 18%;"></th>
                    <th style="min-width : 15%;">Attack</th>
                    <th style="min-width : 15%;">Hull</th>
                    <th style="min-width : 15%;">Shield</th>
                    <th style="min-width : 18%;">Capacity</th>
                    <th style="min-width : 15%;">Speed</th>
                  </tr>
				  <tr>
                    <td>{$LNG.ls_ovbuild_20}</td>
                    <td><span class="orange">{$FleetInfo.attack|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.shield|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.structure|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.capacity|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.speed1|number}</span> %</td>
                  </tr>
                  
                  <!-- Avec les effets technologiques -->
                  <tr>
                    <td>{$LNG.ls_ovbuild_21}</td>
					<td><span class="orange">{$FleetInfo.attackTech|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.shieldTech|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.structureTech|number}</span> {$LNG.lm_achat_units}</td>
					<td><span class="orange">{$FleetInfo.capacity|number}</span> {$LNG.lm_achat_units}</td>
                    <td><span class="orange">{$FleetInfo.speed1|number}</span> %</td>
                  </tr>
                </tbody></table>
				           </div>    </div>
    <div class="espace"></div>
	<!-- Un lien qui permet de revenir à la page des bâtiments -->
<a onclick="history.go(-1)" title="Back to the fleet page">Back to the hangar page.</a>
</div>

