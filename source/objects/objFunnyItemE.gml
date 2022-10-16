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
sound_play("eItemAppear");
instance_create(x, y, objLightIntroE);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y = oldY + sin(degtorad(d)) * 4;
d += 4;
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase >= count)
{
    instance_destroy();
    exit;
}
sound_play("eItemAppear");
instance_create(x, y, objLightIntroE);
x = xx[phase];
y = yy[phase];
phase += 1;
oldY = y;
