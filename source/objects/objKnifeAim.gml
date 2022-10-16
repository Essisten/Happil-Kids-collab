#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
alarm[2] = 1;
direction = point_direction(x, y, objHeart.x, objHeart.y);
image_angle = random(360);
rot = 10;
spd = 10;
speed = 0;
appear = true;
reAim = false;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction = point_direction(x, y, objHeart.x, objHeart.y);
alarm[2] = 1;
speed = 0;
if (image_angle + 90 > direction)
    rot = -abs(rot);
else
    rot = abs(rot);
if (direction > 270)
    direction -= 360;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_angle + 90 != direction)
{
    if (image_angle + 90 >= 360)
        image_angle -= 360;
    if (image_angle + 90 < 0)
        image_angle += 360;
    if (abs(angle_difference(image_angle + 90, direction)) <= abs(rot))
        image_angle = direction - 90;
    else
        image_angle += rot;
    alarm[2] = 1;
}
else
{
    speed = spd;
    if (reAim)
        alarm[1] = 50;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((y > 600 or y < 0 or x < 0 or x > 800) and outside and reAim)
{
    outside = false;
    alarm[0] = 50;
    alarm[1] = 1;
}
