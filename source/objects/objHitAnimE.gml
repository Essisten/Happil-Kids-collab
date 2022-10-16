#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dmg = 0;
target = objBattleControllerE.enemy[objBattleControllerE.selectedEnemy];
if (abs(objFightAim.hitPower) >= 1 or (!objBattleControllerE.weapon and objFightAim.hitPower >= 0))
{
    sprite_index = -1;
}
else
{
    if (!objBattleControllerE.weapon)
    {
        image_speed = 0.2;
        scrPlaySoundE("ePistolShoot");
        dmg = objFightAim.hitPower + 1;
        if (dmg > 2/3)
            sprite_index = sprShootE1;
        else if (dmg > 1/3)
            sprite_index = sprShootE2;
        else
            sprite_index = sprShootE3;
    }
    else
    {
        image_speed = 0.2;
        scrPlaySoundE("eSlice");
        dmg = 1 - abs(objFightAim.hitPower);
        image_xscale = 1 + dmg;
        image_yscale = image_xscale;
    }
}
if (dmg == 0)
    exit;
with (target)
{
    if (dodge)
        alarm[1] = 1;
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
label = instance_create(x, y, objDamageE);
label.dmg = dmg;
instance_destroy();
