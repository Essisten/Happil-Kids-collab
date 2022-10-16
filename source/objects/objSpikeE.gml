#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 30 / room_speed;
//alarm[0] = 1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Bruh I don't need this anymore
if (!variable_local_exists("d"))
    d = 0;
if (d > global.difficulty)
    instance_destroy();
