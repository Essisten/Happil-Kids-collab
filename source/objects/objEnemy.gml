#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
anim = false;
dodging = 0;
HP = 1000;
DEF = 1;
god = false;
dodge = false;
oldX = x;
gravity_direction = 0;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Dodge
gravity = 0.1;
gravity_direction = choose(180, 0);
direction = gravity_direction;
speed = 10;
dodging = 1;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Wait a bit

gravity = 0.1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dodging > 0)
{
    switch (dodging)
    {
        case 1: //first catch
            if ((direction == 180 and x + hspeed < 200) or (direction == 0 and x + hspeed > 600))
            {
                speed = 0;
                gravity = 0;
                gravity_direction += 180;
                direction = gravity_direction;
                alarm[2] = 50;
                dodging = 2;
            }
            break;
        case 2: //second catch
            if ((direction == 0 and x + hspeed > 400) or (direction == 180 and x + hspeed < 400))
            {
                speed = 0;
                gravity = 0;
                x = 400;
                dodging = 0;
            }
            break;
    }
}
