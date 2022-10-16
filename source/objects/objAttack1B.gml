#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
time = 800;
amount = 0;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tmp = instance_create(choose(random_range(0, 200), random_range(600, 800)),
                choose(random_range(200, 400), random_range(500, 600)),
                objKnifeAim);
tmp.reAim = true;
amount += 1;
if (amount < 3 or version == 2)
    alarm[0] = 100;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
alarm[0] = 1;
with (objBattleBox)
{
    hideDarknessW = -100;
    hideDarknessH = -100;
    hideDarkness = true;
}
