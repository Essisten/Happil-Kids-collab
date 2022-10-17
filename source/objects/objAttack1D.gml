#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
time = 650;
for (i = 0; i < 4; i += 1)
    k[i] = 0;
orange = 0;
dist = 96;
dir = 360 / (version+2);
d = 90;
rot = 3;
orangeWidth = 96;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dist -= 1;
if (dist > 32)
    alarm[0] = 2;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tmp = instance_create(choose(random_range(100, 200), random_range(600, 700)), random_range(400, 500), objKnifeAim);
tmp.spd += 2;
if (alarm[0] > 2)
    alarm[1] = 50;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orange = instance_create(objBattleBox.x + orangeWidth * sin(degtorad(d)), objBattleBox.y, objAttackProjectileE);
orange.type = 3;
scrSetSize(orange, 2);
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rot -= 0.1;
if (rot > -4)
    alarm[3] = 1;
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dist += 2;
if (dist < 80)
    alarm[4] = 1;
else
{
    with (orange)
    {
        speed = 6;
        rot = choose(1, -1) * 4;
        if (x < objHeart.x)
            direction = 0;
        else
            direction = 180;
    }
    orange = 0;
    alarm[5] = 100;
}
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xx = objHeart.x;
yy = objHeart.y;
temp = 128;
a[0] = instance_create(xx, yy - 128, objKnifeAim);
a[1] = instance_create(xx, yy + 128, objKnifeAim);
a[2] = instance_create(xx - 128, yy, objKnifeAim);
a[3] = instance_create(xx + 128, yy, objKnifeAim);
for (i = 0; i < 4; i += 1)
{
    a[i].image_angle = a[i].direction + 180;
    a[i].rot = 5;
}
alarm[5] = 50;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
direction += rot;
for (i = 0; i < version + 2; i += 1)
{
    k[i].x = objBattleBox.x + lengthdir_x(dist, direction + dir * i);
    k[i].y = objBattleBox.y + lengthdir_y(dist, direction + dir * i);
    k[i].image_angle = direction + dir * i + 90;
}
if (instance_exists(orange))
{
    orange.x = objBattleBox.x + sin(degtorad(d)) * orangeWidth;
    d += 4;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (version > 1)
{
    time = 1100;
}
event_inherited();
for (i = 0; i < 2 + version; i+= 1)
{
    k[i] = instance_create(objBattleBox.x + lengthdir_x(dist, dir * i),
    objBattleBox.y + lengthdir_y(dist, dir * i), objAttackProjectileE);
}
alarm[0] = 200;
if (version > 1)
    alarm[1] = 50;
alarm[2] = 100;
alarm[3] = 400;
alarm[4] = 700;
