#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = objBattleBox.x;
y = objBattleBox.y;
image_xscale = 0;
image_speed = 0;
spd = 0.05;
weapon = 0;
ready = false;
hitPower = -1;
hitSpd = 0.04;
hitInd = 0;
if (instance_exists(objBattleControllerE))
{
    weapon = objBattleControllerE.weapon;
}
w = 370;
if (instance_exists(objBattleBox))
    w = objBattleBox.box_width / 2;
with (objHeart)
{
    visible = false;
}
if (weapon)
{
    image_index = 1;
}
else
{
    image_yscale = 0;
    with (objBattleBox)
    {
        box_width = 156;
        box_height = 156;
    }
}
alarm[0] = 10;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Animation for aiming

alarm[0] = 10;
hitInd = !hitInd;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Fading
if (!weapon)
{
    image_yscale -= spd;
}
image_xscale -= spd;
image_alpha = image_xscale;
alarm[1] = 1;
if (image_xscale <= 0)
{
    instance_destroy();
    with (objBattleControllerE)
    {
        event_user(7);
        event_user(5);
    }
    with (objTextWriterE)
    {
        event_user(0);
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready == 0)
{
    image_xscale += spd
    image_alpha = image_xscale;
    if (!weapon)
    {
        image_yscale = min(1, image_yscale + spd);
    }
    if (image_xscale >= 1)
    {
        image_xscale = 1;
        image_yscale = 1;
        ready = true;
    }
}
else if (ready == 1)
{
    hitPower += hitSpd;
    if (global.key_pressed[key_shoot] or (!weapon and hitPower > 0) or hitPower >= 1)
    {
        event_user(0);
        ready = -1;
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Finishing aiming
hitSpd = 0;
alarm[1] = 50;
instance_create(400, 200, objHitAnimE);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self();
if (ready != 0)
{
    if (weapon)
    {
        draw_sprite(sprFightAimStick, hitInd, x + w * hitPower, y);
    }
    else
    {
        draw_sprite_ext(sprFightAimCircle, hitInd, x, y, abs(hitPower), abs(hitPower), 0, c_white, 1);
    }
}
