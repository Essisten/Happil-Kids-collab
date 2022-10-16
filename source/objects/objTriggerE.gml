#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
trg = 0;
s = -1;
v = false;
alarm[0] = 1;
image_speed = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible = v;
if (s != -1)
    sprite_index = s;
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.trigger[trg] = true;
with (objTriggerController)
{
    event_user(0);
}
instance_destroy();
