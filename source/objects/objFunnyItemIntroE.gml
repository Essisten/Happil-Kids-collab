#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
phase = 0;
d = 0;
oldY = y;
xx[0] = 0;
yy[0] = 0;
count = 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y = sin(degtorad(d));
d += 1;
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase >= count)
    instance_destroy();
x = xx[phase];
y = yy[phase];
phase += 1;
oldY = y;
