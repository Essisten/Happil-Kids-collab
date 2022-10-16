#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
time = 600;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(0, objBattleBox.y, objAttackProjectileE))
{
    rot = -10;
    hspeed = 8;
    image_xscale = 2;
    image_yscale = image_xscale;
}
with (instance_create(800, objBattleBox.y, objAttackProjectileE))
{
    rot = 10;
    hspeed = -8;
    image_xscale = -2;
    image_yscale = -image_xscale;
}
alarm[1] = 50;
if (choose(true, false))
    alarm[2] = 10;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(0, objBattleBox.y, objAttackProjectileE))
{
    rot = 10;
    hspeed = 8;
    image_xscale = 2;
    image_yscale = -image_xscale;
}
with (instance_create(800, objBattleBox.y, objAttackProjectileE))
{
    rot = -10;
    hspeed = -8;
    image_xscale = -2;
    image_yscale = image_xscale;
}
alarm[0] = 50;
if (choose(true, false))
    alarm[2] = 10;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (version == 1)
    exit;
with (instance_create(objHeart.x, 800, objAttackProjectileE))
{
    vspeed = -16;
    image_xscale = 1;
    image_yscale = image_xscale;
    sprite_index = sprKnife2;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
alarm[0] = 50;
