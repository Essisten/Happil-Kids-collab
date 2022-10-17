#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
time = 800;
blue[0] = 0;
blue[1] = 0;
follower = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tmp = instance_create(random_range(100, 700), random_range(200, 300), objKnifeAim);
tmp.image_angle = point_direction(x, y, objHeart.x, objHeart.y);
alarm[0] = 100 - 30 * version;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i = 0; i < 2; i+=1)
{
    with (blue[i])
    {
        type = 1;
        image_alpha = 1;
        image_blend = c_white;
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
for (i = 0; i < version; i+=1)
{
    if (blue[i].x < 200)
        blue[i].gravity_direction = 0;
    else if (blue[i].x > 600)
        blue[i].gravity_direction = 180;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (version > 1)
{
    time = 865;
    alarm[1] = 800;
}
event_inherited();
blue[0] = instance_create(0, objBattleBox.y, objAttackProjectileE);
if (version == 2)
{
    blue[1] = instance_create(800, objBattleBox.y, objAttackProjectileE);
    blue[1].gravity = 0.3;
    blue[1].type = 2;
    blue[1].image_xscale = 2;
    blue[1].image_yscale = 2;
    blue[1].maxSpd = 8;
}
blue[0].gravity = 0.3;
blue[0].type = 2;
blue[0].image_xscale = 2;
blue[0].image_yscale = 2;
blue[0].maxSpd = 8;
alarm[0] = 100;
