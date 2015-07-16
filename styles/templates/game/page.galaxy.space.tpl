{block name="title" prepend}{$LNG.lm_galaxy}{/block}
{block name="content"}
<div onclick="javascript:annulerAttack(start_attack);" name="fenetre_action_fond"></div><div name="fenetre_action"><h2 class="titre_corps">{$LNG.ls_galaxy_25}</h2><p> {$LNG.ls_galaxy_26} {$space_name}&nbsp;[{$space_system}:{$space_planet}] {$LNG.ls_galaxy_27} «&nbsp;{$space_id_owner}&nbsp;»                                             {$LNG.ls_galaxy_28}.</p><form action="javascript:doit(1, {$space_ids}, $('form select#id_equipe').val());" method="post" id="form_preparer_attaque">

{if $Acepting == 1}
<label for="id_equipe">{$LNG.ls_galaxy_29} :</label>
<select name="id_equipe" id="id_equipe">
{foreach $userComp as $messageID => $xb}
<option value="{$messageID}">{$xb.manage_name}</option>
{/foreach}
</select>
<input value="{$LNG.ls_galaxy_30}" type="submit">
{else}
<div class="no_equipe rouge">{$LNG.ls_galaxy_33}.</div>
{/if}
<input onclick="javascript:annulerAttack(start_attack);" class="neutre" value="{$LNG.ls_galaxy_31}" type="button"></form><p class="gris">{$LNG.ls_galaxy_32}</p></div>
{/block}

