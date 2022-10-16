#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
froz = false;
canBeSlow = true;
hideHeart = true;   //when displaying dialogues
god = false;
iframe = 0;
spd = 4;
HP = 44;
maxHP = 44;
if (global.SettingE[4])
{
    HP = 1;
    maxHP = 1;
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_goto(rSettingsE);
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_alpha == 1)
    image_alpha = 0.3;
else
    image_alpha = 1;
alarm[1] = 10;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (god)
{
    iframe += 1;
    if (iframe > 50 and HP > 0)
    {
        god = false;
        iframe = 0;
        image_alpha = 1;
        alarm[1] = -1;
    }
}
if (instance_exists(objBattleControllerE))
{
    if (objBattleControllerE.heartFrozen)
        exit;
}
if (froz)
    exit;
hspeed = global.input_h * spd;
vspeed = global.input_v * spd;
if (canBeSlow)
    speed *= 1 - (global.key[key_jump] * 0.5);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(objBattleControllerE))
{
    if (objBattleControllerE.heartFrozen)
        exit;
}
///box collisions
var bx, by, bw, bh, cx1, cy1, cx2, cy2, moveang, boxang, box, o;
with objBattleBox
    box = id
boxang = box.box_angle

bx=box.xx
by=box.yy
bw=(box.box_width)/2 - 8
bh=(box.box_height)/2 - 8
o = 16

//left line
cx1=bx+pivot_pos_x(-bw,-bh-o,boxang)
cy1=by+pivot_pos_y(-bw,-bh-o,boxang)
cx2=bx+pivot_pos_x(-bw,bh+o,boxang)
cy2=by+pivot_pos_y(-bw,bh+o,boxang)
while (lines_intersect(bx, by, x, y, cx1, cy1, cx2, cy2, true) != 0) move_heartE(boxang)

//bottom line
cx1=bx+pivot_pos_x(-bw-o,bh,boxang)
cy1=by+pivot_pos_y(-bw-o,bh,boxang)
cx2=bx+pivot_pos_x(bw+o,bh,boxang)
cy2=by+pivot_pos_y(bw+o,bh,boxang)
while (lines_intersect(bx, by, x, y, cx1, cy1, cx2, cy2, true) != 0) move_heartE(boxang+90)

//right line
cx1=bx+pivot_pos_x(bw,-bh-o,boxang)
cy1=by+pivot_pos_y(bw,-bh-o,boxang)
cx2=bx+pivot_pos_x(bw,bh+o,boxang)
cy2=by+pivot_pos_y(bw,bh+o,boxang)
while (lines_intersect(bx, by, x, y, cx1, cy1, cx2, cy2, true) != 0) move_heartE(boxang+180)

//top line
cx1=bx+pivot_pos_x(-bw-o,-bh,boxang)
cy1=by+pivot_pos_y(-bw-o,-bh,boxang)
cx2=bx+pivot_pos_x(bw+o,-bh,boxang)
cy2=by+pivot_pos_y(bw+o,-bh,boxang)
while (lines_intersect(bx, by, x, y, cx1, cy1, cx2, cy2, true) != 0) move_heartE(boxang+270)
#define Collision_objAttackProjectileE
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (god or (other.type == 2 and speed == 0) or
    (other.type == 3 and speed != 0) or
    other.alarm[11] > -1)
    exit;
if (other.karma)
{
    scrHealHeartE(-other.dmgKR);
}
else
{
    scrHealHeartE(-other.dmg);
    god = true;
    alarm[1] = 1;
}
scrPlaySoundE("eHurt");
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Death
sound_stop_all();
scrPlaySoundE("eHeartExplosion");
instance_create(0, 0, objDarknessDeath);
with (objBattleControllerE)
{
    for (i = 0; i < maxButtons; i += 1)
    {
        with (btn[i])
            instance_destroy();
    }
    instance_destroy();
}
with (objTextWriterE)
{
    instance_destroy();
}
repeat (5)
{
    instance_create(x, y, objHeartPieceE);
}
with (objPlayerStatE)
{
    hp = 0;
}
visible = false;
froz = true;
alarm[0] = 200;
#define KeyPress_49
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scrHealHeartE(-10);
#define KeyPress_50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scrHealHeartE(1);
