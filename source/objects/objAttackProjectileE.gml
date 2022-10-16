#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
karma = false;
outside = false;
dmg = 9;
dmgKR = 1;
rot = 0;
type = 1;   //1 - normal, 2 - blue, 3 - orange
appear = true;
maxSpd = -1;
alpha = 1;
alarm[0] = 50;
alarm[11] = 1;
image_speed = 0;
image_alpha = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
outside = true;
#define Alarm_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0);
if (appear and image_alpha < alpha)
{
    image_alpha += 0.05;
    alarm[11] = 1;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle += rot;
if (maxSpd > -1 and speed > maxSpd)
    speed = maxSpd;
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (outside)
    instance_destroy();
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Process the type
switch (type)
{
    case 1:
        exit;
    case 2:
        image_blend = c_aqua;
        break;
    case 3:
        image_blend = c_orange;
        break;
}
alpha = 0.7;
